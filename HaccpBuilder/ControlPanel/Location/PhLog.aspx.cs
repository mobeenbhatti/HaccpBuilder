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

public partial class ControlPanel_Location_PhLog : System.Web.UI.Page
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
            chkClear2.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction2.ClientID + "')");
            currentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]);
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
                ddlMenuItem.Enabled = false;
                ddlSenitizer.Enabled = false;
                ddlInventory.Enabled = false;
                rfvIngredient.Enabled = true;
                rfvMenuItem.Enabled = false;
                rfvSenitizer.Enabled = false;
                rfvInventory.Enabled = false;

            }
            if (rdbMenuItem.Checked == true)
            {
                ddlMenuItem.Enabled = true;
                ddlIngredient.Enabled = false;
                ddlSenitizer.Enabled = false;
                ddlInventory.Enabled = false;
                rfvIngredient.Enabled = false;
                rfvMenuItem.Enabled = true;
                rfvSenitizer.Enabled = false;
                rfvInventory.Enabled = false;
            }
            if (rdbSenitizer.Checked == true)
            {
                ddlSenitizer.Enabled = true;
                ddlMenuItem.Enabled = false;
                ddlInventory.Enabled = false;
                ddlIngredient.Enabled = false;
                rfvIngredient.Enabled = false;
                rfvMenuItem.Enabled = true;
                rfvSenitizer.Enabled = true;
                rfvInventory.Enabled = false;
            }

            if (rdbInventory.Checked == true)
            {
                ddlSenitizer.Enabled = false;
                ddlMenuItem.Enabled = false;
                ddlInventory.Enabled = true;
                ddlIngredient.Enabled = false;
                rfvIngredient.Enabled = false;
                rfvMenuItem.Enabled = false;
                rfvSenitizer.Enabled = false;
                rfvInventory.Enabled = true;
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
        SetTime(3, currentTime);       
        cldVerifiedDate.SelectedDate = currentTime.Date;
        txtEntryDate.Text = currentTime.ToString();

        if ((int)Session["TypeId"] != 1)
        {
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();            
            DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId((int)Session["KitchenId"], 9);
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
        string strDate, strItemId, strTime1, strTime2, strTime3;
        if (Request.QueryString["Id"] != null)
        {
            PhLog PhLog = new PhLog();
            PhLog.PhLogId = int.Parse(Request.QueryString["Id"]);
            ProcessGetPhLog getPhLog = new ProcessGetPhLog();
            getPhLog.PhLog = PhLog;
            getPhLog.Invoke();

            IDataReader logReader = getPhLog.ResultSet;
            if (logReader.Read())
            {
                
                strDate = DateTime.Parse(logReader["ServiceDate"].ToString()).ToShortDateString();                
                cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                if (logReader["ItemCategory"].ToString() == "1")
                {
                    rdbSenitizer.Checked = true;
                    ddlSenitizer.Enabled = true;                                   
                    rdbMenuItem.Checked = false;                   
                    ddlIngredient.Enabled = false;
                    ddlSenitizer.SelectedValue = logReader["ItemId"].ToString();
                    ddlMenuItem.Enabled = false;
                    ddlInventory.Enabled = false;
                }
                if (logReader["ItemCategory"].ToString() == "2")
                {
                    ddlSenitizer.Enabled = false;
                    rdbIngredient.Checked = true;                            
                    ddlMenuItem.Enabled = false;                   
                    ddlIngredient.Enabled = true;
                    ddlInventory.Enabled = false;
                    ddlIngredient.SelectedValue = logReader["ItemId"].ToString();
                }
                if (logReader["ItemCategory"].ToString() == "3")
                {

                    ddlSenitizer.Enabled = false;                  
                    rdbMenuItem.Checked = true;
                    ddlMenuItem.Enabled = true;
                    ddlIngredient.Enabled = false;
                    ddlInventory.Enabled = false;
                    ddlMenuItem.SelectedValue = logReader["ItemId"].ToString();
                }

                if (logReader["ItemCategory"].ToString() == "4")
                {
                    ddlSenitizer.Enabled = false;
                    ddlIngredient.Enabled = false;
                    ddlMenuItem.Enabled = false;
                    ddlInventory.Enabled = true;
                    rdbInventory.Checked = true;
                    ddlInventory.SelectedValue = logReader["ItemId"].ToString();

                }

                if (logReader["PhLevel"].ToString() != "99999.00")
                {
                    txtPhLevel.Text = logReader["PhLevel"].ToString();
                    this.ViewState["Temp1"] = logReader["PhLevel"].ToString();
                }
                else
                {
                    txtPhLevel.Text = "";
                    this.ViewState["Temp1"] = "";
                }
                if (logReader["WaterTemp"].ToString() != "99999.00")
                {
                    txtWaterTemp.Text = logReader["WaterTemp"].ToString();

                }
                else
                {
                    txtWaterTemp.Text = "";

                }

                if (logReader["ContactMinutes"].ToString() != "99999")
                {
                    txtContactMinutes.Text = logReader["ContactMinutes"].ToString();

                }
                else
                {
                    txtContactMinutes.Text = "";

                }
                
                strTime1 = DateTime.Parse(logReader["PhLevelTime"].ToString()).ToShortTimeString();
                SetTime(1, DateTime.Parse(strTime1));
                strTime2 = DateTime.Parse(logReader["WaterTempTime"].ToString()).ToShortTimeString();
                SetTime(2, DateTime.Parse(strTime2));
                strTime3 = DateTime.Parse(logReader["ContactTime"].ToString()).ToShortTimeString();
                SetTime(3, DateTime.Parse(strTime3));  
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                txtBarch.Text = logReader["BatchNumber"].ToString();
                txtVolume.Text = logReader["Volume"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                txtEntryDate.Text = logReader["EntryDate"].ToString();
                if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                {
                    SetPageInEditMode("edit");
                    
                    Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                    Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                    Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName3"].ToString();
                    rdlCorrectiveAction1.Visible = false;
                    rdlCorrectiveAction2.Visible = false;
                    Lbl_CorrectiveAction1.Visible = true;
                    Lbl_CorrectiveAction2.Visible = true;
                    Lbl_CorrectiveAction3.Visible = true;

                }
                else
                {
                    SetPageInEditMode("new");
                    rdlCorrectiveAction1.Visible = true;
                    rdlCorrectiveAction2.Visible = true;
                    Lbl_CorrectiveAction1.Visible = false;
                    Lbl_CorrectiveAction2.Visible = false;
                    Lbl_CorrectiveAction3.Visible = false;
                    rdlCorrectiveAction1.DataBind();
                    rdlCorrectiveAction2.DataBind();
                    for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveActionPhLevel"].ToString())
                        {
                            rdlCorrectiveAction1.Items[i].Selected = true;
                            break;
                        }
                    }
                    for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveActionWaterTemp"].ToString())
                        {
                            rdlCorrectiveAction2.Items[i].Selected = true;
                            break;
                        }
                    }
                    for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveActionContact"].ToString())
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
                ProcessGetPhLog getPhLog = new ProcessGetPhLog();
                IDataReader logReader = getPhLog.GetPhLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), (int)Session["KitchenId"]);

                if (logReader.Read())
                {
                    Session["PhLogId"] = int.Parse(logReader["Id"].ToString());
                    strDate = DateTime.Parse(logReader["ServiceDate"].ToString()).ToShortDateString();
                    
                    cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                    if (logReader["ItemCategory"].ToString() == "1")
                    {
                        rdbSenitizer.Checked = true;
                        ddlSenitizer.Enabled = true;
                        rdbMenuItem.Checked = false;
                        ddlIngredient.Enabled = false;
                        ddlSenitizer.SelectedValue = logReader["ItemId"].ToString();
                        ddlMenuItem.Enabled = false;
                        ddlInventory.Enabled = false;
                    }
                    if (logReader["ItemCategory"].ToString() == "2")
                    {
                        ddlSenitizer.Enabled = false;
                        rdbIngredient.Checked = true;
                        ddlMenuItem.Enabled = false;
                        ddlIngredient.Enabled = true;
                        ddlInventory.Enabled = false;
                        ddlIngredient.SelectedValue = logReader["ItemId"].ToString();
                    }
                    if (logReader["ItemCategory"].ToString() == "3")
                    {

                        ddlSenitizer.Enabled = false;
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        ddlIngredient.Enabled = false;
                        ddlInventory.Enabled = false;
                        ddlMenuItem.SelectedValue = logReader["ItemId"].ToString();
                    }

                    if (logReader["ItemCategory"].ToString() == "4")
                    {
                        ddlSenitizer.Enabled = false;
                        ddlIngredient.Enabled = false;
                        ddlMenuItem.Enabled = false;
                        ddlInventory.Enabled = true;
                        rdbInventory.Checked = true;
                        ddlInventory.SelectedValue = logReader["ItemId"].ToString();

                    }
                    if (logReader["PhLevel"].ToString() != "99999.00")
                    {
                        txtPhLevel.Text = logReader["PhLevel"].ToString();
                        this.ViewState["Temp1"] = logReader["PhLevel"].ToString();
                    }
                    else
                    {
                        txtPhLevel.Text = "";
                        this.ViewState["Temp1"] = "";
                    }                                   
                    if (logReader["WaterTemp"].ToString() != "99999.00")
                    {
                        txtWaterTemp.Text = logReader["WaterTemp"].ToString();

                    }
                    else
                    {
                        txtWaterTemp.Text = "";

                    }
                    if (logReader["ContactMinutes"].ToString() != "99999")
                    {
                        txtContactMinutes.Text = logReader["ContactMinutes"].ToString();

                    }
                    else
                    {
                        txtContactMinutes.Text = "";

                    }
                    strTime1 = DateTime.Parse(logReader["PhLevelTime"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                    strTime2 = DateTime.Parse(logReader["WaterTempTime"].ToString()).ToShortTimeString();
                    SetTime(2, DateTime.Parse(strTime2));
                    strTime3 = DateTime.Parse(logReader["ContactTime"].ToString()).ToShortTimeString();
                    SetTime(3, DateTime.Parse(strTime3));
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    txtBarch.Text = logReader["BatchNumber"].ToString();
                    txtVolume.Text = logReader["Volume"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");

                        Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                        Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                        Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName3"].ToString();
                        rdlCorrectiveAction1.Visible = false;
                        rdlCorrectiveAction2.Visible = false;
                        Lbl_CorrectiveAction1.Visible = true;
                        Lbl_CorrectiveAction2.Visible = true;
                        Lbl_CorrectiveAction3.Visible = true;

                    }
                    else
                    {
                        SetPageInEditMode("new");
                        rdlCorrectiveAction1.Visible = true;
                        rdlCorrectiveAction2.Visible = true;
                        Lbl_CorrectiveAction1.Visible = false;
                        Lbl_CorrectiveAction2.Visible = false;
                        Lbl_CorrectiveAction3.Visible = false;
                        rdlCorrectiveAction1.DataBind();
                        rdlCorrectiveAction2.DataBind();
                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveActionPhLevel"].ToString())
                            {
                                rdlCorrectiveAction1.Items[i].Selected = true;
                                break;
                            }
                        }
                        for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveActionWaterTemp"].ToString())
                            {
                                rdlCorrectiveAction2.Items[i].Selected = true;
                                break;
                            }
                        }
                        for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveActionContact"].ToString())
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
           
            txtPhLevel.Text = "";          
            SetTime(4, currentTime);            
            txtWaterTemp.Text = "";
            txtContactMinutes.Text = "";
            txtBarch.Text = "";
            txtVolume.Text = "";
            //txtVerifiedBy.Text = Session["Initials"].ToString();
            txtVerifiedBy.Text = "";
            cldVerifiedDate.SelectedDate = currentTime.Date;
            cldEntryDate.SelectedDate = currentTime.Date;
            rdbMenuItem.Checked = false;
            rdbIngredient.Checked = false;
            rdbInventory.Checked = false;
            rdbSenitizer.Checked = true;
            trClearCorrectiveActions.Style.Add("display", "''");
            trClearCorrectiveActions2.Style.Add("display", "''");           
            ddlMenuItem.Enabled = false;
            ddlInventory.Enabled = false;
            ddlIngredient.Enabled = false;            
            ddlSenitizer.Enabled = true;
            rfvIngredient.Enabled = false;
            rfvMenuItem.Enabled = false;
            rfvInventory.Enabled = false;
            rfvSenitizer.Enabled = true;
            cmdAdd.Visible = true;
            cmdCancel.Visible = true;
            LogError.Text = "";
            cmdDelete.Visible = false;   
            cmdSubmit.Visible = false;
            rdlCorrectiveAction1.SelectedIndex = -1;
            rdlCorrectiveAction2.SelectedIndex = -1;
            rdlCorrectiveAction3.SelectedIndex = -1;                     
            rdlCorrectiveAction1.DataBind();
            rdlCorrectiveAction2.DataBind();
            rdlCorrectiveAction3.DataBind();
            rdlCorrectiveAction1.Visible = true;
            rdlCorrectiveAction2.Visible = true;
            rdlCorrectiveAction3.Visible = true;
            Lbl_CorrectiveAction1.Visible = false;
            Lbl_CorrectiveAction2.Visible = false;
            Lbl_CorrectiveAction3.Visible = false;
            GetInitialData(); 

        }
        if (mode == "edit")
        {
            SetPageInEditMode("edit");

        }
        grdPh.DataBind();
        ddlIngredient.DataBind();
        ddlIngredient.Items.Insert(0, "Select Input");
        ddlIngredient.SelectedIndex = 0;
        ddlMenuItem.DataBind();
        ddlMenuItem.Items.Insert(0, "Select Output");
        ddlMenuItem.SelectedIndex = 0;
        ddlSenitizer.DataBind();
        ddlSenitizer.Items.Insert(0, "Select Cleaning Solutions/Sanitizers");
        ddlSenitizer.SelectedIndex = 0;
        ddlInventory.DataBind();
        ddlInventory.Items.Insert(0, "Select Equipment/Inventory");
        ddlInventory.SelectedIndex = 0;

    }
    private void SetPageInEditMode(string type)
    {
        if (type == "new")
        {
            txtPhLevel.Enabled = true;
            tpHour1.Enabled = true;
            tpMinute1.Enabled = true;
            tpTime1.Enabled = true;
            tpTime2.Enabled = true;
            tpHour2.Enabled = true;
            tpMinute2.Enabled = true;
            tpHour3.Enabled = true;
            tpMinute3.Enabled = true;
            tpTime3.Enabled = true;
            txtWaterTemp.Enabled = true;
            txtContactMinutes.Enabled = true;
            txtVerifiedBy.Enabled = true;
            txtVolume.Enabled = true;
            txtBarch.Enabled = true;
            cldVerifiedDate.Enabled = true;
            cldEntryDate.Enabled = true;
            rdbMenuItem.Enabled = true;
            rdbIngredient.Enabled = true;
            trClearCorrectiveActions.Style.Add("display", "''");
            trClearCorrectiveActions2.Style.Add("display", "''");
           // rdbNoItem.Enabled = true;

            LogError.Text = "";

            cmdAdd.Visible = false;
            cmdCancel.Visible = true;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
        }
        else if (type == "edit")
        {
            txtVerifiedBy.Enabled = false;
            txtPhLevel.Enabled = false;           
            tpTime1.Enabled = false;
            tpHour1.Enabled = false;
            tpMinute1.Enabled = false;
            tpTime2.Enabled = false;
            tpHour2.Enabled = false;
            tpMinute2.Enabled = false;
            tpHour3.Enabled = false;
            tpMinute3.Enabled = false;
            tpTime3.Enabled = false;
            txtWaterTemp.Enabled = false;
            txtContactMinutes.Enabled = false;
            txtVolume.Enabled = false;
            txtBarch.Enabled = false;
            txtVerifiedBy.Enabled = false;
            cldVerifiedDate.Enabled = false;
            cldEntryDate.Enabled = false;
            rdbMenuItem.Enabled = false;
            trClearCorrectiveActions.Style.Add("display", "none");
            trClearCorrectiveActions2.Style.Add("display", "none");
            rdbIngredient.Enabled = false;
          //  rdbNoItem.Enabled = false;
            ddlMenuItem.Enabled = false;
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
        PhLog PhLog = new PhLog();        
        PhLog.ServiceDate = cldEntryDate.SelectedDate;
        if (rdbIngredient.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlIngredient.SelectedValue);           
            PhLog.ItemCategory = 2;
        }
        if (rdbMenuItem.Checked == true)
        {            
            PhLog.ItemId = int.Parse(ddlMenuItem.SelectedValue);
            PhLog.ItemCategory = 3;
        }
        if (rdbInventory.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlInventory.SelectedValue);
            PhLog.ItemCategory = 4;
        }
        if (rdbSenitizer.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlSenitizer.SelectedValue);
            PhLog.ItemCategory = 1;
        }
       
        if (txtPhLevel.Text != "")
        {
            PhLog.PhLevel = txtPhLevel.Text;
        }
       
        if (tpHour1.Text != "")
        {
            PhLog.PhLevelTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            PhLog.PhLevelTime = DateTime.Now;

        }
        if (txtWaterTemp.Text != "")
        {
            PhLog.WaterTemp = txtWaterTemp.Text;
        }
       
        if (tpHour2.Text != "")
        {
            PhLog.WaterTempTime = DateTime.Parse(GetTime(2));
        }
        else
        {
            PhLog.WaterTempTime = DateTime.Now;

        }
        if (txtContactMinutes.Text != "")
        {
            PhLog.ContactMinutes = txtContactMinutes.Text;
        }

        if (tpHour3.Text != "")
        {
            PhLog.ContactTime = DateTime.Parse(GetTime(3));
        }
        else
        {
            PhLog.ContactTime = DateTime.Now;

        }
        PhLog.BatchNumber = txtBarch.Text;
        PhLog.Volume = txtVolume.Text;
        PhLog.VerifiedBy = txtVerifiedBy.Text;
        PhLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        PhLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            PhLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            PhLog.UserName = (string)Session["UserName"];
        }
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionPhLevel = 0;
        }
        else
        {
            
            PhLog.CorrectiveActionPhLevel = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        if (rdlCorrectiveAction2.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionWaterTemp = 0;
        }
        else
        {
            PhLog.CorrectiveActionWaterTemp = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }
        if (rdlCorrectiveAction3.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionContact = 0;
        }
        else
        {
            PhLog.CorrectiveActionContact = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }

        if (Session["MobileId"] != null)
        {
            PhLog.MobileId = (int)Session["MobileId"];
        }
        ProcessCreatePhLog createPhLog = new ProcessCreatePhLog();
        createPhLog.PhLog = PhLog;
        createPhLog.Invoke();

    }

    private bool EnableDisableTemp_Add(int mode)
    {
        bool result = true; ;
        //if (rdbNoItem.Checked == true && rdbIngredient.Checked == false && rdbMenuItem.Checked == false)
        //{
        //    result = true;
        //}
    if (rdbIngredient.Checked == true || rdbMenuItem.Checked == true || rdbInventory.Checked == true || rdbSenitizer.Checked == true)
        {
            if (mode == 1)
            {
                if (txtPhLevel.Text == "")
                {
                    LogError.Text += "<br/>Please fill pH level field";
                    result = false;
                }
                else
                {
                    result = true;
                }

            }
            else if (mode == 2)
            {

                //if (float.Parse(txtPhLevel.Text) ==  float.Parse(this.ViewState["Temp1"].ToString()))
                if (txtPhLevel.Text == this.ViewState["Temp1"].ToString())
                {
                    if (txtPhLevel.Text == "")
                    {
                        LogError.Text += "<br/>Please fill pH level field ";
                        result = false;
                    }
                    if (txtWaterTemp.Text == "")
                    {
                        LogError.Text += "<br/>Please fill Water Temp field. </ br>";
                        result = false;
                    }

                }
                //else if (float.Parse(txtPhLevel.Text) != float.Parse(this.ViewState["Temp1"].ToString()))
                else if (txtPhLevel.Text != this.ViewState["Temp1"].ToString())
                {
                    if (txtPhLevel.Text == "")
                    {
                        LogError.Text += "<br/>Please fill pH level field </ br>";
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
    private bool CheckPage(int nMode)
    {
        bool result = true;

        if (rdbIngredient.Checked == true && ddlIngredient.SelectedItem.Text == "Select Input")
        {
            LogError.Text += "<br/>Please Select Input";
            result = false;
        }

        if (rdbMenuItem.Checked == true && ddlMenuItem.SelectedItem.Text == "Select Output")
        {
            LogError.Text += "<br/>Please Select Output";
            result = false;
        }

        if (rdbInventory.Checked == true && ddlInventory.SelectedItem.Text == "Select Equipment/Inventory")
        {
            LogError.Text += "<br/>Select Equipment/Inventory";
            result = false;
        }

        if (rdbSenitizer.Checked == true && ddlSenitizer.SelectedItem.Text == "Select Cleaning Solutions/Sanitizers")
        {
            LogError.Text += "<br/>Select Cleaning Solutions/Sanitizers";
            result = false;
        }
        if (tpTime1.Text != "")
        {
            if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
            {
                if (DateTime.Parse(GetTime(1)) > DateTime.Now)
                {
                    LogError.Text += " <br />Please enter correct time in ‘pH level time’ field";
                    result = false;

                }
            }
        }
       
        if (tpTime2.Text != "")
        {
            if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
            {
                if (DateTime.Parse(GetTime(2)) > DateTime.Now)
                {
                    LogError.Text += " <br />Please enter correct time in ‘Water temp time’ field";
                    result = false;

                }
            }
        }

        if (tpTime3.Text != "")
        {
            if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
            {
                if (DateTime.Parse(GetTime(3)) > DateTime.Now)
                {
                    LogError.Text += " <br />Please enter correct time in ‘Contact time’ field";
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
    private void SubmitData()
    {
        PhLog PhLog = new PhLog();
        if (Request.QueryString["Id"] != null)
        {
            PhLog.PhLogId = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["PhLogId"] != null)
            {
                PhLog.PhLogId = (int)Session["PhLogId"];
            }
        }
        PhLog.ServiceDate = cldEntryDate.SelectedDate;
        if (rdbIngredient.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlIngredient.SelectedValue);            
            PhLog.ItemCategory = 2;
        }
        if (rdbMenuItem.Checked == true)
        {            
            PhLog.ItemId = int.Parse(ddlMenuItem.SelectedValue);
            PhLog.ItemCategory = 3;
        }
        if (rdbInventory.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlInventory.SelectedValue);
            PhLog.ItemCategory = 4;
        }
        if (rdbSenitizer.Checked == true)
        {
            PhLog.ItemId = int.Parse(ddlSenitizer.SelectedValue);
            PhLog.ItemCategory = 1;
        }       
       
        if (txtPhLevel.Text != "")
        {
            PhLog.PhLevel = txtPhLevel.Text;
        }       
        if (tpHour1.Text != "")
        {
            PhLog.PhLevelTime = DateTime.Parse(GetTime(1));
        }
        else
        {
            PhLog.PhLevelTime = DateTime.Now;

        }
        if (txtWaterTemp.Text != "")
        {
            PhLog.WaterTemp = txtWaterTemp.Text;
        }
        
        if (tpHour2.Text != "")
        {
            PhLog.WaterTempTime = DateTime.Parse(GetTime(2));
        }
        else
        {
            PhLog.WaterTempTime = DateTime.Now;

        }
        if (txtContactMinutes.Text != "")
        {
            PhLog.ContactMinutes = txtContactMinutes.Text;
        }

        if (tpHour3.Text != "")
        {
            PhLog.ContactTime = DateTime.Parse(GetTime(3));
        }
        else
        {
            PhLog.ContactTime = DateTime.Now;

        }
       
        if (rdlCorrectiveAction1.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionPhLevel = 0;
        }
        else
        {
            PhLog.CorrectiveActionPhLevel = int.Parse(rdlCorrectiveAction1.SelectedValue);
        }
        if (rdlCorrectiveAction2.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionWaterTemp = 0;
        }
        else
        {
            PhLog.CorrectiveActionWaterTemp = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }
        if (rdlCorrectiveAction3.SelectedIndex == -1)
        {
            PhLog.CorrectiveActionContact = 0;
        }
        else
        {
            PhLog.CorrectiveActionContact = int.Parse(rdlCorrectiveAction2.SelectedValue);
        }
        PhLog.BatchNumber = txtBarch.Text;
        PhLog.Volume = txtVolume.Text;
        PhLog.VerifiedBy = txtVerifiedBy.Text;
        PhLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        PhLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            PhLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            PhLog.UserName = (string)Session["UserName"];
        }
        if (Session["MobileId"] != null)
        {
            PhLog.MobileId = (int)Session["MobileId"];
        }
        ProcessSetPhLog setPhLog = new ProcessSetPhLog();
        setPhLog.PhLog = PhLog;
        setPhLog.Invoke();


    }
    private void RemoveData()
    {
        PhLog PhLog = new PhLog();
        PhLog.PhLogId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeletePhLog removePhLog = new ProcessDeletePhLog();
        removePhLog.PhLog = PhLog;
        removePhLog.Invoke();

    }
    protected void ValidateTemp1(object source, ServerValidateEventArgs args)
    {
        int nResult = 0;
        //if (rdbNoItem.Checked != true)
        //{

            if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
            {
                if (txtPhLevel.Text != "")
                {
                    if (float.Parse(txtPhLevel.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtPhLevel.Text) > float.Parse(hfTempHigh.Value))
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
                if (txtWaterTemp.Text != "")
                {
                    if (float.Parse(txtWaterTemp.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtWaterTemp.Text) > float.Parse(hfTempHigh.Value))
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
            //}
        }
    }
    protected void ValidateTemp3(object source, ServerValidateEventArgs args)
    {
        int nResult = 0;
        //if (rdbNoItem.Checked != true)
        //{
        if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
        {
            if (txtContactMinutes.Text != "")
            {
                if (float.Parse(txtContactMinutes.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtContactMinutes.Text) > float.Parse(hfTempHigh.Value))
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
            //}
        }
    }
    private string GetTime(int nPeriod)
    {
        if (nPeriod == 1)
        {
            return tpHour1.Text + ":" + tpMinute1.Text + tpTime1.SelectedValue;
        }
        else
        {
            return tpHour2.Text + ":" + tpMinute2.Text + tpTime2.SelectedValue;
        }
    }
    private void SetTime(int nPeriod, DateTime dtTime)
    {
        if (nPeriod == 1)
        {
            tpHour1.Text = dtTime.ToString("hh");
            tpMinute1.Text = dtTime.ToString("mm");
            tpTime1.Text = dtTime.ToString("tt");
        }
        else if (nPeriod == 2)
        {
            tpHour2.Text = dtTime.ToString("hh");
            tpMinute2.Text = dtTime.ToString("mm");
            tpTime2.Text = dtTime.ToString("tt");
        }
        else if (nPeriod == 3)
        {
            tpHour3.Text = dtTime.ToString("hh");
            tpMinute3.Text = dtTime.ToString("mm");
            tpTime3.Text = dtTime.ToString("tt");
        }
        else
        {
            tpHour1.Text = dtTime.ToString("hh");
            tpMinute1.Text = dtTime.ToString("mm");
            tpTime1.Text = dtTime.ToString("tt");
            tpHour2.Text = dtTime.ToString("hh");
            tpMinute2.Text = dtTime.ToString("mm");
            tpTime2.Text = dtTime.ToString("tt");
            tpHour3.Text = dtTime.ToString("hh");
            tpMinute3.Text = dtTime.ToString("mm");
            tpTime3.Text = dtTime.ToString("tt");
        }

    }
    //protected void ddlServiceDate_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlServiceDate.SelectedIndex > 0)
    //    {
    //        SetItemCategoryDropDown("");
    //    }
    //}
    //private void SetItemCategoryDropDown(string strItemCategory)
    //{
    //    while (ddlItemCategory.Items.Count >= 1)
    //    {
    //        ListItem item = ddlItemCategory.Items[0];
    //        ddlItemCategory.Items.Remove(item);
    //    }

    //    ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
    //    DataSet dsItemCategory = menuItems.GetMealServingMenuItems(DateTime.Parse(ddlServiceDate.SelectedValue),(int)Session["KitchenId"]);
    //    ListItem tempItem = new ListItem("No Food/Menu Item", "0");
    //    ddlItemCategory.Items.Add(tempItem);
    //    foreach (DataRow drItemCategory in dsItemCategory.Tables[0].Rows)
    //    {
    //        ListItem ItemCategory = new ListItem();
    //        ItemCategory.Text = drItemCategory["ItemId"].ToString() + " " + drItemCategory["MenuItem"].ToString();
    //        ItemCategory.Value = drItemCategory["Id"].ToString();
    //        ddlItemCategory.Items.Add(ItemCategory);

    //    }
    //    if (strItemCategory != "")
    //    {
    //        ddlItemCategory.SelectedValue = strItemCategory;
    //    }
    //}
    //private void SetEditableMode(string strDate, string strMenuItem, string strItemId, string strItemId)
    //{
    //    ListItem ItemCategory = new ListItem();
    //    ItemCategory.Text = strItemId + " " + strMenuItem;
    //    ItemCategory.Value = strItemId;

    //    ListItem ServiceDate = new ListItem();
    //    ServiceDate.Text = strDate;
    //    ServiceDate.Value = strDate;
    //    while (ddlItemCategory.Items.Count >= 1)
    //    {
    //        ListItem item = ddlItemCategory.Items[0];
    //        ddlItemCategory.Items.Remove(item);
    //    }
    //    while (ddlServiceDate.Items.Count >= 1)
    //    {
    //        ListItem item = ddlServiceDate.Items[0];
    //        ddlServiceDate.Items.Remove(item);
    //    }
    //    ddlItemCategory.Items.Add(ItemCategory);
    //    ddlItemCategory.SelectedIndex = 0;
    //    ddlServiceDate.Items.Add(ServiceDate);
    //    ddlServiceDate.SelectedIndex = 0;

    //}
    //private int CheckDate(string strCheckDate)
    //{
    //    for (int i = 0; i < ddlServiceDate.Items.Count; i++)
    //    {
    //        if (ddlServiceDate.Items[i].Value == strCheckDate)
    //            return 1;
    //    }
    //    return 0;
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
