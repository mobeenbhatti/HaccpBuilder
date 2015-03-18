﻿using System;
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
using System.Net.Mail;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;

public partial class ControlPanel_District_HBFlexR : System.Web.UI.Page
{
    public static string mode = "NEW";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // btnBack.Attributes.Add("onclick", "MoveBack( )");
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
        }
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }


    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
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
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            IDataReader drKitchenLimit = getKitchen.GetKitchenLimitByDistrictId((int)Session["DistrictId"]);
            drKitchenLimit.Read();
            if (Convert.ToInt32(drKitchenLimit["AllowedKitchen"].ToString()) <= Convert.ToInt32(drKitchenLimit["TotalKitchen"].ToString()))
            {
                lblInfo.Text = "Location Limit Has Filled With Your Selected Service Level";
                lblInfo.Visible = true;
                return false;
            }
            if (drKitchenLimit.IsClosed==false)
            {
                drKitchenLimit.Close();
            }
        }
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchenName.Text);
        if (drKitchen.Read())
        {
            lblInfo.Text = "Kitchen Already Exist";
            lblInfo.Visible = true;
            drKitchen.Close();
            return false;
        }
        else
        {
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }
            return true;
        }

        //ProcessGetContact contact = new ProcessGetContact();

        //DataSet dsContact = contact.GetContactByUser(txtUser.Text, txtPassword.Text);
        //if (dsContact.Tables[0].Rows.Count > 0)
        //{
        //    lblInfo.Text = "User ID Already Exists";
        //    lblInfo.Visible = true;
        //    return false;
        //}
        //else
        //{
        //    return true;
        //}

        //if (nMode == 2)
        //{
        //    ProcessGetContact contact = new ProcessGetContact();
        //    DataSet dsContact = contact.GetContactByUserName(txtUser.Text, int.Parse(hfContactId.Value));
        //    if (dsContact.Tables[0].Rows.Count > 0)
        //    {
        //        lblInfo.Text = "User ID Already Exists";
        //        lblInfo.Visible = true;
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}
        //else
        //{
        //    return false;
        //}

    }
    private void CreateData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.ColdHoldingLog = rdbColdHoldingLogOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogAlert = 0;
        newKitchen.ColdHoldingLogMax = float.Parse(txtColdHoldingHigh.Text);
        newKitchen.ColdHoldingLogMin = float.Parse(txtColdHoldingLow.Text);
        newKitchen.FoodSafetyCheckList = rdbFoodSafetyOn.Checked ? 1 : 0;
        newKitchen.FoodSafetyCheckListAlert = 0;
        newKitchen.FreezerLog = rdbFreezerLogOn.Checked ? 1 : 0;
        newKitchen.FreezerLogAlert = 0;
        newKitchen.FreezerLogMax = float.Parse(txtFreezerLogHigh.Text);
        newKitchen.FreezerLogMin = float.Parse(txtFreezerLogLow.Text);
        newKitchen.HotHoldingLog = rdbHotHoldingLogOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogAlert = 0;
        newKitchen.HotHoldingLogMax = float.Parse(txtHotHoldingLogHigh.Text);
        newKitchen.HotHoldingLogMin = float.Parse(txtHotHoldingLogLow.Text);
        newKitchen.ReceivingLog = rdbReceivingLogOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogAlert = 0;
        newKitchen.ReceivingLogMax = float.Parse(txtReceivingLogHigh.Text);
        newKitchen.ReceivingLogMin = float.Parse(txtReceivingLogLow.Text);
        newKitchen.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogAlert = 0;
        newKitchen.RefrigerationLogMax = float.Parse(txtRefrigerationLogHigh.Text);
        newKitchen.RefrigerationLogMin = float.Parse(txtRefrigerationLogLow.Text);
        newKitchen.FreezerNewLog = rdbFreezerNewLogOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogAlert = 0;
        newKitchen.FreezerNewLogMax = float.Parse(txtFreezerNewLogHigh.Text);
        newKitchen.FreezerNewLogMin = float.Parse(txtFreezerNewLogLow.Text);
        newKitchen.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
        newKitchen.ShippingLogAlert = 0;
        newKitchen.ShippingLogMax = float.Parse(txtShippingLogHigh.Text);
        newKitchen.ShippingLogMin = float.Parse(txtShippingLogLow.Text);
        newKitchen.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        newKitchen.TemperatureLogAlert = 0;
        //newKitchen.TemperatureLogMax = float.Parse(txtTemperatureLogHigh.Text);
        //newKitchen.TemperatureLogMin = float.Parse(txtTemperatureLogLow.Text);
        newKitchen.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        newKitchen.ThermometerAlert = 0;
        //newKitchen.ThermometerMax = float.Parse(txtThermometerHigh.Text);
        //newKitchen.ThermometerMin = float.Parse(txtThermometerLow.Text);
        newKitchen.Validation = rdbValidationOn.Checked ? 1 : 0;
        newKitchen.ValidationAlert = 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Vendors = 0;
        newKitchen.Reports = 1;
        newKitchen.Kitchentype = 5;
        newKitchen.Active = 1;

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        newAddress.State = ddlStateProvince.SelectedItem.Text;
        newAddress.ZipCode = txtZipCode.Text;

        string strUserName, strPassword;
        strUserName = "UID" + GenerateUserName();
        strPassword = GenerateRandomPassword();

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        newContact.EmailAlerts = 0;
        newContact.UserId = strUserName;
        newContact.Password = strPassword;

        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = newKitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        createKitchen.Invoke();

        int nUpdated = SendMessage(strUserName, strPassword, txtEmail.Text);
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
        SetPage();

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
        int minSize = 8;
        char[] passwordCharacters = "123456789".ToCharArray();
        //char[] passwordCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789".ToCharArray();

        int size = maxSize;
        byte[] data = new byte[7];
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
            txtTemperatureLogHigh.Text = "N/A";
            txtTemperatureLogLow.Text = "N/A";
            txtHotHoldingLogHigh.Text = "155";
            txtHotHoldingLogLow.Text = "135";
            txtColdHoldingHigh.Text = "41";
            txtColdHoldingLow.Text = "33";
            txtReceivingLogHigh.Text = "41";
            txtReceivingLogLow.Text = "-20";
            txtFreezerLogHigh.Text = "32";
            txtFreezerLogLow.Text = "-20";
            txtFSCLHigh.Text = "N/A";
            txtFSCLLow.Text = "N/A";
            txtRefrigerationLogHigh.Text = "41";
            txtRefrigerationLogLow.Text = "33";
            txtFreezerNewLogHigh.Text = "41";
            txtFreezerNewLogLow.Text = "33";
            txtShippingLogHigh.Text = "41";
            txtShippingLogLow.Text = "-20";
            txtThermometerHigh.Text = "N/A";
            txtThermometerLow.Text = "N/A";
            txtValidationHigh.Text = "N/A";
            txtValidationLow.Text = "N/A";
            this.ddlStateProvince.SelectedIndex = 0;
            
            this.rdbColdHoldingLogOff.Checked = true;
           
            this.rdbFoodSafetyOff.Checked = true;
           
            this.rdbFreezerLogOff.Checked = true;
           
            this.rdbHotHoldingLogOff.Checked = true;
           
            this.rdbReceivingLogOff.Checked = true;
           
            this.rdbRefrigerationLogOff.Checked = true;
            this.rdbFreezerNewLogOff.Checked = true;
            this.rdbShippingLogOff.Checked = true;
            this.rdbTemperatureLogOff.Checked = true;
           
            this.rdbThermometerOff.Checked = true;
            
            this.rdbValidationOff.Checked = true;
            this.ddlStateProvince.SelectedIndex = 0;
            cmdCancel.Visible = false;
            cmdEdit.Visible = false;
            cmdSubmit.Visible = true;
        }
        else
        {
            txtTemperatureLogHigh.Text = "N/A";
            txtTemperatureLogLow.Text = "N/A";
            txtFSCLHigh.Text = "N/A";
            txtFSCLLow.Text = "N/A";
            txtThermometerHigh.Text = "N/A";
            txtThermometerLow.Text = "N/A";
            txtValidationHigh.Text = "N/A";
            txtValidationLow.Text = "N/A";
            cmdCancel.Visible = true;
            cmdEdit.Visible = true;
            cmdSubmit.Visible = false;
        }
    }

    protected void cmdEdit_Click(object sender, ImageClickEventArgs e)
    {
        if (mode == "EDIT")
        {
            
                int n = UpdateData();
                lblInfo.Text = "HBFlex with Reporting Kitchen Updated Succesfully";
                lblInfo.Visible = true;
                mode = "NEW";
                SetPage();
            
        }
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
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
           
            if (int.Parse(drKitchen["ColdHoldingLog"].ToString()) == 1)
            {
                rdbColdHoldingLogOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyOff.Checked = true;
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
            if (int.Parse(drKitchen["FreezerNewLog"].ToString()) == 1)
            {
                rdbFreezerNewLogOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogOff.Checked = true;
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
            if (int.Parse(drKitchen["Validation"].ToString()) == 1)
            {

                rdbValidationOn.Checked = true;
            }
            else
            {
                rdbValidationOff.Checked = true;
            }
           

            //txtTemperatureLogHigh.Text = drKitchen["TemperatureLogMax"].ToString();
            //txtTemperatureLogLow.Text = drKitchen["TemperatureLogMin"].ToString();
            txtHotHoldingLogHigh.Text = drKitchen["HotHoldingLogMax"].ToString();
            txtHotHoldingLogLow.Text = drKitchen["HotHoldingLogMin"].ToString();
            txtColdHoldingHigh.Text = drKitchen["ColdHoldingLogMax"].ToString();
            txtColdHoldingLow.Text = drKitchen["ColdHoldingLogMin"].ToString();
            txtReceivingLogHigh.Text = drKitchen["ReceivingLogMax"].ToString();
            txtReceivingLogLow.Text = drKitchen["ReceivingLogMin"].ToString();
            txtFreezerLogHigh.Text = drKitchen["FreezerLogMax"].ToString();
            txtFreezerLogLow.Text = drKitchen["FreezerLogMin"].ToString();
            txtRefrigerationLogHigh.Text = drKitchen["RefrigerationLogMax"].ToString();
            txtRefrigerationLogLow.Text = drKitchen["RefrigerationLogMin"].ToString();
            txtFreezerNewLogHigh.Text = drKitchen["FreezerNewLogMax"].ToString();
            txtFreezerNewLogLow.Text = drKitchen["FreezerNewLogMin"].ToString();
            txtShippingLogHigh.Text = drKitchen["ShippingLogMax"].ToString();
            txtShippingLogLow.Text = drKitchen["ShippingLogMin"].ToString();
           // txtThermometerHigh.Text = drKitchen["ThermometerMax"].ToString();
           // txtThermometerLow.Text = drKitchen["ThermometerMin"].ToString();
            txtCity.Text = drKitchen["City"].ToString();
            hfKitchenId.Value = drKitchen["KitchenId"].ToString();
            hfAddressId.Value = drKitchen["AddressId"].ToString();
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
            hfUserId.Value = drKitchen["UserName"].ToString();
            hfPassword.Value = drKitchen["Password"].ToString();
            ddlStateProvince.SelectedValue = drKitchen["StateProvinceId"].ToString();
            drKitchen.Close();
        }
        else
        {
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }
            lblInfo.Text = "Location Not Found";
            lblInfo.Visible = true;
        }
    }
    private int UpdateData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.ColdHoldingLog = rdbColdHoldingLogOn.Checked ? 1 : 0;
        newKitchen.ColdHoldingLogAlert =  0;
        newKitchen.ColdHoldingLogMax = float.Parse(txtColdHoldingHigh.Text);
        newKitchen.ColdHoldingLogMin = float.Parse(txtColdHoldingLow.Text);
        newKitchen.FoodSafetyCheckList = rdbFoodSafetyOn.Checked ? 1 : 0;
        newKitchen.FoodSafetyCheckListAlert =  0;
        newKitchen.FreezerLog = rdbFreezerLogOn.Checked ? 1 : 0;
        newKitchen.FreezerLogAlert =  0;
        newKitchen.FreezerLogMax = float.Parse(txtFreezerLogHigh.Text);
        newKitchen.FreezerLogMin = float.Parse(txtFreezerLogLow.Text);
        newKitchen.HotHoldingLog = rdbHotHoldingLogOn.Checked ? 1 : 0;
        newKitchen.HotHoldingLogAlert =  0;
        newKitchen.HotHoldingLogMax = float.Parse(txtHotHoldingLogHigh.Text);
        newKitchen.HotHoldingLogMin = float.Parse(txtHotHoldingLogLow.Text);
        newKitchen.ReceivingLog = rdbReceivingLogOn.Checked ? 1 : 0;
        newKitchen.ReceivingLogAlert =  0;
        newKitchen.ReceivingLogMax = float.Parse(txtReceivingLogHigh.Text);
        newKitchen.ReceivingLogMin = float.Parse(txtReceivingLogLow.Text);
        newKitchen.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLogAlert =  0;
        newKitchen.RefrigerationLogMax = float.Parse(txtRefrigerationLogHigh.Text);
        newKitchen.RefrigerationLogMin = float.Parse(txtRefrigerationLogLow.Text);
        newKitchen.FreezerNewLog = rdbFreezerNewLogOn.Checked ? 1 : 0;
        newKitchen.FreezerNewLogAlert = 0;
        newKitchen.FreezerNewLogMax = float.Parse(txtFreezerNewLogHigh.Text);
        newKitchen.FreezerNewLogMin = float.Parse(txtFreezerNewLogLow.Text);
        newKitchen.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
        newKitchen.ShippingLogAlert = 0;
        newKitchen.ShippingLogMax = float.Parse(txtShippingLogHigh.Text);
        newKitchen.ShippingLogMin = float.Parse(txtShippingLogLow.Text);
        newKitchen.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        newKitchen.TemperatureLogAlert =  0;
        //newKitchen.TemperatureLogMax = float.Parse(txtTemperatureLogHigh.Text);
        //newKitchen.TemperatureLogMin = float.Parse(txtTemperatureLogLow.Text);
        newKitchen.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        newKitchen.ThermometerAlert = 0;
       // newKitchen.ThermometerMax = float.Parse(txtThermometerHigh.Text);
       // newKitchen.ThermometerMin = float.Parse(txtThermometerLow.Text);
        newKitchen.Validation = rdbValidationOn.Checked ? 1 : 0;
        newKitchen.ValidationAlert =  0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Reports = 1;
        newKitchen.Vendors = 0;
        newKitchen.Kitchentype = 5;
        newKitchen.Active = 1;

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        newAddress.State = ddlStateProvince.SelectedItem.Text;
        newAddress.ZipCode = txtZipCode.Text;
        newAddress.AddressId = int.Parse(hfAddressId.Value);

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        newContact.EmailAlerts =  0;
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = hfUserId.Value;
        newContact.Password = hfPassword.Value;

        ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        setKitchen.Kitchen = newKitchen;
        setKitchen.Contact = newContact;
        setKitchen.Address = newAddress;
        setKitchen.Invoke();


        return 1;
    }
}
