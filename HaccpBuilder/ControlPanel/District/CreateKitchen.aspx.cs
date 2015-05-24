using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
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
using System.IO;


public partial class ControlPanel_District_CreateKitchen : System.Web.UI.Page
{
    public string mode="NEW";
    private bool itemFound = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //btnBack.Attributes.Add("onclick", "MoveBack( )");
            if (Request.QueryString["KitchenName"] != null)
            {
                mode = "EDIT";
                SetPage();
                GetData();
            }
            else
            {
                mode = "NEW";
                SetPage();
            }
            if (TypeId == (int)DistrictTypeEnum.Ctpat)
            {
                pnlValidation.Visible = false;
                pnlFscl.Visible = false;
            }
        }
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }       

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {

        if (CheckData() == true)
        {
           CreateData();
           
        }
        
        
    }

    private bool CheckData()
    {
        if (mode == "NEW")
        {
            if (Utilities.IsEmailExist(txtEmail.Text) == true)
                return false;
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            IDataReader drKitchenLimit = getKitchen.GetKitchenLimitByDistrictId((int)Session["DistrictId"]);
            drKitchenLimit.Read();
            if (Convert.ToInt32(drKitchenLimit["AllowedKitchen"].ToString()) <= Convert.ToInt32(drKitchenLimit["TotalKitchen"].ToString()))
            {
                lblInfo.Text = "Location Limit Has Filled With Your Selected Service Level";
                lblInfo.Visible = true;
                return false;
            }
            if (drKitchenLimit.IsClosed == false)
            {
                drKitchenLimit.Close();
            }

        }
        if (mode == "EDIT")
        {
            if (Utilities.IsEmailExist(txtEmail.Text,int.Parse(hfContactId.Value)) == true)
                return false;

        }
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchenName.Text);
        if (drKitchen.Read())
        {
            lblInfo.Text = "Location Already Exist";
            lblInfo.Visible = true;
            drKitchen.Close();
            return false;
        }
        else
        {
            return true;
        }
    }
    private void CreateData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.CheckList = rdbChecklistOn.Checked ? 1 : 0;
        newKitchen.CheckListAlert = rdbChecklistAlertOn.Checked ? 1 : 0;       
        newKitchen.CleaningLog = rdbCleaningLogOn.Checked ? 1 : 0;
        newKitchen.CleaningLogAlert = rdbCleaningLogAlertOn.Checked ? 1 : 0;
        newKitchen.CleaningLogMax = 0;
        newKitchen.CleaningLogMin = 0;    
        newKitchen.ColdHoldingLog = rdbColdHoldingLogOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogAlert = rdbColdHoldingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogMax = 0; // float.Parse(txtColdHoldingHigh.Text);
        newKitchen.ColdHoldingLogMin = 0; // float.Parse(txtColdHoldingLow.Text);
        newKitchen.FoodSafetyCheckList = rdbFoodSafetyOn.Checked ? 1 : 0;
        newKitchen.FoodSafetyCheckListAlert = rdbFoodSafetyAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerLog = rdbFreezerLogOn.Checked ? 1 : 0;
        newKitchen.FreezerLogAlert = rdbFreezerLogAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerLogMax = 0; // float.Parse(txtFreezerLogHigh.Text);
        newKitchen.FreezerLogMin = 0; // float.Parse(txtFreezerLogLow.Text);
        newKitchen.FreezerNewLog = rdbFreezerNewLogOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogAlert = rdbFreezerLogAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogMax = 0; // float.Parse(txtFreezerNewLogHigh.Text);
        newKitchen.FreezerNewLogMin = 0; // float.Parse(txtFreezerNewLogLow.Text);
        newKitchen.HotHoldingLog = rdbHotHoldingLogOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogAlert = rdbHotHoldingLogAlertOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogMax = 0; // float.Parse(txtHotHoldingLogHigh.Text);
        newKitchen.HotHoldingLogMin = 0; // float.Parse(txtHotHoldingLogLow.Text);
        newKitchen.ReceivingLog = rdbReceivingLogOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogAlert = rdbReceivingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogMax = 0; // float.Parse(txtReceivingLogHigh.Text);
        newKitchen.ReceivingLogMin = 0; // float.Parse(txtReceivingLogLow.Text);
        newKitchen.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogAlert = rdbRefrigerationLogAlertOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogMax = 0; // float.Parse(txtRefrigerationLogHigh.Text);
        newKitchen.RefrigerationLogMin = 0; // float.Parse(txtRefrigerationLogLow.Text);
        newKitchen.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
        newKitchen.ShippingLogAlert = rdbShippingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ShippingLogMax = 0; // float.Parse(txtShippingLogHigh.Text);
        newKitchen.ShippingLogMin = 0; // float.Parse(txtShippingLogLow.Text);
        newKitchen.PhLog = rdbPhLogOn.Checked ? 1 : 0;
        newKitchen.PhLogAlert = rdbPhLogAlertOn.Checked ? 1 : 0;
        newKitchen.PhLogMax = 0;
        newKitchen.PhLogMin = 0;
        newKitchen.PestLog = rdbPestLogOn.Checked ? 1 : 0;
        newKitchen.PestLogAlert = rdbPestLogAlertOn.Checked ? 1 : 0;
        newKitchen.PestLogMax = 0;
        newKitchen.PestLogMin = 0;
        newKitchen.MaintenanceLog = rdbMaintenanceLogOn.Checked ? 1 : 0;
        newKitchen.MaintenanceLogAlert = rdbMaintenanceLogAlertOn.Checked ? 1 : 0;
        newKitchen.MaintenanceLogMax = 0;
        newKitchen.MaintenanceLogMin = 0;
        newKitchen.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        newKitchen.TemperatureLogAlert = rdbTemperatureLogAlertOn.Checked ? 1 : 0;
        //newKitchen.TemperatureLogMax = float.Parse(txtTemperatureLogHigh.Text);
        //newKitchen.TemperatureLogMin = float.Parse(txtTemperatureLogLow.Text);
        newKitchen.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        newKitchen.ThermometerAlert = rdbThermometerAlertOn.Checked ? 1 : 0;
       // newKitchen.ThermometerMax = float.Parse(txtThermometerHigh.Text);
       // newKitchen.ThermometerMin = float.Parse(txtThermometerLow.Text);
        newKitchen.Validation = rdbValidationOn.Checked ? 1 : 0;
        newKitchen.ValidationAlert = rdbValidationAlertOn.Checked ? 1 : 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Vendors = 0;
        newKitchen.Reports = 0;
        switch (TypeId)
        {
            case (int)DistrictTypeEnum.HaccpBuilder:
                newKitchen.Kitchentype = 6;
                break;
            case (int)DistrictTypeEnum.Ctpat:
                 newKitchen.Kitchentype = 7;
                break;           
            case (int)DistrictTypeEnum.HaccpCtpat:
                 newKitchen.Kitchentype = 8;
                break;
        }     
        newKitchen.Active = 1;

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        //newAddress.State = ddlStateProvince.SelectedItem.Text;
        if (hfState.Value != "")
        {
            newAddress.State = txtState.Text.Trim();
        }
        else
        {
            newAddress.State = this.ddlStateProvince.SelectedValue;
        }
        newAddress.ZipCode = txtZipCode.Text;
        newAddress.TimeZone = ddlTimeZone.SelectedValue;
        newAddress.Country = ddlCountry.SelectedValue;

        string strUserName, strPassword;        
        //strUserName = "UID" + GenerateUserName();
        strPassword = GenerateRandomPassword();

        SchoolHaccp.Common.Contact newContact = new SchoolHaccp.Common.Contact();        
        newContact.AltPhone = txtAltPhone.Text;        
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        newContact.EmailAlerts = 1;
        newContact.UserId = txtEmail.Text;

        string passwordSalt = Guid.NewGuid().ToString();        
        newContact.PasswordSalt = passwordSalt;
        newContact.Password = Utilities.CreatePasswordHash(strPassword, passwordSalt);
        newContact.IsUpdated = true;
        

        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = newKitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        int kitchenID = 0;
        kitchenID = createKitchen.Create();

        int nUpdated = SendMessage(txtEmail.Text, strPassword,txtEmail.Text);
        if (nUpdated == 1)
        {
            lblInfo.Text = "Location Created Succesfully";
            lblInfo.Visible = true;

        }
        else
        {
            lblInfo.Text = "Location Created Succesfully, but there is problem occured in email sending";
            lblInfo.Visible = true;
        }
        UploadLogo(kitchenID);
        SetPage();
       
    }
    private void UploadLogo(int kitchenID)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = kitchenID.ToString() + Path.GetFileName(FileUpload1.PostedFile.FileName);
            try
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/Logos/") + fileName);
                ProcessSetKitchen setKitchen = new ProcessSetKitchen();
                setKitchen.UpdateKitchenLogo(kitchenID,fileName);
                
            }
            catch (Exception ex)
            {
                lblInfo.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                lblInfo.Visible = true;
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
    private int SendMessage(string strUserName,string strPassword,string strEmail)
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
    private string GenerateUserName()
    {
        try
        {
            const int MaxPassLenght = 6;
            const int MaxCharLenght = 4;
            const int MaxNumLength = 2;
            string[] ArrFinal = new string[MaxPassLenght];
            int i = 0;
            string strRandom = "";

            string[] ArrChar = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
            string[] Arrnum = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };


            Random rnd = new Random();

            while (i < MaxCharLenght)
            {
                strRandom += "," + ArrChar[rnd.Next(ArrChar.Length - 1)];
                i++;
            }

            i = 0;
            while (i < MaxNumLength)
            {
                strRandom += "," + Arrnum[rnd.Next(Arrnum.Length - 1)];
                i++;
            }
            strRandom = strRandom.TrimStart((",")[0]);

            for (int j = 0; j <= MaxPassLenght - 1; j++)
            {
                ArrFinal.SetValue(strRandom.Split(","[0])[j], j);
            }

            i = 0;
            strRandom = "";
            while (i < MaxPassLenght)
            {

                strRandom += ArrFinal[rnd.Next(MaxPassLenght)];
                i++;
            }
            return strRandom;
        }
        catch
        { return "password"; }
    }
    private string GenerateRandomPassword()
    {

        int maxSize = 20;
        int minSize = 10;
        char[] passwordCharacters = "GHIJKLMNOPQRST@#$!0123456789".ToCharArray();
        //char[] passwordCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789".ToCharArray();

        int size = maxSize;
        byte[] data = new byte[9];
        System.Security.Cryptography.RNGCryptoServiceProvider crypto = new System.Security.Cryptography.RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        size = (data[0] % (maxSize - minSize)) + minSize;
        // ERROR: Not supported in C#: ReDimStatement
        crypto.GetNonZeroBytes(data);
        System.Text.StringBuilder result = new System.Text.StringBuilder(size);
        foreach (byte datum in data)
        {
            result.Append(passwordCharacters[datum % (passwordCharacters.Length - 1)]);
        }

        return result.ToString();

    }
    private void SetPage()
    {
        if (mode == "NEW")
        {
            this.txtAddress1.Text = "";
            this.txtAddress2.Text = "";
            this.txtAltPhone.Text = "";
            this.txtCity.Text = "";
            this.txtEmail.Text = "";
            this.txtFax.Text = "";
            this.txtKitchenName.Text = "";
            this.txtManagerName.Text = "";
            this.txtPhone.Text = "";
            this.txtZipCode.Text = "";
            
            //////////////////////////////
            // LOG CUSTOMIZATION 12-23-09
            //////////////////////////////
            this.hlColdHoldingLog.Enabled = false;
            this.hlCooling.Enabled = false;
            this.hlHotHolding.Enabled = false;
            this.hlReceiving.Enabled = false;
            this.hlRefrigeration.Enabled = false;
            this.hlShippingLog.Enabled = false;
            this.hlFreezerNewLog.Enabled = false;
            this.hlPh.Enabled = false;
            this.hlPest.Enabled = false;
            this.hlMaintenance.Enabled = false;
            this.hlCleaningLog.Enabled = false;
            //this.hlThermometerLog.Enabled = false;

            ///////////////////////////////
            this.ddlCountry.DataBind();
            this.ddlCountry.SelectedValue = "US";
            //this.ddlStateProvince.SelectedIndex = 0;
            this.rdbChecklistOff.Checked = true;
            this.rdbChecklistAlertOff.Checked = true;   
            this.rdbCleaningLogAlertOff.Checked = true;
            this.rdbCleaningLogOff.Checked = true;
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
            this.txtState.Text = "";
            this.txtState.Visible = false;
            this.ddlStateProvince.Visible = true;
            hfState.Value = "";
            cmdCancel.Visible = false;
            cmdEdit.Visible = false;
            cmdSubmit.Visible = true;
        }
        else
        {
            //////////////////////////////
            // LOG CUSTOMIZATION 12-23-09
            //////////////////////////////
            this.hlColdHoldingLog.Enabled = true;
            this.hlCooling.Enabled = true;
            this.hlHotHolding.Enabled = true;
            this.hlReceiving.Enabled = true;
            this.hlShippingLog.Enabled = true;
            this.hlRefrigeration.Enabled = true;
            this.hlPh.Enabled = true;
            this.hlPest.Enabled = true;
            this.hlMaintenance.Enabled = true;
            this.hlCleaningLog.Enabled = true;
           // this.hlThermometerLog.Enabled = true;
            ///////////////////////////////

            //txtTemperatureLogHigh.Text = "N/A";
            //txtTemperatureLogLow.Text = "N/A";
            //txtFSCLHigh.Text = "N/A";
            //txtFSCLLow.Text = "N/A";
            //txtThermometerHigh.Text = "N/A";
            //txtThermometerLow.Text = "N/A";
            //txtValidationHigh.Text = "N/A";
            //txtValidationLow.Text = "N/A";
            this.ddlCountry.DataBind();
            this.ddlCountry.SelectedValue = "US";
            cmdCancel.Visible = true;
            cmdEdit.Visible = true;
            cmdSubmit.Visible = false;
        }
    }

    protected void cmdEdit_Click(object sender, EventArgs e)
    {
        if (UpdateData() == 1)
        {
            // Kitchen Created Successfuly
            lblInfo.Text = "Kitchen Updated Succesfully";
            lblInfo.Visible = true;
            mode = "NEW";
            SetPage();
        }
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        mode = "NEW";
        SetPage();
    }
    private void GetData()
    {
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        IDataReader drKitchen = kitchen.GetKitchenByName(Request.QueryString["KitchenName"]);
        
        if (drKitchen.Read())
        {
            //if (drKitchen["EmailAlerts"].ToString() == "1")
            //{
            //    rdbAlertsYes.Checked = true;
            //}
            //else
            //{
            //    rdbAlertsNo.Checked = true;
            //}
            if (int.Parse(drKitchen["CheckList"].ToString()) == 1)
            {
                rdbChecklistOn.Checked = true;
            }
            else
            {
                rdbChecklistOff.Checked = true;
            }
            if (int.Parse(drKitchen["CleaningLog"].ToString()) == 1)
            {
                rdbCleaningLogOn.Checked = true;
            }
            else
            {
                rdbCleaningLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["ColdHoldingLog"].ToString()) == 1)
            {
                rdbColdHoldingLogOn.Checked = true;
            }
            else
            {
                rdbColdHoldingLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["FoodSafetyChecklist"].ToString()) == 1)
            {
                rdbFoodSafetyOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyOff.Checked = true;
            }
            if (int.Parse(drKitchen["FreezerLog"].ToString()) == 1)
            {
                rdbFreezerLogOn.Checked = true;
            }
            else
            {
                rdbFreezerLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["FreezerNewLog"].ToString()) == 1)
            {
                rdbFreezerNewLogOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["HotHoldingLog"].ToString()) == 1)
            {
                rdbHotHoldingLogOn.Checked = true;
            }
            else
            {
                rdbHotHoldingLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["ReceivingLog"].ToString()) == 1)
            {
                rdbReceivingLogOn.Checked = true;
            }
            else
            {
                rdbReceivingLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["RefrigerationLog"].ToString()) == 1)
            {
                rdbRefrigerationLogOn.Checked = true;
            }
            else
            {
                rdbRefrigerationLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["ShippingLog"].ToString()) == 1)
            {
                rdbShippingLogOn.Checked = true;
            }
            else
            {
                rdbShippingLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["TemperatureLog"].ToString()) == 1)
            {
                rdbTemperatureLogOn.Checked = true;
            }
            else
            {
                rdbTemperatureLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["Thermometer"].ToString()) == 1)
            {
                rdbThermometerOn.Checked = true;
            }
            else
            {
                rdbThermometerOff.Checked = true;
            }

            if (drKitchen["Validation"].ToString() == "1")
            {
                rdbValidationOn.Checked = true;
            }
            else
            {
                rdbValidationOff.Checked = true;
            }
            if (int.Parse(drKitchen["PhLog"].ToString()) == 1)
            {
                rdbPhLogOn.Checked = true;
            }
            else
            {
                rdbPhLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["PestLog"].ToString()) == 1)
            {
                rdbPestLogOn.Checked = true;
            }
            else
            {
                rdbPestLogOff.Checked = true;
            }
            if (int.Parse(drKitchen["MaintenanceLog"].ToString()) == 1)
            {
                rdbMaintenanceLogOn.Checked = true;
            }
            else
            {
                rdbMaintenanceLogOff.Checked = true;
            }
            if(drKitchen["TemperatureLogAlert"].ToString() == "1")
            {
                rdbTemperatureLogAlertOn.Checked=true;
            }
            else
            {
                rdbTemperatureLogAlertOff.Checked=true;
            }
            if(drKitchen["HotHoldingLogAlert"].ToString() == "1") 
            {
                rdbHotHoldingLogAlertOn.Checked = true ;
            }
            else
            {
                rdbHotHoldingLogAlertOff.Checked = true;
            }
            if (drKitchen["CheckListAlert"].ToString() == "1")
            {
                rdbChecklistAlertOn.Checked = true;
            }
            else
            {
                rdbChecklistAlertOff.Checked = true;
            }
            if (drKitchen["CleaningLogAlert"].ToString() == "1")
            {
                rdbCleaningLogAlertOn.Checked = true;
            }
            else
            {
                rdbCleaningLogAlertOff.Checked = true;
            }
            if(drKitchen["ColdHoldingLogAlert"].ToString() == "1" )
            { 
                rdbColdHoldingLogAlertOn.Checked = true; 
            }
            else
            {
                rdbColdHoldingLogAlertOff.Checked = true;
            }
            if (drKitchen["ReceivingLogAlert"].ToString() == "1")
            { 
                rdbReceivingLogAlertOn.Checked = true; 
            }
            else
            { 
                rdbReceivingLogAlertOff.Checked = true; 
            }
            if (drKitchen["ShippingLogAlert"].ToString() == "1")
            {
                rdbShippingLogAlertOn.Checked = true;
            }
            else
            {
                rdbShippingLogAlertOff.Checked = true;
            }
            if (drKitchen["FreezerLogAlert"].ToString() == "1")
            { 
                rdbFreezerLogAlertOn.Checked = true; 
            }
            else
            { 
                rdbFreezerLogAlertOff.Checked = true; 
            }
            if (drKitchen["FreezerNewLogAlert"].ToString() == "1")
            {
                rdbFreezerNewLogAlertOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogAlertOff.Checked = true;
            }
            if (drKitchen["RefrigerationLogAlert"].ToString() == "1")
            { 
                rdbRefrigerationLogAlertOn.Checked = true; 
            }
            else
            {
                rdbRefrigerationLogAlertOff.Checked = true;
            }
            if (drKitchen["FoodSafetyChecklistAlert"].ToString() == "1")
            {
                rdbFoodSafetyAlertOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyAlertOff.Checked = true;
            }
            if (drKitchen["ThermometerAlert"].ToString() == "1")
            {
                rdbThermometerAlertOn.Checked = true;
            }
            else
            {
                rdbThermometerAlertOff.Checked = true;
            }
            if (drKitchen["ValidationAlert"].ToString() == "1")
            {
                rdbValidationAlertOn.Checked = true;
            }
            else
            {
                rdbValidationAlertOff.Checked = true;
            }
            if (drKitchen["PhLogAlert"].ToString() == "1")
            {
                rdbPhLogAlertOn.Checked = true;
            }
            else
            {
                rdbPhLogAlertOff.Checked = true;
            }
            if (drKitchen["PestLogAlert"].ToString() == "1")
            {
                rdbPestLogAlertOn.Checked = true;
            }
            else
            {
                rdbPestLogAlertOff.Checked = true;
            }
            if (drKitchen["MaintenanceLogAlert"].ToString() == "1")
            {
                rdbMaintenanceLogAlertOn.Checked = true;
            }
            else
            {
                rdbMaintenanceLogAlertOff.Checked = true;
            }
               
           // txtTemperatureLogHigh.Text=drKitchen["TemperatureLogMax"].ToString();
           // txtTemperatureLogLow.Text=drKitchen["TemperatureLogMin"].ToString();
            //------------------------------------
            // UPDATED ON 12-22-09 FOR NEW CUSTOMIZATION LOGS
            //------------------------------------
            //txtHotHoldingLogHigh.Text=drKitchen["HotHoldingLogMax"].ToString();
            //txtHotHoldingLogLow.Text=drKitchen["HotHoldingLogMin"].ToString();
            //txtColdHoldingHigh.Text=drKitchen["ColdHoldingLogMax"].ToString();
            //txtColdHoldingLow.Text=drKitchen["ColdHoldingLogMin"].ToString();
            //txtReceivingLogHigh.Text=drKitchen["ReceivingLogMax"].ToString();
            //txtReceivingLogLow.Text=drKitchen["ReceivingLogMin"].ToString();
            //txtFreezerLogHigh.Text=drKitchen["FreezerLogMax"].ToString();
            //txtFreezerLogLow.Text=drKitchen["FreezerLogMin"].ToString();
            //txtRefrigerationLogHigh.Text=drKitchen["RefrigerationLogMax"].ToString();
            //txtRefrigerationLogLow.Text=drKitchen["RefrigerationLogMin"].ToString();
            //txtThermometerHigh.Text=drKitchen["ThermometerMax"].ToString();
            //txtThermometerLow.Text=drKitchen["ThermometerMin"].ToString();
            //------------------------------------
            txtCity.Text = drKitchen["City"].ToString();
            hfKitchenId.Value = drKitchen["KitchenId"].ToString();
            hfAddressId.Value = drKitchen["AddressId"].ToString();
            hfUserId.Value = drKitchen["UserName"].ToString();
            hfPassword.Value = drKitchen["Password"].ToString();
            hfContactId.Value = drKitchen["ContactId"].ToString();
            txtAddress1.Text = drKitchen["AddressLine1"].ToString();
            txtAddress2.Text = drKitchen["AddressLine2"].ToString();
            txtAltPhone.Text = drKitchen["SecondaryPhone"].ToString();
            txtEmail.Text = drKitchen["EmailAddress"].ToString();
            txtFax.Text = drKitchen["Fax"].ToString();
            txtKitchenName.Text = drKitchen["KitchenName"].ToString();
            txtManagerName.Text = drKitchen["Manager"].ToString();
            txtPhone.Text = drKitchen["PrimaryPhone"].ToString();
            txtZipCode.Text = drKitchen["PostalCode"].ToString();
            if (drKitchen["Country"].ToString().Trim() == "")
                ddlCountry.SelectedValue = "US";
            else
                ddlCountry.SelectedValue = drKitchen["Country"].ToString().Trim();
            //ddlStateProvince.SelectedValue = drKitchen["StateProvinceId"].ToString();
            ddlStateProvince.DataBind();
            if(drKitchen["LogoFileName"].ToString() != "")
            imgLogo.ImageUrl = "~/images/Logos/" + drKitchen["LogoFileName"].ToString();
            foreach (ListItem item in ddlStateProvince.Items)
            {
                if (item.Value == drKitchen["StateProvinceId"].ToString())
                {
                    item.Selected = true;
                    itemFound = true;
                }
            }
            if (itemFound == false)
            {
                ddlStateProvince.Visible = false;
                txtState.Visible = true;
                rfvState.Enabled = false;
                rfvState2.Enabled = true;
                hfState.Value = "1";
                txtState.Text = drKitchen["State"].ToString();
            }
            else
            {
                ddlStateProvince.Visible = true;
                txtState.Visible = false;
                rfvState.Enabled = true;
                rfvState2.Enabled = false;
                hfState.Value = "";
            }
            ddlTimeZone.SelectedValue = drKitchen["TimeZone"].ToString();
            Session["KitchenId"] = Convert.ToInt32(hfKitchenId.Value);
            Session["KitchenName"] = drKitchen["KitchenName"].ToString();
            drKitchen.Close();
        }
        else
        {
            lblInfo.Text = "Location Not Found";
            lblInfo.Visible = true;
        }
    }
    private int UpdateData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.CheckList = rdbChecklistOn.Checked ? 1 : 0;
        newKitchen.CheckListAlert = rdbChecklistAlertOn.Checked ? 1 : 0;      
        newKitchen.CleaningLog = rdbCleaningLogOn.Checked ? 1 : 0;
        newKitchen.CleaningLogAlert = rdbCleaningLogAlertOn.Checked ? 1 : 0;
        newKitchen.CleaningLogMax = 0;
        newKitchen.CleaningLogMin = 0;
        newKitchen.ColdHoldingLog = rdbColdHoldingLogOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogAlert = rdbColdHoldingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogMax = 0; // float.Parse(txtColdHoldingHigh.Text);
        newKitchen.ColdHoldingLogMin = 0; // float.Parse(txtColdHoldingLow.Text);
        newKitchen.FoodSafetyCheckList = rdbFoodSafetyOn.Checked ? 1 : 0;
        newKitchen.FoodSafetyCheckListAlert = rdbFoodSafetyAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerLog = rdbFreezerLogOn.Checked ? 1 : 0;
        newKitchen.FreezerLogAlert = rdbFreezerLogAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerLogMax = 0; // float.Parse(txtFreezerLogHigh.Text);
        newKitchen.FreezerLogMin = 0; // float.Parse(txtFreezerLogLow.Text);
        newKitchen.FreezerNewLog = rdbFreezerNewLogOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogAlert = rdbFreezerNewLogAlertOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogMax = 0; // float.Parse(txtFreezerNewLogHigh.Text);
        newKitchen.FreezerNewLogMin = 0; // float.Parse(txtFreezerNewLogLow.Text);
        newKitchen.HotHoldingLog = rdbHotHoldingLogOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogAlert = rdbHotHoldingLogAlertOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogMax = 0; // float.Parse(txtHotHoldingLogHigh.Text);
        newKitchen.HotHoldingLogMin = 0; // float.Parse(txtHotHoldingLogLow.Text);
        newKitchen.ReceivingLog = rdbReceivingLogOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogAlert = rdbReceivingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogMax = 0; // float.Parse(txtReceivingLogHigh.Text);
        newKitchen.ReceivingLogMin = 0; // float.Parse(txtReceivingLogLow.Text);
        newKitchen.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogAlert = rdbRefrigerationLogAlertOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogMax = 0; // float.Parse(txtRefrigerationLogHigh.Text);
        newKitchen.RefrigerationLogMin = 0; // float.Parse(txtRefrigerationLogLow.Text);
        newKitchen.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
        newKitchen.ShippingLogAlert = rdbShippingLogAlertOn.Checked ? 1 : 0;
        newKitchen.ShippingLogMax = 0; // float.Parse(txtShippingLogHigh.Text);
        newKitchen.ShippingLogMin = 0; // float.Parse(txtShippingLogLow.Text)
        newKitchen.PhLog = rdbPhLogOn.Checked ? 1 : 0;
        newKitchen.PhLogAlert = rdbPhLogAlertOn.Checked ? 1 : 0;
        newKitchen.PhLogMax = 0;
        newKitchen.PhLogMin = 0;
        newKitchen.PestLog = rdbPestLogOn.Checked ? 1 : 0;        
        newKitchen.PestLogAlert = rdbPestLogAlertOn.Checked ? 1 : 0;
        newKitchen.PestLogMax = 0;
        newKitchen.PestLogMin = 0;
        newKitchen.MaintenanceLog = rdbMaintenanceLogOn.Checked ? 1 : 0;
        newKitchen.MaintenanceLogAlert = rdbMaintenanceLogAlertOn.Checked ? 1 : 0;
        newKitchen.MaintenanceLogMax = 0;
        newKitchen.MaintenanceLogMin = 0;
        newKitchen.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        newKitchen.TemperatureLogAlert = rdbTemperatureLogAlertOn.Checked ? 1 : 0;
        //newKitchen.TemperatureLogMax = float.Parse(txtTemperatureLogHigh.Text);
        //newKitchen.TemperatureLogMin = float.Parse(txtTemperatureLogLow.Text);
        newKitchen.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        newKitchen.ThermometerAlert = rdbThermometerAlertOn.Checked ? 1 : 0;
       // newKitchen.ThermometerMax = float.Parse(txtThermometerHigh.Text);
       // newKitchen.ThermometerMin = float.Parse(txtThermometerLow.Text);
        newKitchen.Validation = rdbValidationOn.Checked ? 1 : 0;
        newKitchen.ValidationAlert = rdbValidationAlertOn.Checked ? 1 : 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Reports = 1;
        newKitchen.Vendors = 0;
        switch (TypeId)
        {
            case (int)DistrictTypeEnum.HaccpBuilder:
                newKitchen.Kitchentype = 6;
                break;
            case (int)DistrictTypeEnum.Ctpat:
                newKitchen.Kitchentype = 7;
                break;
            case (int)DistrictTypeEnum.HaccpCtpat:
                newKitchen.Kitchentype = 8;
                break;
        }     
        newKitchen.Active = 1;

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        //newAddress.State = this.ddlStateProvince.SelectedItem.Text;
        if (hfState.Value != "")
        {
            newAddress.State = txtState.Text.Trim();
        }
        else
        {
            newAddress.State = this.ddlStateProvince.SelectedValue;
        }
        newAddress.ZipCode = txtZipCode.Text;
        newAddress.TimeZone = ddlTimeZone.SelectedValue;
        newAddress.AddressId = int.Parse(hfAddressId.Value);
        newAddress.Country = ddlCountry.SelectedValue;

        SchoolHaccp.Common.Contact newContact = new SchoolHaccp.Common.Contact();
        newContact.AltPhone = txtAltPhone.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        newContact.EmailAlerts = 1;
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = hfUserId.Value;
        newContact.Password = hfPassword.Value;

        ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        setKitchen.Kitchen = newKitchen;
        setKitchen.Contact = newContact;
        setKitchen.Address = newAddress;
        setKitchen.Invoke();

        UploadLogo(newKitchen.KitchenId);

        return 1;
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlStateProvince.Items.Clear();
        ddlStateProvince.DataBind();
        if (ddlCountry.SelectedValue != "US" && ddlCountry.SelectedValue != "CA")
        {
            ddlStateProvince.Visible = false;
            txtState.Visible = true;
            rfvState.Enabled = false;
            rfvState2.Enabled = true;
            hfState.Value = "1";
        }
        else
        {
            ddlStateProvince.Visible = true;
            txtState.Visible = false;
            rfvState.Enabled = true;
            rfvState2.Enabled = false;
            hfState.Value = "";
        }
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
