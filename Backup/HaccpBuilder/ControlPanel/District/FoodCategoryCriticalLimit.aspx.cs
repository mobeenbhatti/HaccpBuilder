using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;

public partial class ControlPanel_District_FoodCategoryCriticalLimit : System.Web.UI.Page
{
    public static int mode = 0;
    // operation -- 0 for Update Mode and 1 for Insertion Mode
    public static int operation = 0;
    public enum DataValue
    {
        NOVALUE=999
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            if (Request.QueryString["GroupId"] != null)
            {
                GetData();
                hlCancel.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"];
            }
        }

    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (operation == 1)
        {
            // INSERTION OPERATION
            if (txtCclHigh.Text.Equals(string.Empty) && txtCclLow.Text.Equals(string.Empty) && txtCclMax.Text.Equals(string.Empty) && txtCclMin.Text.Equals(string.Empty) && txtQclHigh.Text.Equals(string.Empty) && txtQclLow.Text.Equals(string.Empty) && txtQclMax.Text.Equals(string.Empty) && txtQclMin.Text.Equals(string.Empty) && txtSclHigh.Text.Equals(string.Empty) && txtSclLow.Text.Equals(string.Empty) && txtSclMax.Text.Equals(string.Empty) && txtSclMin.Text.Equals(string.Empty))
            {
            }
            else
            {
                InsertCriticalLimit();
            }
        }
        else
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
            FoodCategoryAction correctiveAction = new FoodCategoryAction();

