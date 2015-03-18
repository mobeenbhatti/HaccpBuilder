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

public partial class ControlPanel_Kitchen_LogAlerts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string CheckIfTitleExists(string strval)
    {
        string title = (string)ViewState["title"];
        if (title == strval)
        {
            return string.Empty;
        }
        else
        {
            title = strval;
            ViewState["title"] = title;
            return title ;
        }
    }
    protected void grdLogAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AlertDate")
        {
            LinkButton lkbDate = e.CommandSource as LinkButton;
            string url;
            url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + lkbDate.CommandArgument.ToString() + "&date=" + lkbDate.Text;
            Response.Redirect(url);
        }
    }
    protected void grdLogAlerts_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        LinkButton lkbDate = e.Row.FindControl("lkbDate") as LinkButton;
        HiddenField hfLogName = e.Row.FindControl("hfTableName") as HiddenField;
        if (lkbDate != null)
        {
            string tableName = hfLogName.Value;
            lkbDate.CommandArgument = tableName + "";
        }
    }
}
