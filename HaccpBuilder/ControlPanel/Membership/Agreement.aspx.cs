using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_Membership_Agreement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdAccept_Click(object sender, ImageClickEventArgs e)
    {
        int nContactId;
        string Target;
        nContactId = int.Parse(Request.QueryString["Contact"]);
        Target = Request.QueryString["target"];
        UpdateContactLogin(nContactId);
        HaccpUser user = (HaccpUser)Session["User"];
        if (Target == "d")
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
            if (Target == "l")
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
            else
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


    }
    private void UpdateContactLogin(int nContactId)
    {
        ProcessCreateContactAgreement createContactAgreement = new ProcessCreateContactAgreement();
        ContactAgreement agreement = new ContactAgreement();
        agreement.Agree = 1;
        agreement.ContactID = nContactId;
        string strIP =  HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        agreement.IPAddress = strIP;
        //HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        createContactAgreement.ContactAgreement = agreement;
        
        createContactAgreement.Invoke();
        //ProcessSetContact setContact = new ProcessSetContact();
        //setContact.UpdateContactLoginStatus(nContactId, DateTime.Today, 1);
        
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("~/ControlPanel/Membership/LoginFailure.aspx");
    }
    protected void cmdAccept_Click(object sender, EventArgs e)
    {
        int nContactId;
        string Target;
        nContactId = int.Parse(Request.QueryString["Contact"]);
        Target = Request.QueryString["target"];
        UpdateContactLogin(nContactId);
        HaccpUser user = (HaccpUser)Session["User"];
        if (Target == "d")
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
            if (Target == "l")
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
            else
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
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Logout.aspx");
    }
}