            correctiveAction.CorrectiveActionID = int.Parse(hfCorrectiveActionId.Value);
            correctiveAction.IsInclude = 0;
            correctiveAction.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);
            correctiveAction.Name = hfCorrectiveActionName.Value;            
            correctiveAction.Status = 0;
           
            ProcessSetFoodCategory setCorrectiveAction = new ProcessSetFoodCategory();
            setCorrectiveAction.CorrectiveAction = correctiveAction;
            setCorrectiveAction.FoodCategoryCorrectiveActions();
        }
        grdCorrectiveAction.DataBind();
        rfvCorrectiveAction.Enabled = false;
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        rfvCorrectiveAction.Enabled = false;
        RegularExpressionValidator6.Enabled = false;

    }
    private void GetData()
    {
        hfFoodCategoryId.Value = Request.QueryString["FoodCategoryId"];
        ProcessGetCriticalLimits getCriticalLimit = new ProcessGetCriticalLimits();
        ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
        DataSet dsCriticalLimit = getFoodCategory.GetFoodCategoryCriticalLimits(Convert.ToInt32(hfFoodCategoryId.Value));

        if (dsCriticalLimit.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in dsCriticalLimit.Tables[0].Rows)
            {
                hfCriticalLimitId.Value = dr["CriticalLimitID"].ToString();
                txtCclHigh.Text = dr["CCLTempHigh"].ToString() == "999.00" ? "" : dr["CCLTempHigh"].ToString();
                txtCclLow.Text = dr["CCLTempLow"].ToString() == "999.00" ? "" : dr["CCLTempLow"].ToString();
                txtCclMax.Text = dr["CCLTime2"].ToString() == "999" ? "" : dr["CCLTime2"].ToString();
                txtCclMin.Text = dr["CCLTime1"].ToString() == "999" ? "" : dr["CCLTime1"].ToString();
                txtQclHigh.Text = dr["QCLTempHigh"].ToString() == "999.00" ? "" : dr["QCLTempHigh"].ToString();
                txtQclLow.Text = dr["QCLTempLow"].ToString() == "999.00" ? "" : dr["QCLTempLow"].ToString();
                txtQclMax.Text = dr["QCLTime2"].ToString() == "999" ? "" : dr["QCLTime2"].ToString();
                txtQclMin.Text = dr["QCLTime1"].ToString() == "999" ? "" : dr["QCLTime1"].ToString();
                txtSclHigh.Text = dr["SCLTempHigh"].ToString() == "999.00" ? "" : dr["SCLTempHigh"].ToString();
                txtSclLow.Text = dr["SCLTempLow"].ToString() == "999.00" ? "" : dr["SCLTempLow"].ToString();
                txtSclMax.Text = dr["SCLTime2"].ToString() == "999" ? "" : dr["SCLTime2"].ToString();
                txtSclMin.Text = dr["SCLTime1"].ToString() == "999" ? "" : dr["SCLTime1"].ToString();
                lblLog.Text = dr["FoodCategory"].ToString() ;
                operation = 0;
            }
        }
        else
        {
            ProcessGetFoodCategory FoodCategory = new ProcessGetFoodCategory();
            IDataReader drFoodCategory = FoodCategory.GetFoodCategoryById(Convert.ToInt32(hfFoodCategoryId.Value));
            if (drFoodCategory.Read())
            {
               lblLog.Text=drFoodCategory["FoodCategory"].ToString();
            }
            drFoodCategory.Close();
         
            if (drFoodCategory.IsClosed == false)
            {
                drFoodCategory.Close();
            }
            operation = 1;
        }
       
    }
    private void UpdateCriticalLimits()
    {
        ProcessSetFoodCategory setLimits = new ProcessSetFoodCategory();
        FoodCategories criticalLimit = new FoodCategories();
        
        criticalLimit.CriticalLimitID = int.Parse(hfCriticalLimitId.Value);       
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
        criticalLimit.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);
       

        setLimits.FoodCategory = criticalLimit;
        setLimits.FoodCategoryCriticalLimits();

    }
    private void InsertCriticalLimit()
    {
        FoodCategories criticalLimit = new FoodCategories();
       // criticalLimit.CriticalLimitID = int.Parse(hfCriticalLimitId.Value);
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
        criticalLimit.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);
        ProcessCreateFoodCategory createCriticalLimit = new ProcessCreateFoodCategory();
        createCriticalLimit.FoodCategory = criticalLimit;
        createCriticalLimit.InsertFoodCategoryCriticalLimits();
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
            if (rdbAnswerYes != null)
            {
                FoodCategoryAction correctiveAction = new FoodCategoryAction();
                
                correctiveAction.CorrectiveActionID = int.Parse(hfCorrectiveActionId.Value);
                correctiveAction.IsInclude = 1;
                correctiveAction.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);                
                correctiveAction.Name = lblName.Text;
                if (rdbAnswerYes.Checked == true)
                {
                    correctiveAction.Status = 1;
                }
                else
                {
                    correctiveAction.Status = 0;
                }
                ProcessSetFoodCategory setCorrectiveAction = new ProcessSetFoodCategory();
                setCorrectiveAction.CorrectiveAction = correctiveAction;
                setCorrectiveAction.FoodCategoryCorrectiveActions();
               
            }
        }
    }
    private void InsertCorrectiveAction()
    {
        FoodCategoryAction correctiveAction = new FoodCategoryAction();        
        correctiveAction.IsInclude = 1;
        correctiveAction.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);        
        correctiveAction.Name = txtActionName.Text;
        correctiveAction.Status = 1;
        ProcessCreateFoodCategory createCorrectiveAction = new ProcessCreateFoodCategory();
        createCorrectiveAction.CorrectiveAction = correctiveAction;
        createCorrectiveAction.InsertFoodCategoryCorrectiveAction();
        
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

                    FoodCategoryAction correctiveAction = new FoodCategoryAction();
                    correctiveAction.IsInclude = 0;
                    correctiveAction.FoodCategoryId = (int)Session["FoodCategoryId"];
                    correctiveAction.Name = txtActionName.Text;
                    correctiveAction.Status = 0;
                    ProcessSetFoodCategory setCorrectiveAction = new ProcessSetFoodCategory();
                    setCorrectiveAction.CorrectiveAction = correctiveAction;
                    setCorrectiveAction.FoodCategoryCriticalLimits();
                    
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
    private void SetPopup()
    {
        ModalPopupExtender1.Show();
        txtActionName.Text = "";
        rfvCorrectiveAction.Enabled = true;
        RegularExpressionValidator6.Enabled = true;
    }
    private void SetPopup(int nCorrectiveActionId, string strName)
    {
        ModalPopupExtender1.Show();
        txtActionName.Text = "";
        rfvCorrectiveAction.Enabled = true;
    }
    protected void cmdGo_Click(object sender, EventArgs e)
    {
        string strURL = "~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + Convert.ToString(Request.QueryString["GroupId"]);
        Response.Redirect(strURL);
    }
}
