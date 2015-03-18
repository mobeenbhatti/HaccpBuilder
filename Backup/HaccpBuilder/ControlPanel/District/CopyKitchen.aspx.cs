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


public partial class ControlPanel_District_CopyKitchen : System.Web.UI.Page
{
    private bool itemFound = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Name"] != "")
            {
                txtKitchen.Text = Request.QueryString["Name"];
                SetPage();
                GetData();
            }
            //btnBack.Attributes.Add("onclick", "MoveBack( )"); 
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
            //RGK-03-19-10
            //if (SaveData() == 1)
            //{
            //    // Kitchen Created Successfuly
            //    lblInfo.Text = "Location Created Succesfully";
            //    lblInfo.Visible = true;
            //    SetPage();
            //    grdKitchenDetails.DataBind();
            //}
            //else
            //{
            //    // Error Occured
            //}
            SaveData();
        }
    }
    private bool CheckData()
    {
        CheckLimit();
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
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }
            return true;
        }
    }
    private void SaveData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);
        newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.ColdHoldingLog = int.Parse(hfColdHoldingLog.Value);
        newKitchen.FoodSafetyCheckList = int.Parse(hffoodSafety.Value);
        newKitchen.FreezerLog = int.Parse(hfFreezerLog.Value);
        newKitchen.HotHoldingLog = int.Parse(hfHotHoldingLog.Value);
        newKitchen.ReceivingLog = int.Parse(hfReceivingLog.Value);
        newKitchen.RefrigerationLog = int.Parse(hfRefrigerationLog.Value);
        newKitchen.FreezerNewLog = int.Parse(hfFreezerNewLog.Value);
        newKitchen.TemperatureLog = int.Parse(hfTemperatureLog.Value);
        newKitchen.Thermometer = int.Parse(hfThemometer.Value);
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Reports = 1;
        newKitchen.Vendors = 0;
        newKitchen.Kitchentype = int.Parse(hfTypeId.Value);
        newKitchen.Active = 1;       
        newKitchen.ShippingLog = int.Parse(hfShippingLog.Value);
        newKitchen.PhLog = int.Parse(hfPhLog.Value);
        newKitchen.MaintenanceLog = int.Parse(hfMaintenanceLog.Value);
        newKitchen.PestLog = int.Parse(hfPestLog.Value);
        newKitchen.CleaningLog = int.Parse(hfCleaningLog.Value);
        newKitchen.CheckList = int.Parse(hfChecklist.Value);

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;        
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
        strUserName = "UID" + GenerateUserName();
        strPassword = GenerateRandomPassword();

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        if (hfAlerts.Value == "False")
            newContact.EmailAlerts = 0;
        else
            newContact.EmailAlerts = 1;
        newContact.UserId = strUserName;
        newContact.Password = strPassword;

        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = newKitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        createKitchen.CopyKitchen();

        // RGK-03-19-10
        // Fields were not cleared after copy
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
        //////////////////////
    }
    //private void SendMail()
    //{
    //    System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
    //    mMailMessage.From = new MailAddress("rehman.gull@nxb.com.pk");
    //    mMailMessage.To.Add(new MailAddress("rehman.gull@hotmail.com"));

    //    mMailMessage.Subject = "User Login Information: ";
    //    string strBody = " <b>TEST MESSAGE</b>";
    //    mMailMessage.Body = strBody;
    //    mMailMessage.IsBodyHtml = true;
    //    mMailMessage.Priority = System.Net.Mail.MailPriority.Normal;
    //    string mSMTPServer = "61.5.139.5";
    //    int mSMTPPort = 25;
    //    SmtpClient SmtpMail = new SmtpClient(mSMTPServer);
    //    SmtpMail.Credentials = new System.Net.NetworkCredential("rehman.gull@nxb.com.pk", "password");
    //    SmtpMail.Send(mMailMessage);

    //}
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
        this.txtAddress1.Text = "";
        this.txtAddress2.Text = "";
        this.txtAltPhone.Text = "";        
        this.txtEmail.Text = "";
        this.txtFax.Text = "";
        this.txtKitchenName.Text = "";
        this.txtManagerName.Text = "";
        this.txtPhone.Text = "";
        this.txtZipCode.Text = "";
        this.ddlCountry.DataBind();
        this.ddlCountry.SelectedValue = "US";
        this.txtState.Text = "";
        this.txtState.Visible = false;
        this.ddlStateProvince.Visible = true;
        hfState.Value = "";
        //this.ddlStateProvince.SelectedIndex = 0;
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        SetPage();
        GetData();
    }
    private void GetData()
    {
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchen.Text);
        if (drKitchen.Read())
        {
            hfAlerts.Value = drKitchen["EmailAlerts"].ToString();
            hfCity.Value = drKitchen["City"].ToString();
            hfChecklist.Value = drKitchen["CheckList"].ToString();
            hfCleaningLog.Value = drKitchen["CleaningLog"].ToString();
            hfColdHoldingLog.Value = drKitchen["ColdHoldingLog"].ToString();
            hffoodSafety.Value = drKitchen["FoodSafetyChecklist"].ToString();
            hfFreezerLog.Value = drKitchen["FreezerLog"].ToString();
            hfHotHoldingLog.Value = drKitchen["HotHoldingLog"].ToString();
            hfKitchenId.Value = drKitchen["KitchenId"].ToString();
            hfReceivingLog.Value = drKitchen["ReceivingLog"].ToString();
            hfRefrigerationLog.Value = drKitchen["RefrigerationLog"].ToString();
            hfFreezerNewLog.Value = drKitchen["FreezerNewLog"].ToString();
            hfMaintenanceLog.Value = drKitchen["MaintenanceLog"].ToString();
            hfShippingLog.Value = drKitchen["ShippingLog"].ToString();
            hfPhLog.Value = drKitchen["PhLog"].ToString();
            hfPestLog.Value = drKitchen["PestLog"].ToString();
            hfTemperatureLog.Value = drKitchen["TemperatureLog"].ToString();
            hfThemometer.Value = drKitchen["Thermometer"].ToString();
            hfTypeId.Value = drKitchen["TypeId"].ToString();
            txtAddress1.Text = drKitchen["AddressLine1"].ToString();
            txtAddress2.Text = drKitchen["AddressLine2"].ToString();
            txtAltPhone.Text = drKitchen["SecondaryPhone"].ToString();
            txtCity.Text = drKitchen["City"].ToString();
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
            drKitchen.Close();
        }
        else
        {
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }

            lblInfo.Text = "Kitchen Not Found";
            lblInfo.Visible = true;
        }
    }
    private void CheckLimit()
    {
        //if (Session["TypeId"] != null)
        //{
        //    ProcessGetKitchen getKitchen = new ProcessGetKitchen();
        //    IDataReader drKitchen = getKitchen.GetKitchenLimitByDistrictId((int)Session["DistrictId"]);
        //    drKitchen.Read();
        //    if (drKitchen["Result"].ToString() != "1")
        //    {
        //         Response.Redirect("~/ControlPanel/District/ErrorPage.aspx?limit=1");
        //    }
           
        //}
        ProcessGetKitchen getKitchen = new ProcessGetKitchen();
        IDataReader drKitchenLimit = getKitchen.GetKitchenLimitByDistrictId((int)Session["DistrictId"]);
        drKitchenLimit.Read();
        if (Convert.ToInt32(drKitchenLimit["AllowedKitchen"].ToString()) <= Convert.ToInt32(drKitchenLimit["TotalKitchen"].ToString()))
        {
            drKitchenLimit.Close();
            Response.Redirect("~/ControlPanel/District/ErrorPage.aspx?limit=1");
        }
        if (drKitchenLimit.IsClosed == false)
        {
            drKitchenLimit.Close();
        }
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

}
