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
    private static string mode = "NEW";
    private static DataSet dsSections;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            if (TypeId < 6)
            {
                Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
            }
            ProcessGetWeeklyReport weeklyReport = new ProcessGetWeeklyReport();
            DataSet dsChecklistSections = weeklyReport.GetchecklistSectionsByKitchenId((int)Session["KitchenId"]);
            rptChecklist.DataSource = dsChecklistSections;
            rptChecklist.DataBind();
            if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
            {
                // ItemId = int.Parse(Request.QueryString["Id"]);                
                mode = "edit";                
                ProcessGetWeeklyReport gethecklistSections = new ProcessGetWeeklyReport();
                dsSections = gethecklistSections.GetchecklistSectionsByMobileId(int.Parse(Request.QueryString["Id"]));
                GetData();                
            }            
           SetPage(); 
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
            //this.ddlTimeZone.SelectedIndex = 0;
            chkActive.Checked = true;
            this.rdbColdHoldingLogAlertOff.Checked = true;
            //this.rdbColdHoldingLogAlertOn.Enabled = false;
            this.rdbColdHoldingLogOff.Checked = true;
            this.rdbFoodSafetyAlertOff.Checked = true;
            //this.rdbFoodSafetyAlertOn.Enabled = false;
            this.rdbFoodSafetyOff.Checked = true;
            this.rdbFreezerLogAlertOff.Checked = true;
            this.rdbFreezerNewLogAlertOff.Checked = true;
            //this.rdbFreezerLogAlertOn.Enabled = false;
            this.rdbFreezerLogOff.Checked = true;
            this.rdbFreezerNewLogOff.Checked = true;
            this.rdbHotHoldingLogAlertOff.Checked = true;
            //this.rdbHotHoldingLogAlertOn.Enabled = false;
            this.rdbHotHoldingLogOff.Checked = true;
            this.rdbReceivingLogAlertOff.Checked = true;
            //this.rdbReceivingLogAlertOn.Enabled = false;
            this.rdbReceivingLogOff.Checked = true;
            this.rdbRefrigerationLogAlertOff.Checked = true;
            //this.rdbRefrigerationLogAlertOn.Enabled = false;
            this.rdbRefrigerationLogOff.Checked = true;
            this.rdbShippingLogAlertOff.Checked = true;
            this.rdbShippingLogOff.Checked = true;
            this.rdbTemperatureLogAlertOff.Checked = true;
            //this.rdbTemperatureLogAlertOn.Enabled = false;
            this.rdbTemperatureLogOff.Checked = true;
            this.rdbThermometerAlertOff.Checked = true;
            //this.rdbThermometerAlertOn.Enabled = false;
            this.rdbThermometerOff.Checked = true;
            this.rdbValidationAlertOff.Checked = true;
            //this.rdbValidationAlertOn.Enabled = false;
            this.rdbValidationOff.Checked = true;
            this.rdbPhLogAlertOff.Checked = true;
            this.rdbPhLogOff.Checked = true;
            this.rdbPestLogAlertOff.Checked = true;
            this.rdbPestLogOff.Checked = true;
            this.rdbMaintenanceLogAlertOff.Checked = true;
            this.rdbMaintenanceLogOff.Checked = true;
            //this.rdbChecklistAlertOff.Checked = true;
            //this.rdbChecklistOff.Checked = true;
            this.rdbCleaningLogAlertOff.Checked = true;
            this.rdbCleaningLogOff.Checked = true;
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
        if (TypeId == 7)
        {
            // CT-PAT Location
            pnlFscl.Visible = false;
            pnlValidation.Visible = false;
        }
        GetIntialData();
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
            txtTimeZone.Text = drKitchen["DisplayName"].ToString();
            hfTimeZone.Value = drKitchen["TimeZone"].ToString();
            hfCountry.Value = drKitchen["CountryRegionCode"].ToString();
            //Session["KitchenId"] = Convert.ToInt32(hfKitchenId.Value);
            //Session["KitchenName"] = drKitchen["KitchenName"].ToString();
            drKitchen.Close();
        }
        ProcessGetDailyReports getLogSettings = new ProcessGetDailyReports();
        DataSet dsLogSetting = getLogSettings.GetReportsStatus((int)Session["KitchenId"]);
        if (dsLogSetting.Tables[0].Rows.Count  > 0)
        {
            foreach (DataRow drLog in dsLogSetting.Tables[0].Rows)
            {
                if (drLog["ColdHoldingLog"].ToString() == "0")
                {
                    rdbColdHoldingLogAlertOff.Enabled = false;
                    rdbColdHoldingLogAlertOn.Enabled = false;
                    rdbColdHoldingLogOff.Enabled = false;
                    rdbColdHoldingLogOn.Enabled = false;
                    rdbColdHoldingLogOff.Checked = true;
                    rdbColdHoldingLogAlertOff.Checked = true;
                }
                if (drLog["FoodSafetyCheckList"].ToString() == "0")
                {
                    rdbFoodSafetyAlertOff.Enabled = false;
                    rdbFoodSafetyAlertOn.Enabled = false;
                    rdbFoodSafetyOff.Enabled = false;
                    rdbFoodSafetyOn.Enabled = false;
                    rdbFoodSafetyOff.Checked = true;
                    rdbFoodSafetyAlertOff.Checked = true;
                    
                }
                if (drLog["FreezerLog"].ToString() == "0")
                {
                    rdbFreezerLogAlertOff.Enabled = false;
                    rdbFreezerLogAlertOn.Enabled = false;
                    rdbFreezerLogOff.Enabled = false;
                    rdbFreezerLogOn.Enabled = false;
                    rdbFreezerLogOff.Checked = true;
                    rdbFreezerLogAlertOff.Checked = true;                    
                }
                if (drLog["FreezerNewLog"].ToString() == "0")
                {
                    rdbFreezerNewLogAlertOff.Enabled = false;
                    rdbFreezerNewLogAlertOn.Enabled = false;
                    rdbFreezerNewLogOff.Enabled = false;
                    rdbFreezerNewLogOn.Enabled = false;
                    rdbFreezerNewLogOff.Checked = true;
                    rdbFreezerNewLogAlertOff.Checked = true;
                }
                if (drLog["HotHoldingLog"].ToString() == "0")
                {
                    rdbHotHoldingLogAlertOff.Enabled = false;
                    rdbHotHoldingLogAlertOn.Enabled = false;
                    rdbHotHoldingLogOff.Enabled = false;
                    rdbHotHoldingLogOn.Enabled = false;
                    rdbHotHoldingLogOff.Checked = true;
                    rdbHotHoldingLogAlertOff.Checked = true;
                }
                if (drLog["ReceivingLog"].ToString() == "0")
                {
                    rdbReceivingLogAlertOff.Enabled = false;
                    rdbReceivingLogAlertOn.Enabled = false;
                    rdbReceivingLogOff.Enabled = false;
                    rdbReceivingLogOn.Enabled = false;
                    rdbReceivingLogOff.Checked = true;
                    rdbReceivingLogAlertOff.Checked = true;
                }
                if (drLog["RefrigerationLog"].ToString() == "0")
                {
                    rdbRefrigerationLogAlertOff.Enabled = false;
                    rdbRefrigerationLogAlertOn.Enabled = false;
                    rdbRefrigerationLogOff.Enabled = false;
                    rdbRefrigerationLogOn.Enabled = false;
                    rdbRefrigerationLogOff.Checked = true;
                    rdbRefrigerationLogAlertOff.Checked = true;
                }
                if (drLog["ShippingLog"].ToString() == "0")
                {
                    rdbShippingLogAlertOff.Enabled = false;
                    rdbShippingLogAlertOn.Enabled = false;
                    rdbShippingLogOff.Enabled = false;
                    rdbShippingLogOn.Enabled = false;
                    rdbShippingLogOff.Checked = true;
                    rdbShippingLogAlertOff.Checked = true;
                }
                if (drLog["TemperatureLog"].ToString() == "0")
                {
                    rdbTemperatureLogAlertOff.Enabled = false;
                    rdbTemperatureLogAlertOn.Enabled = false;
                    rdbTemperatureLogOff.Enabled = false;
                    rdbTemperatureLogOn.Enabled = false;
                    rdbTemperatureLogOff.Checked = true;
                    rdbTemperatureLogAlertOff.Checked = true;
                }
                if (drLog["Thermometer"].ToString() == "0")
                {
                    rdbThermometerAlertOff.Enabled = false;
                    rdbThermometerAlertOn.Enabled = false;
                    rdbThermometerOff.Enabled = false;
                    rdbThermometerOn.Enabled = false;
                    rdbThermometerOff.Checked = true;
                    rdbThermometerAlertOff.Checked = true;
                }
                if (drLog["Validation"].ToString() == "0")
                {
                    rdbValidationAlertOff.Enabled = false;
                    rdbValidationAlertOn.Enabled = false;
                    rdbValidationOff.Enabled = false;
                    rdbValidationOn.Enabled = false;
                    rdbValidationOff.Checked = true;
                    rdbValidationAlertOff.Checked = true;
                }
                if (drLog["PhLog"].ToString() == "0")
                {
                    rdbPhLogAlertOff.Enabled = false;
                    rdbPhLogAlertOn.Enabled = false;
                    rdbPhLogOff.Enabled = false;
                    rdbPhLogOn.Enabled = false;
                    rdbPhLogOff.Checked = true;
                    rdbPhLogAlertOff.Checked = true;
                }
                if (drLog["PestLog"].ToString() == "0")
                {
                    rdbPestLogAlertOff.Enabled = false;
                    rdbPestLogAlertOn.Enabled = false;
                    rdbPestLogOff.Enabled = false;
                    rdbPestLogOn.Enabled = false;
                    rdbPestLogOff.Checked = true;
                    rdbPestLogAlertOff.Checked = true;
                }
                if (drLog["MaintenanceLog"].ToString() == "0")
                {
                    rdbMaintenanceLogAlertOff.Enabled = false;
                    rdbMaintenanceLogAlertOn.Enabled = false;
                    rdbMaintenanceLogOff.Enabled = false;
                    rdbMaintenanceLogOn.Enabled = false;
                    rdbMaintenanceLogOff.Checked = true;
                    rdbMaintenanceLogAlertOff.Checked = true;
                }
                if (drLog["CleaningLog"].ToString() == "0")
                {
                    rdbCleaningLogAlertOff.Enabled = false;
                    rdbCleaningLogAlertOn.Enabled = false;
                    rdbCleaningLogOff.Enabled = false;
                    rdbCleaningLogOn.Enabled = false;
                    rdbCleaningLogOff.Checked = true;
                    rdbCleaningLogAlertOff.Checked = true;
                }
                if (drLog["CheckList"].ToString() == "0")
                {
                    //rdbChecklistAlertOff.Enabled = false;
                    //rdbChecklistAlertOn.Enabled = false;
                    //rdbChecklistOff.Enabled = false;
                    //rdbChecklistOn.Enabled = false;
                    //rdbChecklistOff.Checked = true;
                    //rdbChecklistAlertOff.Checked = true;
                }                
               // SetChecklistDefaults();
               
            }
        }
        
    }
    private void GetData()
    {
        if (Request.QueryString["Id"] != null)
        {

            //ProcessGetContact contact = new ProcessGetContact();
            //DataSet dsContact = contact.GetContactDetailByContactId(int.Parse(Request.QueryString["Id"]));
            ProcessGetMobile getMobile = new ProcessGetMobile();
            getMobile.Invoke(int.Parse(Request.QueryString["Id"]));
            Mobile mobile = getMobile.Mobile;
            Contact contact = getMobile.Contact;
            Address address = getMobile.Address;
            txtEmail.Text = contact.Email;
            txtEmployeeName.Text = contact.Name;
            txtInitials.Text = contact.Initials;
            txtPassword.Text = contact.Password;
            txtPhone1.Text = contact.Phone;
            txtPhone2.Text = contact.AltPhone;
            txtFax.Text = contact.Fax;
            txtUserId.Text = contact.UserId;
            hfContactId.Value = contact.ContactId.ToString();
            hfAddressId.Value = address.AddressId.ToString();
            hfMobileId.Value = mobile.MobileId.ToString();            
           // ddlTimeZone.SelectedValue = address.TimeZone;
            chkActive.Checked = mobile.Active == 1 ? true : false;
            GetIntialData();
            if (mobile.ColdHoldingLog == 1)
            {
                rdbColdHoldingLogOn.Checked = true;
            }
            else
            {
                rdbColdHoldingLogOff.Checked = true;
            }
            if (mobile.FoodSafetyCheckList == 1)
            {
                rdbFoodSafetyOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyOff.Checked = true;
            }
            if (mobile.FreezerLog == 1)
            {
                rdbFreezerLogOn.Checked = true;
            }
            else
            {
                rdbFreezerLogOff.Checked = true;
            }
            if (mobile.FreezerNewLog == 1)
            {
                rdbFreezerNewLogOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogOff.Checked = true;
            }
            if (mobile.HotHoldingLog == 1)
            {
                rdbHotHoldingLogOn.Checked = true;
            }
            else
            {
                rdbHotHoldingLogOff.Checked = true;
            }
            if (mobile.ReceivingLog == 1)
            {
                rdbReceivingLogOn.Checked = true;
            }
            else
            {
                rdbReceivingLogOff.Checked = true;
            }
            if (mobile.RefrigerationLog == 1)
            {
                rdbRefrigerationLogOn.Checked = true;
            }
            else
            {
                rdbRefrigerationLogOff.Checked = true;
            }
            if (mobile.ShippingLog == 1)
            {
                rdbShippingLogOn.Checked = true;
            }
            else
            {
                rdbShippingLogOff.Checked = true;
            }
            if (mobile.TemperatureLog == 1)
            {
                rdbTemperatureLogOn.Checked = true;
            }
            else
            {
                rdbTemperatureLogOff.Checked = true;
            }
            if (mobile.Thermometer == 1)
            {
                rdbThermometerOn.Checked = true;
            }
            else
            {
                rdbThermometerOff.Checked = true;
            }

            if (mobile.Validation == 1)
            {
                rdbValidationOn.Checked = true;
            }
            else
            {
                rdbValidationOff.Checked = true;
            }
            if (mobile.TemperatureLogAlert == 1)
            {
                rdbTemperatureLogAlertOn.Checked = true;
            }
            else
            {
                rdbTemperatureLogAlertOff.Checked = true;
            }
            if (mobile.HotHoldingLogAlert == 1)
            {
                rdbHotHoldingLogAlertOn.Checked = true;
            }
            else
            {
                rdbHotHoldingLogAlertOff.Checked = true;
            }
            if (mobile.ColdHoldingLogAlert == 1)
            {
                rdbColdHoldingLogAlertOn.Checked = true;
            }
            else
            {
                rdbColdHoldingLogAlertOff.Checked = true;
            }
            if (mobile.ReceivingLogAlert == 1)
            {
                rdbReceivingLogAlertOn.Checked = true;
            }
            else
            {
                rdbReceivingLogAlertOff.Checked = true;
            }
            if (mobile.ShippingLogAlert == 1)
            {
                rdbShippingLogAlertOn.Checked = true;
            }
            else
            {
                rdbShippingLogAlertOff.Checked = true;
            }
            if (mobile.FreezerLogAlert == 1)
            {
                rdbFreezerLogAlertOn.Checked = true;
            }
            else
            {
                rdbFreezerLogAlertOff.Checked = true;
            }
            if (mobile.FreezerNewLogAlert == 1)
            {
                rdbFreezerNewLogAlertOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogAlertOff.Checked = true;
            }
            if (mobile.RefrigerationLogAlert == 1)
            {
                rdbRefrigerationLogAlertOn.Checked = true;
            }
            else
            {
                rdbRefrigerationLogAlertOff.Checked = true;
            }
            if (mobile.FoodSafetyCheckListAlert == 1)
            {                
                rdbFoodSafetyAlertOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyAlertOff.Checked = true;
            }
            if (mobile.ThermometerAlert == 1)
            {
                rdbThermometerAlertOn.Checked = true;
            }
            else
            {
                rdbThermometerAlertOff.Checked = true;
            }
            if (mobile.ValidationAlert == 1)
            {
                rdbValidationAlertOn.Checked = true;
            }
            else
            {
                rdbValidationAlertOff.Checked = true;
            }
            if (mobile.PhLog == 1)
                rdbPhLogOn.Checked = true;
            else
                rdbPhLogOff.Checked = true;
            if (mobile.PhLogAlert == 1)
                rdbPhLogAlertOn.Checked = true;
            else
                rdbPhLogAlertOff.Checked = true;
            if (mobile.PestLog == 1)
                rdbPestLogOn.Checked = true;
            else
                rdbPestLogOff.Checked = true;
            if (mobile.PestLogAlert == 1)
                rdbPestLogAlertOn.Checked = true;
            else
                rdbPestLogAlertOff.Checked = true;
            if (mobile.MaintenanceLog == 1)
                rdbMaintenanceLogOn.Checked = true;
            else
                rdbMaintenanceLogOff.Checked = true;
            if (mobile.MaintenanceLogAlert == 1)
                rdbMaintenanceLogAlertOn.Checked = true;
            else
                rdbMaintenanceLogAlertOff.Checked = true;
            //if (mobile.CheckList == 1)
            //    rdbChecklistOn.Checked = true;
            //else
            //    rdbChecklistOff.Checked = true;
            if (mobile.CleaningLog == 1)
                rdbCleaningLogOn.Checked = true;
            else
                rdbCleaningLogOff.Checked = true;
            if (mobile.CleaningLogAlert == 1)
                rdbCleaningLogAlertOn.Checked = true;
            else
                rdbCleaningLogAlertOff.Checked = true;
            
            //ProcessGetWeeklyReport gethecklistSections = new ProcessGetWeeklyReport();
            //DataSet dsSections = gethecklistSections.GetchecklistSectionsByMobileId(int.Parse(Request.QueryString["Id"]));
            //foreach (DataRow dr in dsSections.Tables[0].Rows)
            //{
            //    foreach (ListItem item in chkSection.Items)
            //        if (dr["CheckListSectionId"].ToString() == item.Value)
            //            item.Selected = true;

            //}
            BindChecklistSections();
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
        newAddress.TimeZone = txtTimeZone.Text;
        newAddress.AddressId = int.Parse(hfAddressId.Value);
        newAddress.Country = hfCountry.Value;

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

        Mobile mobile = new Mobile();
        mobile.Active = chkActive.Checked == true ? 1 : 0;    
        //mobile.MobileId = (int)Session["MobileId"];
        mobile.MobileId = int.Parse(hfMobileId.Value);
        mobile.KitchenId = (int)Session["KitchenId"];        
        GetLogSettings(mobile);
       
        //Kitchen kitchen = new Kitchen();
        //kitchen.KitchenId = (int)Session["KitchenId"];

        //ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        //setKitchen.Kitchen = kitchen;
        ProcessSetMobile setMobile = new ProcessSetMobile();
        setMobile.Contact = newContact;
        setMobile.Address = newAddress;
        setMobile.Mobile = mobile;
        setMobile.Invoke();
        SetMobileChecklistSettings(int.Parse(hfMobileId.Value));

        return 1;
    }
    private int DeleteData()
    {
        ProcessDeleteMobile deleteMobile = new ProcessDeleteMobile();
        deleteMobile.Invoke(int.Parse(hfMobileId.Value));
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
        newAddress.TimeZone = txtTimeZone.Text;
        newAddress.Country = hfCountry.Value;
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

        Mobile mobile = new Mobile();
        mobile.Active = chkActive.Checked == true ? 1 : 0;
       // mobile.MobileId = (int)Session["MobileId"];
        mobile.KitchenId = (int)Session["KitchenId"];
        mobile.Name = "Log Settings";
        GetLogSettings(mobile);
        //Kitchen kitchen = new Kitchen();
        //kitchen.KitchenId = (int)Session["KitchenId"];

        //ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        //createKitchen.Kitchen = kitchen;
        ProcessCreateMobile createMobile = new ProcessCreateMobile();
        createMobile.Contact = newContact;
        createMobile.Address = newAddress;
        createMobile.Mobile = mobile;
        createMobile.Invoke();

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
        ProcessGetMobile getMobile = new ProcessGetMobile();
        DataSet dsNewMobile = getMobile.GetNewMobileAccount();
        foreach (DataRow dr in dsNewMobile.Tables[0].Rows)
        {
            hfMobileId.Value = dr["MobileId"].ToString();
            SetMobileChecklistSettings(int.Parse(hfMobileId.Value));
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
    private void GetLogSettings(Mobile mobile)
    {
        mobile.ColdHoldingLog = rdbColdHoldingLogOn.Checked == true ? 1 : 0;
        mobile.ColdHoldingLogAlert = rdbColdHoldingLogAlertOn.Checked == true ? 1 : 0;
        mobile.FoodSafetyCheckList = rdbFoodSafetyOn.Checked == true ? 1 : 0;
        mobile.FoodSafetyCheckListAlert = rdbFoodSafetyAlertOn.Checked == true ? 1 : 0;
        mobile.FreezerLog = rdbFreezerLogOn.Checked == true ? 1 : 0;
        mobile.FreezerLogAlert = rdbFreezerLogAlertOn.Checked == true ? 1 : 0;
        mobile.FreezerNewLog = rdbFreezerNewLogOn.Checked == true ? 1 : 0;
        mobile.FreezerNewLogAlert = rdbFreezerNewLogAlertOn.Checked == true ? 1 : 0;
        mobile.HotHoldingLog = rdbHotHoldingLogOn.Checked == true ? 1 : 0;
        mobile.HotHoldingLogAlert = rdbHotHoldingLogAlertOn.Checked == true ? 1 : 0;
        mobile.ReceivingLog = rdbReceivingLogOn.Checked == true ? 1 : 0;
        mobile.ReceivingLogAlert = rdbReceivingLogAlertOn.Checked == true ? 1 : 0;
        mobile.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        mobile.RefrigerationLogAlert = rdbRefrigerationLogAlertOn.Checked ? 1 : 0;
        mobile.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
        mobile.ShippingLogAlert = rdbShippingLogAlertOn.Checked ? 1 : 0;
        mobile.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        mobile.TemperatureLogAlert = rdbTemperatureLogAlertOn.Checked ? 1 : 0;
        mobile.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        mobile.ThermometerAlert = rdbThermometerAlertOn.Checked ? 1 : 0;
        mobile.Validation = rdbValidationOn.Checked ? 1 : 0;
        mobile.ValidationAlert = rdbValidationAlertOn.Checked ? 1 : 0;
        mobile.PhLogAlert = rdbPhLogAlertOn.Checked ? 1 : 0;
        mobile.PhLog = rdbPhLogOn.Checked ? 1 : 0;
        mobile.PestLogAlert = rdbPestLogAlertOn.Checked ? 1 : 0;
        mobile.PestLog = rdbPestLogOn.Checked ? 1 : 0;
        mobile.MaintenanceLogAlert = rdbMaintenanceLogAlertOn.Checked ? 1 : 0;
        mobile.MaintenanceLog = rdbMaintenanceLogOn.Checked ? 1 : 0;
        mobile.CleaningLogAlert = rdbCleaningLogAlertOn.Checked ? 1 : 0;
        mobile.CleaningLog = rdbCleaningLogOn.Checked ? 1 : 0;
        mobile.CheckListAlert = 1;
        mobile.CheckList = 1;
        
    }
    private void SetMobileChecklistSettings(int nMobileId)
    {
        // First delete entries from Mobilechecklist table and then Insert new records.
        ProcessDeleteMobile deleteMobileChecklist = new ProcessDeleteMobile();
        deleteMobileChecklist.DeleteMobileChecklist(nMobileId);
        int i, totalItems ;
        totalItems = rptChecklist.Items.Count;
        for (i = 0; i < totalItems; i++)
        {
            RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOn");
            HiddenField hfChecklistId = (HiddenField)rptChecklist.Items[i].FindControl("hfKitchenChecklist");
            if (rdbAnswerYes.Checked == true)
            {
                ProcessCreateMobile createMobile = new ProcessCreateMobile();
               // createMobile.CreateMobileChecklist(nMobileId, int.Parse(hfChecklistId.Value));
            }
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
        int result = DeleteData();
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
    private void BindChecklistSections()
    {
       int totalItems = rptChecklist.Items.Count;
       int i;
        for (i = 0; i < totalItems; i++)
        {
            RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOn");
            RadioButton rdbChecklistNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOff");
            HiddenField hfChecklistId = (HiddenField)rptChecklist.Items[i].FindControl("hfKitchenChecklist");
            if (dsSections != null)
            {
                foreach (DataRow dr in dsSections.Tables[0].Rows)
                {
                    if (hfChecklistId != null)
                    {
                        if (hfChecklistId.Value == dr["CheckListSectionId"].ToString())
                        {
                            rdbAnswerYes.Checked = true;
                            break;
                        }
                    }
                }
            }
        }
    }
    private void SetChecklistDefaults()
    {
        int totalItems = rptChecklist.Items.Count;
       int i;
       for (i = 0; i < totalItems; i++)
       {          
           RadioButton rdbChecklistNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOff");
           rdbChecklistNo.Checked = true;
       }
    }
    protected void rptChecklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    HiddenField hfChecklistId = (HiddenField)e.Item.FindControl("hfKitchenChecklist");
        //    RadioButton rdbChecklistYes = (RadioButton)e.Item.FindControl("rdbChecklistOn");
        //    RadioButton rdbChecklistNo = (RadioButton)e.Item.FindControl("rdbChecklistOff");
        //    if (dsSections != null)
        //    {
        //        foreach (DataRow dr in dsSections.Tables[0].Rows)
        //        {
        //            if (hfChecklistId != null)
        //            {
        //                if (hfChecklistId.Value == dr["CheckListSectionId"].ToString())
        //                {
        //                    rdbChecklistYes.Checked = true;
        //                    break;
        //                }
        //                else
        //                {
        //                    rdbChecklistYes.Checked = false;
        //                    rdbChecklistNo.Checked = true;

        //                }
        //            }
        //        }
        //    }
        //}
    }
    public int TypeId
    {
        get
        {
            if (Session["TypeId"] != null)
                return (int)Session["TypeId"];
            else
            {
                Response.Redirect("~/ControlPanel/LogOut.aspx");
                return 0;
            }

        }
    }
}
