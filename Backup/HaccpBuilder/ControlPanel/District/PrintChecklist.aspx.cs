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

public partial class ControlPanel_District_PrintChecklist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["HistoryId"] != null)
            {
                ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
                //IDataReader dr = getHistory.GetHistoryByWeek((int)Session["KitchenId"], int.Parse(Request.QueryString["Week"]), int.Parse(Request.QueryString["Year"]));
                IDataReader dr = getHistory.GetHistoryById(int.Parse(Request.QueryString["HistoryId"]));
                if (dr.Read())
                {
                    Session["HistoryId"] = int.Parse(dr["HistoryId"].ToString());
                    lblObserver.Text += dr["Observer"].ToString();
                    dr.Close();
                    lblInfo.Text = "Food Safety Checklist for Date: " + Request.QueryString["date"].ToString();                   
                }
                if (dr.IsClosed == false)
                {
                    dr.Close();
                }
            }
        }
    }
    protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label titleLabel = (Label)e.Row.FindControl("lblTitle");
            Label lkbCategory = (Label)e.Row.FindControl("lkbCategory");
            HiddenField hfSection = (HiddenField)e.Row.FindControl("hfSection");

            string strval = hfSection.Value;
            string title = (string)ViewState["title"];
            if (title == strval)
            {
                lkbCategory.Visible = false;
                lkbCategory.Text = string.Empty;
                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lkbCategory.Text = getCategory(title);
                lkbCategory.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }

        }
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
}
