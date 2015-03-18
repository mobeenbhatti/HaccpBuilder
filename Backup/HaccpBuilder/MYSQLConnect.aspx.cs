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
using System.Data.Odbc;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_MYSQLConnect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //SELECT DISTINCT responseweek FROM foodsafetyresponses ORDER BY responseweek

       
    }
    //private void CreateDistrict()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "Select Distinct DistrictId ,Director ,ContactEmail,Address1,Address2,City ,County ,State ,ZipCode ,Phone ,AltPhone ,Fax ,DistrictName ,UserId,Username ,Password  from District INNER JOIN Users ON Users.Destination = District.DistrictId WHERE GroupId= 'districtadmin' ORDER BY DistrictId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
        
    //        oDataAdapter.Fill(oDataSet);            
        
    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        //            DistrictId ,Director ,ContactEmail,Address1 ,Address2,City ,County ,State ,ZipCode ,Phone ,AltPhone ,
    //        //Fax ,DistrictName ,Username ,Password ,
    //        string strState = "";
    //        District newDistrict = new District();
    //        newDistrict.DistrictId = int.Parse(dr["DistrictId"].ToString());
    //        newDistrict.Name = dr["DistrictName"].ToString();
    //        newDistrict.NumberOfKitchens = 0;
    //        newDistrict.DistrictType = "Paid";
    //        newDistrict.DistrictPrinting = 1;
    //        newDistrict.Active = 1;

    //        Address newAddress = new Address();
    //        if (dr["Address1"].ToString() != "")
    //        {
    //            newAddress.AddressOne = dr["Address1"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.AddressOne = "No Address";
    //        }
    //        if (dr["Address2"].ToString() != "")
    //        {
    //            newAddress.AddressTwo = dr["Address2"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.AddressTwo = "";
    //        }
    //        if (dr["City"].ToString() != "")
    //        {
    //            newAddress.City = dr["City"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.City = "";
    //        }
    //        //////////////////////////////
    //        foreach (ListItem item in ddlStateProvince.Items)
    //        {
    //            if (dr["State"].ToString() == item.Value)
    //            {
    //                strState = item.Text;
    //                break;
    //            }
    //        }
    //        if (strState != "")
    //        {
    //            newAddress.State = strState;
    //        }
    //        else
    //        {
    //            newAddress.State = "Minnesota";
    //        }
    //        if (dr["ZipCode"].ToString() != "")
    //        {
    //            newAddress.ZipCode = int.Parse(dr["ZipCode"].ToString());
    //        }
    //        else
    //        {
    //            newAddress.ZipCode = 0;
    //        }
    //        if (dr["County"].ToString() != "")
    //        {
    //            newAddress.County = dr["County"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.County = "";
    //        }

    //        //string strUserName, strPassword;
    //        //strUserName = "UID" + GenerateUserName();
    //        //strPassword = GenerateRandomPassword();

    //        Contact newContact = new Contact();
    //        if (dr["AltPhone"].ToString() != "")
    //        {
    //            newContact.AltPhone = dr["AltPhone"].ToString();
    //        }
    //        else
    //        {
    //            newContact.AltPhone = "0";
    //        }
    //        if (dr["Fax"].ToString() != "")
    //        {
    //            newContact.Fax = dr["Fax"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Fax = "";
    //        }
    //        if (dr["ContactEmail"].ToString() != "")
    //        {
    //            newContact.Email = dr["ContactEmail"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Email = "";
    //        }
    //        if (dr["Director"].ToString() != null)
    //        {
    //            newContact.Name = dr["Director"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Name = "";
    //        }
    //        if (dr["Phone"].ToString() != "")
    //        {
    //            newContact.Phone = dr["Phone"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Phone = "";
    //        }
    //        if (dr["UserId"].ToString() != "")
    //        {
    //            newContact.phpUserId = int.Parse(dr["UserId"].ToString());
    //        }
    //        else
    //        {
    //            newContact.phpUserId = 1;
    //        }
    //        //newContact.EmailAlerts = rdbAlertsYes.Checked ? 1 : 0;
    //        newContact.UserId = dr["Username"].ToString();
    //        newContact.Password = dr["Password"].ToString();

    //        ProcessCreateDistrict createDistrict = new ProcessCreateDistrict();
    //        createDistrict.District = newDistrict;
    //        createDistrict.Contact = newContact;
    //        createDistrict.Address = newAddress;
    //        createDistrict.Invoke("php");
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
        
       
    //}
