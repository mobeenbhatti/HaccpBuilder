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

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class TemperatureLogN : System.Web.UI.Page
    {
        public string mode = "new";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();

                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                chkClear2.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction2.ClientID + "')");
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

                if (rdbIngredient.Checked)
                {
                    ddlIngredient.Enabled = true;
                    ddlMenuItem.Enabled = false;

                }
                if (rdbNoItem.Checked == true)
                {
                    ddlIngredient.Enabled = false;
                    ddlMenuItem.Enabled = false;
                }
                if (rdbMenuItem.Checked == true)
                {
                    ddlIngredient.Enabled = false;
                    ddlMenuItem.Enabled = true;
                }
            }

        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            SetTime(3, DateTime.Now);
            //tpTime1.SelectedTime = DateTime.Now;
            //tpTime2.SelectedTime = DateTime.Now;        
            cldVerifiedDate.Text = DateTime.Today.ToShortDateString();
            txtEntryDate.Text = DateTime.Now.ToString();
            //-------------------------------
            // CHANGE AT 01-18-10
            //-------------------------------
            //if ((int)Session["TypeId"] != 1)
            //{
            //    ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            //    ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
            //    //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 1);
            //    DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId((int)Session["KitchenId"], 1);
            //    if (dsTemperature.Tables[0].Rows.Count > 0)
            //    {
            //        hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["QCLTempHigh"].ToString();
            //        hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["QCLTempLow"].ToString();
            //    }
            //}
            //else
            //{
            //    hfTempHigh.Value = "NA";
            //    hfTempLow.Value = "NA";
            //}
            //if ((int)Session["TypeId"] != 1)
            //{
            //    ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            //    DataSet dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 6);
            //    if (dsTemperature.Tables[0].Rows.Count > 0)
            //    {
            //        hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["TempMax"].ToString();
            //        hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["TempMin"].ToString();
            //        if (hfTempHigh.Value == "0.00" || hfTempLow.Value == "0.00")
            //        {
            //            CustomValidator1.Enabled = false;
            //            CustomValidator2.Enabled = false;
            //        }
            //    }
            //}
            //else
            //{
            //    hfTempHigh.Value = "NA";
            //    hfTempLow.Value = "NA";
            //}
            //--------- END 01/18/10--------------------

            // ---------- MAP Meal DATE WITH MEAL SERVING CALENDAR ---------------

            //cldMealDate.SelectedDate = DateTime.Today;
            //ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
            //DataSet dsFoodItem = menuItems.GetMenuItemsDataSet((int)Session["KitchenId"]);
            //ddlFoodItem.Items.Add("Select Value");
            //foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
            //{
            //    // For new table design
            //    ListItem foodItem = new ListItem();
            //    foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    foodItem.Value = drFoodItem["Id"].ToString();            
            //    ddlFoodItem.Items.Add(foodItem);

            //    //foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    //foodItem.Value = drFoodItem["CustomItem"] + "-" + drFoodItem["Id"].ToString();   
            //}
            //ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
            //DataSet dsFoodItem = menuItems.GetMealServingDates((int)Session["KitchenId"]);
            //ddlMealDate.Items.Add("Select Date");
            //foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
            //{
            //    ListItem dateSelected = new ListItem();
            //    dateSelected.Text = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    dateSelected.Value = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    ddlMealDate.Items.Add(dateSelected);

            //}

        }
        private void GetData()
        {
            //string strCustom;
            string strDate, strTime1, strTime2;
            if (Request.QueryString["Id"] != null)
            {
                TemperatureLog TemperatureLog = new TemperatureLog();
                TemperatureLog.TemperatureLogId = int.Parse(Request.QueryString["Id"]);
                ProcessGetTemperatureLog getTemperatureLog = new ProcessGetTemperatureLog();
                getTemperatureLog.TemperatureLog = TemperatureLog;
                getTemperatureLog.Invoke();

                IDataReader logReader = getTemperatureLog.ResultSet;
                if (logReader.Read())
                {
                    strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                    //strMenuItem = logReader["ItemName"].ToString();
                    //strMenuItemId = logReader["ItemId"].ToString();
                    //strItemId = logReader["FoodItem"].ToString();
                    //if (CheckDate(strDate) > 0)
                    //{
                    //    //cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    //    ddlMealDate.SelectedValue = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                    //    // For New Table Design
                    //    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                    //    SetFoodItemDropDown(logReader["FoodItem"].ToString());
                    //}
                    //else
                    //{
                    //    SetEditableMode(strDate, strMenuItem, strMenuItemId, strItemId);
                    //}
                    //if (int.Parse(logReader["IsCustomItem"].ToString()) == 0)
                    //{
                    //    strCustom = "No-";
                    //    ddlFoodItem.SelectedValue = "No-" + logReader["FoodItem"].ToString();
                    //}
                    //else
                    //{
                    //    strCustom = "Yes-";
                    //    ddlFoodItem.SelectedValue = "Yes-" + logReader["FoodItem"].ToString();
                    //}   
                    cldEntryDate.Text = strDate;
                    if (logReader["FoodItem"].ToString() == "1")
                    {
                        //ddlItem.DataSource = odsIngredient;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                        rdbIngredient.Checked = true;
                        rdbNoItem.Checked = false;
                        ddlIngredient.Enabled = true;
                        //rfvIngredient.Enabled = true;
                        rdbNoItem.Checked = false;
                        // rfvMenuItem.Enabled = false;
                        ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                        ddlMenuItem.Enabled = false;
                        if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                        {

                            ProcessGetTemperatureLog getCorrectiveActions = new ProcessGetTemperatureLog();
                            SetCorrectiveAction(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                            SetCriticalLimit(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                            Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                            Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                            rdlCorrectiveAction1.Visible = false;
                            rdlCorrectiveAction2.Visible = false;
                            Lbl_CorrectiveAction1.Visible = true;
                            Lbl_CorrectiveAction2.Visible = true;

                        }
                        else
                        {

                            rdlCorrectiveAction1.Visible = true;
                            rdlCorrectiveAction2.Visible = true;
                            Lbl_CorrectiveAction1.Visible = false;
                            Lbl_CorrectiveAction2.Visible = false;
                            ProcessGetTemperatureLog getCorrectiveActions = new ProcessGetTemperatureLog();
                            SetCorrectiveAction(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                            SetCriticalLimit(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                            for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                                {
                                    rdlCorrectiveAction1.Items[i].Selected = true;
                                    break;
                                }
                            }
                            for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveAction2"].ToString())
                                {
                                    rdlCorrectiveAction2.Items[i].Selected = true;
                                    break;
                                }
                            }
                        }



                    }
                    if (logReader["FoodItem"].ToString() == "2")
                    {
                        //ddlItem.DataSource = odsMenuItem;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        rdbNoItem.Checked = false;
                        rfvIngredient.Enabled = false;
                        //  rfvMenuItem.Enabled = true;
                        ddlIngredient.Enabled = false;
                        ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    }
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        rdbMenuItem.Checked = false; ;
                        ddlMenuItem.Enabled = false;
                        // rfvIngredient.Enabled = false;
                        //   rfvMenuItem.Enabled = false;
                        ddlIngredient.Enabled = false;
                        rdbNoItem.Checked = true;
                        rdbIngredient.Checked = false;
                    }
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");
                    }
                    else
                    {
                        SetPageInEditMode("new");
                    }
                    if (logReader["Internaltemp1"].ToString() != "99999.00")
                    {
                        txtTemp1.Text = logReader["Internaltemp1"].ToString();
                        this.ViewState["Temp1"] = logReader["Internaltemp1"].ToString();
                    }
                    else
                    {
                        txtTemp1.Text = "";
                        this.ViewState["Temp1"] = "";
                    }

                    //tpTime1.SelectedTime = DateTime.Parse(logReader["Temp1Time"].ToString());
                    //tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                    if (logReader["Internaltemp2"].ToString() != "99999.00")
                    {
                        txtTemp2.Text = logReader["InternalTemp2"].ToString();
                    }
                    else
                    {
                        txtTemp2.Text = "";
                    }
                    //tpTime2.SelectedTime = DateTime.Parse(logReader["Temp2Time"].ToString());
                    //tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString(); 
                    strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                    SetTime(2, DateTime.Parse(strTime2));
                    //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtBatchNo.Text = logReader["BatchNo"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.Text = logReader["VerifiedDate"].ToString();
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
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
                    ProcessGetTemperatureLog getTemperatureLog = new ProcessGetTemperatureLog();
                    IDataReader logReader = getTemperatureLog.GetTemperatureLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), (int)Session["KitchenId"]);
                    if (logReader.Read())
                    {
                        Session["TemperatureLogId"] = int.Parse(logReader["Id"].ToString());
                        strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                        //strMenuItem = logReader["ItemName"].ToString();
                        //strMenuItemId = logReader["ItemId"].ToString();
                        //strItemId = logReader["FoodItem"].ToString();
                        //if (CheckDate(strDate) > 0)
                        //{
                        //    //cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                        //    ddlMealDate.SelectedValue = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                        //    // For New Table Design
                        //    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                        //    SetFoodItemDropDown(logReader["FoodItem"].ToString());
                        //}
                        //else
                        //{
                        //    SetEditableMode(strDate, strMenuItem, strMenuItemId, strItemId);
                        //}
                        //if (int.Parse(logReader["IsCustomItem"].ToString()) == 0)
                        //{
                        //    strCustom = "No-";
                        //    ddlFoodItem.SelectedValue = "No-" + logReader["FoodItem"].ToString();
                        //}
                        //else
                        //{
                        //    strCustom = "Yes-";
                        //    ddlFoodItem.SelectedValue = "Yes-" + logReader["FoodItem"].ToString();
                        //}  
                        cldEntryDate.Text = strDate;
                        if (logReader["FoodItem"].ToString() == "1")
                        {
                            //ddlItem.DataSource = odsIngredient;
                            //ddlItem.DataBind();
                            //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                            rdbIngredient.Checked = true;
                            rdbMenuItem.Checked = false;
                            rdbNoItem.Checked = false;
                            ddlIngredient.Enabled = true;
                            //rfvIngredient.Enabled = true;
                            rdbNoItem.Checked = false;
                            // rfvMenuItem.Enabled = false;
                            ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                            ddlMenuItem.Enabled = false;
                            if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                            {

                                ProcessGetTemperatureLog getCorrectiveActions = new ProcessGetTemperatureLog();
                                SetCorrectiveAction(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                                SetCriticalLimit(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                                Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                                Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                                rdlCorrectiveAction1.Visible = false;
                                rdlCorrectiveAction2.Visible = false;
                                Lbl_CorrectiveAction1.Visible = true;
                                Lbl_CorrectiveAction2.Visible = true;

                            }
                            else
                            {
                                rdlCorrectiveAction1.Visible = true;
                                rdlCorrectiveAction2.Visible = true;
                                Lbl_CorrectiveAction1.Visible = false;
                                Lbl_CorrectiveAction2.Visible = false;
                                ProcessGetTemperatureLog getCorrectiveActions = new ProcessGetTemperatureLog();
                                SetCorrectiveAction(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                                SetCriticalLimit(getCorrectiveActions, int.Parse(logReader["IngredientID"].ToString()));
                                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                                {
                                    if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                                    {
                                        rdlCorrectiveAction1.Items[i].Selected = true;
                                        break;
                                    }
                                }
                                for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                                {
                                    if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveAction2"].ToString())
                                    {
                                        rdlCorrectiveAction2.Items[i].Selected = true;
                                        break;
                                    }
                                }
                            }



                        }
                        if (logReader["FoodItem"].ToString() == "2")
                        {
                            //ddlItem.DataSource = odsMenuItem;
                            //ddlItem.DataBind();
                            //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                            rdbMenuItem.Checked = true;
                            ddlMenuItem.Enabled = true;
                            rdbNoItem.Checked = false;
                            rfvIngredient.Enabled = false;
                            //  rfvMenuItem.Enabled = true;
                            ddlIngredient.Enabled = false;
                            ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                        }
                        if (logReader["FoodItem"].ToString() == "3")
                        {
                            rdbMenuItem.Checked = false; ;
                            ddlMenuItem.Enabled = false;
                            // rfvIngredient.Enabled = false;
                            //   rfvMenuItem.Enabled = false;
                            ddlIngredient.Enabled = false;
                            rdbNoItem.Checked = true;
                            rdbIngredient.Checked = false;
                        }
                        if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                        {
                            SetPageInEditMode("edit");
                        }
                        else
                        {
                            SetPageInEditMode("new");
                        }
                        txtTemp1.Text = logReader["Internaltemp1"].ToString();
                        this.ViewState["Temp1"] = logReader["Internaltemp1"].ToString();
                        //tpTime1.SelectedTime = DateTime.Parse(logReader["Temp1Time"].ToString());   
                        //tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                        strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                        SetTime(1, DateTime.Parse(strTime1));
                        txtTemp2.Text = logReader["InternalTemp2"].ToString();
                        //tpTime2.SelectedTime = DateTime.Parse(logReader["Temp2Time"].ToString()); 
                        //tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                        strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                        SetTime(2, DateTime.Parse(strTime2));
                        //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();                    
                        txtBatchNo.Text = logReader["BatchNo"].ToString();
                        txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                        cldVerifiedDate.Text = logReader["VerifiedDate"].ToString();
                        txtEntryDate.Text = logReader["EntryDate"].ToString();
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
                SetPageInEditMode("new");
                //if (Request.QueryString["date"] != null)
                //{
                //    //cldMealDate.SelectedDate = DateTime.Parse(Request.QueryString["date"].ToString());
                //    if (CheckDate(Request.QueryString["date"]) > 0)
                //    {
                //        ddlMealDate.SelectedValue = Request.QueryString["date"].ToString();
                //        SetFoodItemDropDown("");
                //    }
                //}

                // ddlFoodItem.SelectedIndex = 0;
                txtTemp1.Text = "";
                //tpTime1.SelectedTime = DateTime.Now;
                //tpTime2.SelectedTime = DateTime.Now;          
                //tpTime1.Text = DateTime.Now.ToShortTimeString();
                //tpTime2.Text = DateTime.Now.ToShortTimeString();
                SetTime(3, DateTime.Now);
                txtTemp2.Text = "";
                //txtCorrectiveAction.Text = "";
                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
                txtBatchNo.Text = "";
                //txtVerifiedBy.Text = Session["Initials"].ToString();  
                txtVerifiedBy.Text = "";
                cldVerifiedDate.Text = DateTime.Today.ToShortDateString();
                cldEntryDate.Text = DateTime.Today.ToShortDateString();
                rdbMenuItem.Checked = false;
                rdbIngredient.Checked = false;
                rdbNoItem.Checked = true;
                ddlMenuItem.Enabled = false;
                ddlMenuItem.SelectedIndex = 0;
                ddlIngredient.SelectedIndex = 0;
                ddlIngredient.Enabled = false;
                rfvIngredient.Enabled = false;
                rfvMenuItem.Enabled = false;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                lblError.Visible = false;
                RemoveCorrectiveActions();
                CustomValidator1.IsValid = true;
                CustomValidator2.IsValid = true;
                hfTempHigh.Value = "";
                hfTempLow.Value = "";
                LogError.Text = "";
                //while (ddlFoodItem.Items.Count >= 1)
                //{
                //    ListItem item = ddlFoodItem.Items[0];
                //    ddlFoodItem.Items.Remove(item);
                //}
                //while (ddlMealDate.Items.Count >= 1)
                //{
                //    ListItem item = ddlMealDate.Items[0];
                //    ddlMealDate.Items.Remove(item);
                //}
                GetInitialData();

                rdlCorrectiveAction1.DataBind();
                rdlCorrectiveAction2.DataBind();
                rdlCorrectiveAction1.Visible = true;
                rdlCorrectiveAction2.Visible = true;
                Lbl_CorrectiveAction1.Visible = false;
                Lbl_CorrectiveAction2.Visible = false;
            }
            if (mode == "edit")
            {
                SetPageInEditMode("edit");

            }
            grdHotHolding.DataBind();
            ddlIngredient.DataBind();
            ddlIngredient.Items.Insert(0, "Select Ingredient");
            ddlIngredient.SelectedIndex = 0;
            ddlMenuItem.DataBind();
            ddlMenuItem.Items.Insert(0, "Select Menu Item");
            ddlMenuItem.SelectedIndex = 0;

        }
        private void SetPageInEditMode(string type)
        {
            if (type == "new")
            {
                txtTemp1.Enabled = true;
                tempratureTime1.Enabled = true;
                tempratureTime2.Enabled = true;
                txtTemp2.Enabled = true;
                txtVerifiedBy.Enabled = true;
                cldVerifiedDate.Enabled = true;
                cldEntryDate.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
                rdbIngredient.Enabled = true;
                rdbMenuItem.Enabled = true;
                rdbNoItem.Enabled = true;
                txtBatchNo.Enabled = true;
                LogError.Text = "";
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;

            }
            else if (type == "edit")
            {
                txtVerifiedBy.Enabled = false;
                txtTemp1.Enabled = false;
                tempratureTime2.Enabled = false;
                tempratureTime1.Enabled = false;
                txtTemp2.Enabled = false;
                txtTemp2.Enabled = false;
                txtVerifiedBy.Enabled = false;
                cldVerifiedDate.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                trClearCorrectiveActions2.Style.Add("display", "none");
                cldEntryDate.Enabled = false;
                ddlIngredient.Enabled = false;
                rdbIngredient.Enabled = false;
                ddlMenuItem.Enabled = false;
                rdbMenuItem.Enabled = false;
                rdbNoItem.Enabled = false;
                txtBatchNo.Enabled = false;
                LogError.Text = "";
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = false;


            }
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            //mode = "new";
            //InsertData();
            //SetPage();
            LogError.Text = "";
            if (Page.IsValid)
            {
                if (CheckPage(1))
                {
                    mode = "new";
                    InsertData();
                    SetPage();
                    //}
                    //else
                    //{
                    //    lblError.Visible = true;
                    //    // lblError.Text = "Temperature is not in range with Food Category limit";
                }
            }

        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            //mode = "new";
            //SubmitData();
            //SetPage();
            LogError.Text = "";
            if (Page.IsValid)
            {
                if (CheckPage(2))
                {
                    //if (CheckData() == true)
                    //{
                    mode = "new";
                    SubmitData();
                    SetPage();
                    //}
                    //else
                    //{
                    //    lblError.Visible = true;
                    //    // lblError.Text = "Temperature is not in range with Food Category limit";
                    //}
                }
            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            mode = "new";
            RemoveData();
            SetPage();

        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            //ddlIngredient.DataBind();
            SetPage();
        }
        private void InsertData()
        {
            TemperatureLog temperatureLog = new TemperatureLog();
            //temperatureLog.MealDate = cldMealDate.SelectedDate;
            //temperatureLog.MealDate = DateTime.Parse(ddlMealDate.SelectedValue);
            // For New Table Design
            // temperatureLog.FoodItem = ddlFoodItem.SelectedValue;
            //string[] strItemType;
            //strItemType = ddlFoodItem.SelectedValue.Split('-');       
            //temperatureLog.FoodItem = strItemType[1];
            //if (strItemType[0] == "No")
            //{
            //    temperatureLog.IsCustomItem = 0;
            //}
            //else
            //{
            //    temperatureLog.IsCustomItem = 1;
            //}
            temperatureLog.MealDate = DateTime.Parse(cldEntryDate.Text);
            if (rdbIngredient.Checked == true)
            {
                temperatureLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                temperatureLog.MenuItemId = 0;
                temperatureLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                temperatureLog.IngredientId = 0;
                temperatureLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                temperatureLog.FoodItem = 2;
            }
            if (rdbNoItem.Checked == true)
            {
                temperatureLog.IngredientId = 0;
                temperatureLog.MenuItemId = 0;
                temperatureLog.FoodItem = 3;
            }
            if (txtTemp1.Text != "")
            {
                temperatureLog.InternalTemp1 = float.Parse(txtTemp1.Text);
            }
            //temperatureLog.Temp1Time = tpTime1.SelectedTime;
            if (tempratureTime1.Text != "")
            {
                temperatureLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                temperatureLog.Temp1Time = DateTime.Now;

            }
            if (txtTemp2.Text != "")
            {
                temperatureLog.InternalTemp2 = float.Parse(txtTemp2.Text);
            }
            //temperatureLog.Temp2Time = tpTime2.SelectedTime;
            if (tempratureTime2.Text != "")
            {
                temperatureLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {
                temperatureLog.Temp2Time = DateTime.Now;

            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                temperatureLog.CorrectiveAction1 = 0;
            }
            else
            {
                temperatureLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                temperatureLog.CorrectiveAction2 = 0;
            }
            else
            {
                temperatureLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            temperatureLog.BatchNo = txtBatchNo.Text;
            temperatureLog.VerifiedBy = txtVerifiedBy.Text;
            temperatureLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            temperatureLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                temperatureLog.KitchenId = (int)Session["KitchenId"];
            }
            if (Session["UserName"] != null)
            {
                temperatureLog.UserName = (string)Session["UserName"];
            }
            temperatureLog.MobileId = (int)Session["MobileId"];
            ProcessCreateTemperatureLog createTemperatureLog = new ProcessCreateTemperatureLog();
            createTemperatureLog.TemperatureLog = temperatureLog;
            createTemperatureLog.Invoke();

        }
        private void SubmitData()
        {
            TemperatureLog temperatureLog = new TemperatureLog();
            if (Request.QueryString["Id"] != null)
            {
                temperatureLog.TemperatureLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["TemperatureLogId"] != null)
                {
                    temperatureLog.TemperatureLogId = (int)Session["TemperatureLogId"];
                }
            }

            //temperatureLog.MealDate = cldMealDate.SelectedDate;
            // temperatureLog.MealDate = DateTime.Parse(ddlMealDate.SelectedValue);
            //string[] strItemType;
            //strItemType = ddlFoodItem.SelectedValue.Split('-');
            // For New Table Design
            // temperatureLog.FoodItem = ddlFoodItem.SelectedValue;
            //string[] strItemType;
            //strItemType = ddlFoodItem.SelectedValue.Split('-');       
            //temperatureLog.FoodItem = strItemType[1];
            //if (strItemType[0] == "No")
            //{
            //    temperatureLog.IsCustomItem = 0;
            //}
            //else
            //{
            //    temperatureLog.IsCustomItem = 1;
            //}
            temperatureLog.MealDate = DateTime.Parse(cldEntryDate.Text);
            if (rdbIngredient.Checked == true)
            {
                temperatureLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                temperatureLog.MenuItemId = 0;
                temperatureLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                temperatureLog.IngredientId = 0;
                temperatureLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                temperatureLog.FoodItem = 2;
            }
            if (rdbNoItem.Checked == true)
            {
                temperatureLog.IngredientId = 0;
                temperatureLog.MenuItemId = 0;
                temperatureLog.FoodItem = 3;
            }
            if (txtTemp1.Text != "")
            {
                temperatureLog.InternalTemp1 = float.Parse(txtTemp1.Text);
            }
            //temperatureLog.Temp1Time = tpTime1.SelectedTime;
            if (tempratureTime1.Text != "")
            {
                temperatureLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                temperatureLog.Temp1Time = DateTime.Now;

            }
            if (txtTemp2.Text != "")
            {
                temperatureLog.InternalTemp2 = float.Parse(txtTemp2.Text);
            }
            //temperatureLog.Temp2Time = tpTime2.SelectedTime;
            if (tempratureTime2.Text != "")
            {
                temperatureLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {
                temperatureLog.Temp2Time = DateTime.Now;

            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                temperatureLog.CorrectiveAction1 = 0;
            }
            else
            {
                temperatureLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                temperatureLog.CorrectiveAction2 = 0;
            }
            else
            {
                temperatureLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            temperatureLog.BatchNo = txtBatchNo.Text;
            temperatureLog.VerifiedBy = txtVerifiedBy.Text;
            temperatureLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            temperatureLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                temperatureLog.KitchenId = (int)Session["KitchenId"];
            }
            if (Session["UserName"] != null)
            {
                temperatureLog.UserName = (string)Session["UserName"];
            }
            temperatureLog.MobileId = (int)Session["MobileId"];
            ProcessSetTemperatureLog setTemperatureLog = new ProcessSetTemperatureLog();
            setTemperatureLog.TemperatureLog = temperatureLog;
            setTemperatureLog.Invoke();


        }
        private void RemoveData()
        {
            TemperatureLog temperatureLog = new TemperatureLog();
            temperatureLog.TemperatureLogId = int.Parse(Request.QueryString["Id"].ToString());
            ProcessDeleteTemperatureLog removeTemperatureLog = new ProcessDeleteTemperatureLog();
            removeTemperatureLog.TemperatureLog = temperatureLog;
            removeTemperatureLog.Invoke();

        }
        private bool CheckPage(int nMode)
        {

            bool result = true;
            if (rdbIngredient.Checked == true && ddlIngredient.SelectedItem.Text == "Select Ingredient")
            {
                LogError.Text += "<br/>Please Select Ingredient";
                result = false;
            }
            if (rdbMenuItem.Checked == true && ddlMenuItem.SelectedItem.Text == "Select Menu Item")
            {
                LogError.Text += "<br/>Please Select Select Menu Item";
                result = false;
            }
            if (tempratureTime1.Text != "")
            {
                if (DateTime.Parse(cldEntryDate.Text).ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(1)) > DateTime.Now)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 1 time’ field";
                        result = false;

                    }
                }
            }

            if (tempratureTime2.Text != "")
            {
                if (DateTime.Parse(cldEntryDate.Text).ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(2)) > DateTime.Now)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 2 time’ field";
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
            if (rdbNoItem.Checked == true && rdbIngredient.Checked == false)
            {
                result = true;
            }
            else if (rdbIngredient.Checked == true)
            {
                if (mode == 1)
                {
                    if (txtTemp1.Text == "")
                    {
                        LogError.Text += "<br/>Please fill Internal Temp 1 field";
                        result = false;
                    }
                    else
                    {
                        result = true;
                    }

                }
                else if (mode == 2)
                {
                    //  if (float.Parse(txtTemp1.Text) ==float.Parse(this.ViewState["Temp1"].ToString()))
                    if (txtTemp1.Text == this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Internal Temp 1 field ";
                            result = false;
                        }
                        if (txtTemp2.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Internal Temp 2 field. </ br>";
                            result = false;
                        }

                    }
                    // else if (float.Parse(txtTemp1.Text) !=float.Parse(this.ViewState["Temp1"].ToString()))
                    else if (txtTemp1.Text != this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br/>Please fill Internal Temp 1 field </ br>";
                            result = false;
                        }
                        else
                        {
                            result = true;
                        }
                    }

                }
            }
            return result;

        }
        private bool CheckData()
        {
            ProcessGetTemperatureLog getTemperatureLog = new ProcessGetTemperatureLog();
            int CCPLimit;
            if (rdbIngredient.Checked == true)
            {
                if (txtTemp1.Text != "" && txtTemp2.Text != "")
                {
                    IDataReader ResultSet = getTemperatureLog.CheckTempRange(int.Parse(ddlIngredient.SelectedValue));

                    if (ResultSet.Read() == true)
                    {
                        if (ResultSet["CCPLimit"].ToString() != "")
                        {
                            CCPLimit = int.Parse(ResultSet["CCPLimit"].ToString());
                            if (CCPLimit > 100)
                            {
                                if (float.Parse(txtTemp1.Text) >= CCPLimit && float.Parse(txtTemp2.Text) >= CCPLimit)
                                    return true;
                                else
                                {
                                    //txtCorrectiveAction.Text = getTemperatureLog.ResultSet["CorrectiveAction"].ToString();
                                    if (int.Parse(getTemperatureLog.ResultSet["CCPLimit"].ToString()) > 100)
                                    {
                                        lblError.Text = "Minimum Temperature should be" + getTemperatureLog.ResultSet["CCPLimit"].ToString();
                                    }
                                    else
                                    {
                                        lblError.Text = "Maximum Temperature should be" + getTemperatureLog.ResultSet["CCPLimit"].ToString();
                                    }
                                    return false;
                                }
                            }
                            else
                            {
                                if (float.Parse(txtTemp1.Text) <= CCPLimit && float.Parse(txtTemp2.Text) <= CCPLimit)
                                    return true;
                                else
                                {
                                    //txtCorrectiveAction.Text = getTemperatureLog.ResultSet["CorrectiveAction"].ToString();
                                    if (int.Parse(getTemperatureLog.ResultSet["CCPLimit"].ToString()) > 100)
                                    {
                                        lblError.Text = "Minimum Temperature should be" + getTemperatureLog.ResultSet["CCPLimit"].ToString();
                                    }
                                    else
                                    {
                                        lblError.Text = "Maximum Temperature should be" + getTemperatureLog.ResultSet["CCPLimit"].ToString();
                                    }
                                    return false;
                                }
                            }
                        }
                        ResultSet.Close();
                    }
                    else
                    {
                        if (ResultSet.IsClosed == false)
                        {
                            ResultSet.Close();
                        }
                        return false;
                    }
                    if (ResultSet.IsClosed == false)
                    {
                        ResultSet.Close();
                    }
                }


            }
            else
            {
                //if (rdbMenuItem.Checked == true)
                //{
                //   // if (getTemperatureLog(nItemId, txtTemp1.Text, 2) == true && getTemperatureLog.CheckTempRange(nItemId, txtTemp2.Text, 2))
                //        //{
                //        //    return true;
                //        //}    
                //        return true;
                //}


            }
            return true;
        }
        protected void ValidateTemp1(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            if (rdbNoItem.Checked != true)
            {
                if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
                {
                    if (txtTemp1.Text != "")
                    {
                        if (float.Parse(txtTemp1.Text) > float.Parse(hfTempHigh.Value))
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
                nResult = 0;
                if (hfTempLow.Value != "NA" && hfTempLow.Value != "")
                {
                    if (txtTemp1.Text != "")
                    {
                        if (float.Parse(txtTemp1.Text) < float.Parse(hfTempLow.Value))
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
            }
        }
        protected void ValidateTemp2(object source, ServerValidateEventArgs args)
        {
            if (rdbNoItem.Checked != true)
            {
                int nResult = 0;
                if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
                {
                    if (txtTemp2.Text != "")
                    {
                        if (float.Parse(txtTemp2.Text) > float.Parse(hfTempHigh.Value))
                        {
                            for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction2.Items[i].Selected == true)
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
                if (hfTempLow.Value != "NA" && hfTempLow.Value != "")
                {
                    if (txtTemp2.Text != "")
                    {
                        if (float.Parse(txtTemp2.Text) < float.Parse(hfTempLow.Value))
                        {
                            for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction2.Items[i].Selected == true)
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
            }
        }
        protected void ddlIngredient_SelectedIndexChanged(object sender, EventArgs e)
        {

            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetTemperatureLog getLimits = new ProcessGetTemperatureLog();
                //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 1);
                SetCorrectiveAction(getLimits);
                SetCriticalLimit(getLimits);
            }
            else
            {
                hfTempHigh.Value = "NA";
                hfTempLow.Value = "NA";
                Lbl_QCLMaxtempValue.Text = "NA";
                Lbl_QCLMintempValue.Text = "NA";
            }
        }
        private void SetCriticalLimit(ProcessGetTemperatureLog getLimits)
        {
            if (ddlIngredient.SelectedIndex > 0)
            {
                IDataReader drCriticalLimits = getLimits.GetCriticalLimits(int.Parse(ddlIngredient.SelectedValue));
                if (drCriticalLimits.Read())
                {
                    hfTempHigh.Value = drCriticalLimits["QCLTempHigh"].ToString() == "" ? "NA" : drCriticalLimits["QCLTempHigh"].ToString();
                    hfTempLow.Value = drCriticalLimits["QCLTempLow"].ToString() == "" ? "NA" : drCriticalLimits["QCLTempLow"].ToString();
                    Lbl_QCLMaxtempValue.Text = hfTempHigh.Value;
                    Lbl_QCLMintempValue.Text = hfTempLow.Value;
                    drCriticalLimits.Close();
                }
                else
                {
                    if (drCriticalLimits.IsClosed == false)
                    {
                        drCriticalLimits.Close();
                    }
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
        private void SetCorrectiveAction(ProcessGetTemperatureLog getLimits)
        {
            if (ddlIngredient.SelectedIndex > 0)
            {
                DataSet dsCorrectiveAction = getLimits.GetCorrectiveActions(int.Parse(ddlIngredient.SelectedValue));
                if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
                {
                    rdlCorrectiveAction1.DataSource = dsCorrectiveAction;
                    rdlCorrectiveAction1.DataBind();
                    rdlCorrectiveAction2.DataSource = dsCorrectiveAction;
                    rdlCorrectiveAction2.DataBind();
                }
            }
            else
            {
                RemoveCorrectiveActions();
            }

        }
        private void SetCorrectiveAction(ProcessGetTemperatureLog getLimits, int nIngredientId)
        {
            DataSet dsCorrectiveAction = getLimits.GetCorrectiveActions(nIngredientId);
            if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
            {
                rdlCorrectiveAction1.DataSource = dsCorrectiveAction;
                rdlCorrectiveAction1.DataBind();
                rdlCorrectiveAction2.DataSource = dsCorrectiveAction;
                rdlCorrectiveAction2.DataBind();
            }
            else
            {
                RemoveCorrectiveActions();
            }

        }
        private void SetCriticalLimit(ProcessGetTemperatureLog getLimits, int nIngredientId)
        {
            IDataReader drCriticalLimits = getLimits.GetCriticalLimits(nIngredientId);
            if (drCriticalLimits.Read())
            {
                hfTempHigh.Value = drCriticalLimits["QCLTempHigh"].ToString();
                hfTempLow.Value = drCriticalLimits["QCLTempLow"].ToString();
                Lbl_QCLMaxtempValue.Text = drCriticalLimits["QCLTempHigh"].ToString();
                Lbl_QCLMintempValue.Text = drCriticalLimits["QCLTempLow"].ToString();
                drCriticalLimits.Close();
            }
            else
            {
                if (drCriticalLimits.IsClosed == false)
                {
                    drCriticalLimits.Close();
                }
                hfTempHigh.Value = "NA";
                hfTempLow.Value = "NA";
                Lbl_QCLMaxtempValue.Text = "NA";
                Lbl_QCLMintempValue.Text = "NA";
            }
        }
        private void RemoveCorrectiveActions()
        {
            int nCount = rdlCorrectiveAction1.Items.Count;
            for (int i = 0; i < nCount; i++)
            {
                rdlCorrectiveAction1.Items.RemoveAt(0);
                rdlCorrectiveAction2.Items.RemoveAt(0);
            }
        }
        private string GetTime(int nPeriod)
        {
            if (nPeriod == 1)
            {
                return tempratureTime1.Text;
            }
            else
            {
                return tempratureTime2.Text;
            }
        }
        private void SetTime(int nPeriod, DateTime dtTime)
        {
            if (nPeriod == 1)
            {
                tempratureTime1.Text = dtTime.ToShortTimeString();
               
            }
            else if (nPeriod == 2)
            {
                tempratureTime2.Text = dtTime.ToShortTimeString();
            }
            else
            {
                tempratureTime1.Text = dtTime.ToShortTimeString();
                tempratureTime2.Text = dtTime.ToShortTimeString();
            }

        }
        //private void SetFoodItemDropDown(string strFoodItem)
        //{
        //    while (ddlFoodItem.Items.Count >= 1)
        //    {
        //        ListItem item = ddlFoodItem.Items[0];
        //        ddlFoodItem.Items.Remove(item);
        //    }

        //    ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
        //    DataSet dsFoodItem = menuItems.GetMealServingMenuItems(DateTime.Parse(ddlMealDate.SelectedValue), (int)Session["KitchenId"]);
        //    ListItem tempItem = new ListItem("No Food/Menu Item", "0");
        //    ddlFoodItem.Items.Add(tempItem);
        //    foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
        //    {
        //        ListItem foodItem = new ListItem();
        //        foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
        //        foodItem.Value = drFoodItem["Id"].ToString();
        //        ddlFoodItem.Items.Add(foodItem);

        //    }
        //    if (strFoodItem != "")
        //    {
        //        ddlFoodItem.SelectedValue = strFoodItem;
        //    }
        //}
        //private void SetEditableMode(string strDate, string strMenuItem, string strMenuItemId, string strItemId)
        //{
        //    ListItem foodItem = new ListItem();
        //    foodItem.Text = strMenuItemId + " " + strMenuItem;
        //    foodItem.Value = strItemId;

        //    ListItem MealDate = new ListItem();
        //    MealDate.Text = strDate;
        //    MealDate.Value = strDate;
        //    while (ddlFoodItem.Items.Count >= 1)
        //    {
        //        ListItem item = ddlFoodItem.Items[0];
        //        ddlFoodItem.Items.Remove(item);
        //    }
        //    while (ddlMealDate.Items.Count >= 1)
        //    {
        //        ListItem item = ddlMealDate.Items[0];
        //        ddlMealDate.Items.Remove(item);
        //    }
        //    ddlFoodItem.Items.Add(foodItem);
        //    ddlFoodItem.SelectedIndex = 0;
        //    ddlMealDate.Items.Add(MealDate);
        //    ddlMealDate.SelectedIndex = 0;

        //}
        //private int CheckDate(string strCheckDate)
        //{
        //    for (int i = 0; i < ddlMealDate.Items.Count; i++)
        //    {
        //        if (ddlMealDate.Items[i].Value == strCheckDate)
        //            return 1;
        //    }
        //    return 0;
        //}
    }
}