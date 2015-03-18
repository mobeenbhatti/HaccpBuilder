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

public partial class ControlPanel_District_ViewHACCPPlanNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["KitchenId"] != null)
        {
            Session["KitchenId"] = int.Parse(Request.QueryString["KitchenId"].ToString());
        }
        SetProceduralQuestions();
        // ProcessGetKitchen getKitchen = new ProcessGetKitchen();
        // DataSet dsKitchen = getKitchen.Get(Session["vchEmail"].ToString(), Session["vchPassword"].ToString());
        // lblKitchen.Text = DataBinder.Eval(dtvKitchenDetails.DataItem, "KitchenName");
        dtvKitchenDetails.DataBind();
        lblKitchen.Text = DataBinder.Eval(dtvKitchenDetails.DataItem, "KitchenName").ToString();


    }
    private void SetProceduralQuestions()
    {

        ProcessGetProceduralResponse getResponse = new ProcessGetProceduralResponse();
        DataSet dsResponse;
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 1);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion1.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 2);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion2.Text = dr["CorrectiveAction"].ToString();
                if(dr["Response"].ToString() != "")
                {
                if (int.Parse(dr["Response"].ToString()) == 1)
                {
                    rdlAllergenYes.Checked = true;
                }
                else if (int.Parse(dr["Response"].ToString()) == 0)
                {
                    rdlAllergenNo.Checked = true;
                }
                else
                {
                    rdlAllergenNA.Checked = true;
                }
                }
            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 3);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion2b.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 4);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion3.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 5);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion4.Text = dr["CorrectiveAction"].ToString();
                if (dr["Response"].ToString() != "")
                {
                    if (int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdbSoilYes.Checked = true;
                    }
                    else if (int.Parse(dr["Response"].ToString()) == 0)
                    {
                        rdbSoilNo.Checked = true;
                    }
                    else
                    {
                        rdbSoilNA.Checked = true;
                    }
                }
            }
        }
        int i = 0;
        dsResponse = getResponse.GetResponsesInfo((int)Session["KitchenId"]);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {

                RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerNA = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNA");
                if (dr["Response"].ToString() != "")
                {
                    if (int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdbAnswerYes.Checked = true;
                    }
                    else if (int.Parse(dr["Response"].ToString()) == 0)
                    {
                        rdbAnswerNo.Checked = true;
                    }
                    else
                    {
                        rdbAnswerNA.Checked = true;
                    }
                }
                i++;
            }
        }

    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DetailsView dtvSOP;
            HiddenField hfSOPId;
            ProcessGetSOP getSOP = new ProcessGetSOP();
            dtvSOP = (DetailsView)e.Item.FindControl("dtvSOP");
            hfSOPId = (HiddenField)e.Item.FindControl("hfSOPId");
            dtvSOP.DataSource = getSOP.GetSOPById(int.Parse(hfSOPId.Value));
            dtvSOP.DataBind();

        }
    }
    protected void grdMenuAll_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void grdMenuProcess4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title3"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title3"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void grdMenuProcess3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title2"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title2"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void grdMenuProcess2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title1"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title1"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void grdMenuProcess1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title0"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title0"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void rptProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DetailsView dtvProcess;
            HiddenField hfProcessId;
            GridView grdMenu;
            DataSet dsProcessMenu;
            Label lblProcessMenu;

            dtvProcess = (DetailsView)e.Item.FindControl("dtvProcess");
            hfProcessId = (HiddenField)e.Item.FindControl("hfProcessId");
            grdMenu = (GridView)e.Item.FindControl("grdMenuProcess1");
            lblProcessMenu = (Label)e.Item.FindControl("lblProcessMenu");
            ProcessGetProcess getProcess = new ProcessGetProcess();
            dtvProcess.DataSource = getProcess.GetProcessByKitchenId((int)Session["KitchenId"], int.Parse(hfProcessId.Value));
            dtvProcess.DataBind();

            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();

            dsProcessMenu = getMenuItem.GetMenuItemsNewByProcess((int)Session["KitchenId"], int.Parse(hfProcessId.Value));

            grdMenu.DataSource = dsProcessMenu;
            grdMenu.DataBind();
            if (dsProcessMenu.Tables[0].Rows.Count < 1)
            {
                lblProcessMenu.Text = "No Data Found";
            }

        }
    }
    protected void rptFoodCatogary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataSet dsFoodcategoryCorectiveAction;
            HiddenField hfFoodCategoryId;
            Repeater rptFoodcategoryCorectiveAction;

            //Repeater rptFoodcategory;

            System.Web.UI.HtmlControls.HtmlTableRow trFoodCategoryCorrectiveActions;
            //rptFoodcategory = (Repeater)e.Item.FindControl("rptFoodcategory");
            rptFoodcategoryCorectiveAction = (Repeater)e.Item.FindControl("rptFoodcategoryCorectiveAction");
            hfFoodCategoryId = (HiddenField)e.Item.FindControl("hfFoodCategoryId");
            trFoodCategoryCorrectiveActions = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("trFoodCategoryCorrectiveActions");

            ProcessGetFoodCategory processGetFoodCategory = new ProcessGetFoodCategory();

            //rptFoodcategory.DataSource = processGetFoodCategory.GetFoodCategoriesByKitchenId((int)Session["KitchenId"]);
            //rptFoodcategory.DataBind();
            dsFoodcategoryCorectiveAction = processGetFoodCategory.GetFoodCategoryCorrectiveActions(int.Parse(hfFoodCategoryId.Value)); ;
            rptFoodcategoryCorectiveAction.DataSource = dsFoodcategoryCorectiveAction;
            rptFoodcategoryCorectiveAction.DataBind();

            if (dsFoodcategoryCorectiveAction.Tables[0].Rows.Count < 1)
            {
                trFoodCategoryCorrectiveActions.Visible = true;

            }
            else
            {
                trFoodCategoryCorrectiveActions.Visible = false;
            }



        }
    }
}
