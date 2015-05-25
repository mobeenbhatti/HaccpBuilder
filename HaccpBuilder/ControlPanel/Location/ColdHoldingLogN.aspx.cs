using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Collections.Generic;
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
    public partial class ColdHoldingLogN : System.Web.UI.Page
    {
        public string mode = "new";
        protected DateTime currentTime = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                chkClear2.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction2.ClientID + "')");
                currentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]);
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
                if (rdbIngredient.Checked == true)
                {

                    ddlIngredient.Enabled = true;
                    ddlMenuItem.Enabled = false;
                }
                if (rdbMenuItem.Checked == true)
                {
                    ddlMenuItem.Enabled = true;
                    ddlIngredient.Enabled = false;
                }
                //if (rdbNoItem.Checked == true)
                //{
                //    ddlMenuItem.Enabled = false;
                //    ddlIngredient.Enabled = false;
                //}
            }


        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            //txtTime1.Text = DateTime.Now.ToShortTimeString();
            //txtTime2.Text = DateTime.Now.ToShortTimeString();
            //tpTime1.Text = DateTime.Now.ToShortTimeString();
            //tpTime2.Text = DateTime.Now.ToShortTimeString();
            SetTime(3, currentTime);
            cldEntryDate.Text = DateTime.Today.ToShortDateString();
            cldVerifiedDate.Text = DateTime.Today.ToShortDateString();
            txtEntryDate.Text = currentTime.ToString();
            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetKitchen getKitchen = new ProcessGetKitchen();
                ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
                //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 1);
                DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId((int)Session["KitchenId"], 1);
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
            //ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
            //DataSet dsFoodItem = menuItems.GetMealServingDates((int)Session["KitchenId"]);
            //ddlMealDate.Items.Add("Select Date");
            //foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
            //{
            //    //ListItem foodItem = new ListItem();
            //    //foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    //foodItem.Value = drFoodItem["Id"].ToString();

            //    ListItem dateSelected = new ListItem();
            //    dateSelected.Text = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    dateSelected.Value = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    ddlMealDate.Items.Add(dateSelected);

            //    // For new table design
            //    //foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    //foodItem.Value = drFoodItem["CustomItem"] + "-" + drFoodItem["Id"].ToString();           
            //    //ddlFoodItem.Items.Add(foodItem);
            //}

        }
        private void GetData()
        {
            // string strCustom;
            string strDate, strMenuItem, strMenuItemId, strItemId, strTime1, strTime2;
            if (Request.QueryString["Id"] != null)
            {
                ColdHoldingLog coldHoldingLog = new ColdHoldingLog();
                coldHoldingLog.ColdHoldingLogId = int.Parse(Request.QueryString["Id"]);
                ProcessGetColdHoldingLog getColdHoldingLog = new ProcessGetColdHoldingLog();
                getColdHoldingLog.ColdHoldingLog = coldHoldingLog;
                getColdHoldingLog.Invoke();

                IDataReader logReader = getColdHoldingLog.ResultSet;
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

                    // For New Table Design
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

                    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                    if (logReader["FoodItem"].ToString() == "1")
                    {
                        //ddlItem.DataSource = odsIngredient;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                        rdbIngredient.Checked = true;
                        ddlIngredient.Enabled = true;
                        //rdbNoItem.Checked = false;
                        //rfvIngredient.Enabled = true;

                        //rfvMenuItem.Enabled = false;
                        ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                        ddlMenuItem.Enabled = false;
                        rdbMenuItem.Checked = false;
                        rdbIngredient.Enabled = true;
                        rdbMenuItem.Enabled = false;
                        //rdbNoItem.Enabled = false;

                    }
                    if (logReader["FoodItem"].ToString() == "2")
                    {
                        //ddlItem.DataSource = odsMenuItem;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        //rfvIngredient.Enabled = false;
                        //rfvMenuItem.Enabled = true;
                        rdbIngredient.Checked = false;
                        //rdbNoItem.Checked = false;
                        ddlIngredient.Enabled = false;
                        rdbIngredient.Enabled = false;
                        rdbMenuItem.Enabled = true;
                        //rdbNoItem.Enabled = false;
                        ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    }
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        //  rdbMenuItem.Checked = false; ;
                        //  ddlMenuItem.Enabled = false;
                        //rfvIngredient.Enabled = false;
                        //rfvMenuItem.Enabled = false;
                        //  ddlIngredient.Enabled = false;
                        // rdbIngredient.Checked = false;
                        //rdbNoItem.Checked = true;
                        // rdbIngredient.Enabled = false;
                        // rdbMenuItem.Enabled = false;
                        //rdbNoItem.Enabled = true;
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


                    //tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                    //txtTime1.Text= logReader["Temp1Time"].ToString();
                    if (logReader["Internaltemp2"].ToString() != "99999.00")
                    {
                        txtTemp2.Text = logReader["InternalTemp2"].ToString();
                    }
                    else
                    {
                        txtTemp2.Text = "";
                    }

                    //tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                    strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                    SetTime(2, DateTime.Parse(strTime2));
                    //txtTime2.Text = logReader["Temp2Time"].ToString();
                    //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.Text = DateTime.Parse(logReader["VerifiedDate"].ToString()).ToShortDateString();
                    cldEntryDate.Text = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();


                    txtEntryDate.Text = logReader["EntryDate"].ToString();

                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");
                        Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                        Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                        rdlCorrectiveAction1.Visible = false;
                        rdlCorrectiveAction2.Visible = false;
                        Lbl_CorrectiveAction1.Visible = true;
                        Lbl_CorrectiveAction2.Visible = true;

                    }
                    else
                    {
                        SetPageInEditMode("new");
                        rdlCorrectiveAction1.Visible = true;
                        rdlCorrectiveAction2.Visible = true;
                        Lbl_CorrectiveAction1.Visible = false;
                        Lbl_CorrectiveAction2.Visible = false;
                        rdlCorrectiveAction1.DataBind();
                        rdlCorrectiveAction2.DataBind();
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
                    ProcessGetColdHoldingLog getColdHoldingLog = new ProcessGetColdHoldingLog();
                    IDataReader logReader = getColdHoldingLog.GetColdHoldingLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), (int)Session["KitchenId"]);
                    if (logReader.Read())
                    {
                        Session["ColdHoldingLogId"] = int.Parse(logReader["Id"].ToString());
                        strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                        //strMenuItem = logReader["ItemName"].ToString();
                        //strMenuItemId = logReader["ItemId"].ToString();
                        //strItemId = logReader["FoodItem"].ToString();
                        //if (CheckDate(strDate) > 0)
                        //{
                        //    //cldEntryDate.SelectedDate = DateTime.Parse(logReader["EntryDate"].ToString());
                        //    ddlMealDate.SelectedValue = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                        //    // For New Table Design
                        //    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                        //    SetFoodItemDropDown(logReader["FoodItem"].ToString());
                        //}
                        //else
                        //{
                        //    SetEditableMode(strDate, strMenuItem, strMenuItemId, strItemId);
                        //}

                        // For New Table Design
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


                        //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                        // ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                        cldEntryDate.Text = strDate;
                        if (logReader["FoodItem"].ToString() == "1")
                        {
                            //ddlItem.DataSource = odsIngredient;
                            //ddlItem.DataBind();
                            //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                            rdbIngredient.Checked = true;
                            ddlIngredient.Enabled = true;
                            //rdbNoItem.Checked = false;
                            //rfvIngredient.Enabled = true;

                            //rfvMenuItem.Enabled = false;
                            ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                            ddlMenuItem.Enabled = false;
                            rdbMenuItem.Checked = false;
                            rdbIngredient.Enabled = true;
                            rdbMenuItem.Enabled = false;
                            //rdbNoItem.Enabled = false;

                        }
                        if (logReader["FoodItem"].ToString() == "2")
                        {
                            //ddlItem.DataSource = odsMenuItem;
                            //ddlItem.DataBind();
                            //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                            rdbMenuItem.Checked = true;
                            ddlMenuItem.Enabled = true;
                            //rfvIngredient.Enabled = false;
                            //rfvMenuItem.Enabled = true;
                            rdbIngredient.Checked = false;
                            //rdbNoItem.Checked = false;
                            ddlIngredient.Enabled = false;
                            rdbIngredient.Enabled = false;
                            rdbMenuItem.Enabled = true;
                            //rdbNoItem.Enabled = false;
                            ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                        }
                        if (logReader["FoodItem"].ToString() == "3")
                        {
                            rdbMenuItem.Checked = false; ;
                            ddlMenuItem.Enabled = false;
                            //rfvIngredient.Enabled = false;
                            //rfvMenuItem.Enabled = false;
                            ddlIngredient.Enabled = false;
                            rdbIngredient.Checked = false;
                            //rdbNoItem.Checked = true;
                            rdbIngredient.Enabled = false;
                            rdbMenuItem.Enabled = false;
                            //rdbNoItem.Enabled = true;
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
                        //tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                        strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                        SetTime(1, DateTime.Parse(strTime1));
                        //txtTime1.Text= logReader["Temp1Time"].ToString();
                        if (logReader["Internaltemp2"].ToString() != "99999.00")
                        {
                            txtTemp2.Text = logReader["InternalTemp2"].ToString();
                        }
                        else
                        {
                            txtTemp2.Text = "";
                        }

                        //tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                        strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                        SetTime(2, DateTime.Parse(strTime2));
                        //txtTime2.Text = logReader["Temp2Time"].ToString();
                        //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                        txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                        cldVerifiedDate.Text = logReader["VerifiedDate"].ToString();
                        cldEntryDate.Text = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                        txtEntryDate.Text = logReader["EntryDate"].ToString();

                        if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                        {
                            SetPageInEditMode("edit");
                            Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                            Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                            rdlCorrectiveAction1.Visible = false;
                            rdlCorrectiveAction2.Visible = false;
                            Lbl_CorrectiveAction1.Visible = true;
                            Lbl_CorrectiveAction2.Visible = true;

                        }
                        else
                        {
                            SetPageInEditMode("new");
                            rdlCorrectiveAction1.DataBind();
                            rdlCorrectiveAction2.DataBind();
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
                //ddlFoodItem.SelectedIndex = 0;
                txtTemp1.Text = "";
                //tpTime1.Text = DateTime.Now.ToShortTimeString();
                //tpTime2.Text = DateTime.Now.ToShortTimeString();
                SetTime(3, currentTime);
                //txtTime1.Text = DateTime.Now.ToShortTimeString();
                txtTemp2.Text = "";
                //txtTime2.Text = DateTime.Now.ToShortTimeString();
                //txtCorrectiveAction.Text = "";
                //txtVerifiedBy.Text = Session["Initials"].ToString();
                txtVerifiedBy.Text = "";
                cldVerifiedDate.Text = DateTime.Today.ToShortDateString();
                cldEntryDate.Text = DateTime.Today.ToShortDateString();
                rdbMenuItem.Checked = false;
                rdbIngredient.Checked = true;

                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
                //rdbNoItem.Checked = true;
                ddlMenuItem.Enabled = false;
                GetInitialData();
                ddlIngredient.SelectedIndex = 0;
                ddlIngredient.Enabled = true;
                rfvIngredient.Enabled = true;
                rfvMenuItem.Enabled = false;
                rdlCorrectiveAction1.SelectedIndex = -1;
                rdlCorrectiveAction2.SelectedIndex = -1;


                LogError.Text = "";

                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
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

                if (Request.QueryString["date"] != null)
                {
                    cldEntryDate.Text = Request.QueryString["date"].ToString();
                    //if (CheckDate(Request.QueryString["date"]) > 0)
                    //{
                    //    ddlMealDate.SelectedValue = Request.QueryString["date"].ToString();
                    //    SetFoodItemDropDown("");
                    //}
                }
                //else
                //{
                //    //cldEntryDate.SelectedDate = DateTime.Today;
                //}
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
        //private void ddlIngredientBinding()
        //{
        //   ProcessGetIngredient 
        //}
        // Enable or disable web controls
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
                rdbMenuItem.Enabled = true;
                rdbIngredient.Enabled = true;
                //rdbNoItem.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
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
                tempratureTime1.Enabled = false;
                tempratureTime2.Enabled = false;
                txtTemp2.Enabled = false;
                txtVerifiedBy.Enabled = false;
                cldVerifiedDate.Enabled = false;
                cldEntryDate.Enabled = false;
                rdbMenuItem.Enabled = false;
                rdbIngredient.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                trClearCorrectiveActions2.Style.Add("display", "none");
                //rdbNoItem.Enabled = false;
                ddlMenuItem.Enabled = false;
                ddlIngredient.Enabled = false;
                LogError.Text = "";
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = false;

            }
        }

        // Enable or disable temperatue range check
        private bool EnableDisableTemp_Add(int mode)
        {
            bool result = true; ;
            //if (rdbNoItem.Checked == true && rdbIngredient.Checked == false && rdbMenuItem.Checked == false)
            //{

            //    result = true;
            //}
            if (rdbIngredient.Checked == true || rdbMenuItem.Checked == true)
            {


                if (mode == 1)
                {
                    if (txtTemp1.Text == "")
                    {
                        LogError.Text += " <br />Please fill Internal Temp 1 field";
                        result = false;
                    }


                }
                else if (mode == 2)
                {

                    // if (float.Parse(txtTemp1.Text) == float.Parse(this.ViewState["Temp1"].ToString()))
                    if (txtTemp1.Text == this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 1 field ";
                            result = false;
                        }

                        if (txtTemp2.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 2 field. </ br>";
                            result = false;
                        }


                    }
                    //  else if (float.Parse(txtTemp1.Text) != float.Parse(this.ViewState["Temp1"].ToString()))
                    else if (txtTemp1.Text != this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 1 field </ br>";
                            result = false;
                        }


                    }

                }
            }


            return result;

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
            currentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]);
            if (rdbIngredient.Checked == true && ddlIngredient.SelectedItem.Text == "Select Ingredient")
            {
                LogError.Text += "<br />Please Select Ingredient";
                result = false;
            }

            if (rdbMenuItem.Checked == true && ddlMenuItem.SelectedItem.Text == "Select Menu Item")
            {
                LogError.Text += "<br />Please Select Menu Item";
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

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            mode = "new";
            RemoveData();
            SetPage();
            CustomValidator1.IsValid = true;
            CustomValidator2.IsValid = true;
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
            CustomValidator1.IsValid = true;
            CustomValidator2.IsValid = true;

        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            //ddlIngredient.DataBind();
            //ddlMenuItem.DataBind();
            SetPage();

        }
        private void InsertData()
        {
            ColdHoldingLog coldHoldingLog = new ColdHoldingLog();
            //coldHoldingLog.EntryDate = cldEntryDate.SelectedDate;

            //coldHoldingLog.FoodItem = int.Parse(ddlFoodItem.SelectedValue);
            //if (ddlFoodItem.SelectedValue == "1")
            coldHoldingLog.MealDate = DateTime.Parse(cldEntryDate.Text);
            if (rdbIngredient.Checked == true)
            {
                coldHoldingLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                coldHoldingLog.MenuItemId = 0;
                coldHoldingLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                coldHoldingLog.IngredientId = 0;
                coldHoldingLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                coldHoldingLog.FoodItem = 2;
            }
            //if (rdbNoItem.Checked == true)
            //{
            //    coldHoldingLog.IngredientId = 0;
            //    coldHoldingLog.MenuItemId = 0;
            //    coldHoldingLog.FoodItem = 3;
            //}


            // For New Table Design
            //string[] strItemType;
            //strItemType = ddlFoodItem.SelectedValue.Split('-');       
            //coldHoldingLog.FoodItem = strItemType[1];
            //if (strItemType[0] == "No")
            //{
            //    coldHoldingLog.IsCustomItem = 0;
            //}
            //else
            //{
            //    coldHoldingLog.IsCustomItem = 1;
            //}
            if (txtTemp1.Text != "")
            {
                coldHoldingLog.InternalTemp1 = float.Parse(txtTemp1.Text);
            }
            if (tempratureTime1.Text != "")
            {
                //coldHoldingLog.Temp1Time = DateTime.Parse(tpTime1.Text);
                coldHoldingLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                coldHoldingLog.Temp1Time = DateTime.Now;

            }
            if (txtTemp2.Text != "")
            {
                coldHoldingLog.InternalTemp2 = float.Parse(txtTemp2.Text);
            }
            if (tempratureTime2.Text != "")
            {
                coldHoldingLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {
                coldHoldingLog.Temp2Time = DateTime.Now;

            }
            //if (txtCorrectiveAction.Text.Trim() != "")
            //{
            //    coldHoldingLog.CorrectiveAction = txtCorrectiveAction.Text;
            //}
            //else
            //{
            //    coldHoldingLog.CorrectiveAction = null;
            //}
            coldHoldingLog.VerifiedBy = txtVerifiedBy.Text;
            coldHoldingLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            coldHoldingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                coldHoldingLog.KitchenId = (int)Session["KitchenId"];
            }
            if (Session["UserName"] != null)
            {
                coldHoldingLog.UserName = (string)Session["UserName"];
            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                coldHoldingLog.CorrectiveAction1 = 0;
            }
            else
            {
                coldHoldingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                coldHoldingLog.CorrectiveAction2 = 0;
            }
            else
            {
                coldHoldingLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            if (Session["MobileId"] != null)
            {
                coldHoldingLog.MobileId = (int)Session["MobileId"];
            }
            ProcessCreateColdHoldingLog createColdHoldingLog = new ProcessCreateColdHoldingLog();
            createColdHoldingLog.ColdHoldingLog = coldHoldingLog;
            createColdHoldingLog.Invoke();

        }
        private void SubmitData()
        {
            ColdHoldingLog coldHoldingLog = new ColdHoldingLog();
            if (Request.QueryString["Id"] != null)
            {
                coldHoldingLog.ColdHoldingLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["ColdHoldingLogId"] != null)
                {
                    coldHoldingLog.ColdHoldingLogId = (int)Session["ColdHoldingLogId"];
                }
            }

            //coldHoldingLog.EntryDate = cldEntryDate.SelectedDate;
            coldHoldingLog.MealDate = DateTime.Parse(cldEntryDate.Text);
            // coldHoldingLog.FoodItem = int.Parse(ddlFoodItem.SelectedValue);
            // if (ddlFoodItem.SelectedValue == "1")
            if (rdbIngredient.Checked == true)
            {
                coldHoldingLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                coldHoldingLog.MenuItemId = 0;
                coldHoldingLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                coldHoldingLog.IngredientId = 0;
                coldHoldingLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                coldHoldingLog.FoodItem = 2;
            }
            //if (rdbNoItem.Checked == true)
            //{
            //    coldHoldingLog.IngredientId = 0;
            //    coldHoldingLog.MenuItemId = 0;
            //    coldHoldingLog.FoodItem = 3;
            //}

            // For New Table Design
            //string[] strItemType;
            //strItemType = ddlFoodItem.SelectedValue.Split('-');       
            //coldHoldingLog.FoodItem = strItemType[1];
            //if (strItemType[0] == "No")
            //{
            //    coldHoldingLog.IsCustomItem = 0;
            //}
            //else
            //{
            //    coldHoldingLog.IsCustomItem = 1;
            //}
            //if (txtTemp1.Text != "")
            //{
            //    coldHoldingLog.InternalTemp1 = float.Parse(txtTemp1.Text);
            //}      
            if (txtTemp1.Text != "")
            {
                coldHoldingLog.InternalTemp1 = float.Parse(txtTemp1.Text);
            }
            if (tempratureTime1.Text != "")
            {
                coldHoldingLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                coldHoldingLog.Temp1Time = DateTime.Now;

            }
            if (txtTemp2.Text != "")
            {
                coldHoldingLog.InternalTemp2 = float.Parse(txtTemp2.Text);
            }
            if (tempratureTime2.Text != "")
            {
                coldHoldingLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {
                coldHoldingLog.Temp2Time = DateTime.Now;

            }
            //if (txtCorrectiveAction.Text.Trim() != "")
            //{
            //    coldHoldingLog.CorrectiveAction = txtCorrectiveAction.Text;
            //}
            //else
            //{
            //    coldHoldingLog.CorrectiveAction = null;
            //}
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                coldHoldingLog.CorrectiveAction1 = 0;
            }
            else
            {
                coldHoldingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                coldHoldingLog.CorrectiveAction2 = 0;
            }
            else
            {
                coldHoldingLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            coldHoldingLog.VerifiedBy = txtVerifiedBy.Text;
            coldHoldingLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            coldHoldingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                coldHoldingLog.KitchenId = (int)Session["KitchenId"];
            }
            if (Session["UserName"] != null)
            {
                coldHoldingLog.UserName = (string)Session["UserName"];
            }
            if (Session["MobileId"] != null)
            {
                coldHoldingLog.MobileId = (int)Session["MobileId"];
            }
            ProcessSetColdHoldingLog setColdHoldingLog = new ProcessSetColdHoldingLog();
            setColdHoldingLog.ColdHoldingLog = coldHoldingLog;
            setColdHoldingLog.Invoke();


        }
        private void RemoveData()
        {
            ColdHoldingLog coldHoldingLog = new ColdHoldingLog();
            coldHoldingLog.ColdHoldingLogId = int.Parse(Request.QueryString["Id"].ToString());
            ProcessDeleteColdHoldingLog removeColdHoldingLog = new ProcessDeleteColdHoldingLog();
            removeColdHoldingLog.ColdHoldingLog = coldHoldingLog;
            removeColdHoldingLog.Invoke();

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
                //tpHour1.Text = (((dtTime.Hour + 11) % 12) + 1).ToString();
                tempratureTime1.Text = dtTime.ToShortTimeString();
            }
            else if (nPeriod == 2)
            {
                tempratureTime2.Text = dtTime.ToShortTimeString();
            }
            else
            {
                //tpHour1.Text = (((dtTime.Hour + 11) % 12) + 1).ToString();
                tempratureTime1.Text = dtTime.ToShortTimeString();
                tempratureTime2.Text = dtTime.ToShortTimeString();
            }

        }
        //protected void ddlMealDate_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlMealDate.SelectedIndex > 0)
        //    {
        //        SetFoodItemDropDown("");
        //    }
        //}
        //private void SetFoodItemDropDown(string strFoodItem)
        //{
        //    while (ddlFoodItem.Items.Count >= 1)
        //    {
        //        ListItem item = ddlFoodItem.Items[0];
        //        ddlFoodItem.Items.Remove(item);
        //    }

        //    ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
        //    DataSet dsFoodItem = menuItems.GetMealServingMenuItems(DateTime.Parse(ddlMealDate.SelectedValue), (int)Session["KitchenId"]);
        //    //ListItem tempItem = new ListItem("Select Value", "");
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
        protected void ddlFoodItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            // if(ddlFoodItem.SelectedValue == "1")
            // {
            //     ddlItem.DataSource = odsIngredient;
            //     ddlItem.DataTextField = "Name";
            //     ddlItem.DataValueField = "IngredientID";
            //     ddlItem.DataBind();
            // }
            //if(ddlFoodItem.SelectedValue == "2")
            // {
            //     ddlItem.DataSource = odsMenuItem;
            //     ddlItem.DataTextField = "Name";
            //     ddlItem.DataValueField = "MenuItemId";
            //     ddlItem.DataBind();
            // }
        }
        protected void ValidateTemp1(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            //if (rdbNoItem.Checked != true)
            //{
            if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
            {
                if (txtTemp1.Text != "")
                {
                    if (float.Parse(txtTemp1.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp1.Text) > float.Parse(hfTempHigh.Value))
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
                //}
            }
        }
        protected void ValidateTemp2(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            //if (rdbNoItem.Checked != true)
            //{

            if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
            {
                if (txtTemp2.Text != "")
                {
                    if (float.Parse(txtTemp2.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp2.Text) > float.Parse(hfTempHigh.Value))
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
                // }
            }
        }

        //protected void SetFoodItem(object source, ServerValidateEventArgs args)
        //{


        //    if (rdbNoItem.Checked == true)
        //    {
        //        rdbMenuItem.Checked = false;
        //        ddlMenuItem.Enabled = false;
        //        rfvIngredient.Enabled = false;
        //        rfvMenuItem.Enabled = false;
        //        ddlIngredient.Enabled = false;
        //        rdbIngredient.Checked = false;

        //    }
        //    else if (rdbIngredient.Checked == true)
        //    {


        //        ddlIngredient.Enabled = true;
        //        rdbNoItem.Checked = false;
        //        rfvIngredient.Enabled = true;
        //        rfvMenuItem.Enabled = false;
        //        ddlMenuItem.Enabled = false;
        //        rdbMenuItem.Checked = false;
        //    }
        //    else if (rdbMenuItem.Checked == true)
        //    {

        //        ddlMenuItem.Enabled = true;
        //        rfvIngredient.Enabled = false;
        //        rfvMenuItem.Enabled = true;
        //        ddlIngredient.Enabled = false;
        //        rdbMenuItem.Checked = false;
        //    }

        //}
        //protected void cmdClear_Click(object sender, EventArgs e)
        //{
        //    rdlCorrectiveAction1.ClearSelection();
        //}
        //protected void cmdClear2_Click(object sender, EventArgs e)
        //{
        //    rdlCorrectiveAction2.ClearSelection();
        //}

    }
}