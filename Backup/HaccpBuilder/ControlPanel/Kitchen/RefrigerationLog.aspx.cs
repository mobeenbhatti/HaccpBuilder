using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class RefrigerationLogNew : System.Web.UI.Page
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




        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            cldMealDate.SelectedDate = currentTime.Date;
            cldVerifiedDate.SelectedDate = currentTime.Date;
            txtEntryDate.Text = currentTime.ToString();

            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetKitchen getKitchen = new ProcessGetKitchen();
                ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
                //dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId(KitchenId, 1);
                DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId(KitchenId, 5);
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
            //string strCustom;
            string strTime1;
            if (Request.QueryString["Id"] != null)
            {
                RefrigerationLog refrigerationLog = new RefrigerationLog();
                refrigerationLog.RefrigerationLogId = int.Parse(Request.QueryString["Id"]);
                ProcessGetRefrigerationLog getRefrigerationLog = new ProcessGetRefrigerationLog();
                getRefrigerationLog.RefrigerationLog = refrigerationLog;
                getRefrigerationLog.Invoke();

                IDataReader logReader = getRefrigerationLog.ResultSet;
                if (logReader.Read())
                {
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    //txtLocation.Text = logReader["Location"].ToString();
                    if (logReader["CustomInventoryID"].ToString() == "")
                    {
                        ddlRefrigerationDevice.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlRefrigerationDevice.SelectedValue = logReader["CustomInventoryID"].ToString();
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
                    ProcessGetRefrigerationLog getRefrigerationLog = new ProcessGetRefrigerationLog();
                    IDataReader logReader = getRefrigerationLog.GetRefrigerationLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), KitchenId);
                    if (logReader.Read())
                    {
                        Session["RefrigerationLogId"] = int.Parse(logReader["Id"].ToString());
                        cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());                       
                        if (logReader["CustomInventoryID"].ToString() == "")
                        {
                            ddlRefrigerationDevice.SelectedIndex = 0;
                        }
                        else
                        {
                            ddlRefrigerationDevice.SelectedValue = logReader["CustomInventoryID"].ToString();
                        }
                        if (logReader["Temperature"].ToString() != "99999.00")
                        {
                            txtTemperature.Text = logReader["Temperature"].ToString();

                        }
                        else
                        {
                            txtTemperature.Text = "";

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
                    cldMealDate.SelectedDate = currentTime.Date;
                }
                cldVerifiedDate.SelectedDate = currentTime.Date;
                SetPageInEditMode("new");                
                ddlRefrigerationDevice.SelectedIndex = 0;
                txtTemperature.Text = "";
                SetTime(1, currentTime);               
                txtVerifiedBy.Text = "";
                txtEntryDate.Text = currentTime.ToString();
                rdlCorrectiveAction1.SelectedIndex = -1;
                trClearCorrectiveActions.Style.Add("display", "''");
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                rdlCorrectiveAction1.DataBind();  
                rdlCorrectiveAction1.Visible = true;
                GetInitialData();
                Lbl_CorrectiveAction1.Visible = false;


            }
            if (mode == "edit")
            {
                SetPageInEditMode("edit");

            }
            grdHotHolding.DataBind();
            ddlRefrigerationDevice.DataBind();
            ddlRefrigerationDevice.Items.Insert(0, "Select Refrigeration Device");
            ddlRefrigerationDevice.SelectedIndex = 0;



        }
        private void SetPageInEditMode(string type)
        {
            if (type == "new")
            {
                txtTemperature.Enabled = true;
                tpHour1.Enabled = true;
                tpMinute1.Enabled = true;
                tpTime1.Enabled = true;
                txtVerifiedBy.Enabled = true;
                cldVerifiedDate.Enabled = true;
                cldMealDate.Enabled = true;
                // txtLocation.Enabled = true;
                ddlRefrigerationDevice.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
            }
            else if (type == "edit")
            {
                txtTemperature.Enabled = false;
                tpHour1.Enabled = false;
                tpMinute1.Enabled = false;
                tpTime1.Enabled = false;
                cldMealDate.Enabled = false;
                txtVerifiedBy.Enabled = false;
                cldVerifiedDate.Enabled = false;
                ddlRefrigerationDevice.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = false;
            }
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                mode = "new";
                InsertData();
                SetPage();
            }
        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
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
            SetPage();
        }

        private void InsertData()
        {
            RefrigerationLog refrigerationLog = new RefrigerationLog();
            refrigerationLog.MealDate = cldMealDate.SelectedDate;
            if (txtTemperature.Text != "")
            {
                refrigerationLog.Temperature = float.Parse(txtTemperature.Text);
            }
            if (tpHour1.Text != "")
            {
                refrigerationLog.TempTime = DateTime.Parse(GetTime(1));
            }
            else
            {
                refrigerationLog.TempTime = DateTime.Now;

            }

            refrigerationLog.RefrigerationDevice = int.Parse(ddlRefrigerationDevice.SelectedValue);
           
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                refrigerationLog.CorrectiveAction1 = 0;
            }
            else
            {
                refrigerationLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            refrigerationLog.VerifiedBy = txtVerifiedBy.Text;
            refrigerationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            refrigerationLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                refrigerationLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                refrigerationLog.UserName = (string)Session["UserName"];
            }

            ProcessCreateRefrigerationLog createRefrigerationLog = new ProcessCreateRefrigerationLog();
            createRefrigerationLog.RefrigerationLog = refrigerationLog;
            createRefrigerationLog.Invoke();

        }
        private void SubmitData()
        {
            RefrigerationLog refrigerationLog = new RefrigerationLog();
            if (Request.QueryString["Id"] != null)
            {
                refrigerationLog.RefrigerationLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["RefrigerationLogId"] != null)
                {
                    refrigerationLog.RefrigerationLogId = (int)Session["RefrigerationLogId"];
                }
            }

            refrigerationLog.MealDate = cldMealDate.SelectedDate;
            if (txtTemperature.Text != "")
            {
                refrigerationLog.Temperature = float.Parse(txtTemperature.Text);
            }
            if (tpHour1.Text != "")
            {
                refrigerationLog.TempTime = DateTime.Parse(GetTime(1));
            }
            else
            {
                refrigerationLog.TempTime = DateTime.Now;

            }
            refrigerationLog.RefrigerationDevice = int.Parse(ddlRefrigerationDevice.SelectedValue);
          
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                refrigerationLog.CorrectiveAction1 = 0;
            }
            else
            {
                refrigerationLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            refrigerationLog.VerifiedBy = txtVerifiedBy.Text;
            refrigerationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            refrigerationLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                refrigerationLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                refrigerationLog.UserName = (string)Session["UserName"];
            }
            refrigerationLog.MobileId = int.Parse(hfMobileId.Value);
            ProcessSetRefrigerationLog setRefrigerationLog = new ProcessSetRefrigerationLog();
            setRefrigerationLog.RefrigerationLog = refrigerationLog;
            setRefrigerationLog.Invoke();


        }
        private void RemoveData()
        {
            RefrigerationLog refrigerationLog = new RefrigerationLog();
            refrigerationLog.RefrigerationLogId = int.Parse(Request.QueryString["Id"].ToString());
            ProcessDeleteRefrigerationLog removeRefrigerationLog = new ProcessDeleteRefrigerationLog();
            removeRefrigerationLog.RefrigerationLog = refrigerationLog;
            removeRefrigerationLog.Invoke();

        }

        protected void cmdAdd_Click(object sender, ImageClickEventArgs e)
        {
            if (Page.IsValid)
            {
                mode = "new";
                InsertData();
                SetPage();
            }
        }
        protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
        {
            mode = "new";
            SetPage();
            CustomValidator2.IsValid = true;

        }
        protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
        {
            mode = "new";
            RemoveData();
            SetPage();
            CustomValidator2.IsValid = true;
        }
        protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
        {
            if (Page.IsValid)
            {
                mode = "new";
                SubmitData();
                SetPage();
            }
        }
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
           
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
        protected void ValidateTemp1(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;

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