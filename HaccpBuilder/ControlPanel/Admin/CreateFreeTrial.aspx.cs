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

public partial class ControlPanel_Admin_CreateFreeTrial : System.Web.UI.Page
{
    public static string mode = "NEW";
    bool itemFound = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            //if (Request.QueryString["RequestId"] != null)
            //{
            //    // mode = "NEW"; 
               
            //}
            if (Request.QueryString["KitchenName"] != null)
            {
                mode = "EDIT";
                SetPage();
                GetData();
            }
            else
            {               
                SetPage();
                GetData();
               // lblInfo.Text = "Free Trial request Test";
                lblInfo.Visible = true;
            }
            //if (lblInfo.Visible == true)
            //{
            //    lblInfo.Visible = false;
            //}
        }
    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckData(1) == true)
        {
            if (CreateData() == 1)
            {
                int nUpdated = SendMessage(txtUser.Text, txtPassword.Text, txtEmail.Text);
                if (nUpdated == 1)
                {
                    lblInfo.Text = "Free Trial Kitchen Created Succesfully";
                    lblInfo.Visible = true;                    
                }
                else
                {
                    lblInfo.Text = "Free Trial Kitchen Created Succesfully, but there is problem occured in email sending";
                    lblInfo.Visible = true;
                }
                SetPage();
            }
            else
            {
                // Error Occured
            }
        }
    }
    protected void cmdEdit_Click(object sender, ImageClickEventArgs e)
    {
        if (mode == "EDIT")
        {
            if (CheckData(2) == true)
            {
                UpdateData();
                lblInfo.Text = "Free Trial Kitchen Updated Succesfully";
                lblInfo.Visible = true;
                mode = "NEW";
                SetPage();
            }
        }
        //else
        //{
        //    if (CheckData() == true)
        //    {
        //        if (CreateData() == 1)
        //        {
        //            // District Created Successfuly
        //            lblInfo.Text = "District Created Succesfully";
        //            lblInfo.Visible = true;
        //            SetPage();
        //        }
        //        else
        //        {
        //            // Error Occured
        //        }
        //    }
        //}
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        mode = "NEW";
        SetPage();
    }
    private bool CheckData(int nMode)
    {
        if (nMode == 1)
        {
            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchenName.Text.Trim());
            if (drKitchen.Read())
            {
                lblInfo.Text = "Kitchen Already Exist";
                lblInfo.Visible = true;
                drKitchen.Close();
                return false;
            }
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }

            ProcessGetContact contact = new ProcessGetContact();

            DataSet dsContact = contact.GetContactByUser(txtUser.Text.Trim(), txtPassword.Text);
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
            DataSet dsContact = contact.GetContactByUserName(txtUser.Text, int.Parse(hfContactId.Value));
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
    private int CreateData()
    {
        DeleteData();
        ProcessGetDistrict geDistrict = new ProcessGetDistrict();
        IDataReader drDistrict = geDistrict.GetDistrictByName("Free Trial District");
        int nDistrictId =0;
        if (drDistrict.Read())
        {
            nDistrictId = int.Parse(drDistrict["DistrictId"].ToString());
            drDistrict.Close();
        }
        if (drDistrict.IsClosed==false)
        {
            drDistrict.Close();
        }
        Kitchen newKitchen = new Kitchen();
        //newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.DistrictId = nDistrictId;
        newKitchen.ColdHoldingLog =  0;
        newKitchen.FoodSafetyCheckList =  0;
        newKitchen.FreezerLog =  0;
        newKitchen.HotHoldingLog =  0;
        newKitchen.ReceivingLog =  0;
        newKitchen.RefrigerationLog =  0;
        newKitchen.TemperatureLog =  0;
        newKitchen.Thermometer = 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.Ingredients = int.Parse(txtIngredient.Text);
        newKitchen.MenuItems = int.Parse(txtMenu.Text);
        newKitchen.Reports = 1;
        newKitchen.Vendors = int.Parse(txtVendors.Text);
        newKitchen.Kitchentype = 1;
        newKitchen.Active = int.Parse(ddlStatus.SelectedValue);

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text.Trim();
        newAddress.AddressTwo = txtAddress2.Text.Trim();
        newAddress.City = txtCity.Text.Trim();
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
        //strPassword = GenerateRandomPassword();

        string password = txtPassword.Text;
        string passwordSalt = Guid.NewGuid().ToString();
        if (txtUser.Text.Contains("@"))
            password = Utilities.CreatePasswordHash(password, passwordSalt);

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text.Trim();
        newContact.Fax = txtFax.Text.Trim();
        newContact.Email = txtEmail.Text.Trim();
        newContact.Name = txtManagerName.Text.Trim();
        newContact.Phone = txtPhone.Text.Trim();
        newContact.EmailAlerts =  0;
        newContact.UserId = txtUser.Text.Trim();
        newContact.Password = password;
        newContact.PasswordSalt = passwordSalt;
            newContact.IsUpdated=true;
        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = newKitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        createKitchen.Invoke();

        return 1;

    }
    private int SendMessage(string strUserName, string strPassword, string strEmail)
    {
        string strBody = "<br/> Hello,<br/> Thank you for requesting a HACCP Builder Free Trial.  HACCP Builder makes it easy to build and <br/> manage your HACCP Plan plus keep your site/location in compliance with the USDA/FDA <br/> HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
        strBody += "<br/><br/>In the HACCP Builder Free Trial you will be able to enter up to:<br/><br/>1 Vendors<br/>4 Ingredients<br/>2 Menu Items<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";
        //strBody += " " + strUserName;
        //strBody += "<br/>Your password is:";
        //strBody += " " + strPassword;

        EmailContents contents = new EmailContents();
        contents.Body = strBody;
        contents.Subject = "HACCP Builder is now set-up for your kitchen. Please use this information to sign in.";
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
            this.txtPassword.Text = "";
            this.txtUser.Text = "";
            this.txtIngredient.Text = "4";
            this.txtMenu.Text = "2";
            this.txtVendors.Text = "1";
            this.ddlCountry.DataBind();
            this.ddlCountry.SelectedValue = "US";
           // this.ddlStateProvince.SelectedIndex = 0;
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
            cmdCancel.Visible = true;
            cmdEdit.Visible = true;
            cmdSubmit.Visible = false;
            this.ddlCountry.DataBind();
            this.ddlCountry.SelectedValue = "US";
        }
    }
    private void GetData()
    {
        if (mode == "NEW")
        {
            DataSet dsDistrict;
            ProcessGetFreeTrialRequest getFreeTrialRequest = new ProcessGetFreeTrialRequest();
            dsDistrict = getFreeTrialRequest.GetFreeTrialRequestById(Request.QueryString["RequestId"]);
            
            if (dsDistrict.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsDistrict.Tables[0].Rows)
                {
                    txtCity.Text = dr["City"].ToString().Trim();
                    txtKitchenName.Text = dr["Name"].ToString().Trim();
                    txtEmail.Text = dr["EmailAddress"].ToString().Trim();                    
                    txtManagerName.Text = dr["DistrictManager"].ToString().Trim();
                    //txtPassword.Text = dr["Password"].ToString().Trim();
                    //txtUser.Text = dr["UserId"].ToString().Trim();
                    txtZipCode.Text = dr["PostalCode"].ToString();
                    txtPhone.Text = dr["PhoneNumber"].ToString();
                       
                    //ddlDistrictPrint.SelectedIndex = 2;
                    //ddlDistrictType.SelectedIndex = 2;
                    //ddlCountry.SelectedValue = "US";
                    //ddlStateProvince.SelectedValue = "25";
                    //ddlTimeZone.SelectedValue = "Eastern Standard Time";
                    if (dr["Country"].ToString().Trim() == "")
                        ddlCountry.SelectedValue = "US";
                    else
                        ddlCountry.SelectedValue = dr["Country"].ToString().Trim();
                    ddlStateProvince.DataBind();
                    foreach (ListItem item in ddlStateProvince.Items)
                    {
                        if (item.Value  == dr["StateProvinceId"].ToString())
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
                        txtState.Text = dr["State"].ToString();
                    }
                    else
                    {
                        ddlStateProvince.Visible = true;
                        txtState.Visible = false;
                        rfvState.Enabled = true;
                        rfvState2.Enabled = false;
                        hfState.Value = "";
                    }                   
                    ddlTimeZone.SelectedValue = "Eastern Standard Time";
                   // ddlStateProvince.SelectedValue = dr["StateProvinceId"].ToString();
                    ddlStatus.SelectedValue = "1";
                    
                }
            }
        }
        else
        {
            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            IDataReader drKitchen = kitchen.GetKitchenByName(Request.QueryString["KitchenName"]);
            if (drKitchen.Read())
            {

                txtCity.Text = drKitchen["City"].ToString().Trim();
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
                ddlStatus.SelectedValue = drKitchen["Active"].ToString();
                txtUser.Text = drKitchen["UserName"].ToString();
                txtPassword.Text = drKitchen["Password"].ToString();
                txtMenu.Text = drKitchen["MenuItems"].ToString();
                txtIngredient.Text = drKitchen["Ingredients"].ToString();
                txtVendors.Text = drKitchen["Vendors"].ToString();
                drKitchen.Close();
            }
            else
            {
                if ( drKitchen.IsClosed==false)
                {
                    drKitchen.Close();
                }
                lblInfo.Text = "Kitchen Not Found";
                lblInfo.Visible = true;
            }
        }
    }
    private int UpdateData()
    {
        ProcessGetDistrict geDistrict = new ProcessGetDistrict();
        IDataReader drDistrict = geDistrict.GetDistrictByName("Free Trial District");
        int nDistrictId = 0;
        if (drDistrict.Read())
        {
            nDistrictId = int.Parse(drDistrict["DistrictId"].ToString());
            drDistrict.Close();
        }
        if (drDistrict.IsClosed == false)
        {
            drDistrict.Close();
        }

        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = nDistrictId;
        newKitchen.ColdHoldingLog =  0;
        newKitchen.FoodSafetyCheckList =  0;
        newKitchen.FreezerLog =  0;
        newKitchen.HotHoldingLog = 0;
        newKitchen.ReceivingLog = 0;
        newKitchen.RefrigerationLog =  0;
        newKitchen.TemperatureLog =  0;
        newKitchen.Thermometer =  0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);
        newKitchen.Ingredients = int.Parse(txtIngredient.Text);
        newKitchen.MenuItems = int.Parse(txtMenu.Text);
        newKitchen.Reports = 1;
        newKitchen.Vendors = int.Parse(txtVendors.Text);
        newKitchen.Kitchentype = 1;
        newKitchen.Active = int.Parse(ddlStatus.SelectedValue);

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text.Trim();
        newAddress.AddressTwo = txtAddress2.Text.Trim();
        newAddress.City = txtCity.Text.Trim();
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

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text.Trim();
        newContact.Fax = txtFax.Text.Trim();
        newContact.Email = txtEmail.Text.Trim();
        newContact.Name = txtManagerName.Text.Trim();
        newContact.Phone = txtPhone.Text.Trim();
        newContact.EmailAlerts =  0;
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = txtUser.Text.Trim();

        string password = txtPassword.Text;
        string passwordSalt = Guid.NewGuid().ToString();
        if (txtUser.Text.Contains("@"))
            password = Utilities.CreatePasswordHash(password, passwordSalt);
        newContact.Password = password;
        newContact.PasswordSalt = passwordSalt;
        newContact.IsUpdated = true;

        ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        setKitchen.Kitchen = newKitchen;
        setKitchen.Contact = newContact;
        setKitchen.Address = newAddress;
        setKitchen.Invoke();


        return 1;
    }
    private void DeleteData()
    {
        FreeTrialRequest freeTrialRequest = new FreeTrialRequest();
        freeTrialRequest.FreeTrialRequestId = Request.QueryString["RequestId"];
        ProcessDeleteFreeTrialRequest deleteRequest = new ProcessDeleteFreeTrialRequest();
        deleteRequest.FreeTrialRequest = freeTrialRequest;
        deleteRequest.Invoke();
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
