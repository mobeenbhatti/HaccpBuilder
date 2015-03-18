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

public partial class ControlPanel_Location_ShippingLog : System.Web.UI.Page
{
    public string mode = "new";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
            CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
            chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
            //cmdBack.Attributes.Add("onclick", "MoveBack( )");
            GetInitialData();
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
        else
        {
            if (rdbMenuItem.Checked == true)
            {
                ddlMenuItem.Enabled = true;
                ddlVendor.Enabled = true;
             
            }
           
        }
     



    }
    protected void cmdBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    private void GetInitialData()
    {        
        cldMealDate.SelectedDate = DateTime.Today;
        SetTime(1, DateTime.Now);
        chkTempRequired.Checked = false;
        cldVerifiedDate.SelectedDate = DateTime.Today;
        txtEntryDate.Text=DateTime.Now.ToString();

        if ((int)Session["TypeId"] != 1)
        {
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
            //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 1);
            DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId((int)Session["KitchenId"], 8);
            if (dsTemperature.Tables[0].Rows.Count > 0)
            {
                hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["QCLTempHigh"].ToString();
                hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["QCLTempLow"].ToString();
                Lbl_QCLMaxtempValue.Text = dsTemperature.Tables[0].Rows[0]["QCLTempHigh"].ToString();
                Lbl_QCLMintempValue.Text = dsTemperature.Tables[0].Rows[0]["QCLTempLow"].ToString();
            }
        }
        else
        {
            hfTempHigh.Value = "NA";
            hfTempLow.Value = "NA";
            Lbl_QCLMaxtempValue.Text = "NA";
            Lbl_QCLMintempValue.Text = "NA";
        }

    }
    private void GetData()
    {
       // string strCustom;
        string strTime1;
        if (Request.QueryString["Id"] != null)
        {
            ShippingLog shippingLog = new ShippingLog();
            shippingLog.ShippingLogId = int.Parse(Request.QueryString["Id"]);
            ProcessGetShippingLog getShippingLog = new ProcessGetShippingLog();
            getShippingLog.ShippingLog = shippingLog;
            getShippingLog.Invoke();           
          
            IDataReader logReader = getShippingLog.ResultSet;
            if (logReader.Read())
            {
                cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                //if (logReader["FoodItem"].ToString() == "1")
                //{
                //    //ddlItem.DataSource = odsIngredient;
                //    //ddlItem.DataBind();
                //    //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                //    rdbMenuItem.Checked = true;
                //    rdbNoItem.Checked = false;
                //    ddlMenuItem.Enabled = true;
                //  //  rfvIngredient.Enabled = true;
                //   // rfvMenuItem.Enabled = false;
                //    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                   
                //  //  ddlMenuItem.Enabled = false;

                //}
                if (logReader["FoodItem"].ToString() == "2")
                {
                    //ddlItem.DataSource = odsMenuItem;
                    //ddlItem.DataBind();
                    //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                    rdbMenuItem.Checked = true;
                    ddlMenuItem.Enabled = true;
                   // rfvMenuItem.Enabled = true;

                    ddlVendor.Enabled = true;
                   // rfvCustomer.Enabled = true;
                    
                    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    ddlVendor.SelectedValue = logReader["CustomerId"].ToString();
                }
                if (logReader["FoodItem"].ToString() == "3")
                {
                  //  rdbMenuItem.Checked = false; ;
                  //  ddlMenuItem.Enabled = false;
                  //  rfvMenuItem.Enabled = false;
                   // rfvIngredient.Enabled = false;                   
                    //ddlMenuItem.Enabled = false;
                    //rdbMenuItem.Checked = false;
                    //ddlVendor.Enabled = false;
                    //rfvCustomer.Enabled = false;
                   // rfvMenuItem.Enabled = false;
                 //   rdbNoItem.Checked = true;
                }
                //ddlMenuItem.SelectedValue = logReader["IngredientId"].ToString();
                
               // txtProduct.Text = logReader["ProductName"].ToString();
               // txtVendor.Text = logReader["Vendor"].ToString();


                if (logReader["Temperature"].ToString() != "99999.00")
                {
                    txtTemperature.Text = logReader["Temperature"].ToString();
                    this.ViewState["Temperature"] = logReader["Temperature"].ToString();
                }
                else
                {
                    txtTemperature.Text = "";
                    this.ViewState["Temperature"] = "";
                }
                try
                {
                    //tpTime.Text = DateTime.Parse(logReader["TempTime"].ToString()).ToShortTimeString();
                    strTime1 = DateTime.Parse(logReader["TempTime"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                }
                catch(Exception ex)
                {
                   if(ex.ToString().Contains("String was not recognized as a valid DateTime"))
                   {
                       //tpTime.Text = DateTime.Now.ToShortTimeString();
                       strTime1 = DateTime.Now.ToShortTimeString();
                       SetTime(1, DateTime.Parse(strTime1));
                   }
                }


                if (logReader["RemoveTemperatureCheck"].ToString() == "1")
                {
                    chkTempRequired.Checked = true;
                    txtTemperature.Text = "";
                    txtTemperature.Enabled = false;
                    tpHour1.Enabled = false;
                    tpMinute1.Enabled = false;
                    tpTime1.Enabled = false;
                    tpHour1.Text = "";
                    tpMinute1.Text = "";
                  
                }
                else if (logReader["RemoveTemperatureCheck"].ToString() == "0")
                {
                    chkTempRequired.Checked = false;
                    txtTemperature.Enabled = true;
                    tpTime1.Enabled = true;
                    tpHour1.Enabled = true;
                    tpMinute1.Enabled = true;

                }
               
                txtBatch.Text = logReader["BatchNumber"].ToString();
                txtVolume.Text = logReader["Volume"].ToString();  
                //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                txtEntryDate.Text =logReader["EntryDate"].ToString();

                if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                {
                    SetPageInEditMode("edit");
                    Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                 
                    rdlCorrectiveAction1.Visible = false;
                 
                    Lbl_CorrectiveAction1.Visible = true;
              

                }
                else
                {
                    SetPageInEditMode("new");
                    rdlCorrectiveAction1.Visible = true;
               
                    Lbl_CorrectiveAction1.Visible = false;
                
                    rdlCorrectiveAction1.DataBind();
              
                    for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                        {
                            rdlCorrectiveAction1.Items[i].Selected = true;
                            break;
                        }
                    }
                  
                }
                logReader.Close();
            }
            if (logReader.IsClosed == false)
            {
                logReader.Close();
            }
        }
        else
        {
            if (Request.QueryString["date"] != null)
            {
                ProcessGetShippingLog getShippingLog = new ProcessGetShippingLog();
                IDataReader logReader = getShippingLog.GetShippingLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()),(int)Session["KitchenId"]);
                if (logReader.Read())
                {
                    Session["ShippingLogId"] = int.Parse(logReader["Id"].ToString());
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    //if (logReader["FoodItem"].ToString() == "1")
                    //{
                    //    //ddlItem.DataSource = odsIngredient;
                    //    //ddlItem.DataBind();
                    //    //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                    //    rdbMenuItem.Checked = true;
                    //    rdbNoItem.Checked = false;
                    //    ddlMenuItem.Enabled = true;
                    //    //  rfvIngredient.Enabled = true;
                    //    // rfvMenuItem.Enabled = false;
                    //    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    //    ddlVendor.SelectedValue = logReader["CustomerId"].ToString();
                    //    //  ddlMenuItem.Enabled = false;

                    //}
                    if (logReader["FoodItem"].ToString() == "2")
                    {
                        //ddlItem.DataSource = odsMenuItem;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        //rfvMenuItem.Enabled = true;

                        ddlVendor.Enabled = true;
                       // rfvCustomer.Enabled = true;

                        ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                        ddlVendor.SelectedValue = logReader["CustomerId"].ToString();
                    }
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        ddlMenuItem.Enabled = false;
                        rdbMenuItem.Checked = false;
                        ddlVendor.Enabled = false;
                       // rfvCustomer.Enabled = false;
                       // rfvMenuItem.Enabled = false;
                      //  rdbNoItem.Checked = true;
                    }
                   // ddlMenuItem.SelectedValue = logReader["IngredientId"].ToString();
                    //ddlVendor.SelectedValue = logReader["CustomerId"].ToString();
                  //  txtProduct.Text = logReader["ProductName"].ToString();
                  //  txtVendor.Text = logReader["Vendor"].ToString();
                    if (logReader["Temperature"].ToString() != "99999.00")
                    {
                        txtTemperature.Text = logReader["Temperature"].ToString();
                        this.ViewState["Temperature"] = logReader["Temperature"].ToString();
                    }
                    else
                    {
                        txtTemperature.Text = "";
                        this.ViewState["Temperature"] = "";
                    }
                    try
                    {
                        // tpTime.Text = DateTime.Parse(logReader["TempTime"].ToString()).ToShortTimeString();                        
                        strTime1 = DateTime.Parse(logReader["TempTime"].ToString()).ToShortTimeString();
                        SetTime(1, DateTime.Parse(strTime1));
                    }
                    catch (Exception ex)
                    {
                        if (ex.ToString().Contains("String was not recognized as a valid DateTime"))
                        {
                            //tpTime.Text = DateTime.Now.ToShortTimeString();
                            strTime1 = DateTime.Now.ToShortTimeString();
                            SetTime(1, DateTime.Parse(strTime1));
                        }
                    }
                    if (logReader["RemoveTemperatureCheck"].ToString() == "1")
                    {
                        chkTempRequired.Checked = true;
                        txtTemperature.Text = "";
                        txtTemperature.Enabled = false;
                        tpHour1.Text = "";
                        tpMinute1.Text = "";
                        tpTime1.Enabled = false;
                        tpMinute1.Enabled = false;
                        tpHour1.Enabled = false;

                    }
                    else if (logReader["RemoveTemperatureCheck"].ToString() == "0")
                    {
                        chkTempRequired.Checked = false;
                        txtTemperature.Enabled = true;
                        tpHour1.Enabled = true;
                        tpMinute1.Enabled = true;
                        tpTime1.Enabled = true;

                    }
                    txtBatch.Text = logReader["BatchNumber"].ToString();
                    txtVolume.Text = logReader["Volume"].ToString(); 
                    //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text =logReader["EntryDate"].ToString();
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");
                        Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();

                        rdlCorrectiveAction1.Visible = false;

                        Lbl_CorrectiveAction1.Visible = true;


                    }
                    else
                    {
                        SetPageInEditMode("new");
                        rdlCorrectiveAction1.Visible = true;

                        Lbl_CorrectiveAction1.Visible = false;

                        rdlCorrectiveAction1.DataBind();

                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                            {
                                rdlCorrectiveAction1.Items[i].Selected = true;
                                break;
                            }
                        }

                    }
                    logReader.Close();
                }
                else
                {
                    if (logReader.IsClosed == false)
                    {
                        logReader.Close();
                    }
                    mode = "new";
                    SetPage();
                }

            }
        }


    }
    private void SetPage()
    {
        if (mode == "new")
        {
            if (Request.QueryString["date"] != null)
            {
                cldMealDate.SelectedDate = DateTime.Parse(Request.QueryString["date"].ToString());
            }
            else
            {
                cldMealDate.SelectedDate = DateTime.Today;
            }
            chkTempRequired.Checked = false;
            SetPageInEditMode("new");
            txtTemperature.Text = "";
            //tpTime.Text = DateTime.Now.ToShortTimeString();  
            SetTime(1, DateTime.Now); 
       
        GetInitialData();
            txtBatch.Text = "";
            txtVolume.Text = "";
            ddlVendor.SelectedIndex = 0;
            //rdbMenuItem.Checked = false;
            rdbMenuItem.Checked = true;
         //   rdbNoItem.Checked = true;
            //ddlMenuItem.Enabled = false;
            ddlMenuItem.SelectedIndex = 0;
            ddlVendor.SelectedIndex = 0;
            ddlMenuItem.Enabled = true;
           // ddlVendor.Enabled = false;
            //rfvIngredient.Enabled = false;
            rfvMenuItem.Enabled = true;
            rfvCustomer.Enabled = true;
          //  ddlMenuItem.SelectedIndex = 0;
           // txtVendor.Text = "";
         //   txtProduct.Text = "";            
            //txtCorrectiveAction.Text = "";
          //  txtVerifiedBy.Text = Session["Initials"].ToString();
            txtVerifiedBy.Text = "";
           cldVerifiedDate.SelectedDate = DateTime.Today;
           txtEntryDate.Text = DateTime.Now.ToString();
           rdlCorrectiveAction1.SelectedIndex = -1;
           LogError.Text = "";
            cmdAdd.Visible = true;
            cmdCancel.Visible = true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;
            rdlCorrectiveAction1.DataBind();
            rdlCorrectiveAction1.Visible = true;

            Lbl_CorrectiveAction1.Visible = false;


        }
        if (mode == "edit")
        {
            SetPageInEditMode("edit");
            cmdAdd.Visible = false;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
        }
        grdHotHolding.DataBind();
        ddlMenuItem.DataBind();
        ddlMenuItem.Items.Insert(0, "Select Menu Item");
        ddlMenuItem.SelectedIndex = 0;
        ddlVendor.DataBind();
        ddlVendor.Items.Insert(0, " Select Customer");
        ddlVendor.SelectedIndex = 0;
        
        
       
        
    }
    private void SetPageInEditMode(string type)
    {
        if (type == "new")
        {
     
       
            txtVerifiedBy.Enabled = true;
            chkTempRequired.Enabled = true;
            if (chkTempRequired.Checked == true)
            {
                txtTemperature.Enabled = false;
                tpHour1.Enabled = false;
                tpMinute1.Enabled = false;
                tpTime1.Enabled = false;

            }
            else if (chkTempRequired.Checked == false)
            {
                txtTemperature.Enabled = true;
                tpHour1.Enabled = true;
                tpMinute1.Enabled = true;
                tpTime1.Enabled = true;
            }
           
            cldVerifiedDate.Enabled = true;
            cldMealDate.Enabled = true;
            rdbMenuItem.Enabled = true;
           // rdbNoItem.Enabled = true;
         
          
            LogError.Text = "";
            txtBatch.Enabled = true;
            txtVolume.Enabled = true;
            cmdAdd.Visible = false;
            cmdCancel.Visible = true;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
        }
        else if (type == "edit")
        {
            txtTemperature.Enabled = false;
       
            txtVerifiedBy.Enabled = false;
            chkTempRequired.Enabled = false;
            tpHour1.Enabled = false;
            tpMinute1.Enabled = false;
            tpTime1.Enabled = false;
            cldVerifiedDate.Enabled = false;
            cldMealDate.Enabled = false;
            rdbMenuItem.Enabled = false;
          //  rdbNoItem.Enabled = false;
            txtBatch.Enabled = false;
            txtVolume.Enabled = false;
     
    
            ddlMenuItem.Enabled = false;
            ddlVendor.Enabled = false;
            LogError.Text = "";
            cmdAdd.Visible = false;
            cmdCancel.Visible = true;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = false;
        }
    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        LogError.Text = "";
        if (Page.IsValid)
        {
            if (CheckPage(1))
            {
                mode = "new";
                InsertData();
                SetPage();
            }
        }
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        LogError.Text = "";
        if (Page.IsValid)
        {
            if (CheckPage(2))
            {
                mode = "new";
                SubmitData();
                SetPage();
            }
        }
    }
    private bool CheckPage(int nMode)
    {
   
        bool result = true;
        if (rdbMenuItem.Checked == true && ddlMenuItem.SelectedItem.Text == "Select Menu Item")
        {
            LogError.Text += "<br/>Please Select Menu Item";
            result = false;
        }
        if (rdbMenuItem.Checked == true && ddlVendor.SelectedItem.Text == "Select Customer")
        {
            LogError.Text += "<br/>Please Select Customer";
            result = false;
        }
        if (tpHour1.Text != "")
        {
            if (cldMealDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
            {
                if (DateTime.Parse(GetTime(1)) > DateTime.Now)
                {
                    LogError.Text += " <br />Please enter correct time in ‘Temp 1 time’ field";
                    result = false;

                }
            }
        }

      
        if (result == false)
        {
            return result;
        }
        if (Page.IsValid)
        {
            result = EnableDisableTemp_Add(nMode);

        }
        else
        {
            result = false;
        }
        return result;
    }
    private bool EnableDisableTemp_Add(int mode)
    {
        bool result = true; ;
        if (chkTempRequired.Checked == false)
        {
            //if (rdbNoItem.Checked == true && rdbMenuItem.Checked == false)
            //{
            //    result = true;
            //}
            if (rdbMenuItem.Checked == true)
            {
                if (mode == 1)
                {
                    if (txtTemperature.Text == "")
                    {
                        LogError.Text += "<br/>Please fill Temperature field";
                        result = false;
                    }
                    if (tpHour1.Text == "")
                    {
                        LogError.Text += "<br/>Please fill Temperatur Time field";
                        result = false;
                    }


                }
                else if (mode == 2)
                {

                    if (txtTemperature.Text == this.ViewState["Temperature"].ToString())
                    {
                        if (txtTemperature.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Temperature field ";
                            result = false;
                        }
                        if (tpHour1.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Temperatur Time field";
                            result = false;
                        }

                    }
                    else if (txtTemperature.Text != this.ViewState["Temperature"].ToString())
                    {
                        if (txtTemperature.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Temperature field </ br>";
                            result = false;
                        }
                        if (tpHour1.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Temperatur Time field";
                            result = false;
                        }
                    }

                }
            }
        }

        return result;

    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        mode = "new";
        RemoveData();
        SetPage();
        CustomValidator2.IsValid = true;
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        mode = "new";
        SetPage();
        CustomValidator2.IsValid = true;

    }
    protected void cmdAddNew_Click(object sender, EventArgs e)
    {
        mode = "new";
       // ddlMenuItem.DataBind();
        SetPage();
    }
    private void InsertData()
    {
        ShippingLog shippingLog = new ShippingLog();
        shippingLog.MealDate = cldMealDate.SelectedDate;
        if (txtTemperature.Text != "")
        {
            shippingLog.Temperature = float.Parse(txtTemperature.Text);
        }
        if (tpHour1.Text != "")
        {
            shippingLog.TempTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            shippingLog.TempTime = DateTime.Now;

        }

        if (chkTempRequired.Checked == false)
        {
            shippingLog.TempRequired = 0;
        }
        else if (chkTempRequired.Checked == true)
        {
            shippingLog.TempRequired = 1;
        }
        if (rdbMenuItem.Checked == true)
        {
            shippingLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
            shippingLog.IngredientId = 0;
            shippingLog.FoodItem = 2;
            shippingLog.VendorId = int.Parse(ddlVendor.SelectedValue);
        }
        //if (rdbMenuItem.Checked == true)
        //{
        //    shippingLog.IngredientId = 0;
        //    shippingLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
        //    shippingLog.FoodItem = 2;
        //    shippingLog.VendorId = 0;
        //}
        //if (rdbNoItem.Checked == true)
        //{
        //    shippingLog.IngredientId = 0;
        //    shippingLog.MenuItemId = 0;
        //    shippingLog.FoodItem = 3;
        //    shippingLog.VendorId = 0;
        //}
        // shippingLog.IngredientId = int.Parse(ddlMenuItem.SelectedValue);

        //  shippingLog.ProductName = txtProduct.Text;
        //   shippingLog.Vendor = txtVendor.Text;
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    shippingLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    shippingLog.CorrectiveAction = null;
        //}
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            shippingLog.CorrectiveAction1 = 0;
        }
        else
        {
            shippingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        shippingLog.VerifiedBy = txtVerifiedBy.Text;
        shippingLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        shippingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        shippingLog.BatchNumber = txtBatch.Text;
        shippingLog.Volume = txtVolume.Text;
        if (Session["KitchenId"] != null)
        {
            shippingLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            shippingLog.UserName = (string)Session["UserName"];
        }
        if ((int)Session["MobileId"] != null)
        {
            shippingLog.MobileId = (int)Session["MobileId"];
        }
        ProcessCreateShippingLog createShippingLog = new ProcessCreateShippingLog();
        createShippingLog.ShippingLog = shippingLog;
        createShippingLog.Invoke();

    }
    private void SubmitData()
    {
        ShippingLog shippingLog = new ShippingLog();
        if (Request.QueryString["Id"] != null)
        {
            shippingLog.ShippingLogId = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["ShippingLogId"] != null)
            {
                shippingLog.ShippingLogId = (int)Session["ShippingLogId"];
            }
        }

        shippingLog.MealDate = cldMealDate.SelectedDate;
        if (txtTemperature.Text != "")
        {
            shippingLog.Temperature = float.Parse(txtTemperature.Text);
        }

        if (tpHour1.Text != "")
        {
            shippingLog.TempTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            shippingLog.TempTime = DateTime.Now;

        }
        if (chkTempRequired.Checked == false)
        {
            shippingLog.TempRequired = 0;
        }
        else if (chkTempRequired.Checked == true)
        {
            shippingLog.TempRequired = 1;
        }
        //if (rdbMenuItem.Checked == true)
        //{
        //    shippingLog.IngredientId = int.Parse(ddlMenuItem.SelectedValue);
        //    shippingLog.MenuItemId = 0;
        //    shippingLog.FoodItem = 1;
        //    shippingLog.VendorId = int.Parse(ddlVendor.SelectedValue);
        //}
        if (rdbMenuItem.Checked == true)
        {
            shippingLog.IngredientId = 0;
            shippingLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
            shippingLog.FoodItem = 2;

            shippingLog.VendorId = int.Parse(ddlVendor.SelectedValue);
        }
        //if (rdbNoItem.Checked == true)
        //{
        //    shippingLog.IngredientId = 0;
        //    shippingLog.MenuItemId = 0;
        //    shippingLog.FoodItem = 3;
        //    shippingLog.VendorId = 0;
        //}
        //shippingLog.IngredientId = int.Parse(ddlMenuItem.SelectedValue);

        //  shippingLog.ProductName = txtProduct.Text;
        //   shippingLog.Vendor = txtVendor.Text;
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    shippingLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    shippingLog.CorrectiveAction = null;
        //}
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            shippingLog.CorrectiveAction1 = 0;
        }
        else
        {
            shippingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        shippingLog.VerifiedBy = txtVerifiedBy.Text;
        shippingLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        shippingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            shippingLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            shippingLog.UserName = (string)Session["UserName"];
        }
        if (Session["MobileId"] != null)
        {
            shippingLog.MobileId = (int)Session["MobileId"];
        }
        shippingLog.BatchNumber = txtBatch.Text;
        shippingLog.Volume = txtVolume.Text;
        ProcessSetShippingLog setShippingLog = new ProcessSetShippingLog();
        setShippingLog.ShippingLog = shippingLog;
        setShippingLog.Invoke();


    }
    private void RemoveData()
    {
        ShippingLog shippingLog = new ShippingLog();
        shippingLog.ShippingLogId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteShippingLog removeShippingLog = new ProcessDeleteShippingLog();
        removeShippingLog.ShippingLog = shippingLog;
        removeShippingLog.Invoke();

    }
    protected void cmdAddNew_Click1(object sender, ImageClickEventArgs e)
    {
        mode = "new";
        SetPage();
    }
    protected void chkTempRequired_CheckedChanged(object sender, EventArgs e)
    {
        if (chkTempRequired.Checked == true)
        {
            txtTemperature.Text = "";
            //tpTime.Text = "";
            txtTemperature.Enabled = false;
            tpHour1.Enabled = false;
            tpMinute1.Enabled = false;
            tpTime1.Enabled = false;
            tpMinute1.Text = "";
            tpHour1.Text = "";
        }
        else
        {
            txtTemperature.Enabled = true;
            tpHour1.Enabled = true;
            tpMinute1.Enabled = true;
            tpTime1.Enabled = true;
            SetTime(1, DateTime.Now);

        }

    }
    protected void ddlMenuItem_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Ingredients ingredient = new Ingredients();
        ingredient.IngredientID = int.Parse(ddlMenuItem.SelectedValue);
        ProcessGetIngredient getIngredient = new ProcessGetIngredient();
        getIngredient.Ingredient = ingredient;
        getIngredient.Invoke();
        IDataReader drIngredient = getIngredient.ResultSet;
        if (drIngredient.Read())
        {
            ddlVendor.SelectedValue = drIngredient["CustomerId"].ToString();
            drIngredient.Close();
        }
        if (drIngredient.IsClosed == false)
        {
            drIngredient.Close();
        }
    }
    protected void ValidateTemp1(object source, ServerValidateEventArgs args)
    {
        if (chkTempRequired.Checked == false)
        {
            int nResult = 0;
            //if (rdbNoItem.Checked == false)
            //{

                if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
                {

                    if (txtTemperature.Text != "")
                    {
                        if (float.Parse(txtTemperature.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemperature.Text) > float.Parse(hfTempHigh.Value))
                        {
                            for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction1.Items[i].Selected == true)
                                {
                                    nResult = 1;
                                    break;
                                }
                            }
                            if (nResult == 0)
                            {
                                args.IsValid = false;
                            }
                        }
                    }
                }
            //}
        }
    }
    private string GetTime(int nPeriod)
    {
        return tpHour1.Text + ":" + tpMinute1.Text + tpTime1.SelectedValue;
    }
    private void SetTime(int nPeriod, DateTime dtTime)
    {
        if (nPeriod == 1)
        {
            //tpHour1.Text = (((dtTime.Hour + 11) % 12) + 1).ToString();
            tpHour1.Text = dtTime.ToString("hh");
            tpMinute1.Text = dtTime.ToString("mm");
            tpTime1.Text = dtTime.ToString("tt");
        }

    }
    //protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    if (hfTempHigh.Value != "NA" || txtTemperature.Text != "")
    //    {
    //        if (float.Parse(txtTemperature.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemperature.Text) > float.Parse(hfTempHigh.Value) && txtCorrectiveAction.Text == "")
    //        {
    //            args.IsValid = false;
    //        }
    //        else
    //        {
    //            args.IsValid = true;
    //        }
    //    }
    //}
    //protected void cmdClear_Click(object sender, EventArgs e)
    //{
    //    rdlCorrectiveAction1.ClearSelection();
    //}
}


