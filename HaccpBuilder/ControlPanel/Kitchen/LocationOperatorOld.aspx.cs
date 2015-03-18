using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
using System.Net.Mail;
using System.Data;

public partial class ControlPanel_Kitchen_LocationOperator : System.Web.UI.Page
{
    public static string mode = "NEW";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if ((int)Session["TypeId"] != 6)
            {
                Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
            }
            if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
            {
                // ItemId = int.Parse(Request.QueryString["Id"]);
                mode = "edit";
                SetPage();
                GetData();
            }
            else
            {
                SetPage();
            }
        }
    }
    private void SendMail()
    {
        System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
        mMailMessage.From = new MailAddress("rehman.gull@nxb.com.pk");
        mMailMessage.To.Add(new MailAddress("rehman.gull@hotmail.com"));

        mMailMessage.Subject = "User Login Information: ";
        string strBody = " <b>TEST MESSAGE</b>";
        mMailMessage.Body = strBody;
        mMailMessage.IsBodyHtml = true;
        mMailMessage.Priority = System.Net.Mail.MailPriority.Normal;
        string mSMTPServer = "61.5.139.5";
        //int mSMTPPort = 25;
        SmtpClient SmtpMail = new SmtpClient(mSMTPServer);
        SmtpMail.Credentials = new System.Net.NetworkCredential("rehman.gull@nxb.com.pk", "password");
        SmtpMail.Send(mMailMessage);

    }
    private int SendMessage(string strUserName, string strPassword, string strEmail)
    {
        string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder because your company has set up HACCP  <br/> Builder to manage your site’s/location’s food safety program.  HACCP Builder makes it easy to <br/> build and manage your HACCP Plan plus keep your site/location in compliance with the <br/>USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
        strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";

        EmailContents contents = new EmailContents();
        contents.Body = strBody;
        contents.Subject = "HACCP Builder is now set-up for your location. Please use this information to sign in.";
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
    private void SetPage()
    {
        if (mode == "NEW")
        {         
            
            this.txtEmail.Text = "";
            this.txtFax.Text = "";
            this.txtEmployeeName.Text = "";
            this.txtUserId.Text = "";
            this.txtPassword.Text = "";
            this.txtInitials.Text = "";
            this.txtPhone1.Text = "";
            this.txtPhone2.Text = "";
            this.txtFax.Text = "";
            this.ddlTimeZone.SelectedIndex = 0;
            GetIntialData();


            cmdAdd.Visible = true;
            cmdCancel.Visible = true; 
            cmdSubmit.Visible = false;
            cmdDelete.Visible = false;
        }
        else
        {            

            cmdCancel.Visible = true;
            cmdAdd.Visible = false ;
            cmdSubmit.Visible = true;
            cmdDelete.Visible = true;
        }
        grdHotHolding.DataBind();
    }
    private void GetIntialData()
    {
        
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        IDataReader drKitchen = kitchen.GetKitchenContactByRoleId((int)Session["KitchenId"],2);

        if (drKitchen.Read())
        {
            txtCity.Text = drKitchen["City"].ToString();            
            txtAddress1.Text = drKitchen["AddressLine1"].ToString();
            txtAddress2.Text = drKitchen["AddressLine2"].ToString();
            //txtAltPhone.Text = drKitchen["SecondaryPhone"].ToString();
            txtState.Text = drKitchen["StateProvince"].ToString();
            //txtFax.Text = drKitchen["Fax"].ToString();
            hfStateId.Value = drKitchen["StateProvinceId"].ToString();
           // txtPhone1.Text = drKitchen["PrimaryPhone"].ToString();
            txtZipCode.Text = drKitchen["PostalCode"].ToString();
            
            //Session["KitchenId"] = Convert.ToInt32(hfKitchenId.Value);
            //Session["KitchenName"] = drKitchen["KitchenName"].ToString();
            drKitchen.Close();
        }
    }
    private void GetData()
    {
        if (Request.QueryString["Id"] != null)
        {

            ProcessGetContact contact = new ProcessGetContact();
            DataSet dsContact = contact.GetContactDetailByContactId(int.Parse(Request.QueryString["Id"]));
            if (dsContact.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsContact.Tables[0].Rows)
                {
                    txtEmail.Text = dr["EmailAddress"].ToString();
                    txtEmployeeName.Text = dr["Employee"].ToString();
                    txtInitials.Text = dr["Initials"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                    txtPhone1.Text = dr["PrimaryPhone"].ToString();
                    txtPhone2.Text = dr["SecondaryPhone"].ToString();
                    txtFax.Text = dr["Fax"].ToString();
                    txtUserId.Text = dr["UserName"].ToString();
                    hfContactId.Value = dr["ContactId"].ToString();
                    hfAddressId.Value = dr["AddressId"].ToString();
                    hfStateId.Value = dr["StateProvinceId"].ToString();
                    ddlTimeZone.SelectedValue = dr["TimeZone"].ToString();
                }
                GetIntialData();
            }
        }
        else
        {
            lblInfo.Text = "Employee Not Found";
            lblInfo.Visible = true;
        }
    }
    private int UpdateData(int nMode)
    {        

        Address newAddress = new Address();
        newAddress.AddressId = int.Parse(hfAddressId.Value);
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        newAddress.State = txtState.Text;
        newAddress.ZipCode = txtZipCode.Text;
        newAddress.TimeZone = ddlTimeZone.SelectedValue;
        newAddress.AddressId = int.Parse(hfAddressId.Value);

        Contact newContact = new Contact();
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.AltPhone = txtPhone2.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtEmployeeName.Text;
        newContact.Phone = txtPhone1.Text;
        newContact.EmailAlerts = 0;
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = txtUserId.Text;
        newContact.Password = txtPassword.Text;
        newContact.Initials = txtInitials.Text;
        if (nMode == 1)
        {
            // Updation Mode
            newContact.Active = 1;
        }
        if (nMode == 2)
        {
            // Deletion Mode
            newContact.Active = 0;
        }
       
        

        Kitchen kitchen = new Kitchen();
        kitchen.KitchenId = (int)Session["KitchenId"];

        ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        setKitchen.Kitchen = kitchen;
        setKitchen.Contact = newContact;
        setKitchen.Address = newAddress;
        setKitchen.UpdateKitchenContact();


        return 1;
    }
    private void CreateData()
    {
        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        newAddress.State = txtState.Text;
        newAddress.ZipCode = txtZipCode.Text;
        newAddress.TimeZone = ddlTimeZone.SelectedValue;
        //newAddress.AddressId = int.Parse(hfAddressId.Value);

        Contact newContact = new Contact();
        newContact.AltPhone = txtPhone2.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtEmployeeName.Text;
        newContact.Phone = txtPhone1.Text;
        newContact.EmailAlerts = 0;
        //newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = txtUserId.Text;
        newContact.Password = txtPassword.Text;
        newContact.Initials = txtInitials.Text;

        Kitchen kitchen = new Kitchen();
        kitchen.KitchenId = (int)Session["KitchenId"];

        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = kitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        createKitchen.CreateKitchenEmployee();

        //int nUpdated = SendMessage(txtUserId.Text, txtPassword.Text, txtEmail.Text);
        int nUpdated = 1;
        if (nUpdated == 1)
        {
            lblInfo.Text = "Employee Account Created Succesfully";
            lblInfo.Visible = true;

        }
        else
        {
            lblInfo.Text = "Employee Account Created Succesfully, but there is problem occured in email sending";
            lblInfo.Visible = true;
        }
        SetPage();

    }
    private bool CheckData(int nMode)
    {

        if (nMode == 1)
        {                          
            ProcessGetContact contact = new ProcessGetContact();
            DataSet dsContact = contact.GetContactByUserName(txtUserId.Text.Trim());
            if (dsContact.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "User ID Already Exists";
                lblInfo.Visible = true;
                return false;
            }
            else
            {
                return true;
            }
        }
        if (nMode == 2)
        {            
            ProcessGetContact contact = new ProcessGetContact();
            DataSet dsContact = contact.GetContactByUserName(txtUserId.Text, int.Parse(hfContactId.Value));
            if (dsContact.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "User ID Already Exists";
                lblInfo.Visible = true;
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }

    }
   
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        LogError.Text = "";
        if (Page.IsValid)
        {
            if (CheckData(2) == true)
            {
                mode = "NEW";
                // 1 - Update the Data
                // 2 - Delete Data 
                UpdateData(1);
                SetPage();
            }
            
        }
    }
    protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
    {
        mode = "NEW";
        UpdateData(2);
        SetPage();
        
    }
    protected void cmdAdd_Click(object sender, ImageClickEventArgs e)
    {
        LogError.Text = "";
        if (Page.IsValid)
        {
            if (CheckData(1) == true)
            {
                mode = "NEW";
                CreateData();
                SetPage();
            }
        }
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        mode = "NEW";
        SetPage();
       

    }
    protected void cmdAddNew_Click(object sender, ImageClickEventArgs e)
    {
        mode = "NEW";       
        SetPage();
    }
}
