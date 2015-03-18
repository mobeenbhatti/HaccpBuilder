using System;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;
using SchoolHaccp.Operational;



public partial class ControlPanel_LoginPage : System.Web.UI.Page
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
    private void GetDetails()
    {
        Session["Username"] = this.Login1.UserName;
        Session["Password"] = this.Login1.Password;
        RoleManagerProvider getRoles = new RoleManagerProvider();
        //string[] strRoles1 = getRoles.GetRolesForUser(this.Login1.UserName);

        //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, this.Login1.UserName, DateTime.Now,
        //    DateTime.Now.AddMinutes(50), this.Login1.RememberMeSet, "Test Data");
        //string hashCookies = FormsAuthentication.Encrypt(ticket);
        //HttpCookie cookie = new HttpCookie("LoginCookie", hashCookies);
        //string returnUrl = Request.QueryString["ReturnUrl"];
        
        //if (returnUrl == null)
        //{  
        if(getRoles.IsUserInRole(this.Login1.UserName,this.Login1.Password,"DistrictAdmin"))
        {
            ProcessGetDistrict district = new ProcessGetDistrict();
            IDataReader districtReader = district.Get(this.Login1.UserName,this.Login1.Password);
            if (districtReader.Read())
            {
                Session["DistrictId"] = (int)districtReader["DistrictId"];
                districtReader.Close();
                Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
            }
            else
            {
                Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
            }
           
            
        }
        else
            if (getRoles.IsUserInRole(this.Login1.UserName,this.Login1.Password, "KitchenAdmin"))
            {
                ProcessGetKitchen kitchen = new ProcessGetKitchen();
                IDataReader kitchenReader = kitchen.Get(this.Login1.UserName,this.Login1.Password);
                if (kitchenReader.Read())
                {
                    Session["KitchenId"] =(int)kitchenReader["KitchenId"];
                    kitchenReader.Close();
                    Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
                }
                else
                {
                    Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
                }
                
                
            }
            else
                if (getRoles.IsUserInRole(this.Login1.UserName,this.Login1.Password, "Administrator"))
                {                                     
                        Response.Redirect("~/ControlPanel/Admin/Default.aspx");                    
                }        
        }
        //else
        //{
        //    Response.Redirect(returnUrl);
        //}


    
    
}