//        Dim sConString As String = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost;
//DATABASE=Your_Mysql_DB; UID=mysql_username; PASSWORD=mysql_password; OPTION=3"
//Dim oConnection as ODBCConnection = new ODBCConnection(sConString)
//Dim sSQL as String = "SELECT * FROM Table1"
//Dim oDataAdapter as ODBCDataAdapter = New ODBCDataAdapter(sSQL, oConnection)
//Dim oDataSet as DataSet = new DataSet()
//oDataAdapter.Fill(oDataSet)
//oDataGrid.DataSource = oDataSet
//oDataGrid.DataBind()

    //protected void cmdCreate_Click(object sender, ImageClickEventArgs e)
    //{
    //    CreateDistrict();
    //}
    //protected void cmdCreateKitchen_Click(object sender, ImageClickEventArgs e)
    //{
    //    CreateKitchen();
    //}
    //private void CreateKitchen()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT Distinct KitchenId,DistrictId ,Manager ,ContactEmail,Address1,Address2,City ,County ,StateId ,ZipCode ,Phone ,AltPhone ,Fax ,KitchenName ,UserId,Username ,Password,EAlert  FROM `kitchens` INNER JOIN USERS ON Users.Destination = Kitchens.KitchenId WHERE GroupId= 'siteadmin' ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        //            DistrictId ,Director ,ContactEmail,Address1 ,Address2,City ,County ,State ,ZipCode ,Phone ,AltPhone ,
    //        //Fax ,DistrictName ,Username ,Password ,
    //        string strState = "";
    //        Kitchen newKitchen = new Kitchen();
    //        newKitchen.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        newKitchen.DistrictId = int.Parse(dr["DistrictId"].ToString());
    //        newKitchen.Name = dr["KitchenName"].ToString();
    //        if(dr["EAlert"].ToString() == "1")
    //        {
    //            newKitchen.ColdHoldingLog =  1;
    //            newKitchen.FoodSafetyCheckList = 1;
    //            newKitchen.FreezerLog = 1;
    //            newKitchen.HotHoldingLog = 1;
    //            newKitchen.ReceivingLog = 1;
    //            newKitchen.RefrigerationLog = 1;
    //            newKitchen.TemperatureLog = 1;
    //            newKitchen.Thermometer = 1;
    //        }
    //        else
    //        {
    //            newKitchen.ColdHoldingLog =  0;
    //            newKitchen.FoodSafetyCheckList = 0;
    //            newKitchen.FreezerLog = 0;
    //            newKitchen.HotHoldingLog = 0;
    //            newKitchen.ReceivingLog = 0;
    //            newKitchen.RefrigerationLog = 0;
    //            newKitchen.TemperatureLog = 0;
    //            newKitchen.Thermometer = 0;
    //        }          
           

    //        Address newAddress = new Address();
    //        if (dr["Address1"].ToString() != "")
    //        {
    //            newAddress.AddressOne = dr["Address1"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.AddressOne = "No Address";
    //        }
    //        if (dr["Address2"].ToString() != "")
    //        {
    //            newAddress.AddressTwo = dr["Address2"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.AddressTwo = "";
    //        }
    //        if (dr["City"].ToString() != "")
    //        {
    //            newAddress.City = dr["City"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.City = "";
    //        }
    //        //////////////////////////////
    //        foreach (ListItem item in ddlStateProvince.Items)
    //        {
    //            if (dr["StateId"].ToString() == item.Value)
    //            {
    //                strState = item.Text;
    //                break;
    //            }
    //        }
    //        if (strState != "")
    //        {
    //            newAddress.State = strState;
    //        }
    //        else
    //        {
    //            newAddress.State = "Minnesota";
    //        }
    //        if (dr["ZipCode"].ToString() != "")
    //        {
    //            newAddress.ZipCode = int.Parse(dr["ZipCode"].ToString());
    //        }
    //        else
    //        {
    //            newAddress.ZipCode = 0;
    //        }
    //        if (dr["County"].ToString() != "")
    //        {
    //            newAddress.County = dr["County"].ToString();
    //        }
    //        else
    //        {
    //            newAddress.County = "";
    //        }

    //        //string strUserName, strPassword;
    //        //strUserName = "UID" + GenerateUserName();
    //        //strPassword = GenerateRandomPassword();

    //        Contact newContact = new Contact();
    //        if (dr["AltPhone"].ToString() != "")
    //        {
    //            newContact.AltPhone = dr["AltPhone"].ToString();
    //        }
    //        else
    //        {
    //            newContact.AltPhone = "0";
    //        }
    //        if (dr["Fax"].ToString() != "")
    //        {
    //            newContact.Fax = dr["Fax"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Fax = "";
    //        }
    //        if (dr["ContactEmail"].ToString() != "")
    //        {
    //            newContact.Email = dr["ContactEmail"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Email = "";
    //        }
    //        if (dr["Manager"].ToString() != null)
    //        {
    //            newContact.Name = dr["Manager"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Name = "";
    //        }
    //        if (dr["Phone"].ToString() != "")
    //        {
    //            newContact.Phone = dr["Phone"].ToString();
    //        }
    //        else
    //        {
    //            newContact.Phone = "";
    //        }
    //        if (dr["UserId"].ToString() != "")
    //        {
    //            newContact.phpUserId = int.Parse(dr["UserId"].ToString());
    //        }
    //        else
    //        {
    //            newContact.phpUserId = 1;
    //        }

    //        newContact.EmailAlerts = int.Parse(dr["EAlert"].ToString());
    //        newContact.UserId = dr["Username"].ToString();
    //        newContact.Password = dr["Password"].ToString();

    //        ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
    //        createKitchen.Kitchen = newKitchen;
    //        createKitchen.Contact = newContact;
    //        createKitchen.Address = newAddress;
    //        createKitchen.Invoke("php");

            
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();


    //}
    //protected void cmdInventory_Click(object sender, ImageClickEventArgs e)
    //{
    //    UpdateInventory();
    //}
    //private void UpdateInventory()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM KitchenInventory ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        InventoryItem inventoryItem = new InventoryItem();
    //        inventoryItem.InventoryItemId = int.Parse(dr["InventoryItemId"].ToString());
    //        inventoryItem.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        if (int.Parse(dr["Selected"].ToString()) == 1)
    //        {
    //            inventoryItem.Selected = int.Parse(dr["Selected"].ToString());
    //            inventoryItem.Quantity = int.Parse(dr["Quantity"].ToString());
    //            ProcessSetKitchenInventory setKitchenInventory = new ProcessSetKitchenInventory();
    //            setKitchenInventory.KitchenInventory = inventoryItem;
    //            setKitchenInventory.Invoke("php");
    //        }
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void cmdKitchenDetails_Click(object sender, ImageClickEventArgs e)
    //{
    //    CreateKitchenDetails();
    //}
    //private void CreateKitchenDetails()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM KitchenDetails ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        KitchenDetails kitchenDetail = new KitchenDetails();
    //        if (dr["AMServe"].ToString() != "")
    //        {
    //            kitchenDetail.AMServe = int.Parse(dr["AMServe"].ToString());
    //        }
    //        else
    //        {
    //        }
    //        if (dr["PMServe"].ToString() != "")
    //        {
    //            kitchenDetail.PMServe = int.Parse(dr["PMServe"].ToString());
    //        }
    //        else
    //        {
    //            kitchenDetail.PMServe = 0;
    //        }
    //        if (dr["NumberOfManagers"].ToString() != "")
    //        {
    //            kitchenDetail.Managers = int.Parse(dr["NumberOfManagers"].ToString());
    //        }
    //        else
    //        {
    //            kitchenDetail.Managers = 0;
    //        }
    //        if (dr["NumberOfStaff"].ToString() != "")
    //        {
    //            kitchenDetail.Staff = int.Parse(dr["NumberOfStaff"].ToString());
    //        }
    //        else
    //        {
    //            kitchenDetail.Staff = 0;
    //        }
    //        if (dr["WeeksInMenuCycle"].ToString() != "")
    //        {
    //            if (int.Parse(dr["WeeksInMenuCycle"].ToString()) > 0)
    //            {
    //                kitchenDetail.IsCycleRepeat = 1;
    //            }
    //        }
    //        else
    //        {
    //            kitchenDetail.IsCycleRepeat = 2;
    //        }
    //        kitchenDetail.CycleMeasuredBy = "Week";
    //        if (dr["WeeksInMenuCycle"].ToString() != "")
    //        {
    //            kitchenDetail.UnitsInCycle = int.Parse(dr["WeeksInMenuCycle"].ToString());
    //        }
    //        else
    //        {
    //            kitchenDetail.UnitsInCycle = 0;
    //        }

    //        kitchenDetail.StartDate = DateTime.Today ;
    //        kitchenDetail.EndDate = DateTime.Today;
    //        kitchenDetail.KitchenId = int.Parse(dr["KitchenId"].ToString());

    //        ProcessCreateDailyParticipation createDailyPaerticipation = new ProcessCreateDailyParticipation();
    //        createDailyPaerticipation.KitchenDetails = kitchenDetail;
    //        createDailyPaerticipation.Invoke();
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}

    //protected void cmdCustomInventory_Click(object sender, ImageClickEventArgs e)
    //{
    //   // CreateCustomInventoryTypes();
    //    CreateCustomInventory();
    //}
    //private void CreateCustomInventoryTypes()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM custominventorytypes WHERE KitchenId IS NOT NULL order by KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
    //        customInventory.Name = dr["Name"].ToString();
    //        customInventory.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        customInventory.KitchenInventoryCustomId = int.Parse(dr["CustomInventoryTypeId"].ToString());         

    //        ProcessCreateKitchenInventoryCustom createCustomInventory = new ProcessCreateKitchenInventoryCustom();
    //        createCustomInventory.KitchenInventoryCustom = customInventory;
    //        createCustomInventory.Invoke("php");        
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateCustomInventory()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "select * from KitchenInventorycustom Where CustomInventoryTypeId IS NOT NULL order by KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        if (dr["CustomInventoryTypeId"].ToString() != "")
    //        {
    //            KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
    //            customInventory.Name = dr["Name"].ToString();
    //            if (dr["Quantity"].ToString() != "")
    //            {
    //                customInventory.Quantity = int.Parse(dr["Quantity"].ToString());
    //            }
    //            else
    //            {
    //                customInventory.Quantity = 0;
    //            }
    //            customInventory.Selected = int.Parse(dr["Selected"].ToString());
    //            customInventory.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //            customInventory.KitchenInventoryCustomId = int.Parse(dr["CustomInventoryTypeId"].ToString());

    //            ProcessCreateKitchenInventoryCustom createCustomInventory = new ProcessCreateKitchenInventoryCustom();
    //            createCustomInventory.KitchenInventoryCustom = customInventory;
    //            createCustomInventory.Invoke("php");
    //        }
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateMenuItems()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM kitchenmenuitems ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        KitchenMenuItem menuItem = new KitchenMenuItem();
    //        menuItem.MenuItemId = int.Parse(dr["MenuItemId"].ToString());
    //        if (dr["Selected"].ToString() != "")
    //        {
    //            menuItem.Selected = int.Parse(dr["Selected"].ToString());
    //            if (dr["PreparationTypeId"].ToString() != "")
    //            {
    //                menuItem.PreparationType = int.Parse(dr["PreparationTypeId"].ToString());
    //            }
    //            else
    //            {
    //                menuItem.PreparationType = 1;
    //            }
    //            menuItem.KitchenId = int.Parse(dr["KitchenId"].ToString());

    //            ProcessSetKitchenMenu setKitchenMenu = new ProcessSetKitchenMenu();
    //            setKitchenMenu.KitchenMenu = menuItem;
    //            setKitchenMenu.Invoke("php");
    //        }
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void cmdMenuItems_Click(object sender, ImageClickEventArgs e)
    //{
    //    CreateMenuItems();
    //}
    //private void CreateCustomMenuItems()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM kitchenmenucustom ORDER BY KitchenId ";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
            
    //            KitchenMenuCustomItem customMenuItem = new KitchenMenuCustomItem();
    //            customMenuItem.KitchenMenuCustomId = int.Parse(dr["KitchenMenuCustomId"].ToString());
    //            customMenuItem.Name = dr["Name"].ToString();
    //            if (dr["FoodGroupId"].ToString() != "")
    //            {
    //            customMenuItem.FoodGroupId = int.Parse(dr["FoodGroupId"].ToString());
    //            }
    //            else
    //            {
    //                 customMenuItem.FoodGroupId = 1;
    //            }
    //            customMenuItem.Instructions = dr["Instructions"].ToString();
    //            customMenuItem.KitchenId = int.Parse(dr["KitchenId"].ToString());

    //            if (dr["PreparationTypeId"].ToString() != "")
    //            {
    //                customMenuItem.PreparationTypeId = int.Parse(dr["PreparationTypeId"].ToString());
    //            }
    //            else
    //            {
    //                customMenuItem.PreparationTypeId = 2;
    //            }
    //            if (dr["ProcessId"].ToString() != "")
    //            {
    //                customMenuItem.ProcessId = int.Parse(dr["ProcessId"].ToString());
    //            }
    //            if (dr["Ready"].ToString() != "")
    //            {
    //                customMenuItem.Ready = int.Parse(dr["Ready"].ToString());
    //            }
    //            else
    //            {
    //                customMenuItem.Ready = 0;
    //            }
    //            if (dr["RecipeNumber"].ToString() != "")
    //            {
    //                customMenuItem.RecipeNumber = dr["RecipeNumber"].ToString();
    //            }
    //            else
    //            {
    //                customMenuItem.RecipeNumber = null;
    //            }

    //            customMenuItem.Selected = 1;

    //            ProcessCreateKitchenMenuCustomItem createCustomMenuItem = new ProcessCreateKitchenMenuCustomItem();
    //            createCustomMenuItem.KitchenMenuCustomItem = customMenuItem;
    //            createCustomMenuItem.Invoke("php");
            
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void cmdCustomMenu_Click(object sender, ImageClickEventArgs e)
    //{
    //    CreateCustomMenuItems();
    //}
    //protected void lkbColHolding_Click(object sender, EventArgs e)
    //{
    //    CreateColdHoldingLog();
    //}
    //private void CreateColdHoldingLog()
    //{
    //     string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT ColdHoldingLogId,EntryDate,mi.MenuItemId AS FoodItem,IsCustomItem,InternalTemp1,Temp1Time,InternalTemp2,Temp2Time,CorrectiveAction,UserId,VerifiedBy,VerifiedDate,chl.KitchenId From ColdHoldingLog chl INNER JOIN KitchenMenuItems kmi ON kmi.KitchenMenuItemId = FoodItem INNER JOIN MenuItems mi ON mi.MenuItemId = kmi.MenuItemId  ORDER BY chl.KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        ColdHoldingLog coldHoldingLog = new ColdHoldingLog();
    //        //coldHoldingLog.EntryDate = cldEntryDate.SelectedDate;
    //        coldHoldingLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        coldHoldingLog.FoodItem = dr["FoodItem"].ToString();
    //        if (dr["InternalTemp1"].ToString() != "")
    //        {
    //            coldHoldingLog.InternalTemp1 = float.Parse(dr["InternalTemp1"].ToString());
    //        }
    //        else
    //        {
    //            coldHoldingLog.InternalTemp1 = 0;
    //        }
    //        if (dr["Temp1Time"].ToString() != "")
    //        {
    //            coldHoldingLog.Temp1Time = DateTime.Parse(dr["Temp1Time"].ToString());
    //        }
    //        else
    //        {
    //            coldHoldingLog.Temp1Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["InternalTemp2"].ToString() != "")
    //        {
    //            coldHoldingLog.InternalTemp2 = float.Parse(dr["InternalTemp2"].ToString());
    //        }
    //        else
    //        {
    //            coldHoldingLog.InternalTemp2 = 0;
    //        }
    //        if (dr["Temp2Time"].ToString() != "")
    //        {
    //            coldHoldingLog.Temp2Time = DateTime.Parse(dr["Temp2Time"].ToString());
    //        }
    //        else
    //        {
    //            coldHoldingLog.Temp2Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            coldHoldingLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            coldHoldingLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            coldHoldingLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            coldHoldingLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            coldHoldingLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            coldHoldingLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        coldHoldingLog.KitchenId = int.Parse(dr["KitchenId"].ToString());           
    //        coldHoldingLog.UserName = dr["UserId"].ToString();
    //        coldHoldingLog.IsCustomItem = int.Parse(dr["IsCustomItem"].ToString());
           

    //        ProcessCreateColdHoldingLog createColdHoldingLog = new ProcessCreateColdHoldingLog();
    //        createColdHoldingLog.ColdHoldingLog = coldHoldingLog;
    //        createColdHoldingLog.Invoke("php");
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void lkbFreezerLog_Click(object sender, EventArgs e)
    //{
    //    CreateFreezerLog();
    //}
    //protected void lkbHotHolding_Click(object sender, EventArgs e)
    //{
    //    CreateHotHoldingLog();
    //}
    //protected void lkbReceiving_Click(object sender, EventArgs e)
    //{
    //    CreateReceivingLog();
    //}
    //protected void lkbRefrigeration_Click(object sender, EventArgs e)
    //{
    //    CreateRefrigerationLog();
    //}
    //protected void lkbTemperature_Click(object sender, EventArgs e)
    //{
    //    CreateTemperatureLog();
    //}
    //protected void lkbThermo_Click(object sender, EventArgs e)
    //{
    //    CreateThermoLog();
    //}
    //private void CreateThermoLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM `thermocalibrationlog` ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        ThermoCalibrationLog thermoCalibrationLog = new ThermoCalibrationLog();
    //        thermoCalibrationLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        if (dr["TemperatureReading"].ToString() != "")
    //        {
    //            thermoCalibrationLog.Temperature = float.Parse(dr["TemperatureReading"].ToString());
    //        }
    //        thermoCalibrationLog.Thermometer = dr["Thermometer"].ToString();

    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            thermoCalibrationLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            thermoCalibrationLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            thermoCalibrationLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            thermoCalibrationLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            thermoCalibrationLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            thermoCalibrationLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        thermoCalibrationLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        thermoCalibrationLog.UserName = dr["UserId"].ToString();

    //        ProcessCreateThermoCalibrationLog createThermoCalibrationLog = new ProcessCreateThermoCalibrationLog();
    //        createThermoCalibrationLog.ThermoCalibrationLog = thermoCalibrationLog;
    //        createThermoCalibrationLog.Invoke("php");

           
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateTemperatureLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT TemperatureLogId,EntryDate,mi.MenuItemId AS FoodItem,IsCustomItem,InternalTemp1,Temp1Time,InternalTemp2,Temp2Time,CorrectiveAction,UserId,VerifiedBy,VerifiedDate,chl.KitchenId From TemperatureLog chl INNER JOIN KitchenMenuItems kmi ON kmi.KitchenMenuItemId = FoodItem INNER JOIN MenuItems mi ON mi.MenuItemId = kmi.MenuItemId  ORDER BY chl.KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        TemperatureLog temperatureLog = new TemperatureLog();
    //        //coldHoldingLog.EntryDate = cldEntryDate.SelectedDate;
    //        temperatureLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        temperatureLog.FoodItem = dr["FoodItem"].ToString();
    //        if (dr["InternalTemp1"].ToString() != "")
    //        {
    //            temperatureLog.InternalTemp1 = float.Parse(dr["InternalTemp1"].ToString());
    //        }
    //        else
    //        {
    //            temperatureLog.InternalTemp1 = 0;
    //        }
    //        if (dr["Temp1Time"].ToString() != "")
    //        {
    //            temperatureLog.Temp1Time = DateTime.Parse(dr["Temp1Time"].ToString());
    //        }
    //        else
    //        {
    //            temperatureLog.Temp1Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["InternalTemp2"].ToString() != "")
    //        {
    //            temperatureLog.InternalTemp2 = float.Parse(dr["InternalTemp2"].ToString());
    //        }
    //        else
    //        {
    //            temperatureLog.InternalTemp2 = 0;
    //        }
    //        if (dr["Temp2Time"].ToString() != "")
    //        {
    //            temperatureLog.Temp2Time = DateTime.Parse(dr["Temp2Time"].ToString());
    //        }
    //        else
    //        {
    //            temperatureLog.Temp2Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            temperatureLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            temperatureLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            temperatureLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            temperatureLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            temperatureLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            temperatureLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        temperatureLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        temperatureLog.UserName = dr["UserId"].ToString();
    //        temperatureLog.IsCustomItem = int.Parse(dr["IsCustomItem"].ToString());


    //        ProcessCreateTemperatureLog createTemperatureLog = new ProcessCreateTemperatureLog();
    //        createTemperatureLog.TemperatureLog = temperatureLog;
    //        createTemperatureLog.Invoke("php");
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateRefrigerationLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM `refrigerationlog` ORDER BY KitchenId ";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        RefrigerationLog refrigerationLog = new RefrigerationLog();
    //        refrigerationLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        if (dr["Temperature"].ToString() != "")
    //        {
    //            refrigerationLog.Temperature = float.Parse(dr["Temperature"].ToString());
    //        }
    //        refrigerationLog.Location = dr["LocationUnitDescription"].ToString();

    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            refrigerationLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            refrigerationLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            refrigerationLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            refrigerationLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            refrigerationLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            refrigerationLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }

    //        refrigerationLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        refrigerationLog.UserName = dr["UserId"].ToString();

    //        ProcessCreateRefrigerationLog createRefrigerationLog = new ProcessCreateRefrigerationLog();
    //        createRefrigerationLog.RefrigerationLog = refrigerationLog;
    //        createRefrigerationLog.Invoke("php");
           
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateReceivingLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM Receivinglog ORDER BY KitchenId ";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        ReceivingLog receivingLog = new ReceivingLog();
    //        receivingLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        if (dr["Temperature"].ToString() != "")
    //        {
    //            receivingLog.Temperature = float.Parse(dr["Temperature"].ToString());
    //        }
    //        receivingLog.ProductName = dr["ProductName"].ToString();
    //        receivingLog.Vendor = dr["VendorOrSchool"].ToString();
    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            receivingLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            receivingLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            receivingLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            receivingLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            receivingLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            receivingLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        receivingLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        receivingLog.UserName = dr["UserId"].ToString();
           
    //        ProcessCreateReceivingLog createReceivingLog = new ProcessCreateReceivingLog();
    //        createReceivingLog.ReceivingLog = receivingLog;
    //        createReceivingLog.Invoke("php"); 

    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateHotHoldingLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT HotHoldingLogId,EntryDate,mi.MenuItemId AS FoodItem,IsCustomItem,InternalTemp1,Temp1Time,InternalTemp2,Temp2Time,CorrectiveAction,UserId,VerifiedBy,VerifiedDate,chl.KitchenId From HotHoldingLog chl INNER JOIN KitchenMenuItems kmi ON kmi.KitchenMenuItemId = FoodItem INNER JOIN MenuItems mi ON mi.MenuItemId = kmi.MenuItemId  ORDER BY chl.KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        HotHoldingLog hotHoldingLog = new HotHoldingLog();
    //        //hotHoldingLog.EntryDate = cldEntryDate.SelectedDate;
    //        hotHoldingLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());
    //        hotHoldingLog.FoodItem = dr["FoodItem"].ToString();
    //        if (dr["InternalTemp1"].ToString() != "")
    //        {
    //            hotHoldingLog.InternalTemp1 = float.Parse(dr["InternalTemp1"].ToString());
    //        }
    //        else
    //        {
    //            hotHoldingLog.InternalTemp1 = 0;
    //        }
    //        if (dr["Temp1Time"].ToString() != "")
    //        {
    //            hotHoldingLog.Temp1Time = DateTime.Parse(dr["Temp1Time"].ToString());
    //        }
    //        else
    //        {
    //            hotHoldingLog.Temp1Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["InternalTemp2"].ToString() != "")
    //        {
    //            hotHoldingLog.InternalTemp2 = float.Parse(dr["InternalTemp2"].ToString());
    //        }
    //        else
    //        {
    //            hotHoldingLog.InternalTemp2 = 0;
    //        }
    //        if (dr["Temp2Time"].ToString() != "")
    //        {
    //            hotHoldingLog.Temp2Time = DateTime.Parse(dr["Temp2Time"].ToString());
    //        }
    //        else
    //        {
    //            hotHoldingLog.Temp2Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            hotHoldingLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            hotHoldingLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            hotHoldingLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        else
    //        {
    //            hotHoldingLog.VerifiedBy = null;
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            hotHoldingLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            hotHoldingLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        hotHoldingLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        hotHoldingLog.UserName = dr["UserId"].ToString();
    //        hotHoldingLog.IsCustomItem = int.Parse(dr["IsCustomItem"].ToString());


    //        ProcessCreateHotHoldingLog createHotHoldingLog = new ProcessCreateHotHoldingLog();
    //        createHotHoldingLog.HotHoldingLog = hotHoldingLog;
    //        createHotHoldingLog.Invoke("php");
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //private void CreateFreezerLog()
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM freezerlog ORDER BY KitchenId ";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        FreezerLog freezerLog = new FreezerLog();
    //        //freezerLog.EntryDate = cldEntryDate.SelectedDate;
    //        freezerLog.EntryDate = DateTime.Parse(dr["EntryDate"].ToString());

    //        // For New Table Design
    //        freezerLog.FoodItem = dr["FoodItem"].ToString();
    //        freezerLog.IsCustomItem = int.Parse(dr["IsCustomItem"].ToString());
    //        if (dr["Temp1"].ToString() != "")
    //        {
    //            freezerLog.Temp1 = float.Parse(dr["Temp1"].ToString());
    //        }
    //        if (dr["Temp1Time"].ToString() != "")
    //        {
    //            freezerLog.Temp1Time = DateTime.Parse(dr["Temp1Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp1Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["Temp2"].ToString() != "")
    //        {
    //            freezerLog.Temp2 = float.Parse(dr["Temp2"].ToString());
    //        }
    //        if (dr["Temp2Time"].ToString() != "")
    //        {
    //            freezerLog.Temp2Time = DateTime.Parse(dr["Temp2Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp2Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["Temp3"].ToString() != "")
    //        {
    //            freezerLog.Temp3 = float.Parse(dr["Temp3"].ToString());
    //        }
    //        if (dr["Temp3Time"].ToString() != "")
    //        {
    //            freezerLog.Temp3Time = DateTime.Parse(dr["Temp3Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp3Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["Temp4"].ToString() != "")
    //        {
    //            freezerLog.Temp4 = float.Parse(dr["Temp4"].ToString());
    //        }
    //        if (dr["Temp4Time"].ToString() != "")
    //        {
    //            freezerLog.Temp4Time = DateTime.Parse(dr["Temp4Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp4Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["Temp5"].ToString() != "")
    //        {
    //            freezerLog.Temp5 = float.Parse(dr["Temp5"].ToString());
    //        }
    //        if (dr["Temp5Time"].ToString() != "")
    //        {
    //            freezerLog.Temp5Time = DateTime.Parse(dr["Temp5Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp5Time = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["Temp6"].ToString() != "")
    //        {
    //            freezerLog.Temp6 = float.Parse(dr["Temp6"].ToString());
    //        }
    //        if (dr["Temp6Time"].ToString() != "")
    //        {
    //            freezerLog.Temp6Time = DateTime.Parse(dr["Temp6Time"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.Temp6Time = DateTime.Parse("01/01/1900");
    //        }

    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            freezerLog.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            freezerLog.CorrectiveAction = null;
    //        }
    //        if (dr["VerifiedBy"].ToString() != "")
    //        {
    //            freezerLog.VerifiedBy = dr["VerifiedBy"].ToString();
    //        }
    //        if (dr["VerifiedDate"].ToString() != "")
    //        {
    //            freezerLog.VerifiedDate = DateTime.Parse(dr["VerifiedDate"].ToString());
    //        }
    //        else
    //        {
    //            freezerLog.VerifiedDate = DateTime.Parse("01/01/1900");
    //        }
    //        if (dr["KitchenId"].ToString() != "")
    //        {
    //            freezerLog.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        }            
    //            freezerLog.UserName = (dr["UserId"].ToString());
            

    //        ProcessCreateFreezerLog createFreezerLog = new ProcessCreateFreezerLog();
    //        createFreezerLog.FreezerLog = freezerLog;
    //        createFreezerLog.Invoke("php");

    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void lkbCheckList_Click(object sender, EventArgs e)
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "select distinct responseweek,kitchenId,Observer from foodsafetyresponses  Group By KitchenId,Observer,ResponseWeek order by kitchenid ";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);

    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        ResponseHistory responseHistory = new ResponseHistory();
    //        responseHistory.KitchenId = int.Parse(dr["KitchenId"].ToString());
    //        responseHistory.Observer = dr["Observer"].ToString();            
    //        responseHistory.ResponseWeek = int.Parse(dr["ResponseWeek"].ToString());
            

    //        ProcessCreateResponseHistory createResponse = new ProcessCreateResponseHistory();
    //        createResponse.ResponseHistory = responseHistory;
    //        createResponse.Invoke();
    //        //ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
    //        //Session["HistoryId"] = getHistory.GetHistoryId();
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
    //protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    //{
    //    string sConString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=haccpdb; UID=root; PASSWORD=YES; ";
    //    OdbcConnection oConnection = new OdbcConnection(sConString);
    //    string sSQL = "SELECT * FROM `foodsafetyresponses` ORDER BY KitchenId";
    //    OdbcDataAdapter oDataAdapter = new OdbcDataAdapter(sSQL, oConnection);
    //    DataSet oDataSet = new DataSet();
    //    // Update Kitchens SET Zipcode = 123 WHERE KitchenId = 1157910575
    //    oDataAdapter.Fill(oDataSet);
    //    int nHistoryId = 0,nKitchenId,nResponseWeek =0,nOldResponseWeek = 0;
    //    foreach (DataRow dr in oDataSet.Tables[0].Rows)
    //    {
    //        ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
    //        nKitchenId = int.Parse(dr["KitchenId"].ToString());
    //        nResponseWeek = int.Parse(dr["ResponseWeek"].ToString());
    //        if (nResponseWeek != nOldResponseWeek)
    //        {
    //            nOldResponseWeek = nResponseWeek;
    //            IDataReader drWeek = getHistory.GetHistoryByWeek(nKitchenId, nResponseWeek);
    //            if (drWeek.Read())
    //            {
    //                nHistoryId = int.Parse(drWeek["HistoryId"].ToString());
    //            }
    //        }
    //        FoodSafetyResponse userResponse = new FoodSafetyResponse();
    //        userResponse.KitchenId = nKitchenId;
    //        userResponse.QuestionId = int.Parse(dr["QuestionId"].ToString());
    //        userResponse.HistoryId = nHistoryId;
    //        userResponse.Answer = int.Parse(dr["answer"].ToString());
    //        if (dr["CorrectiveAction"].ToString() != "")
    //        {
    //            userResponse.CorrectiveAction = dr["CorrectiveAction"].ToString();
    //        }
    //        else
    //        {
    //            userResponse.CorrectiveAction = null;
    //        }
    //        ProcessCreateFoodSafetyResponse createReponse = new ProcessCreateFoodSafetyResponse();
    //        createReponse.FoodSafetyResponse = userResponse;
    //        createReponse.Invoke("php");
            
    //    }
    //    grdMySql.DataSource = oDataSet;
    //    grdMySql.DataBind();
    //}
}
