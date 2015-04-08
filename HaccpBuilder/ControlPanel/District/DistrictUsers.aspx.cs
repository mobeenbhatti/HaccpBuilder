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

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;


public partial class ControlPanel_District_DistrictUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblInfo.Visible = false;
       // btnBack.Attributes.Add("onclick", "MoveBack( )");
        if (!this.IsPostBack)
        {
            if (Request.QueryString["UserId"] != null)
            {
                SetPage(1);
                //DataSet dsContact;
                //ProcessGetContact getContact = new ProcessGetContact();
                //string strRoleName = "";
                //dsContact = getContact.GetContactsByContactId(int.Parse(Request.QueryString["UserId"]));
                //if (dsContact.Tables[0].Rows.Count > 0)
                //{
                //    hfContactId.Value = dsContact.Tables[0].Rows[0]["ContactId"].ToString();
                //    ddlKitchenEdit.SelectedValue = dsContact.Tables[0].Rows[0]["KitchenId"].ToString();
                //    txtEmailAddressEdit.Text = dsContact.Tables[0].Rows[0]["EmailAddress"].ToString();
                //    txtPasswordEdit.Text = dsContact.Tables[0].Rows[0]["Password"].ToString();
                //    txtUserEdit.Text = dsContact.Tables[0].Rows[0]["UserId"].ToString();
                //    strRoleName = dsContact.Tables[0].Rows[0]["RoleName"].ToString();
                //}
                //if (strRoleName == "KitchenAdmin")
                //{
                //    //rdbKitchen.Checked = true;
                //    rdbLoginLevel.SelectedIndex = 1;
                //}
                //if (strRoleName == "DistrictAdmin")
                //{
                //    //rdbDistrict.Checked = true;
                //    rdbLoginLevel.SelectedIndex = 0;
                //}
                //if (strRoleName == "DistrictReadOnly")
                //{
                //    //rdbDistrictRead.Checked = true;
                //}
                //txtEmailAddressEdit.Enabled = true;
                //txtPasswordEdit.Enabled = true;
                //txtUserEdit.Enabled = true;
                //rqVldEmail.Enabled = true;
                //rqVldName.Enabled = true;
                //rqVldPassword.Enabled = true;
                //ValidationSummary1.Enabled = true;
                ////rqVldRole.Enabled = false;
                //cmdSubmit.Enabled = true;


            }
            else
            {
                SetPage(2);
                //txtEmailAddressEdit.Enabled = false;
                //txtPasswordEdit.Enabled = false;
                //txtUserEdit.Enabled = false;
                //rqVldEmail.Enabled = false;
                //rqVldName.Enabled = false;
                //rqVldPassword.Enabled = false;
                //rqVldRole.Enabled = false;
                //ValidationSummary1.Enabled = false;
                //cmdSubmit.Enabled = false;
                
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    
    protected void cmdSearchByEmail_Click(object sender, EventArgs e)
    {
        GetData(3);
    }
    protected void cmdSearchByKitchen_Click(object sender, EventArgs e)
    {
        GetData(1);
    }
    protected void cmdSearchByUserName_Click(object sender, EventArgs e)
    {
        GetData(2);
    }
    private void GetData(int nCriteria)
    {
        DataSet dsResultSet = new DataSet();
        ProcessGetContact contact = new ProcessGetContact();
        switch (nCriteria)
        {
            case 1:
                // Search By Kitchen Id
               // dsResultSet = contact.GetContactByKitchen(int.Parse(ddlKitchenName.SelectedValue));
                break;
            case 2:
                // Search By User Name
                dsResultSet = contact.GetContactByUser(txtUserName.Text.Trim());
                break;
            case 3:
                // Search By Email Address
                dsResultSet = contact.GetContactsByEmail(txtEmailAddress.Text, (int)Session["DistrictId"]);
                break;
        }
        if (dsResultSet.Tables[0].Rows.Count > 0)
        {
            grdSearchKitchen.DataSource = dsResultSet;
            grdSearchKitchen.DataBind();
            grdSearchKitchen.Visible = true;
            grdUser.Visible = false;
        }
        else
        {
            lblInfo.Text = "No Data Found";
            lblInfo.Visible = true;
        }
       
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (CheckData() == true)
        {
            string password = txtPasswordEdit.Text;
            string passwordSalt = Guid.NewGuid().ToString();
            if (txtUserEdit.Text.Contains("@"))
                password = Utilities.CreatePasswordHash(password, passwordSalt);

            Contact contact = new Contact();
            contact.ContactId = int.Parse(hfContactId.Value);
            contact.Email = txtUserEdit.Text;
            contact.UserId = txtUserEdit.Text;
            contact.Password = password;
            contact.RoleName = "KitchenAdmin";
            contact.PasswordSalt = passwordSalt;
            contact.IsUpdated = true;
            //if (rdbLoginLevel.SelectedIndex == 1)
            //{ contact.RoleName = "KitchenAdmin"; }
            //else
            //{ contact.RoleName = "DistrictAdmin"; }
            //if (rdbDistrict.Checked == true)
            //{
            //    contact.RoleName = "DistrictAdmin";
            //}
            //if (rdbKitchen.Checked == true)
            //{
            //    contact.RoleName = "KitchenAdmin";
            //}
            //if (rdbDistrictRead.Checked == true)
            //{
            //    contact.RoleName = "DistrictReadOnly";
            //}

            ProcessSetContact setContact = new ProcessSetContact();
            setContact.Contact = contact;
            setContact.Invoke();
            int nStatus = SendMessage(contact.UserId, txtPasswordEdit.Text, contact.Email);
           if (nStatus == 1)
           {
               lblInfo.Text = "User Information Updated Succesfully and email has been sent";
           }
           else
           {
               lblInfo.Text = "User Information Updated Succesfully";
           }
            lblInfo.Visible = true;
            SetPage(2);
        }
        
    }
    private bool CheckData()
    {
        ProcessGetContact contact = new ProcessGetContact();
        DataSet dsContact = contact.GetContactByUserName(txtUserEdit.Text,int.Parse(hfContactId.Value));
        if(dsContact.Tables[0].Rows.Count > 0)
        {
            lblInfo.Text = "User Already Exists";
            lblInfo.Visible = true;
            return false;
        }
        else
        {
            return true;
        }
        //ProcessGetKitchen kitchen = new ProcessGetKitchen();
        //IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchenName.Text);
        //if (drKitchen.Read())
        //{
        //    lblInfo.Text = "Kitchen Already Exist";
        //    lblInfo.Visible = true;
        //    return false;
        //}
        //else
        //{
        //    return true;
        //}
    }
    private void SetPage(int nState)
    {
        if (nState == 1 || nState == 4)
        {
            DataSet dsContact;
            ProcessGetContact getContact = new ProcessGetContact();
            string strRoleName = "";
            if (nState == 1)
            {
                dsContact = getContact.GetContactsByContactId(int.Parse(Request.QueryString["UserId"]));
            }
            else
            {
                dsContact = getContact.GetContactByKitchen(int.Parse(ddlKitchenEdit.SelectedValue));
            }
            if (dsContact.Tables[0].Rows.Count > 0)
            {
                hfContactId.Value = dsContact.Tables[0].Rows[0]["ContactId"].ToString();
                ddlKitchenEdit.SelectedValue = dsContact.Tables[0].Rows[0]["KitchenId"].ToString();
                txtUserEdit.Text = dsContact.Tables[0].Rows[0]["EmailAddress"].ToString();
                //txtPasswordEdit.Text = dsContact.Tables[0].Rows[0]["Password"].ToString();
                txtUserEdit.Text = dsContact.Tables[0].Rows[0]["UserId"].ToString();
                strRoleName = dsContact.Tables[0].Rows[0]["RoleName"].ToString();
            }
            //if (strRoleName == "KitchenAdmin")
            //{
            //    //rdbKitchen.Checked = true;
            //    rdbLoginLevel.SelectedIndex = 1;
            //}
            //if (strRoleName == "DistrictAdmin")
            //{
            //    //rdbDistrict.Checked = true;
            //    rdbLoginLevel.SelectedIndex = 0;
            //}
            //if (strRoleName == "DistrictReadOnly")
            //{
            //    //rdbDistrictRead.Checked = true;
            //}
           // txtEmailAddressEdit.Enabled = true;
            txtPasswordEdit.Enabled = true;
            txtUserEdit.Enabled = true;
           // rqVldEmail.Enabled = true;
            rqVldName.Enabled = true;
            rqVldPassword.Enabled = true;
            ValidationSummary1.Enabled = true;
            //rqVldRole.Enabled = false;
            cmdSubmit.Enabled = true;
        }
        if (nState == 2)
        {
          //  txtEmailAddressEdit.Enabled = false;
            txtPasswordEdit.Enabled = false;
            txtUserEdit.Enabled = false;
           // rqVldEmail.Enabled = false;
            rqVldName.Enabled = false;
            rqVldPassword.Enabled = false;
            //rqVldRole.Enabled = false;
            ValidationSummary1.Enabled = false;
            cmdSubmit.Enabled = false;
           // txtEmailAddressEdit.Text = "";
            txtUserEdit.Text = "";
            txtPasswordEdit.Text = "";
            grdUser.DataBind();
        }

        string Info1 = "<b>The password length must be greater than or equal to 8.</b>";
        Info1 += "<b>The password must contain one or more uppercase characters.</b><br /> ";
        Info1 += "<b>The password must contain one or more lowercase characters.</b><br /> ";
        Info1 += "<b>The password must contain one or more numeric values.</b><br /> ";
        Info1 += "<b>The password must contain one or more special characters.</b><br /> ";


        Img_passwordhelp.Attributes.Add("onmouseover", "return overlib('" + Info1 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
        Img_passwordhelp.Attributes.Add("onmouseout", "return nd();");
        //if (nState == 3)
        //{
        //    txtEmailAddressEdit.Text = "";
        //    txtUserEdit.Text = "";
        //    txtPasswordEdit.Text = "";
        //    grdUser.DataBind();
        //}
    }
    protected void ddlKitchenEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetPage(4);
    }
    private int SendMessage(string strUserName, string strPassword, string strEmail)
    {

        //string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder because your company has set up HACCP  <br/> Builder to manage your site’s/location’s food safety program.  HACCP Builder makes it easy to <br/> build and manage your HACCP Plan plus keep your site/location in compliance with the <br/>USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
        //strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";
        string strBody = "<br/>Your login's have been changed:<br/> Your new Username is:" + strUserName + "<br/> Your new Password is:" + strPassword + "<br/> Your new Email is:" + strEmail;
        EmailContents contents = new EmailContents();
        contents.Body = strBody;
        contents.Subject = "Your HACCP Builder Credentials has changed. Please use this information to sign in.";
        EmailManager emailManager = new EmailManager();
        try
        {
            emailManager.ToAddress = strEmail;
            emailManager.SendUserInfo(contents);
        }
        catch (Exception)
        {
            return 0;
        }
        if (emailManager.IsSent)
        {
            return 1;
        }
        else
        {
            return 0;
        }

    }
}
