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


using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;


public partial class ControlPanel_Membership_LoginPage : System.Web.UI.Page
{




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
        this.Login1.Focus();
    }


    protected void Login1_LoggedIn1(object sender, EventArgs e)
    {
        GetDetails();

    }
    //private void GetDetails()
    //{
    //    Session["Username"] = this.Login1.UserName;
    //    Session["Password"] = this.Login1.Password;
    //    DateTime dtLoginDate;
    //    int nIsAgree;
    //    int nContactId;
    //    //Session["KitchenId"] = 1157910826;
    //    //string strURL = "~/ControlPanel/Kitchen/Default.aspx";
    //    //lblCheck.Text = strURL;
    //    //Response.Redirect(strURL);
    //    RoleManagerProvider getRoles = new RoleManagerProvider();
    //    //string[] strRoles1 = getRoles.GetRolesForUser(this.Login1.UserName);

    //    //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, this.Login1.UserName, DateTime.Now,
    //    //    DateTime.Now.AddMinutes(50), this.Login1.RememberMeSet, "Test Data");
    //    //string hashCookies = FormsAuthentication.Encrypt(ticket);
    //    //HttpCookie cookie = new HttpCookie("LoginCookie", hashCookies);
    //    //string returnUrl = Request.QueryString["ReturnUrl"];

    //    //if (returnUrl == null)
    //    //{  




    //    if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "DistrictAdmin"))
    //    {
    //        ProcessGetDistrict district = new ProcessGetDistrict();
    //        IDataReader districtReader = district.Get(this.Login1.UserName, this.Login1.Password);
    //        if (districtReader.Read())
    //        {
    //            // Type Id specifies the Corporate level
    //            // 5 - Free Trial
    //            // 4 - HBez
    //            // 3 - HBFlex without Reporting
    //            // 2 - HBFlex with Reporting
    //            // 1 - Command Central
    //            Session["DistrictId"] = (int)districtReader["DistrictId"];
    //            Session["TypeId"] = (int)districtReader["TypeId"];
    //            if (districtReader["Active"].ToString() != "1")
    //            {
    //                //Redirect to Error page
    //                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=3");
    //            }
    //            //Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    //            // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
    //            ProcessGetContact getContactInfo = new ProcessGetContact();
    //            DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
    //            if (ds.Tables[0].Rows.Count > 0)
    //            {
    //                foreach (DataRow dr in ds.Tables[0].Rows)
    //                {
    //                    if (dr["LoginDate"].ToString() != "")
    //                    {
    //                        dtLoginDate = DateTime.Parse(dr["LoginDate"].ToString());
    //                    }
    //                    else
    //                    {
    //                        dtLoginDate = DateTime.Today.AddDays(-90);
    //                    }
    //                    if (dr["IsAgree"].ToString() != "")
    //                    {
    //                        nIsAgree = int.Parse(dr["IsAgree"].ToString());
    //                    }
    //                    else
    //                    {
    //                        nIsAgree = 0;
    //                    }
    //                    nContactId = int.Parse(dr["ContactId"].ToString());
    //                    if (nIsAgree == 1)
    //                    {
    //                        TimeSpan span = DateTime.Today.Subtract(dtLoginDate);
    //                        if (span.Days >= 90)
    //                        {
    //                            // MOVE TO AGREEMENT PAGE
    //                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString() );
    //                        }
    //                        else
    //                        {
    //                             string returnUrl =Request.QueryString["ReturnUrl"];
    //                            if (returnUrl == null)
    //                            {
    //                                Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
    //                            }

    //                            else
    //                            {
    //                                Response.Redirect(returnUrl);
    //                            }
    //                        }
    //                    }
    //                    else
    //                    {
    //                        // MOVE TO AGREEMENT PAGE
    //                        Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString());
    //                    }

    //                }
    //            }


    //        }
    //        else
    //        {
    //            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
    //        }


    //    }
    //    else
    //        if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "KitchenAdmin"))
    //        {
    //            ProcessGetKitchen kitchen = new ProcessGetKitchen();
    //            IDataReader kitchenReader = kitchen.Get(this.Login1.UserName, this.Login1.Password);
    //            if (kitchenReader.Read())
    //            {
    //                Session["KitchenId"] = (int)kitchenReader["KitchenId"];
    //                Session["TypeId"] = (int)kitchenReader["TypeId"];
    //                if (kitchenReader["Active"].ToString() != "1")
    //                {
    //                    //Redirect to Error page
    //                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
    //                }

    //                if ((int)Session["TypeId"] == 1)
    //                {
    //                    //Implemented for Free Trila Locations. If exceeds the limit , user couldn't login.
    //                    TimeSpan span = DateTime.Today.Subtract(DateTime.Parse(kitchenReader["CreatedDate"].ToString()));

    //                    //if (span.Days > 10)
    //                    //{
    //                    //    //Redirect to Error Page
    //                    //    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?category=2");
    //                    //}
    //                }


    //                // GET AGREEMENT INFO TO SHOW AGREEMENT PAGE
    //                ProcessGetContact getContactInfo = new ProcessGetContact();
    //                DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
    //                if (ds.Tables[0].Rows.Count > 0)
    //                {
    //                    foreach (DataRow dr in ds.Tables[0].Rows)
    //                    {
    //                        if (dr["LoginDate"].ToString() != "")
    //                        {
    //                            dtLoginDate = DateTime.Parse(dr["LoginDate"].ToString());
    //                        }
    //                        else
    //                        {
    //                            dtLoginDate = DateTime.Today.AddDays(-90);
    //                        }
    //                        if (dr["IsAgree"].ToString() != "")
    //                        {
    //                            nIsAgree = int.Parse(dr["IsAgree"].ToString());
    //                        }
    //                        else
    //                        {
    //                            nIsAgree = 0;
    //                        }
    //                        nContactId = int.Parse(dr["ContactId"].ToString());
    //                        if (nIsAgree == 1)
    //                        {
    //                            TimeSpan span = DateTime.Today.Subtract(dtLoginDate);
    //                            if (span.Days >= 90)
    //                            {
    //                                // WHEN 90 DAYS HAVE BEEN PASSED, MOVE TO AGREEMENT PAGE
    //                                Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
    //                            }
    //                            else
    //                            {
    //                                Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    //                            }
    //                        }
    //                        else
    //                        {
    //                            // WHEN USER IS LOGIN FIRST TIME, MOVE TO AGREEMENT PAGE
    //                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
    //                        }

    //                    }
    //                }
    //            }
    //            else
    //            {
    //                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
    //            }


    //        }
    //        else
    //            if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "Administrator"))
    //            {
    //                Response.Redirect("~/ControlPanel/Admin/Default.aspx");
    //            }
    //            else
    //            {
    //                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
    //            }
    //}


    private void GetDetails()
    {


        Session["Username"] = this.Login1.UserName;
        Session["Password"] = this.Login1.Password;
        DateTime dtLoginDate;
        int nIsAgree = 0;
        int nContactId;
        //string strIP =  HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        string strIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        int nAgree = 0;
        //Session["KitchenId"] = 1157910826;
        //string strURL = "~/ControlPanel/Kitchen/Default.aspx";
        //lblCheck.Text = strURL;
        //Response.Redirect(strURL);
        RoleManagerProvider getRoles = new RoleManagerProvider();
        //string[] strRoles1 = getRoles.GetRolesForUser(this.Login1.UserName);

        //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, this.Login1.UserName, DateTime.Now,
        //    DateTime.Now.AddMinutes(50), this.Login1.RememberMeSet, "Test Data");
        //string hashCookies = FormsAuthentication.Encrypt(ticket);
        //HttpCookie cookie = new HttpCookie("LoginCookie", hashCookies);
        //string returnUrl = Request.QueryString["ReturnUrl"];

        //if (returnUrl == null)
        //{  




        if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "DistrictAdmin"))
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
                        if (dr["LoginDate"].ToString() != "")
                        {
                            dtLoginDate = DateTime.Parse(dr["LoginDate"].ToString());
                        }
                        else
                        {
                            dtLoginDate = DateTime.Today.AddDays(-90);
                        }
                        if (dr["IsAgree"].ToString() != "")
                        {
                            nIsAgree = int.Parse(dr["IsAgree"].ToString());
                        }
                        else
                        {
                            nIsAgree = 0;
                        }
                        nContactId = int.Parse(dr["ContactId"].ToString());
                        if (nIsAgree == 1)
                        {
                            TimeSpan span = DateTime.Today.Subtract(dtLoginDate);
                            if (span.Days >= 90)
                            {
                                // MOVE TO AGREEMENT PAGE
                                Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString());
                            }
                            else
                            {

                                Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");

                            }
                        }
                        else
                        {
                            // MOVE TO AGREEMENT PAGE
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=d&Contact=" + nContactId.ToString());
                        }

                    }
                }


            }
            else
            {
                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
            }


        }
        else
            if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "KitchenAdmin"))
            {
                ProcessGetKitchen kitchen = new ProcessGetKitchen();
                IDataReader kitchenReader = kitchen.Get(this.Login1.UserName, this.Login1.Password);
                if (kitchenReader.Read())
                {
                    Session["KitchenId"] = (int)kitchenReader["KitchenId"];
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
                    ProcessGetContactAgreement getAgreement = new ProcessGetContactAgreement();
                    
                    DataSet ds = getContactInfo.GetContactByUser(this.Login1.UserName, this.Login1.Password);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            ////////////////////
                            // OLD AGREEMENT CODE
                            //if (dr["LoginDate"].ToString() != "")
                            //{
                            //    dtLoginDate = DateTime.Parse(dr["LoginDate"].ToString());
                            //}
                            //else
                            //{
                            //    dtLoginDate = DateTime.Today.AddDays(-90);
                            //}
                            //if (dr["IsAgree"].ToString() != "")
                            //{
                            //    nIsAgree = int.Parse(dr["IsAgree"].ToString());
                            //}
                            //else
                            //{
                            //    nIsAgree = 0;
                            //}
                            /////////////////////
                            nContactId = int.Parse(dr["ContactId"].ToString());
                            DataSet dsAgreement = getAgreement.GetContactAgreementByDate(nContactId,strIP);
                            if (dsAgreement.Tables[0].Rows.Count > 0)
                            {
                                Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
                            }
                            else
                            {                                
                               Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());                               
                            }
                            
                                
                            
                            
                            ////////////////////
                            // OLD AGREEMENT CODE
                            //if (nIsAgree == 1)
                            //{
                            //    TimeSpan span = DateTime.Today.Subtract(dtLoginDate);
                            //    if (span.Days >= 90)
                            //    {
                            //        // WHEN 90 DAYS HAVE BEEN PASSED, MOVE TO AGREEMENT PAGE
                            //        Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
                            //    }
                            //    else
                            //    {
                            //        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");

                            //    }
                            //}
                            //else
                            //{
                            //    // WHEN USER IS LOGIN FIRST TIME, MOVE TO AGREEMENT PAGE
                            //    Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=k&Contact=" + nContactId.ToString());
                            //}
                            ///////////////////////
                        }
                    }
                }
                else
                {
                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                }
               
            }
            else
                if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "KitchenEmployee"))
        {
            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            IDataReader kitchenReader = kitchen.Get(this.Login1.UserName, this.Login1.Password);
            string strInitials = "";
           
            if (kitchenReader.Read())
            {
                Session["KitchenId"] = (int)kitchenReader["KitchenId"];
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
                        if (dr["LoginDate"].ToString() != "")
                        {
                            dtLoginDate = DateTime.Parse(dr["LoginDate"].ToString());
                        }
                        else
                        {
                            dtLoginDate = DateTime.Today.AddDays(-90);
                        }
                        if (dr["IsAgree"].ToString() != "")
                        {
                            nIsAgree = int.Parse(dr["IsAgree"].ToString());
                        }
                        else
                        {
                            nIsAgree = 0;
                        }
                        nContactId = int.Parse(dr["ContactId"].ToString());
                        strInitials = dr["Initials"].ToString();
                        Session["Initials"] = strInitials;
                        if (dr["Active"].ToString() != "1")
                        {
                            //Redirect to Error page, if Contact is inactive
                            Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx?Category=1");
                        }

                        if (nIsAgree == 1)
                        {
                            TimeSpan span = DateTime.Today.Subtract(dtLoginDate);
                            if (span.Days >= 90)
                            {
                                // WHEN 90 DAYS HAVE BEEN PASSED, MOVE TO AGREEMENT PAGE
                                Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                            }
                            else
                            {
                                Response.Redirect("~/ControlPanel/Location/Default.aspx");

                            }
                        }
                        else
                        {
                            // WHEN USER IS LOGIN FIRST TIME, MOVE TO AGREEMENT PAGE
                            Response.Redirect("~/ControlPanel/Membership/Agreement.aspx?target=l&Contact=" + nContactId.ToString());
                        }

                    }
                }
            }
            else
            {
                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
            }


        }
            else
                if (getRoles.IsUserInRole(this.Login1.UserName, this.Login1.Password, "Administrator"))
                {

                    Response.Redirect("~/ControlPanel/Admin/Default.aspx");
                }
                else
                {
                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                }


    }
}
