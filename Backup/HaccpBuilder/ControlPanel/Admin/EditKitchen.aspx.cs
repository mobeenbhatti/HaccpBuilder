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

public partial class ControlPanel_Admin_EditKitchen : System.Web.UI.Page
{
    public string mode = "NEW";
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
                lblInfo.Visible = true;
                lblInfo.Text = "No Record Found";
            }
        }
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void cmdEdit_Click(object sender, ImageClickEventArgs e)
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
            if (drKitchen["EmailAlerts"].ToString() == "True")
            {
                rdbAlertsYes.Checked = true;
            }
            else
            {
                rdbAlertsNo.Checked = true;
            }
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
            ddlStateProvince.SelectedValue = drKitchen["StateProvinceId"].ToString();
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
    private int UpdateData()
    {
        Kitchen newKitchen = new Kitchen();
        newKitchen.DistrictId = int.Parse(Request.QueryString["DistrictId"]);        
        newKitchen.ColdHoldingLog = rdbColdHoldingLogOn.Checked ? 1 : 0;
        newKitchen.FoodSafetyCheckList = rdbFoodSafetyOn.Checked ? 1 : 0;
        newKitchen.FreezerLog = rdbFreezerLogOff.Checked ? 1 : 0;
        newKitchen.HotHoldingLog = rdbHotHoldingLogOn.Checked ? 1 : 0;
        newKitchen.ReceivingLog = rdbReceivingLogOn.Checked ? 1 : 0;
        newKitchen.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
        newKitchen.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
        newKitchen.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
        newKitchen.Name = txtKitchenName.Text;
        newKitchen.KitchenId = int.Parse(hfKitchenId.Value);

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
        newContact.EmailAlerts = rdbAlertsYes.Checked ? 1 : 0;
        newContact.ContactId = int.Parse(hfContactId.Value);

        ProcessSetKitchen setKitchen = new ProcessSetKitchen();
        setKitchen.Kitchen = newKitchen;
        setKitchen.Contact = newContact;
        setKitchen.Address = newAddress;
        setKitchen.Invoke();


        return 1;
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
            this.ddlStateProvince.SelectedIndex = 0;
            //cmdCancel.Visible = false;
            //cmdEdit.Visible = false;
            //cmdSubmit.Visible = true;
        }
        else
        {
            cmdCancel.Visible = true;
            cmdEdit.Visible = true;
            cmdSubmit.Visible = false;
        }
    }
}
