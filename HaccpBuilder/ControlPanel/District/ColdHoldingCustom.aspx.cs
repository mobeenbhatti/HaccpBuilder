using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_ColdHoldingCustom : System.Web.UI.Page
{
    public static int mode = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            if (Request.QueryString["LogType"] != null)
            {
                GetData();
               // hlCancel.NavigateUrl += "?KitchenName=" + (string)Session["KitchenName"];
                if ((int)Session["TypeId"] == 2)
                {

                    hlCancel.NavigateUrl = "~/ControlPanel/District/CreateHBFlexR.aspx?KitchenName=" + (string)Session["KitchenName"];

                }
                else if ((int)Session["TypeId"] == 1)
                {
                    // Command Central Corporate
                    hlCancel.NavigateUrl = "~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + (string)Session["KitchenName"];
                }
                if (Request.QueryString["LogType"] == "10" || Request.QueryString["LogType"] == "11" || Request.QueryString["LogType"] == "12")
                {
                   // pnlCriticalLimits.Visible = false;
                    tblCriticalLimits.Visible = false;

                }
            }
        }

    }


    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (tblCriticalLimits.Visible == true)
        {
            UpdateCriticalLimits();
        }
        UpdateCorrectiveActions();
        ModalPopupExtender1.PopupControlID = divPopup1.ID;
        ModalPopupExtender1.PopupDragHandleControlID = panelDragHandle1.ID;
        ModalPopupExtender1.Show();
    }
    protected void cmdClose_Click(object sender, EventArgs e)
    {
        InsertCorrectiveAction();       
        if (mode != 0)
        {
            KitchenCorrectiveAction correctiveAction = new KitchenCorrectiveAction();
            correctiveAction.CorrectiveActionID = int.Parse(hfCorrectiveActionId.Value);
            correctiveAction.IsInclude = 0;
            correctiveAction.KitchenId = (int)Session["KitchenId"];
            correctiveAction.LogTypeID = int.Parse(Request.QueryString["LogType"]);
            correctiveAction.Name = hfCorrectiveActionName.Value;
            correctiveAction.Status = 0;
           
            ProcessSetKitchenCorrectiveAction setCorrectiveAction = new ProcessSetKitchenCorrectiveAction();
            setCorrectiveAction.KitchenCorrectiveAction = correctiveAction;
            setCorrectiveAction.Invoke();
        }
        grdCorrectiveAction.DataBind();
        rfvCorrectiveAction.Enabled = false;
        // RGK(03-22-10) Bug Id:1691
        //Increase the length to 100. Also make validator disable on clicking "Cancel" button
        revCorrectiveAction.Enabled = false;
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        rfvCorrectiveAction.Enabled = false;
        revCorrectiveAction.Enabled = false;
        
        
    }
    private void GetData()
    {
        ProcessGetFoodCategories getFoodCategory = new ProcessGetFoodCategories();
        ProcessGetCriticalLimits getCriticalLimit = new ProcessGetCriticalLimits();
        int nLogTypeId = Convert.ToInt32(Request.QueryString["LogType"]);
        DataSet dsCriticalLimit = getCriticalLimit.GetCriticalLimitsByKitchenId((int)Session["KitchenId"], nLogTypeId);
        if(dsCriticalLimit.Tables[0].Rows.Count > 0)
        {
            if (nLogTypeId == 2)
                foreach (DataRow dr in dsCriticalLimit.Tables[0].Rows)
                {
                    hfCriticalLimitId.Value = dr["CriticalLimitID"].ToString();
                    txtCclHigh.Text = dr["CCLTempHigh"].ToString();
                    txtCclLow.Text = dr["CCLTempLow"].ToString();
                    txtCclMax.Text = dr["CCLTime2"].ToString();
                    txtCclMin.Text = dr["CCLTime1"].ToString();
                    txtQclHigh.Text = dr["QCLTempHigh"].ToString();
                    txtQclLow.Text = dr["QCLTempLow"].ToString();
                    txtQclMax.Text = dr["QCLTime2"].ToString();
                    txtQclMin.Text = dr["QCLTime1"].ToString();
                    txtSclHigh.Text = dr["SCLTempHigh"].ToString();
                    txtSclLow.Text = dr["SCLTempLow"].ToString();
                    txtSclMax.Text = dr["SCLTime2"].ToString();
                    txtSclMin.Text = dr["SCLTime1"].ToString();

                    txtCclHigh1.Text = dr["CCLTempHigh2"].ToString();
                    txtCclLow1.Text = dr["CCLTempLow2"].ToString();
                    txtQclHigh1.Text = dr["QCLTempHigh2"].ToString();
                    txtQclLow1.Text = dr["QCLTempLow2"].ToString();
                    txtSclHigh1.Text = dr["SCLTempHigh2"].ToString();
                    txtSclLow1.Text = dr["SCLTempLow2"].ToString();

                    txtCclHigh2.Text = dr["CCLTempHigh3"].ToString();
                    txtCclLow2.Text = dr["CCLTempLow3"].ToString();
                    txtQclHigh2.Text = dr["QCLTempHigh3"].ToString();
                    txtQclLow2.Text = dr["QCLTempLow3"].ToString();
                    txtSclHigh2.Text = dr["SCLTempHigh3"].ToString();
                    txtSclLow2.Text = dr["SCLTempLow3"].ToString();

                    rfvCclHigh1.Enabled = true;
                    rfvCclHigh2.Enabled = true;
                    rfvCClLow1.Enabled = true;
                    rfvCClLow2.Enabled = true;
                    rfvQclHigh1.Enabled = true;
                    rfvQclHigh2.Enabled = true;
                    rfvQclLow1.Enabled = true;
                    rfvQClLow2.Enabled = true;
                    rfvSclHigh1.Enabled = true;
                    rfvSclHigh2.Enabled = true;
                    rfvSClLow1.Enabled = true;
                    rfvSClLow2.Enabled = true;
                }
            else
            {
                foreach (DataRow dr in dsCriticalLimit.Tables[0].Rows)
                {
                    hfCriticalLimitId.Value = dr["CriticalLimitID"].ToString();
                    txtCclHigh.Text = dr["CCLTempHigh"].ToString();
                    txtCclLow.Text = dr["CCLTempLow"].ToString();
                    txtCclMax.Text = dr["CCLTime2"].ToString();
                    txtCclMin.Text = dr["CCLTime1"].ToString();
                    txtQclHigh.Text = dr["QCLTempHigh"].ToString();
                    txtQclLow.Text = dr["QCLTempLow"].ToString();
                    txtQclMax.Text = dr["QCLTime2"].ToString();
                    txtQclMin.Text = dr["QCLTime1"].ToString();
                    txtSclHigh.Text = dr["SCLTempHigh"].ToString();
                    txtSclLow.Text = dr["SCLTempLow"].ToString();
                    txtSclMax.Text = dr["SCLTime2"].ToString();
                    txtSclMin.Text = dr["SCLTime1"].ToString();
                }
            }
        }
        switch (Convert.ToInt32(Request.QueryString["LogType"]))
        {
            case 1:
                lblLog.Text = "COLD HOLDING LOG";
                break;
            case 2:
                lblLog.Text = "COOLING TEMPERATURE LOG";
                tblTemperatureLog.Visible = true;
                break;
            case 3:
                lblLog.Text = "HOT HOLDING LOG";
                break;
            case 4:
                lblLog.Text = "RECEIVING LOG";
                break;
            //case 5:
            //    lblLog.Text = "RECEIVING LOG";
            //    break;
            case 5:
                lblLog.Text = "REFRIGERATION LOG";
                break;
            case 6:
                lblLog.Text = "THERMOMETER CALIBRATION LOG";
                break;
            case 7:
                lblLog.Text = "FREEZER LOG";
                break;
            case 8:
                lblLog.Text = "SHIPPING LOG";
                break;
            case 9:
                lblLog.Text = "PH LOG";
                break;
            case 10:
                lblLog.Text = "PEST LOG";
                break;
            case 11:
                lblLog.Text = "MAINTENANCE LOG";
                break;
            case 12:
                lblLog.Text = "CLEANING AND SANITIZATION LOG";
                break;
            default:
                lblLog.Text = "COLD HOLDING LOG";
                break;
        }//end switch statement
    }
    private void UpdateCriticalLimits()
    {
        
        ProcessSetCriticalLimits setLimits = new ProcessSetCriticalLimits();
        CriticalLimit criticalLimit = new CriticalLimit();
        criticalLimit.CriticalLimitID = int.Parse(hfCriticalLimitId.Value);
        criticalLimit.KitchenId = (int)Session["KitchenId"];
        criticalLimit.LogTypeID = int.Parse(Request.QueryString["LogType"]);

        //ctiricalLimit.CCLTempHigh = float.Parse(txtCclHigh.Text);
        //ctiricalLimit.CCLTempLow = float.Parse(txtCclLow.Text);
        //ctiricalLimit.CCLTime1 = int.Parse(txtCclMin.Text);
        //ctiricalLimit.CCLTime2 = int.Parse(txtCclMax.Text);
        //ctiricalLimit.QCLTempHigh = float.Parse(txtQclHigh.Text);
        //ctiricalLimit.QCLTempLow = float.Parse(txtQclLow.Text);
        //ctiricalLimit.QCLTime1 = int.Parse(txtQclMin.Text);
        //ctiricalLimit.QCLTime2 = int.Parse(txtQclMax.Text);
        //ctiricalLimit.SCLTempHigh = float.Parse(txtSclHigh.Text);
        //ctiricalLimit.SCLTempLow = float.Parse(txtSclLow.Text);
        //ctiricalLimit.SCLTime1 = int.Parse(txtSclMin.Text);
        //ctiricalLimit.SCLTime2 = int.Parse(txtSclMax.Text);

        //criticalLimit.CCLTempHigh = (txtCclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclHigh.Text);
        //criticalLimit.CCLTempLow = (txtCclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclLow.Text);
        //criticalLimit.CCLTime1 = (txtCclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtCclMin.Text);
        //criticalLimit.CCLTime2 = (txtCclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtCclMax.Text);
        //criticalLimit.QCLTempHigh = (txtQclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclHigh.Text);
        //criticalLimit.QCLTempLow = (txtQclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclLow.Text);
        //criticalLimit.QCLTime1 = (txtQclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtQclMin.Text);
        //criticalLimit.QCLTime2 = (txtQclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtQclMax.Text);
        //criticalLimit.SCLTempHigh = (txtSclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclHigh.Text);
        //criticalLimit.SCLTempLow = (txtSclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclLow.Text);
        //criticalLimit.SCLTime1 = (txtSclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtSclMin.Text);
        //criticalLimit.SCLTime2 = (txtSclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtSclMax.Text);

        criticalLimit.CCLTempHigh = (txtCclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclHigh.Text);
        criticalLimit.CCLTempLow = (txtCclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclLow.Text);
        criticalLimit.CCLTime1 = (txtCclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtCclMin.Text);
        criticalLimit.CCLTime2 = (txtCclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtCclMax.Text);
        criticalLimit.QCLTempHigh = (txtQclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclHigh.Text);
        criticalLimit.QCLTempLow = (txtQclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclLow.Text);
        criticalLimit.QCLTime1 = (txtQclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtQclMin.Text);
        criticalLimit.QCLTime2 = (txtQclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtQclMax.Text);
        criticalLimit.SCLTempHigh = (txtSclHigh.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclHigh.Text);
        criticalLimit.SCLTempLow = (txtSclLow.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclLow.Text);
        criticalLimit.SCLTime1 = (txtSclMin.Text.Equals(string.Empty)) ? 999 : int.Parse(txtSclMin.Text);
        criticalLimit.SCLTime2 = (txtSclMax.Text.Equals(string.Empty)) ? 999 : int.Parse(txtSclMax.Text);

        if (criticalLimit.LogTypeID == 2)
        {
            criticalLimit.CCLTempHigh1 = (txtCclHigh1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclHigh1.Text);
            criticalLimit.CCLTempLow1 = (txtCclLow1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclLow1.Text);
            criticalLimit.QCLTempHigh1 = (txtQclHigh1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclHigh1.Text);
            criticalLimit.QCLTempLow1 = (txtQclLow1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclLow1.Text);
            criticalLimit.SCLTempHigh1 = (txtSclHigh1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclHigh1.Text);
            criticalLimit.SCLTempLow1 = (txtSclLow1.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclLow1.Text);

            criticalLimit.CCLTempHigh2 = (txtCclHigh2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclHigh2.Text);
            criticalLimit.CCLTempLow2 = (txtCclLow2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtCclLow2.Text);
            criticalLimit.QCLTempHigh2 = (txtQclHigh2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclHigh2.Text);
            criticalLimit.QCLTempLow2 = (txtQclLow2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtQclLow2.Text);
            criticalLimit.SCLTempHigh2 = (txtSclHigh2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclHigh2.Text);
            criticalLimit.SCLTempLow2 = (txtSclLow2.Text.Equals(string.Empty)) ? 999 : float.Parse(txtSclLow2.Text);

            //ctiricalLimit.CCLTempHigh1 = float.Parse(txtCclHigh1.Text);
            //ctiricalLimit.CCLTempLow1 = float.Parse(txtCclLow1.Text);
            //ctiricalLimit.QCLTempHigh1 = float.Parse(txtQclHigh1.Text);
            //ctiricalLimit.QCLTempLow1 = float.Parse(txtQclLow1.Text);
            //ctiricalLimit.SCLTempHigh1 = float.Parse(txtSclHigh1.Text);
            //ctiricalLimit.SCLTempLow1 = float.Parse(txtSclLow1.Text);

            //ctiricalLimit.CCLTempHigh2 = float.Parse(txtCclHigh2.Text);
            //ctiricalLimit.CCLTempLow2 = float.Parse(txtCclLow2.Text);
            //ctiricalLimit.QCLTempHigh2 = float.Parse(txtQclHigh2.Text);
            //ctiricalLimit.QCLTempLow2 = float.Parse(txtQclLow2.Text);
            //ctiricalLimit.SCLTempHigh2 = float.Parse(txtSclHigh2.Text);
            //ctiricalLimit.SCLTempLow2 = float.Parse(txtSclLow2.Text);
        }
        setLimits.CriticalLimits = criticalLimit;
        setLimits.Invoke();
        
    }
    private void UpdateCorrectiveActions()
    {
        RadioButton rdbAnswerYes;
        HiddenField hfCorrectiveActionId;
        Label lblName;
        foreach (GridViewRow row in grdCorrectiveAction.Rows)
        {
            rdbAnswerYes = (RadioButton)row.FindControl("rdbAnswerYes");
            hfCorrectiveActionId = (HiddenField)row.FindControl("hfCorrectiveActionId");
            lblName = (Label)row.FindControl("lblName");
            if (rdbAnswerYes != null )
            {
                KitchenCorrectiveAction correctiveAction = new KitchenCorrectiveAction();
                correctiveAction.CorrectiveActionID = int.Parse(hfCorrectiveActionId.Value);
                correctiveAction.IsInclude = 1;
                correctiveAction.KitchenId = (int)Session["KitchenId"];
                correctiveAction.LogTypeID = int.Parse(Request.QueryString["LogType"]);
                correctiveAction.Name = lblName.Text;
                if (rdbAnswerYes.Checked == true)
                {
                    correctiveAction.Status = 1;
                }
                else
                {
                    correctiveAction.Status = 0;
                }
                ProcessSetKitchenCorrectiveAction setCorrectiveAction = new ProcessSetKitchenCorrectiveAction();
                setCorrectiveAction.KitchenCorrectiveAction = correctiveAction;
                setCorrectiveAction.Invoke();
                
            }
        }
    }
    private void InsertCorrectiveAction()
    {
        KitchenCorrectiveAction correctiveAction = new KitchenCorrectiveAction();
        correctiveAction.IsInclude = 1;
        correctiveAction.KitchenId = (int)Session["KitchenId"];
        correctiveAction.LogTypeID = int.Parse(Request.QueryString["LogType"]);
        correctiveAction.Name = txtActionName.Text;
        correctiveAction.Status = 1;
        ProcessCreateKitchenCorrectiveAction createCorrectiveAction = new ProcessCreateKitchenCorrectiveAction();
        createCorrectiveAction.KitchenCorrectiveAction = correctiveAction;
        createCorrectiveAction.Invoke();
    }
    private void UpdateCorrectiveAction(int nCorrectiveActionId)
    {
        RadioButton rdbAnswerYes;
        HiddenField hfCorrectiveActionId;
        Label lblName;
        foreach (GridViewRow row in grdCorrectiveAction.Rows)
        {
            rdbAnswerYes = (RadioButton)row.FindControl("rdbAnswerYes");
            hfCorrectiveActionId = (HiddenField)row.FindControl("hfCorrectiveActionId");
            lblName = (Label)row.FindControl("lblName");
            if (rdbAnswerYes != null)
            {
                if (nCorrectiveActionId == int.Parse(hfCorrectiveActionId.Value))
                {
                    KitchenCorrectiveAction correctiveAction = new KitchenCorrectiveAction();
                    correctiveAction.CorrectiveActionID = int.Parse(hfCorrectiveActionId.Value);
                    correctiveAction.IsInclude = 0;
                    correctiveAction.KitchenId = (int)Session["KitchenId"];
                    correctiveAction.LogTypeID = int.Parse(Request.QueryString["LogType"]);
                    correctiveAction.Name = lblName.Text;
                    correctiveAction.Status = 0;
                    
                    ProcessSetKitchenCorrectiveAction setCorrectiveAction = new ProcessSetKitchenCorrectiveAction();
                    setCorrectiveAction.KitchenCorrectiveAction = correctiveAction;
                    setCorrectiveAction.Invoke();
                }

            }
        }
    }
    protected void cmdAdditionalFoodCategory_Click(object sender, EventArgs e)
    {
        SetPopup();
        mode = 0;
        
    }
    protected void grdCorrectiveAction_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Replace")
        {
           hfCorrectiveActionId.Value = e.CommandArgument.ToString();
            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            hfCorrectiveActionName.Value = ((Label)row.FindControl("lblName")).Text;
            SetPopup();
            mode = int.Parse(e.CommandArgument.ToString());
        }

    }
    public void SetPopup()
    {
        ModalPopupExtender1.Show();
        txtActionName.Text = "";
        rfvCorrectiveAction.Enabled = true;
        revCorrectiveAction.Enabled = true;
        
    }
    private void SetPopup(int nCorrectiveActionId, string strName)
    {
        ModalPopupExtender1.Show();
        txtActionName.Text = "";
        rfvCorrectiveAction.Enabled = true;
        revCorrectiveAction.Enabled = true;
    }
    protected void cmdGo_Click(object sender, EventArgs e)
    {
        string strURL="";
        if ((int)Session["TypeId"] == 2)
        {

           // Response.Redirect("~/ControlPanel/District/CreateHBFlexR.aspx");
            strURL = "~/ControlPanel/District/CreateHBFlexR.aspx?KitchenName=" + (string)Session["KitchenName"];
        }
        else if ((int)Session["TypeId"] == 1)
        {
            // Command Central Corporate
            strURL = "~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + (string)Session["KitchenName"];
        }
        
        Response.Redirect(strURL);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SetPopup();
    }
}
