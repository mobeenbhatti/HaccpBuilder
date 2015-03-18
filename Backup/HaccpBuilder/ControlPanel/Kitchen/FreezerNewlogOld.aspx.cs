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


public partial class ControlPanel_Kitchen_FreezerNewlog : System.Web.UI.Page
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
            DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId(KitchenId, 7);
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
            FreezerNewLog freezerNewLog = new FreezerNewLog();
            freezerNewLog.FreezerNewLogId = int.Parse(Request.QueryString["Id"]);
            ProcessGetFreezerNewLog getFreezerNewLog = new ProcessGetFreezerNewLog();
            getFreezerNewLog.FreezerNewLog = freezerNewLog;
            getFreezerNewLog.Invoke();
   
            IDataReader logReader = getFreezerNewLog.ResultSet;
            if (logReader.Read())
            {
                cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                //txtLocation.Text = logReader["Location"].ToString();
                if (logReader["CustomInventoryID"].ToString() == "")
                {
                    ddlFreezerNewLogDevice.SelectedIndex = 0;
                }
                else
                {
                    ddlFreezerNewLogDevice.SelectedValue = logReader["CustomInventoryID"].ToString();
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
                ProcessGetFreezerNewLog getFreezerNewLog = new ProcessGetFreezerNewLog();
                IDataReader logReader = getFreezerNewLog.GetFreezerNewLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()),KitchenId);
                if (logReader.Read())
                {
                    Session["FreezerNewLogId"] = int.Parse(logReader["Id"].ToString());
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                   // txtLocation.Text = logReader["Location"].ToString();
                    if (logReader["CustomInventoryID"].ToString() == "")
                    {
                        ddlFreezerNewLogDevice.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlFreezerNewLogDevice.SelectedValue = logReader["CustomInventoryID"].ToString();
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
            //txtLocation.Text = "";
            ddlFreezerNewLogDevice.SelectedIndex = 0;
            txtTemperature.Text = "";
            SetTime(1, currentTime);
            //txtCorrectiveAction.Text = "";
           // txtVerifiedBy.Text = Session["UserName"].ToString();
            txtVerifiedBy.Text = "";
            txtEntryDate.Text = currentTime.ToString();
            rdlCorrectiveAction1.SelectedIndex = -1;
            cmdAdd.Visible = true;
            cmdCancel.Visible = true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;
            trClearCorrectiveActions.Style.Add("display", "''");
            rdlCorrectiveAction1.DataBind();
           
            GetInitialData();
            rdlCorrectiveAction1.Visible = true;
            Lbl_CorrectiveAction1.Visible = false;
 

        }
        if (mode == "edit")
        {
            SetPageInEditMode("edit");
        
        }
        grdHotHolding.DataBind();
   
        ddlFreezerNewLogDevice.DataBind();
        ddlFreezerNewLogDevice.Items.Insert(0, "Select Freezer Device");
        ddlFreezerNewLogDevice.SelectedIndex = 0;
      
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
            trClearCorrectiveActions.Style.Add("display", "''");
            ddlFreezerNewLogDevice.Enabled = true;
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
            ddlFreezerNewLogDevice.Enabled = false;
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
        //ddlFreezerNewLogDevice.DataBind();
        SetPage();
    }

    private void InsertData()
    {
        FreezerNewLog freezerNewLog = new FreezerNewLog();
        freezerNewLog.MealDate = cldMealDate.SelectedDate;
        if (txtTemperature.Text != "")
        {
            freezerNewLog.Temperature = float.Parse(txtTemperature.Text);
        }
        if (tpHour1.Text != "")
        {
            freezerNewLog.TempTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            freezerNewLog.TempTime = DateTime.Now;

        }
        //freezerNewLog.Location = txtLocation.Text;

        freezerNewLog.FreezerNewLogDevice = int.Parse(ddlFreezerNewLogDevice.SelectedValue);
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    freezerNewLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    freezerNewLog.CorrectiveAction = null;
        //}
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            freezerNewLog.CorrectiveAction1 = 0;
        }
        else
        {
            freezerNewLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        freezerNewLog.VerifiedBy = txtVerifiedBy.Text;
        freezerNewLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        freezerNewLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            freezerNewLog.KitchenId = KitchenId;
        }
        if (Session["UserName"] != null)
        {
            freezerNewLog.UserName = (string)Session["UserName"];
        }

        ProcessCreateFreezerNewLog createFreezerNewLog = new ProcessCreateFreezerNewLog();
        createFreezerNewLog.FreezerNewLog = freezerNewLog;
        createFreezerNewLog.Invoke();

    }
    private void SubmitData()
    {
        FreezerNewLog freezerNewLog = new FreezerNewLog();
        if (Request.QueryString["Id"] != null)
        {
            freezerNewLog.FreezerNewLogId = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["FreezerNewLogId"] != null)
            {
                freezerNewLog.FreezerNewLogId = (int)Session["FreezerNewLogId"];
            }
        }

        freezerNewLog.MealDate = cldMealDate.SelectedDate;
        if (txtTemperature.Text != "")
        {
            freezerNewLog.Temperature = float.Parse(txtTemperature.Text);
        }
        if (tpHour1.Text != "")
        {
            freezerNewLog.TempTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            freezerNewLog.TempTime = DateTime.Now;

        }
        freezerNewLog.FreezerNewLogDevice = int.Parse(ddlFreezerNewLogDevice.SelectedValue);
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    freezerNewLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    freezerNewLog.CorrectiveAction = null;
        //}
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            freezerNewLog.CorrectiveAction1 = 0;
        }
        else
        {
            freezerNewLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        freezerNewLog.VerifiedBy = txtVerifiedBy.Text;
        freezerNewLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        freezerNewLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            freezerNewLog.KitchenId = KitchenId;
        }
        if (Session["UserName"] != null)
        {
            freezerNewLog.UserName = (string)Session["UserName"];
        }
        freezerNewLog.MobileId = int.Parse(hfMobileId.Value);
        ProcessSetFreezerNewLog setFreezerNewLog = new ProcessSetFreezerNewLog();
        setFreezerNewLog.FreezerNewLog = freezerNewLog;
        setFreezerNewLog.Invoke();


    }
    private void RemoveData()
    {
        FreezerNewLog freezerNewLog = new FreezerNewLog();
        freezerNewLog.FreezerNewLogId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteFreezerNewLog removeFreezerNewLog = new ProcessDeleteFreezerNewLog();
        removeFreezerNewLog.FreezerNewLog = freezerNewLog;
        removeFreezerNewLog.Invoke();

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
        //if (hfTempHigh.Value != "NA")
        //{
        //    if (txtTemperature.Text != "")
        //    {
        //        if ((float.Parse(txtTemperature.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemperature.Text) > float.Parse(hfTempHigh.Value)) && txtCorrectiveAction.Text == "")
        //        {
        //            args.IsValid = false;
        //        }
        //    }
        //}
    }
    //     var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
    //// var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
    // var txtTemp1 = document.getElementById('PlaceHolder_txtTemperature');
     
    // var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
    // var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
    // var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

      
    // if (hfTempHigh.value != 'NA') {
    //     if (txtTemp1.value != '') {
    //         if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
    //             ValidatorEnable(vldMenuItem, true);
    //             args.IsValid = false;
    //         }
    //     }
    // }
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
    //protected void cmdClear_Click(object sender, EventArgs e)
    //{
    //    rdlCorrectiveAction1.ClearSelection();
    //}
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




