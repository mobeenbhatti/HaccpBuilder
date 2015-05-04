using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using DataModel;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;


public partial class ControlPanel_Membership_LoginPage : System.Web.UI.Page
{
    private Entities _context = new Entities();



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InitializeLogin();
        }

    }
    private void InitializeLogin()
    {
        if (Session["Username"] != null)
        {
            this.Login1.UserName = Session["Username"].ToString();
        }
         if (Request.Cookies["myCookie"] != null) //Cookie Exists??

            {
             //RGK Test Git
                HttpCookie cookie = Request.Cookies.Get("myCookie");

                string user = cookie.Values["user"].ToString();
             string password = cookie.Values["pass"].ToString();

                if (user != "")

                {

                    Login1.UserName = user; //Write the username onto login username textbox 
                    
                }

            }
        this.Login1.Focus();
    }


    protected void Login1_LoggedIn1(object sender, EventArgs e)
    {
        GetDetails();
        CheckBox chBox = (CheckBox)Login1.FindControl("RememberMe");

        if (chBox.Checked)
        {

            HttpCookie myCookie = new HttpCookie("myCookie"); //Instance the new cookie

            Response.Cookies.Remove("myCookie"); //Remove previous cookie

            Response.Cookies.Add(myCookie); //Create the new cookie

            myCookie.Values.Add("user", this.Login1.UserName); //Add the username field to the cookie

            DateTime deathDate = DateTime.Now.AddDays(15); //Days of life

            Response.Cookies["myCookie"].Expires = deathDate; //Assign the life period

            //IF YOU WANT SAVE THE PASSWORD TOO (IT IS NOT RECOMMENDED)

            myCookie.Values.Add("pass", this.Login1.Password);

        }

    }
    private void GetDetails()
    {
        HaccpUser user = (HaccpUser)Session["User"];
        string password = this.Login1.Password;
        if (user != null && this.Login1.UserName.Contains("@"))
            password = Utilities.CreatePasswordHash(this.Login1.Password, user.PasswordSalt);

        Session["Username"] = this.Login1.UserName;
        Session["Password"] = password;
        DateTime dtLoginDate;
        int nContactId = 1;
        string strIP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        RoleManagerProvider getRoles = new RoleManagerProvider();
        //string strIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        
       
                #region District
        
        if (getRoles.IsUserInRole(this.Login1.UserName, password, "DistrictAdmin"))
        {
            // RGK - To support new Credential policy
            if (this.Login1.UserName.Contains("@"))
            {
                var cnt = (from c in _context.Contacts
                           where c.EmailAddress == this.Login1.UserName && c.Password == password
                           select c).FirstOrDefault();
                if (cnt != null)
                {
                    var dst = cnt.Districts.FirstOrDefault();
                    Session["DistrictId"] = dst.DistrictId;
                    Session["District"] = dst.DistrictId;
                    Session["TypeId"] = (int)dst.TypeId;
                    nContactId = cnt.ContactId;
                    if (dst.Active.ToString() != "1")
                    {
                        //Redirect to Error page
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=3");
                    }
                    if (CheckAgreement(nContactId) == true)
                    {
                        Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString());
                    }
                }
                else
                {
                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                }
            }
                //Old Credential ploicy
            else
            {
                ProcessGetDistrict district = new ProcessGetDistrict();
                IDataReader districtReader = district.Get(this.Login1.UserName, this.Login1.Password);

                if (districtReader.Read())
                {
                    // Type Id specifies the Corporate level
                    // 5 - Free Trial
                    // 4 - HBez
                    // 3 - HBFlex without Reporting
                    // 2 - HBFlex with Reporting
                    // 1 - Command Central
                    Session["DistrictId"] = (int)districtReader["DistrictId"];
                    Session["District"] = (int)districtReader["DistrictId"];
                    Session["TypeId"] = (int)districtReader["TypeId"];
                    if (districtReader["Active"].ToString() != "1")
                    {
                        //Redirect to Error page
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=3");
                    }
                    districtReader.Close();
                    //Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
                    // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
                    ProcessGetContact getContactInfo = new ProcessGetContact();
                    DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            nContactId = int.Parse(dr["ContactId"].ToString());

                        }
                        //ProcessGetContactAgreement getAgreement = new ProcessGetContactAgreement();
                        //DataSet dsAgreement = getAgreement.GetContactAgreementByDate(nContactId, strIP);
                        //if (dsAgreement.Tables[0].Rows.Count > 0)
                        if (CheckAgreement(nContactId) == true)
                        {
                            if (user != null && user.IsUpdated == false)
                            {
                                Response.Redirect("~/ControlPanel/District/LoginUpdate.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString());
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                }
            }
            
        }
        #endregion
        #region Kitchen
        else
            if (getRoles.IsUserInRole(this.Login1.UserName, password, "KitchenAdmin"))
            {
                // RGK - To support new Credential policy
                if (this.Login1.UserName.Contains("@"))
                {
                    var cnt = (from c in _context.Contacts
                               where c.EmailAddress == this.Login1.UserName && c.Password == password
                               select c).FirstOrDefault();
                    if (cnt != null)
                    {
                        var dst = cnt.Kitchens.FirstOrDefault();
                        Session["KitchenId"] = dst.KitchenId;
                        Session["District"] = dst.DistrictId;
                        Session["TypeId"] = (int)dst.TypeId;
                        nContactId = cnt.ContactId;
                        if (dst.Active.ToString() != "1")
                        {
                            //Redirect to Error page
                            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=3");
                        }
                        if ((int)Session["TypeId"] == 1)
                        {
                            //Implemented for Free Trila Locations. If exceeds the limit , user couldn't login.
                            TimeSpan span = DateTime.Today.Subtract(dst.CreatedDate);
                        }
                        if (CheckAgreement(nContactId) == true)
                        {
                            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
                        }

                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                    }
                }
                //Old Credential ploicy
                else
                {
                    ProcessGetKitchen kitchen = new ProcessGetKitchen();
                    IDataReader kitchenReader = kitchen.Get(this.Login1.UserName, this.Login1.Password);
                    if (kitchenReader.Read())
                    {
                        Session["KitchenId"] = (int)kitchenReader["KitchenId"];
                        Session["District"] = (int)kitchenReader["DistrictId"];
                        Session["TypeId"] = (int)kitchenReader["TypeId"];
                        if (kitchenReader["Active"].ToString() != "1")
                        {
                            //Redirect to Error page
                            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                        }

                        if ((int)Session["TypeId"] == 1)
                        {
                            //Implemented for Free Trila Locations. If exceeds the limit , user couldn't login.
                            TimeSpan span = DateTime.Today.Subtract(DateTime.Parse(kitchenReader["CreatedDate"].ToString()));

                            //if (span.Days > 10)
                            //{
                            //    //Redirect to Error Page
                            //    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?category=2");
                            //}
                        }

                        kitchenReader.Close();
                        // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
                        ProcessGetContact getContactInfo = new ProcessGetContact();

                        DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {
                                nContactId = int.Parse(dr["ContactId"].ToString());
                            }
                            //ProcessGetContactAgreement getAgreement = new ProcessGetContactAgreement();
                            //DataSet dsAgreement = getAgreement.GetContactAgreementByDate(nContactId, strIP);
                            //if (dsAgreement.Tables[0].Rows.Count > 0)

                            // Mobeen
                            //if (CheckAgreement(nContactId) == true)
                            //{
                            //    Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
                            //}
                            //else
                            //{
                            //    Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
                            //}



                            // Added mobeen
                            if (CheckAgreement(nContactId) == true)
                            {
                                if (user != null && user.IsUpdated == false)
                                {
                                    Response.Redirect("~/ControlPanel/Kitchen/LoginUpdate.aspx");
                                }
                                else
                                {
                                    Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
                                }
                            }
                            else
                            {
                                Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
                            }

                        }
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                    }
                }
            }
        #endregion
        #region Mobile
            else
                if (getRoles.IsUserInRole(this.Login1.UserName, password, "KitchenEmployee"))
                {
                    // mobeen - To support new Credential policy
                if (this.Login1.UserName.Contains("@"))
                {
                    ProcessGetMobile mobile = new ProcessGetMobile();
                    IDataReader mobileReader = mobile.Get(this.Login1.UserName, password);
                    string strInitials = "";

                    if (mobileReader.Read())
                    {
                        Session["KitchenId"] = (int)mobileReader["KitchenId"];
                        Session["TypeId"] = (int)mobileReader["TypeId"];
                        Session["MobileId"] = (int)mobileReader["MobileId"];
                        if (mobileReader["Active"].ToString() != "1")
                        {
                            //Redirect to Error page
                            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                        }

                        if ((int)Session["TypeId"] == 1)
                        {
                            //Implemented for Free Trila Locations. If exceeds the limit , user couldn't login.
                            TimeSpan span = DateTime.Today.Subtract(DateTime.Parse(mobileReader["CreatedDate"].ToString()));

                            //if (span.Days > 10)
                            //{
                            //    //Redirect to Error Page
                            //    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?category=2");
                            //}
                        }

                        mobileReader.Close();
                        // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
                        ProcessGetContact getContactInfo = new ProcessGetContact();
                       
                        DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {

                                nContactId = int.Parse(dr["ContactId"].ToString());
                                strInitials = dr["Initials"].ToString();
                                Session["Initials"] = strInitials;
                                if (dr["Active"].ToString() != "1")
                                {
                                    //Redirect to Error page, if Contact is inactive
                                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                                }
                            }
                            //ProcessGetContactAgreement getAgreement = new ProcessGetContactAgreement();
                            //DataSet dsAgreement = getAgreement.GetContactAgreementByDate(nContactId, strIP);
                            //if (dsAgreement.Tables[0].Rows.Count > 0)
                            if (CheckAgreement(nContactId) == true)
                            {
                                Response.Redirect("~/ControlPanel/Location/Dashboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                            }
                            
                        }
                        else
                        {
                            // WHEN USER IS LOGIN FIRST TIME, MOVE TO AGREEMENT PAGE
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                        }
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                    }


                }
                //added mobeen Old Credential ploicy
                else
                {
                    ProcessGetMobile mobile = new ProcessGetMobile();
                    IDataReader mobileReader = mobile.Get(this.Login1.UserName, this.Login1.Password);
                    string strInitials = "";

                    if (mobileReader.Read())
                    {
                        Session["KitchenId"] = (int)mobileReader["KitchenId"];
                        Session["TypeId"] = (int)mobileReader["TypeId"];
                        Session["MobileId"] = (int)mobileReader["MobileId"];
                        if (mobileReader["Active"].ToString() != "1")
                        {
                            //Redirect to Error page
                            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                        }

                        if ((int)Session["TypeId"] == 1)
                        {
                            //Implemented for Free Trila Locations. If exceeds the limit , user couldn't login.
                            TimeSpan span = DateTime.Today.Subtract(DateTime.Parse(mobileReader["CreatedDate"].ToString()));

                            //if (span.Days > 10)
                            //{
                            //    //Redirect to Error Page
                            //    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?category=2");
                            //}
                        }

                        mobileReader.Close();
                        // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
                        ProcessGetContact getContactInfo = new ProcessGetContact();

                        DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables[0].Rows)
                            {

                                nContactId = int.Parse(dr["ContactId"].ToString());
                                strInitials = dr["Initials"].ToString();
                                Session["Initials"] = strInitials;
                                if (dr["Active"].ToString() != "1")
                                {
                                    //Redirect to Error page, if Contact is inactive
                                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                                }
                            }
                            //ProcessGetContactAgreement getAgreement = new ProcessGetContactAgreement();
                            //DataSet dsAgreement = getAgreement.GetContactAgreementByDate(nContactId, strIP);
                            //if (dsAgreement.Tables[0].Rows.Count > 0)
                           
                            //mobeen
                            //if (CheckAgreement(nContactId) == true)
                            //{
                            //    Response.Redirect("~/ControlPanel/Location/Default.aspx");
                            //}
                            //else
                            //{
                            //    Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                            //}

                            //added mobeen
                            if (CheckAgreement(nContactId) == true)
                            {
                                if (user != null && user.IsUpdated == false)
                                {
                                    Response.Redirect("~/ControlPanel/Location/LoginUpdate.aspx");
                                }
                                else
                                {
                                    Response.Redirect("~/ControlPanel/Location/Default.aspx");
                                }
                            }

                        }
                        else
                        {
                            // WHEN USER IS LOGIN FIRST TIME, MOVE TO AGREEMENT PAGE
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                        }
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                    }
                
                
                }

                }
            #endregion
        #region Admin
                else
                    if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "Administrator"))
                    {

                        Response.Redirect("~/ControlPanel/Admin/Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                    }
                #endregion
    }
    private bool CheckAgreement(int nContactId)
    {
        HttpCookie hfAgreement;
        bool flag = true;       
        if (Convert.ToString(Request.Cookies[nContactId.ToString()]) == "")
        {
            hfAgreement = new HttpCookie(nContactId.ToString());
            hfAgreement.Value = nContactId.ToString();
            hfAgreement.Expires = DateTime.Now.AddDays(90);
            Response.Cookies.Add(hfAgreement);
            flag = false;
        }
        else
        {
            hfAgreement = Request.Cookies[nContactId.ToString()];             
            if (Convert.ToString(hfAgreement.Value) != nContactId.ToString())
            {
                hfAgreement.Value = nContactId.ToString();
                hfAgreement.Expires = DateTime.Now.AddDays(90);
                Response.Cookies.Add(hfAgreement);
                flag = false;
            }
        }
        

        
        return flag;
    }
    
}
