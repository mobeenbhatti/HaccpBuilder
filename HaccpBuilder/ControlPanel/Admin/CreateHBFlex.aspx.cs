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

public partial class ControlPanel_Admin_CreateHBFlex : System.Web.UI.Page
{
    public string mode = "NEW";
    public static string state = "FreeTrial";
    private bool itemFound = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            if (Request.QueryString["DistrictId"] != null)
            {
                mode = "EDIT";
                state = "District";
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
                int nUpdated = SendMessage(txtUser.Text, txtPassword.Text, txtEmail.Text);
                if (nUpdated == 1)
                {
                    lblInfo.Text = "Corporate Created Succesfully";
                    lblInfo.Visible = true;
                    
                }
                else
                {
                    lblInfo.Text = "Corporate Created Succesfully, but there is problem occured in email sending";
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
    private bool CheckData(int nMode)
    {
        if (nMode == 1)
        {
            ProcessGetDistrict District = new ProcessGetDistrict();
            IDataReader drDistrict = District.GetDistrictByName(txtDistrictName.Text.Trim());
            if (drDistrict.Read())
            {
                lblInfo.Text = "District Already Exists";
                lblInfo.Visible = true;
                drDistrict.Close();
                return false;
            }
            else
            {
                if(drDistrict.IsClosed==false)
                {
                    drDistrict.Close();
                }

                ProcessGetContact contact = new ProcessGetContact();
                DataSet dsContact = contact.GetContactByUserName(txtUser.Text);
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
        }
        if (nMode == 2)
        {
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            IDataReader drKitchen = getKitchen.GetKitchenLimitByDistrictId(int.Parse(Request.QueryString["DistrictId"]));
            drKitchen.Read();
            if (Convert.ToInt32(txtKitchenNumber.Text) < Convert.ToInt32(drKitchen["TotalKitchen"].ToString()))
            {
                lblInfo.Text = drKitchen["TotalKitchen"].ToString() + " Locations are already created, please change number of locations";
                lblInfo.Visible = true;
                drKitchen.Close();

                return false;
            }
            if (drKitchen.IsClosed == false)
            {
                drKitchen.Close();
            }

            ProcessGetContact contact = new ProcessGetContact();
            DataSet dsContact = contact.GetContactByUserName(txtUser.Text.Trim(), int.Parse(hfContactId.Value));
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
        //if (state == "FreeTrial")
        //{
        //    DeleteData();
        //}
        District newDistrict = new District();
        newDistrict.Name = txtDistrictName.Text.Trim();
        newDistrict.NumberOfKitchens = int.Parse(txtKitchenNumber.Text);
        //newDistrict.DistrictType = ddlDistrictType.SelectedItem.Text;
        newDistrict.DistrictType = "Paid";
        newDistrict.DistrictPrinting = int.Parse(ddlDistrictPrint.SelectedValue);
        newDistrict.Active = int.Parse(ddlStatus.SelectedValue);
        if (rdbReportsYes.Checked == true)
        {
            newDistrict.Reports = 1;
            // For HBFlex With Reporting
            newDistrict.TypeId = 2;
        }
        else
        {
            newDistrict.Reports = 0;
            // For HBFlex Without Reporting
            newDistrict.TypeId = 3;
        }

        Address newAddress = new Address();
        //newAddress.AddressOne = txtAddress1.Text;
        //newAddress.AddressTwo = txtAddress2.Text;
        newAddress.City = txtCity.Text.Trim();
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
        //string strUserName, strPassword;
        //strUserName = "UID" + GenerateUserName();
        //strPassword = GenerateRandomPassword();
        newAddress.Country = ddlCountry.SelectedValue;

        Contact newContact = new Contact();
        //newContact.AltPhone = txtAltPhone.Text;
        //newContact.Fax = txtFax.Text;
        newContact.Email = txtEmail.Text.Trim();
        newContact.Name = txtManagerName.Text.Trim();
        //newContact.Phone = txtPhone.Text;
        //newContact.EmailAlerts = rdbAlertsYes.Checked ? 1 : 0;
        newContact.UserId = txtUser.Text.Trim();
        newContact.Password = txtPassword.Text;

        ProcessCreateDistrict createDistrict = new ProcessCreateDistrict();
        createDistrict.District = newDistrict;
        createDistrict.Contact = newContact;
        createDistrict.Address = newAddress;
        createDistrict.Invoke();

       
        return 1;

    }
    private int SendMessage(string strUserName, string strPassword, string strEmail)
    {
        string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder.  Your company has set up HACCP Builder to<br/> manage your food safety program.  HACCP Builder makes it easy to build your HACCP Plan and<br/> keep your organization in compliance with the USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
        strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";

        EmailContents contents = new EmailContents();
        contents.Body = strBody;
        contents.Subject = "HACCP Builder is now set-up for your Corporation. Please use this information to sign in.";
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
            this.txtCity.Text = "";
            this.txtEmail.Text = "";
            this.txtDistrictName.Text = "";
            this.txtManagerName.Text = "";
            this.txtZipCode.Text = "";
            this.txtKitchenNumber.Text = "";
            this.txtPassword.Text = "";
            this.txtUser.Text = "";
            this.ddlCountry.DataBind();
            this.ddlCountry.SelectedValue = "US";
            this.ddlStateProvince.SelectedIndex = 0;
            this.ddlDistrictPrint.SelectedIndex = 0;
            //this.ddlDistrictType.SelectedIndex = 0;
            this.ddlStatus.SelectedIndex = 0;
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
        DataSet dsDistrict;
        if (state == "FreeTrial")
        {
            // Get Free Trial Request Info
            ProcessGetFreeTrialRequest getFreeTrialRequest = new ProcessGetFreeTrialRequest();
            dsDistrict = getFreeTrialRequest.GetFreeTrialRequestById(Request.QueryString["RequestId"]);
            if (dsDistrict.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsDistrict.Tables[0].Rows)
                {
                    txtCity.Text = dr["City"].ToString().Trim();
                    txtDistrictName.Text = dr["Name"].ToString().Trim();
                    txtEmail.Text = dr["EmailAddress"].ToString().Trim();
                    txtKitchenNumber.Text = dr["NumberOfKitchens"].ToString();
                    txtManagerName.Text = dr["DistrictManager"].ToString().Trim();
                    //txtPassword.Text = dr["Password"].ToString().Trim();
                    //txtUser.Text = dr["UserId"].ToString().Trim();
                    txtZipCode.Text = dr["PostalCode"].ToString();
                    ddlDistrictPrint.SelectedIndex = 2;
                    //ddlDistrictType.SelectedIndex = 2;
                    ddlStatus.SelectedIndex = 2;
                    ddlCountry.SelectedValue = dr["Country"].ToString().Trim();
                    ddlStateProvince.SelectedValue = dr["StateProvinceId"].ToString();
                    ddlTimeZone.SelectedValue = dr["TimeZone"].ToString();
                    if (dr["Reports"].ToString() == "1")
                    {
                        rdbReportsYes.Checked = true;
                    }
                    else
                    {
                        rdbReportsNo.Checked = true;
                    }
                    //hfAddressId.Value = dr["AddressId"].ToString();
                    //hfContactId.Value = dr["ContactId"].ToString();
                    //hfDistrictId.Value = dr["DistrictId"].ToString();
                }
            }
        }
        else
        {
            ProcessGetDistrict getDistrict = new ProcessGetDistrict();
            dsDistrict = getDistrict.GetDistrictDetailByID(int.Parse(Request.QueryString["DistrictId"]));

            if (dsDistrict.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsDistrict.Tables[0].Rows)
                {
                    txtCity.Text = dr["City"].ToString().Trim();
                    txtDistrictName.Text = dr["Name"].ToString().Trim();
                    txtEmail.Text = dr["EmailAddress"].ToString().Trim();
                    txtKitchenNumber.Text = dr["NumberOfKitchens"].ToString();
                    txtManagerName.Text = dr["DistrictManager"].ToString().Trim();
                    txtPassword.Text = dr["Password"].ToString().Trim();
                    txtUser.Text = dr["UserId"].ToString().Trim();
                    txtZipCode.Text = dr["PostalCode"].ToString();
                    if (dr["DistrictPrinting"].ToString() == "1")
                    {
                        ddlDistrictPrint.SelectedIndex = 1;
                    }
                    else
                    {
                        ddlDistrictPrint.SelectedIndex = 2;
                    }
                    //if (dr["DistrictType"].ToString().Trim() == "Paid")
                    //{
                    //    ddlDistrictType.SelectedIndex = 1;
                    //}
                    //else
                    //{
                    //    ddlDistrictType.SelectedIndex = 2;
                    //}
                    if (int.Parse(dr["Active"].ToString()) == 1)
                    {
                        ddlStatus.SelectedIndex = 1;
                    }
                    else
                    {
                        ddlStatus.SelectedIndex = 2;
                    }
                    if (dr["Reports"].ToString() == "1")
                    {
                        rdbReportsYes.Checked = true;
                    }
                    else
                    {
                        rdbReportsNo.Checked = true;
                    }
                    if (dr["Country"].ToString().Trim() == "")
                        ddlCountry.SelectedValue = "US";
                    else
                        ddlCountry.SelectedValue = dr["Country"].ToString().Trim();
                    //ddlStateProvince.SelectedValue = drKitchen["StateProvinceId"].ToString();
                    ddlStateProvince.DataBind();
                    foreach (ListItem item in ddlStateProvince.Items)
                    {
                        if (item.Value == dr["StateProvinceId"].ToString())
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
                    hfAddressId.Value = dr["AddressId"].ToString();
                    hfContactId.Value = dr["ContactId"].ToString();
                    hfDistrictId.Value = dr["DistrictId"].ToString();
                }
            }
            else
            {
                lblInfo.Text = "No Record Found";
                lblInfo.Visible = true;
            }
        }

    }
    private void UpdateData()
    {
        District newDistrict = new District();
        newDistrict.Name = this.txtDistrictName.Text.Trim();
        newDistrict.NumberOfKitchens = int.Parse(this.txtKitchenNumber.Text);
        //newDistrict.DistrictType = this.ddlDistrictType.SelectedItem.Text;
        newDistrict.DistrictType = "Paid";
        newDistrict.DistrictPrinting = int.Parse(this.ddlDistrictPrint.SelectedValue);
        newDistrict.Active = int.Parse(this.ddlStatus.SelectedValue);
        newDistrict.DistrictId = int.Parse(hfDistrictId.Value);
        if (rdbReportsYes.Checked == true)
        {
            newDistrict.Reports = 1;
            newDistrict.TypeId = 2;
        }
        else
        {
            newDistrict.Reports = 0;
            newDistrict.TypeId = 3;
        }

        Address newAddress = new Address();
        newAddress.City = this.txtCity.Text.Trim();
        //newAddress.State = this.ddlStateProvince.SelectedItem.Text;
        if (hfState.Value != "")
        {
            newAddress.State = txtState.Text.Trim();
        }
        else
        {
            newAddress.State = this.ddlStateProvince.SelectedValue;
        }
        newAddress.ZipCode = this.txtZipCode.Text;
        newAddress.TimeZone = ddlTimeZone.SelectedValue;
        newAddress.AddressId = int.Parse(hfAddressId.Value);
        newAddress.Country = ddlCountry.SelectedValue;

        Contact newContact = new Contact();
        newContact.Email = this.txtEmail.Text.Trim();
        newContact.Name = this.txtManagerName.Text.Trim();
        newContact.UserId = this.txtUser.Text.Trim();
        newContact.Password = this.txtPassword.Text;
        newContact.ContactId = int.Parse(hfContactId.Value);

        ProcessSetDistrict setDistrict = new ProcessSetDistrict();
        setDistrict.District = newDistrict;
        setDistrict.Contact = newContact;
        setDistrict.Address = newAddress;
        setDistrict.Invoke();
    }
    private void DeleteData()
    {
        FreeTrialRequest freeTrialRequest = new FreeTrialRequest();
        freeTrialRequest.FreeTrialRequestId = Request.QueryString["RequestId"];
        ProcessDeleteFreeTrialRequest deleteRequest = new ProcessDeleteFreeTrialRequest();
        deleteRequest.FreeTrialRequest = freeTrialRequest;
        deleteRequest.Invoke();
    }
    protected void cmdEdit_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckData(2) == true)
        {
            UpdateData();
            lblInfo.Text = "Corporate Updated Succesfully";
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
