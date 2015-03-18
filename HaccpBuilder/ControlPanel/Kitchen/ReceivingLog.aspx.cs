using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
using System.Web.Services;
using System.Web.Script.Services;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    [WebService(Namespace = "http://tempuri.org")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public partial class ReceivingLogNew : System.Web.UI.Page
    {
        public string mode = "new";
        public DateTime currentTime = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                currentTime = Utilities.GetTimeByZone(KitchenId);
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
                if (rdbIngredient.Checked == true)
                {
                    ddlIngredient.Enabled = true;

                }
                //if (chkTempRequired.Checked == true)
                //{
                //    txtTemperature.Enabled = false;
                //    tpTime.Enabled = false;
                //    txtTemperature.Text = "";
                //    tpTime.Text = "";
                //}
                //else if (chkTempRequired.Checked == false)
                //{
                //    txtTemperature.Enabled = true;
                //    tpTime.Enabled = true;

                //}

            }




        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            cldMealDate.SelectedDate = DateTime.Today;
            //tpTime.Text = DateTime.Now.ToShortTimeString();
            SetTime(1, currentTime);
            chkTempRequired.Checked = false;
            cldVerifiedDate.SelectedDate = currentTime.Date;
            txtEntryDate.Text = currentTime.ToString();

            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetKitchen getKitchen = new ProcessGetKitchen();
                ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
                //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId(KitchenId, 1);
                DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId(KitchenId, 4);
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
                ReceivingLog receivingLog = new ReceivingLog();
                receivingLog.ReceivingLogId = int.Parse(Request.QueryString["Id"]);
                ProcessGetReceivingLog getReceivingLog = new ProcessGetReceivingLog();
                getReceivingLog.ReceivingLog = receivingLog;
                getReceivingLog.Invoke();

                IDataReader logReader = getReceivingLog.ResultSet;
                if (logReader.Read())
                {
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    if (logReader["FoodItem"].ToString() == "1")
                    {
                        //ddlItem.DataSource = odsIngredient;
                        //ddlItem.DataBind();
                        //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                        rdbIngredient.Checked = true;
                        //  rdbNoItem.Checked = false;
                        ddlIngredient.Enabled = true;
                        //  rfvIngredient.Enabled = true;
                        // rfvMenuItem.Enabled = false;
                        ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                        //ddlVendor.SelectedValue = logReader["VendorId"].ToString();
                        dvVendor.InnerText = GetVendor(int.Parse(ddlIngredient.SelectedValue));
                        //  ddlMenuItem.Enabled = false;

                    }
                    //if (logReader["FoodItem"].ToString() == "2")
                    //{
                    //    //ddlItem.DataSource = odsMenuItem;
                    //    //ddlItem.DataBind();
                    //    //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                    //    rdbMenuItem.Checked = true;
                    //    ddlMenuItem.Enabled = true;
                    //    rfvIngredient.Enabled = false;
                    //    rfvMenuItem.Enabled = true;
                    //    ddlIngredient.Enabled = false;
                    //    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    //}
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        //  rdbMenuItem.Checked = false; ;
                        //  ddlMenuItem.Enabled = false;
                        //  rfvMenuItem.Enabled = false;
                        // rfvIngredient.Enabled = false;                   
                        // ddlIngredient.Enabled = false;
                        //  rdbIngredient.Checked = false;
                        //  rdbNoItem.Checked = true;
                    }
                    //ddlIngredient.SelectedValue = logReader["IngredientId"].ToString();

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
                    txtEntryDate.Text = logReader["EntryDate"].ToString();

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
                    hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";
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
                    ProcessGetReceivingLog getReceivingLog = new ProcessGetReceivingLog();
                    IDataReader logReader = getReceivingLog.GetReceivingLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), KitchenId);
                    if (logReader.Read())
                    {
                        Session["ReceivingLogId"] = int.Parse(logReader["Id"].ToString());
                        cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                        if (logReader["FoodItem"].ToString() == "1")
                        {
                            //ddlItem.DataSource = odsIngredient;
                            //ddlItem.DataBind();
                            //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                            rdbIngredient.Checked = true;
                            // rdbNoItem.Checked = false;
                            ddlIngredient.Enabled = true;
                            //  rfvIngredient.Enabled = true;
                            // rfvMenuItem.Enabled = false;
                            ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                            //ddlVendor.SelectedValue = logReader["VendorId"].ToString();
                            dvVendor.InnerText = GetVendor(int.Parse(ddlIngredient.SelectedValue));
                            //  ddlMenuItem.Enabled = false;

                        }
                        //if (logReader["FoodItem"].ToString() == "2")
                        //{
                        //    //ddlItem.DataSource = odsMenuItem;
                        //    //ddlItem.DataBind();
                        //    //ddlItem.SelectedValue = logReader["MenuItem"].ToString();
                        //    rdbMenuItem.Checked = true;
                        //    ddlMenuItem.Enabled = true;
                        //    rfvIngredient.Enabled = false;
                        //    rfvMenuItem.Enabled = true;
                        //    ddlIngredient.Enabled = false;
                        //    ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                        //}
                        if (logReader["FoodItem"].ToString() == "3")
                        {
                            //  rdbMenuItem.Checked = false; ;
                            //  ddlMenuItem.Enabled = false;
                            //  rfvMenuItem.Enabled = false;
                            // rfvIngredient.Enabled = false;                   
                            ddlIngredient.Enabled = false;
                            rdbIngredient.Checked = false;
                            // rdbNoItem.Checked = true;
                        }
                        // ddlIngredient.SelectedValue = logReader["IngredientId"].ToString();
                        //  ddlVendor.SelectedValue = logReader["VendorId"].ToString();
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
                        txtEntryDate.Text = logReader["EntryDate"].ToString();
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
                        hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";
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
        private void GetData(int nId)
        {
            // string strCustom;
            string strTime1;
            ReceivingLog receivingLog = new ReceivingLog();
            receivingLog.ReceivingLogId = nId;
            Session["ReceivingLogId"] = nId;
            ProcessGetReceivingLog getReceivingLog = new ProcessGetReceivingLog();
            getReceivingLog.ReceivingLog = receivingLog;
            getReceivingLog.Invoke();

            IDataReader logReader = getReceivingLog.ResultSet;
            if (logReader.Read())
            {
                cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                if (logReader["FoodItem"].ToString() == "1")
                {
                    //ddlItem.DataSource = odsIngredient;
                    //ddlItem.DataBind();
                    //ddlItem.SelectedValue = logReader["Ingredient"].ToString();
                    rdbIngredient.Checked = true;
                    //  rdbNoItem.Checked = false;
                    ddlIngredient.Enabled = true;
                    //  rfvIngredient.Enabled = true;
                    // rfvMenuItem.Enabled = false;
                    ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                    //ddlVendor.SelectedValue = logReader["VendorId"].ToString();
                    dvVendor.InnerText = GetVendor(int.Parse(ddlIngredient.SelectedValue));
                    //  ddlMenuItem.Enabled = false;

                }
                if (logReader["FoodItem"].ToString() == "3")
                {

                }

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

                    strTime1 = DateTime.Parse(logReader["TempTime"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                }
                catch (Exception ex)
                {
                    if (ex.ToString().Contains("String was not recognized as a valid DateTime"))
                    {

                        strTime1 = DateTime.Now.ToShortTimeString();
                        SetTime(1, DateTime.Parse(strTime1));
                    }
                }


                if (logReader["RemoveTemperatureCheck"].ToString() == "1")
                {
                    chkTempRequired.Checked = true;
                    txtTemperature.Text = "";
                    txtTemperature.Enabled = false;

                }
                else if (logReader["RemoveTemperatureCheck"].ToString() == "0")
                {
                    chkTempRequired.Checked = false;
                    txtTemperature.Enabled = true;
                }

                txtBatch.Text = logReader["BatchNumber"].ToString();
                txtVolume.Text = logReader["Volume"].ToString();
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                txtEntryDate.Text = logReader["EntryDate"].ToString();

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
                hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";
                logReader.Close();
            }
            if (logReader.IsClosed == false)
            {
                logReader.Close();
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
                SetTime(1, currentTime);
                trClearCorrectiveActions.Style.Add("display", "''");
                txtBatch.Text = "";
                txtVolume.Text = "";
                rdbIngredient.Checked = true;
                ddlIngredient.Enabled = true;
                rfvIngredient.Enabled = true;
                txtVerifiedBy.Text = "";
                GetInitialData();
                cldVerifiedDate.SelectedDate = currentTime.Date;
                txtEntryDate.Text = currentTime.ToString();
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
            ddlIngredient.DataBind();
            ddlIngredient.Items.Insert(0, "Select Input");
            ddlIngredient.SelectedIndex = 0;
            dvVendor.InnerText = "";
            //ddlVendor.DataBind();
            //ddlVendor.Items.Insert(0, "Select Vendor");
            //ddlVendor.SelectedIndex = 0;
            //ddlVendor.Enabled = false;

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
                }
                else if (chkTempRequired.Checked == false)
                {
                    txtTemperature.Enabled = true;
                }
                tpHour1.Enabled = true;
                tpMinute1.Enabled = true;
                tpTime1.Enabled = true;
                cldVerifiedDate.Enabled = true;
                cldMealDate.Enabled = true;
                rdbIngredient.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
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
                rdbIngredient.Enabled = false;
                txtBatch.Enabled = false;
                txtVolume.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");

                ddlIngredient.Enabled = false;
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
            if (Page.IsValid == true)
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
            currentTime = Utilities.GetTimeByZone(KitchenId);
            if (rdbIngredient.Checked == true && ddlIngredient.SelectedItem.Text == "Select Input")
            {
                LogError.Text += "<br/>Please Select Input";
                result = false;
            }
            if (tpHour1.Text != "")
            {
                if (cldMealDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(1)) > currentTime)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 1 time’ field";
                        result = false;

                    }
                }
            }
            result = ValidateTemp(LogError.Text);


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
                //if (rdbNoItem.Checked == true && rdbIngredient.Checked == false)
                //{
                //    result = true;
                //}
                if (rdbIngredient.Checked == true)
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
            //CustomValidator2.IsValid = true;
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
            //CustomValidator2.IsValid = true;

        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            //ddlIngredient.DataBind();
            SetPage();
        }
        private void InsertData()
        {
            ReceivingLog receivingLog = new ReceivingLog();
            receivingLog.MealDate = cldMealDate.SelectedDate;
            if (txtTemperature.Text != "")
            {
                receivingLog.Temperature = float.Parse(txtTemperature.Text);
            }
            if (tpHour1.Text != "")
            {
                receivingLog.TempTime = DateTime.Parse(GetTime(1));
            }
            else
            {
                receivingLog.TempTime = DateTime.Now;

            }

            if (chkTempRequired.Checked == false)
            {
                receivingLog.TempRequired = 0;
            }
            else if (chkTempRequired.Checked == true)
            {
                receivingLog.TempRequired = 1;
            }
            if (rdbIngredient.Checked == true)
            {
                receivingLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                receivingLog.MenuItemId = 0;
                receivingLog.FoodItem = 1;
                receivingLog.VendorId = GetVendorId(int.Parse(ddlIngredient.SelectedValue));
            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                receivingLog.CorrectiveAction1 = 0;
            }
            else
            {
                receivingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            receivingLog.VerifiedBy = txtVerifiedBy.Text;
            receivingLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            receivingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            receivingLog.BatchNumber = txtBatch.Text;
            receivingLog.Volume = txtVolume.Text;
            if (Session["KitchenId"] != null)
            {
                receivingLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                receivingLog.UserName = (string)Session["UserName"];
            }

            ProcessCreateReceivingLog createReceivingLog = new ProcessCreateReceivingLog();
            createReceivingLog.ReceivingLog = receivingLog;
            createReceivingLog.Invoke();

        }
        private void SubmitData()
        {
            ReceivingLog receivingLog = new ReceivingLog();
            if (Request.QueryString["Id"] != null)
            {
                receivingLog.ReceivingLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["ReceivingLogId"] != null)
                {
                    receivingLog.ReceivingLogId = (int)Session["ReceivingLogId"];
                }
            }

            receivingLog.MealDate = cldMealDate.SelectedDate;
            if (txtTemperature.Text != "")
            {
                receivingLog.Temperature = float.Parse(txtTemperature.Text);
            }

            if (tpHour1.Text != "")
            {
                receivingLog.TempTime = DateTime.Parse(GetTime(1));
            }
            else
            {
                receivingLog.TempTime = DateTime.Now;

            }
            if (chkTempRequired.Checked == false)
            {
                receivingLog.TempRequired = 0;
            }
            else if (chkTempRequired.Checked == true)
            {
                receivingLog.TempRequired = 1;
            }
            if (rdbIngredient.Checked == true)
            {
                receivingLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                receivingLog.MenuItemId = 0;
                receivingLog.FoodItem = 1;
                receivingLog.VendorId = GetVendorId(int.Parse(ddlIngredient.SelectedValue));
            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                receivingLog.CorrectiveAction1 = 0;
            }
            else
            {
                receivingLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            receivingLog.VerifiedBy = txtVerifiedBy.Text;
            receivingLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            receivingLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                receivingLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                receivingLog.UserName = (string)Session["UserName"];
            }
            receivingLog.BatchNumber = txtBatch.Text;
            receivingLog.Volume = txtVolume.Text;
            receivingLog.MobileId = int.Parse(hfMobileId.Value);
            ProcessSetReceivingLog setReceivingLog = new ProcessSetReceivingLog();
            setReceivingLog.ReceivingLog = receivingLog;
            setReceivingLog.Invoke();


        }
        private void RemoveData()
        {
            ReceivingLog receivingLog = new ReceivingLog();
            if (Request.QueryString["Id"] != null)
            {
                receivingLog.ReceivingLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["ReceivingLogId"] != null)
                {
                    receivingLog.ReceivingLogId = (int)Session["ReceivingLogId"];
                }
            }
            //receivingLog.ReceivingLogId = int.Parse(Request.QueryString["Id"].ToString());
            ProcessDeleteReceivingLog removeReceivingLog = new ProcessDeleteReceivingLog();
            removeReceivingLog.ReceivingLog = receivingLog;
            removeReceivingLog.Invoke();

        }
        protected void cmdAddNew_Click1(object sender, ImageClickEventArgs e)
        {
            mode = "new";
            SetPage();
        }
        //protected void ddlIngredient_SelectedIndexChanged1(object sender, EventArgs e)
        //{
        //    if (ddlIngredient.SelectedItem.Text == "Select Input")
        //    {
        //        ddlVendor.SelectedIndex = 0;
        //    }
        //    else
        //    {
        //        Ingredients ingredient = new Ingredients();
        //        ingredient.IngredientID = int.Parse(ddlIngredient.SelectedValue);
        //        ProcessGetIngredient getIngredient = new ProcessGetIngredient();
        //        getIngredient.Ingredient = ingredient;
        //        getIngredient.Invoke();
        //        IDataReader drIngredient = getIngredient.ResultSet;
        //        if (drIngredient.Read())
        //        {
        //            ddlVendor.SelectedValue = drIngredient["VendorId"].ToString();
        //            drIngredient.Close();
        //        }
        //        if (drIngredient.IsClosed == false)
        //        {
        //            drIngredient.Close();
        //        }
        //    }
        //}
        [WebMethod]
        public static string GetVendor(int IngredientId)
        {
            string result = "";
            if (IngredientId == 0)
                result = "No Vendor Found";
            Ingredients ingredient = new Ingredients();
            ingredient.IngredientID = IngredientId;
            ProcessGetIngredient getIngredient = new ProcessGetIngredient();
            getIngredient.Ingredient = ingredient;
            getIngredient.Invoke();
            IDataReader drIngredient = getIngredient.ResultSet;
            if (drIngredient.Read())
            {
                result = drIngredient["VendorId"].ToString();
                Vendors vendor = new Vendors();
                vendor.VendorID = int.Parse(result);
                ProcessGetVendor getVednor = new ProcessGetVendor();
                getVednor.Vendor = vendor;
                getVednor.Invoke();
                IDataReader drVendors = getVednor.ResultSet;
                if (drVendors.Read())
                {
                    result = drVendors["VendorName"].ToString();
                }
                drVendors.Close();
                drIngredient.Close();
            }
            if (drIngredient.IsClosed == false)
            {
                drIngredient.Close();
            }
            return result;

        }
        public int GetVendorId(int IngredientId)
        {
            int result = 0;
            if (IngredientId == 0)
                return result;
            Ingredients ingredient = new Ingredients();
            ingredient.IngredientID = IngredientId;
            ProcessGetIngredient getIngredient = new ProcessGetIngredient();
            getIngredient.Ingredient = ingredient;
            getIngredient.Invoke();
            IDataReader drIngredient = getIngredient.ResultSet;
            if (drIngredient.Read())
            {
                result = int.Parse(drIngredient["VendorId"].ToString());
                drIngredient.Close();
            }
            if (drIngredient.IsClosed == false)
            {
                drIngredient.Close();
            }
            return result;

        }
        protected void chkTempRequired_CheckedChanged(object sender, EventArgs e)
        {
            if (chkTempRequired.Checked == true)
            {
                txtTemperature.Text = "";
                txtTemperature.Enabled = false;
                //tpHour1.Enabled = false;
                //tpMinute1.Enabled = false;
                //tpTime1.Enabled = false;
                //tpMinute1.Text = "";
                //tpHour1.Text = "";
            }
            else
            {
                txtTemperature.Enabled = true;
                //tpHour1.Enabled = true;
                //tpMinute1.Enabled = true;
                //tpTime1.Enabled = true;
                //SetTime(1, DateTime.Now);

            }

        }
        protected void ValidateTemp(object source, ServerValidateEventArgs args)
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
                //   }
            }
        }
        protected bool ValidateTemp(string strLogError)
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
                                LogError.Text += "Please select Corrective Action field";
                                return false;
                            }
                            else
                            {
                                return true;
                            }
                        }
                        else
                        {
                            return true;
                        }

                    }
                    else
                    {
                        return true;
                    }
                }
                else
                {
                    return true;
                }
                //   }
            }
            else
            {
                return true;
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
        //protected void cmdClear_Click(object sender, EventArgs e)
        //{
        //    rdlCorrectiveAction1.ClearSelection();
        //}
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
        protected void grdHotHolding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Receiving")
            {
                int nLogId = int.Parse(e.CommandArgument.ToString());
                GetData(nLogId);
            }
        }
        public int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
    }
}