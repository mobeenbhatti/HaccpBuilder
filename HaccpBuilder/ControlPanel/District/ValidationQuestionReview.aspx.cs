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

public partial class ControlPanel_District_ValidationQuestionReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["GroupId"] != null)
            {
                ddlChecklistGroup.DataBind();
                ddlChecklistGroup.SelectedValue = Request.QueryString["GroupId"];
                //lblGroupName.Text = ddlChecklistGroup.SelectedItem.Text;
                hlPrint.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"];

            }
        }
    }


    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        //Set value of label for next page
        //lblIteration.Text = (int.Parse(lblIteration.Text) + 1).ToString();
        //if (int.Parse(lblIteration.Text) <= 11)
        //{
        //    GetData();
        //}
        //else
        //{
        Response.Redirect("~/ControlPanel/District/KitchenValidation.aspx?GroupId=" + Request.QueryString["GroupId"]);
        //}


    }
    public string getCategory(string strSectionId)
    {
        string strSection = "";
        switch (strSectionId.Trim())
        {

            case "PA":
                strSection = "Personal Hygiene";
                break;
            case "FP":
                strSection = "Food Preparation";
                break;
            case "HH":
                strSection = "Hot Holding";
                break;
            case "CH":
                strSection = "Cold Holding";
                break;
            case "RFM":
                strSection = "Refrigerator, Freezer, And Milk Cooler";
                break;
            case "FSDS":
                strSection = "Food Storage and Dry Storage";
                break;
            case "CS":
                strSection = "Cleaning and Sanitizing";
                break;
            case "UE":
                strSection = "Utensils and Equipment";
                break;
            case "LE":
                strSection = "Large Equipment";
                break;
            case "GSD":
                strSection = "Garbage Storage and Disposal";
                break;
            case "PC":
                strSection = "Pest Control";
                break;
        }
        return strSection;

    }
    protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }


    protected void cmdBack_Click(object sender, EventArgs e)
    {
        //lblIteration.Text = (int.Parse(lblIteration.Text) - 1).ToString();
        //GetData();
    }
    //private void GetData()
    //{
    //    grdQuestion.DataSource = ObjectDataSource1;
    //    grdQuestion.DataBind();


    //}

    
    protected void grdQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    
    protected void grdQuestion_DataBound(object sender, EventArgs e)
    {
        if (grdQuestion.Rows.Count < 1)
        {
            // Show Data not found message

            lblMeassage.Text = "No Question Selected ";
            lblMeassage.Visible = true;
        }
        else
        {
            lblMeassage.Visible = false;
        }
    }
    protected void ddlChecklistGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        //lblGroupName.Text = ddlChecklistGroup.SelectedItem.Text;
        hlPrint.NavigateUrl += "?GroupId=" + ddlChecklistGroup.SelectedValue;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Write("<script language=javascript>window.open('~/ControlPanel/District/FoodSafetyChecklistPrint.aspx?GroupId="+ddlChecklistGroup.SelectedValue + "',win','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,res izable=1,"+"width=600,height=600');</script>");
        //Response.Write("<script language=javascript>window.open('~/../../District/FoodSafetyChecklistPrint.aspx?GroupId=10,win,toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,res izable=1,width=600,height=600');</script>");
        // Response.Write("<script language=javascript>window.open('~/../../District/FoodSafetyChecklistPrint.aspx?GroupId=10',win,toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,res izable=1,width=600,height=600');</script>");
        Response.Write("<script language=javascript>window.open('~/../../District/ValidationPrint.aspx?GroupId=" + ddlChecklistGroup.SelectedValue + "','','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600');</script>");
       
        //window.open('http://www.pageresource.com/jscript/jex5.htm','mywindow','width=400,height=200');
    }
}
