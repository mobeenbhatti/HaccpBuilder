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


public partial class ControlPanel_FreezerLog : System.Web.UI.Page
{
    public string mode = "new";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
            CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
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


    }
    protected void cmdBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    private void GetInitialData()
    {
        tpTime1.Text = DateTime.Now.ToShortTimeString();
        tpTime2.Text = DateTime.Now.ToShortTimeString();
        tpTime3.Text = DateTime.Now.ToShortTimeString();
        //tpTime4.Text = DateTime.Now.ToShortTimeString();
        //tpTime5.Text = DateTime.Now.ToShortTimeString();
        //tpTime6.Text = DateTime.Now.ToShortTimeString();
        cldVerifiedDate.SelectedDate = DateTime.Today;
        txtEntryDate.Text = DateTime.Now.ToShortDateString();
        if ((int)Session["TypeId"] != 1)
        {
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            DataSet dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 2);
            if (dsTemperature.Tables[0].Rows.Count > 0)
            {
                hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["TempMax"].ToString();
                hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["TempMin"].ToString();
                Lbl_QCLMaxtempValue.Text = dsTemperature.Tables[0].Rows[0]["TempMax"].ToString();
                Lbl_QCLMintempValue.Text = dsTemperature.Tables[0].Rows[0]["TempMin"].ToString();
            }
        }
        else
        {
            hfTempHigh.Value = "NA";
            hfTempLow.Value = "NA";
            Lbl_QCLMaxtempValue.Text = "NA";
            Lbl_QCLMintempValue.Text = "NA";
        }



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

    protected void ValidateTemp1(object source, ServerValidateEventArgs args)
    {
        int nResult = 0;
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
        }
    }
    protected void ValidateTemp2(object source, ServerValidateEventArgs args)
    {
        int nResult = 0;
        if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
        {
            if (txtTemp1.Text != "")
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
        }
    }
    protected void ValidateTemp3(object source, ServerValidateEventArgs args)
    {
        int nResult = 0;
        if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
        {
            if (txtTemp1.Text != "")
            {
                if (float.Parse(txtTemp3.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp3.Text) > float.Parse(hfTempHigh.Value))
                {
                    for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction3.Items[i].Selected == true)
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

    //protected void ValidateTemp4(object source, ServerValidateEventArgs args)
    //{
    //    int nResult = 0;
    //    if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
    //    {
    //        if (txtTemp1.Text != "")
    //        {
    //            if (float.Parse(txtTemp4.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp4.Text) > float.Parse(hfTempHigh.Value))
    //            {
    //                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
    //                {
    //                    if (rdlCorrectiveAction1.Items[i].Selected == true)
    //                    {
    //                        nResult = 1;
    //                        break;
    //                    }
    //                }
    //                if (nResult == 0)
    //                {
    //                    args.IsValid = false;
    //                }
    //            }
    //        }
    //    }
    //}

    //protected void ValidateTemp5(object source, ServerValidateEventArgs args)
    //{
    //    int nResult = 0;
    //    if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
    //    {
    //        if (txtTemp1.Text != "")
    //        {
    //            if (float.Parse(txtTemp5.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp5.Text) > float.Parse(hfTempHigh.Value))
    //            {
    //                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
    //                {
    //                    if (rdlCorrectiveAction1.Items[i].Selected == true)
    //                    {
    //                        nResult = 1;
    //                        break;
    //                    }
    //                }
    //                if (nResult == 0)
    //                {
    //                    args.IsValid = false;
    //                }
    //            }
    //        }
    //    }
    //}
    //protected void ValidateTemp6(object source, ServerValidateEventArgs args)
    //{
    //    int nResult = 0;
    //    if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
    //    {
    //        if (txtTemp1.Text != "")
    //        {
    //            if (float.Parse(txtTemp6.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemp6.Text) > float.Parse(hfTempHigh.Value))
    //            {
    //                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
    //                {
    //                    if (rdlCorrectiveAction1.Items[i].Selected == true)
    //                    {
    //                        nResult = 1;
    //                        break;
    //                    }
    //                }
    //                if (nResult == 0)
    //                {
    //                    args.IsValid = false;
    //                }
    //            }
    //        }
    //    }
    //}
    private void GetData()
    {
        //string strCustom;
        string strDate, strMenuItem, strMenuItemId, strItemId;
        if (Request.QueryString["Id"] != null)
        {
            FreezerLog FreezerLog = new FreezerLog();
            FreezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"]);
            ProcessGetFreezerLog getFreezerLog = new ProcessGetFreezerLog();
            getFreezerLog.FreezerLog = FreezerLog;
            getFreezerLog.Invoke();
            rdlCorrectiveAction1.DataBind();
            IDataReader logReader = getFreezerLog.ResultSet;
            if (logReader.Read())
            {
                // cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                //strMenuItem = logReader["ItemName"].ToString();
                //strMenuItemId = logReader["ItemId"].ToString();
                //strItemId = logReader["FoodItem"].ToString();
                //if (CheckDate(DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString()) > 0)
                //{
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
                cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                if (logReader["FoodItem"].ToString() == "1")
                {
                    //ddlItem.DataSource = odsIngredient;
                    //ddlItem.DataBind();
                    //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                    rdbIngredient.Checked = true;
                    ddlIngredient.Enabled = true;
                    rfvIngredient.Enabled = true;
                    rfvMenuItem.Enabled = false;
                    ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                    ddlMenuItem.Enabled = false;
                }
                if (logReader["FoodItem"].ToString() == "2")
                {
                    //ddlItem.DataSource = odsMenuItem;
                    //ddlItem.DataBind();
                    //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                    rdbMenuItem.Checked = true;
                    ddlMenuItem.Enabled = true;
                    rfvIngredient.Enabled = false;
                    rfvMenuItem.Enabled = true;
                    ddlIngredient.Enabled = false;
                    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                }
                if (logReader["FoodItem"].ToString() == "3")
                {
                    rdbMenuItem.Checked = false; ;
                    ddlMenuItem.Enabled = false;
                    rfvIngredient.Enabled = false;
                    rfvMenuItem.Enabled = false;
                    ddlIngredient.Enabled = false;
                    rdbNoItem.Checked = true;
                }
                txtTemp1.Text = logReader["Temp1"].ToString();
                tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                txtTemp2.Text = logReader["Temp2"].ToString();
                tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                txtTemp3.Text = logReader["Temp3"].ToString();
                tpTime3.Text = DateTime.Parse(logReader["Temp3Time"].ToString()).ToShortTimeString();
                //txtTemp4.Text = logReader["Temp4"].ToString();
                //tpTime4.Text = DateTime.Parse(logReader["Temp4Time"].ToString()).ToShortTimeString();
                //txtTemp5.Text = logReader["Temp5"].ToString();
                //tpTime5.Text = DateTime.Parse(logReader["Temp5Time"].ToString()).ToShortTimeString();
                //txtTemp6.Text = logReader["Temp6"].ToString();
                //tpTime6.Text = DateTime.Parse(logReader["Temp6Time"].ToString()).ToShortTimeString();
                // txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                txtEntryDate.Text = logReader["EntryDate"].ToString();
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
                for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                {
                    if (rdlCorrectiveAction3.Items[i].Value == logReader["CorrectiveAction3"].ToString())
                    {
                        rdlCorrectiveAction3.Items[i].Selected = true;
                        break;
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
                ProcessGetFreezerLog getFreezerLog = new ProcessGetFreezerLog();
                IDataReader logReader = getFreezerLog.GetFreezerLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), (int)Session["KitchenId"]);

                if (logReader.Read())
                {
                    Session["FreezerLogId"] = int.Parse(logReader["Id"].ToString());
                    strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                    //strMenuItem = logReader["ItemName"].ToString();
                    //strMenuItemId = logReader["ItemId"].ToString();
                    //strItemId = logReader["FoodItem"].ToString();
                    // cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    //if (CheckDate(strDate) > 0)
                    //{
                    //    ddlMealDate.SelectedValue = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();
                    //    // For New Table Design
                    //    //ddlFoodItem.SelectedValue = logReader["FoodItem"].ToString();
                    //    SetFoodItemDropDown(logReader["FoodItem"].ToString());
                    //}
                    //else
                    //{
                    //    // SHOW ERROR OF DATE NOT AVAILABLE IN CALENDAR
                    //    SetEditableMode(strDate, strMenuItem, strMenuItemId, strItemId);
                    //    //lblError.Text = "Date is not available in Meal Serving Calendar";
                    //    //mode = "new";
                    //    //SetPage();
                    //    //return;
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
                    cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                    if (logReader["FoodItem"].ToString() == "1")
                    {
                        //ddlItem.DataSource = odsIngredient;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                        rdbIngredient.Checked = true;
                        ddlIngredient.Enabled = true;
                        rfvIngredient.Enabled = true;
                        rfvMenuItem.Enabled = false;
                        ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                        ddlMenuItem.Enabled = false;
                    }
                    if (logReader["FoodItem"].ToString() == "2")
                    {
                        //ddlItem.DataSource = odsMenuItem;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        rfvIngredient.Enabled = false;
                        rfvMenuItem.Enabled = true;
                        ddlIngredient.Enabled = false;
                        ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    }
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        rdbMenuItem.Checked = false; ;
                        ddlMenuItem.Enabled = false;
                        rfvIngredient.Enabled = false;
                        rfvMenuItem.Enabled = false;
                        ddlIngredient.Enabled = false;
                        rdbNoItem.Checked = true;
                    }
                    txtTemp1.Text = logReader["Temp1"].ToString();
                    tpTime1.Text = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    txtTemp2.Text = logReader["Temp2"].ToString();
                    tpTime2.Text = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                    txtTemp3.Text = logReader["Temp3"].ToString();
                    tpTime3.Text = DateTime.Parse(logReader["Temp3Time"].ToString()).ToShortTimeString();
                    //txtTemp4.Text = logReader["Temp4"].ToString();
                    //tpTime4.Text = DateTime.Parse(logReader["Temp4Time"].ToString()).ToShortTimeString();
                    //txtTemp5.Text = logReader["Temp5"].ToString();
                    //tpTime5.Text = DateTime.Parse(logReader["Temp5Time"].ToString()).ToShortTimeString();
                    //txtTemp6.Text = logReader["Temp6"].ToString();
                    //tpTime6.Text = DateTime.Parse(logReader["Temp6Time"].ToString()).ToShortTimeString();
                    //  txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
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
                    for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction3.Items[i].Value == logReader["CorrectiveAction3"].ToString())
                        {
                            rdlCorrectiveAction3.Items[i].Selected = true;
                            break;
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
    //private int CheckDate(string strCheckDate)
    //{
    //    for (int i = 0; i < ddlMealDate.Items.Count; i++)
    //    {
    //        if (ddlMealDate.Items[i].Value == strCheckDate)
    //            return 1;
    //    }
    //    return 0;
    //}

    private void SetPage()
    {
        if (mode == "new")
        {
            //ddlFoodItem.SelectedIndex = 0;
            txtTemp1.Text = "";
            txtTemp2.Text = "";
            txtTemp3.Text = "";
            //txtTemp4.Text = "";
            //txtTemp5.Text = "";
            //txtTemp6.Text = "";
            tpTime1.Text = DateTime.Now.ToShortTimeString();
            tpTime2.Text = DateTime.Now.ToShortTimeString();
            tpTime3.Text = DateTime.Now.ToShortTimeString();
            //tpTime4.Text = DateTime.Now.ToShortTimeString();
            //tpTime5.Text = DateTime.Now.ToShortTimeString();
            //tpTime6.Text = DateTime.Now.ToShortTimeString();
            //txtCorrectiveAction.Text = "";
            txtVerifiedBy.Text = "";
            cldVerifiedDate.SelectedDate = DateTime.Today;
            cldEntryDate.SelectedDate = DateTime.Today;
            rdbMenuItem.Checked = false;
            rdbIngredient.Checked = false;
            rdbNoItem.Checked = true;
            ddlMenuItem.Enabled = false;
            ddlIngredient.SelectedIndex = 0;
            ddlIngredient.Enabled = false;
            rfvIngredient.Enabled = false;
            rfvMenuItem.Enabled = false;
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
            GetInitialData();
            if (Request.QueryString["date"] != null)
            {
                //cldMealDate.SelectedDate = DateTime.Parse(Request.QueryString["date"].ToString());
                //if (CheckDate(Request.QueryString["date"]) > 0)
                //{
                //    ddlMealDate.SelectedValue = Request.QueryString["date"].ToString();
                //    SetFoodItemDropDown("");
                //}
            }
            else
            {
                //cldMealDate.SelectedDate = DateTime.Today;
            }
        }
        if (mode == "edit")
        {
            cmdAdd.Visible = false;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
        }
        grdHotHolding.DataBind();
        rdlCorrectiveAction1.DataBind();
        rdlCorrectiveAction2.DataBind();
        rdlCorrectiveAction3.DataBind();
    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            mode = "new";
            InsertData();
            SetPage();
        }
        else
        {
        }
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            mode = "new";
            SubmitData();
            SetPage();
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
        SetPage();
    }
    private void InsertData()
    {
        FreezerLog freezerLog = new FreezerLog();
        //freezerLog.MealDate = cldMealDate.SelectedDate;
        //freezerLog.MealDate = DateTime.Parse(ddlMealDate.SelectedValue);

        // For New Table Design
        // freezerLog.FoodItem = ddlFoodItem.SelectedValue;
        //string[] strItemType;
        //strItemType = ddlFoodItem.SelectedValue.Split('-');       
        //freezerLog.FoodItem = strItemType[1];
        //if (strItemType[0] == "No")
        //{
        //    freezerLog.IsCustomItem = 0;
        //}
        //else
        //{
        //    freezerLog.IsCustomItem = 1;
        //}  

        freezerLog.MealDate = cldEntryDate.SelectedDate;
        if (rdbIngredient.Checked == true)
        {
            freezerLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
            freezerLog.MenuItemId = 0;
            freezerLog.FoodItem = 1;
        }
        if (rdbMenuItem.Checked == true)
        {
            freezerLog.IngredientId = 0;
            freezerLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
            freezerLog.FoodItem = 2;
        }
        if (rdbNoItem.Checked == true)
        {
            freezerLog.IngredientId = 0;
            freezerLog.MenuItemId = 0;
            freezerLog.FoodItem = 3;
        }
        if (txtTemp1.Text != "")
        {
            freezerLog.Temp1 = float.Parse(txtTemp1.Text);
        }
        freezerLog.Temp1Time = DateTime.Parse(tpTime1.Text);
        if (txtTemp2.Text != "")
        {
            freezerLog.Temp2 = float.Parse(txtTemp2.Text);
        }
        freezerLog.Temp2Time = DateTime.Parse(tpTime2.Text);
        if (txtTemp3.Text != "")
        {
            freezerLog.Temp3 = float.Parse(txtTemp3.Text);
        }
        freezerLog.Temp3Time = DateTime.Parse(tpTime3.Text);
        //if (txtTemp4.Text != "")
        //{
        //    freezerLog.Temp4 = float.Parse(txtTemp4.Text);
        //}
        //freezerLog.Temp4Time = DateTime.Parse(tpTime4.Text);
        //if (txtTemp5.Text != "")
        //{
        //    freezerLog.Temp5 = float.Parse(txtTemp5.Text);
        //}
        //freezerLog.Temp5Time = DateTime.Parse(tpTime5.Text);
        //if (txtTemp6.Text != "")
        //{
        //    freezerLog.Temp6 = float.Parse(txtTemp6.Text);
        //}
        //freezerLog.Temp6Time = DateTime.Parse(tpTime6.Text);

        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    freezerLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    freezerLog.CorrectiveAction = null;
        //}
        freezerLog.VerifiedBy = txtVerifiedBy.Text;
        freezerLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        freezerLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            freezerLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            freezerLog.UserName = (string)Session["UserName"];
        }
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction1 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        if (rdlCorrectiveAction2.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction2 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }
        if (rdlCorrectiveAction3.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction3 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction3 = int.Parse(rdlCorrectiveAction3.SelectedValue);
        }
        ProcessCreateFreezerLog createFreezerLog = new ProcessCreateFreezerLog();
        createFreezerLog.FreezerLog = freezerLog;
        createFreezerLog.Invoke();

    }
    private void SubmitData()
    {
        FreezerLog freezerLog = new FreezerLog();
        if (Request.QueryString["Id"] != null)
        {
            freezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["FreezerLogId"] != null)
            {
                freezerLog.FreezerLogId = (int)Session["FreezerLogId"];
            }
        }

        //freezerLog.MealDate = cldMealDate.SelectedDate;
        // freezerLog.MealDate = DateTime.Parse(ddlMealDate.SelectedValue);
        // For New Table Design
        // freezerLog.FoodItem = ddlFoodItem.SelectedValue;
        //string[] strItemType;
        //strItemType = ddlFoodItem.SelectedValue.Split('-');       
        //freezerLog.FoodItem = strItemType[1];
        //if (strItemType[0] == "No")
        //{
        //    freezerLog.IsCustomItem = 0;
        //}
        //else
        //{
        //    freezerLog.IsCustomItem = 1;
        //}
        freezerLog.MealDate = cldEntryDate.SelectedDate;
        if (rdbIngredient.Checked == true)
        {
            freezerLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
            freezerLog.MenuItemId = 0;
            freezerLog.FoodItem = 1;
        }
        if (rdbMenuItem.Checked == true)
        {
            freezerLog.IngredientId = 0;
            freezerLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
            freezerLog.FoodItem = 2;
        }
        if (rdbNoItem.Checked == true)
        {
            freezerLog.IngredientId = 0;
            freezerLog.MenuItemId = 0;
            freezerLog.FoodItem = 3;
        }
        if (txtTemp1.Text != "")
        {
            freezerLog.Temp1 = float.Parse(txtTemp1.Text);
        }
        freezerLog.Temp1Time = DateTime.Parse(tpTime1.Text);
        if (txtTemp2.Text != "")
        {
            freezerLog.Temp2 = float.Parse(txtTemp2.Text);
        }
        freezerLog.Temp2Time = DateTime.Parse(tpTime2.Text);
        if (txtTemp3.Text != "")
        {
            freezerLog.Temp3 = float.Parse(txtTemp3.Text);
        }
        freezerLog.Temp3Time = DateTime.Parse(tpTime3.Text);
        //if (txtTemp4.Text != "")
        //{
        //    freezerLog.Temp4 = float.Parse(txtTemp4.Text);
        //}
        //freezerLog.Temp4Time = DateTime.Parse(tpTime4.Text);
        //if (txtTemp5.Text != "")
        //{
        //    freezerLog.Temp5 = float.Parse(txtTemp5.Text);
        //}
        //freezerLog.Temp5Time = DateTime.Parse(tpTime5.Text);
        //if (txtTemp6.Text != "")
        //{
        //    freezerLog.Temp6 = float.Parse(txtTemp6.Text);
        //}
        //freezerLog.Temp6Time = DateTime.Parse(tpTime6.Text);
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    freezerLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    freezerLog.CorrectiveAction = null;
        //}
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction1 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        if (rdlCorrectiveAction2.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction2 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }
        if (rdlCorrectiveAction3.SelectedIndex == -1)
        {
            freezerLog.CorrectiveAction3 = 0;
        }
        else
        {
            freezerLog.CorrectiveAction3 = int.Parse(rdlCorrectiveAction3.SelectedValue);
        }
        freezerLog.VerifiedBy = txtVerifiedBy.Text;
        freezerLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        freezerLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            freezerLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            freezerLog.UserName = (string)Session["UserName"];
        }

        ProcessSetFreezerLog setFreezerLog = new ProcessSetFreezerLog();
        setFreezerLog.FreezerLog = freezerLog;
        setFreezerLog.Invoke();


    }
    private void RemoveData()
    {
        FreezerLog FreezerLog = new FreezerLog();
        FreezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteFreezerLog removeFreezerLog = new ProcessDeleteFreezerLog();
        removeFreezerLog.FreezerLog = FreezerLog;
        removeFreezerLog.Invoke();

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

    //   ListItem MealDate = new ListItem();
    //    MealDate.Text = strDate;
    //    MealDate.Value=strDate;
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
}
