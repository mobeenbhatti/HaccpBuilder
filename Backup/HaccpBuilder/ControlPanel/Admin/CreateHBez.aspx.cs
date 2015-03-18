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

public partial class ControlPanel_Admin_CreateHBez : System.Web.UI.Page
{
    public static string mode = "NEW";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            if (Request.QueryString["RequestId"] != null)
            {
                // mode = "NEW";            
                SetPage();
                GetData();
            }
            if (Request.QueryString["KitchenName"] != null)
            {
                mode = "EDIT";
                SetPage();
                GetData();
            }
            if (lblInfo.Visible == true)
            {
                lblInfo.Visible = false;
            }
        }
    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckData(1) == true)
        {
            if (CreateData() == 1)
            {
                // District Created Successfuly
                lblInfo.Text = "HBez Kitchen Created Succesfully";
                lblInfo.Visible = true;

            }
            else
            {
                // Error Occured
            }
            SetPage();
        }
    }
    protected void cmdEdit_Click(object sender, ImageClickEventArgs e)
    {
        if (mode == "EDIT")
        {
            if (CheckData(2) == true)
            {
                UpdateData();
                lblInfo.Text = "HBez Kitchen Updated Succesfully";
                lblInfo.Visible = true;
                mode = "NEW";
                SetPage();
            }
        }
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
            IDataReader drKitchen = kitchen.GetKitchenByName(txtKitchenName.Text);
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

            DataSet dsContact = contact.GetContactByUser(txtUser.Text, txtPassword.Text);
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
        IDataReader drDistrict = geDistrict.GetDistrictByName("HBez District");
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
        //newKitchen.DistrictId = (int)Session["DistrictId"];
        newKitchen.DistrictId = nDistrictId;
        newKitchen.ColdHoldingLog = 0;
        newKitchen.FoodSafetyCheckList = 0;
        newKitchen.FreezerLog = 0;
        newKitchen.HotHoldingLog = 0;
        newKitchen.ReceivingLog = 0;
        newKitchen.RefrigerationLog = 0;
        newKitchen.TemperatureLog = 0;
        newKitchen.Thermometer = 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        if (rdbReportsYes.Checked == true)
        {
            newKitchen.Reports = 1;
            newKitchen.Kitchentype = 4;
        }
        else
        {
            newKitchen.Reports = 0;
            newKitchen.Kitchentype = 2;
        }
        newKitchen.Vendors = 0;

        newKitchen.Active = int.Parse(ddlStatus.SelectedValue);

        Address newAddress = new Address();
        newAddress.AddressOne = txtAddress1.Text;
        newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text;
        newAddress.State = ddlStateProvince.SelectedItem.Text;
        newAddress.ZipCode = txtZipCode.Text;

        string strUserName, strPassword;
        //strUserName = "UID" + GenerateUserName();
        //strPassword = GenerateRandomPassword();

        Contact newContact = new Contact();
        newContact.AltPhone = txtAltPhone.Text;
        newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text;
        newContact.Name = txtManagerName.Text;
        newContact.Phone = txtPhone.Text;
        newContact.EmailAlerts = 0;
        newContact.UserId = txtUser.Text;
        newContact.Password = txtPassword.Text;

        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
        createKitchen.Kitchen = newKitchen;
        createKitchen.Contact = newContact;
        createKitchen.Address = newAddress;
        createKitchen.Invoke();

        int nUpdated = SendMessage(txtUser.Text, txtPassword.Text, txtEmail.Text);
        return nUpdated;

    }
    private int SendMessage(string strUserName, string strPassword, string strEmail)
    {
        string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder because your company has set up HACCP  <br/> Builder to manage your site’s/location’s food safety program.  HACCP Builder makes it easy to <br/> build and manage your HACCP Plan plus keep your site/location in compliance with the <br/>USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
        strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";
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
            rdbReportsYes.Checked = false;
            rdbReportsNo.Checked = false;
            this.ddlStateProvince.SelectedIndex = 0;
            cmdCancel.Visible = false;
            cmdEdit.Visible = false;
            cmdSubmit.Visible = true;
        }
        else
        {
            cmdCancel.Visible = true;
            cmdEdit.Visible = true;
            cmdSubmit.Visible = false;
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
                    ddlStatus.SelectedIndex = 2;
                    ddlCountry.SelectedValue = dr["CountryRegionCode"].ToString();
                    ddlStateProvince.SelectedValue = dr["StateProvinceId"].ToString();
                }
            }
        }
        else
        {
            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            IDataReader drKitchen = kitchen.GetKitchenByName(Request.QueryString["KitchenName"]);
            if (drKitchen.Read())
            {

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
                ddlCountry.SelectedValue = drKitchen["CountryRegionCode"].ToString();
                ddlStateProvince.SelectedValue = drKitchen["StateProvinceId"].ToString();
                ddlStatus.SelectedValue = drKitchen["Active"].ToString();
                txtUser.Text = drKitchen["UserName"].ToString();
                txtPassword.Text = drKitchen["Password"].ToString();
                if (drKitchen["Reports"].ToString() == "1")
                {
                    rdbReportsYes.Checked = true;
                }
                else
                {
                    rdbReportsNo.Checked = true;
                }
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
    }
    private int UpdateData()
    {
        ProcessGetDistrict geDistrict = new ProcessGetDistrict();
        IDataReader drDistrict = geDistrict.GetDistrictByName("HBez District");
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
        newKitchen.ColdHoldingLog = 0;
        newKitchen.FoodSafetyCheckList = 0;
        newKitchen.FreezerLog = 0;
        newKitchen.HotHoldingLog = 0;
        newKitchen.ReceivingLog = 0;
        newKitchen.RefrigerationLog = 0;
        newKitchen.TemperatureLog = 0;
        newKitchen.Thermometer = 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);
        newKitchen.Ingredients = 0;
        newKitchen.MenuItems = 0;
        newKitchen.Vendors = 0;
        if (rdbReportsYes.Checked == true)
        {
            newKitchen.Reports = 1;
        }
        else
        {
            newKitchen.Reports = 0;
        }
        if (rdbReportsYes.Checked == true)
        {
            newKitchen.Kitchentype = 4;
        }
        else
        {
            newKitchen.Kitchentype = 2;
        }
        newKitchen.Active = int.Parse(ddlStatus.SelectedValue);
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
        newContact.EmailAlerts = 0;
        newContact.ContactId = int.Parse(hfContactId.Value);
        newContact.UserId = txtUser.Text.Trim();
        newContact.Password = txtPassword.Text.Trim();

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
    }
}
