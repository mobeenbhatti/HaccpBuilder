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
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_KitchenCCP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        SaveKitchenCCPGroup();
        Response.Redirect("~/ControlPanel/District/CustomCCP.aspx");
    }
    private void SaveKitchenCCPGroup()
    {
        int i, totalItems;
        totalItems = grdhKitchenGroup.Rows.Count;
        for (i = 0; i < totalItems; i++)
        {
            DropDownList ddlCCP = (DropDownList)grdhKitchenGroup.Rows[i].FindControl("ddlCCPGroup");
            HiddenField hfKitchen = (HiddenField)grdhKitchenGroup.Rows[i].FindControl("hfKitchenId");


            if (ddlCCP != null || hfKitchen != null)
            {
                //////////////////////////////
                ///Save KitchenCCPGroup///////

                KitchenCCPGroup kitchenCCPGroup = new KitchenCCPGroup();
                kitchenCCPGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenCCPGroup.CCPGroupId = int.Parse(ddlCCP.SelectedValue);

                ProcessDeleteKitchenCCPGroup deleteKistchenCCPGroup = new ProcessDeleteKitchenCCPGroup();
                deleteKistchenCCPGroup.KitchenCCPGroup = kitchenCCPGroup;
                deleteKistchenCCPGroup.Invoke();

                ProcessCreateKitchenCCPGroup createKitchenCCPGroup = new ProcessCreateKitchenCCPGroup();
                createKitchenCCPGroup.kitchenCCPGroup = kitchenCCPGroup;
                createKitchenCCPGroup.Invoke();


            }
        }

    }
    protected void grdhKitchenGroup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfKitchenId = (HiddenField)e.Row.FindControl("hfKitchenId");
            DropDownList ddlCCPGroup = (DropDownList)e.Row.FindControl("ddlCCPGroup");
            if (ddlCCPGroup != null || hfKitchenId != null)
            {
                IDataReader drKitchenCCPGroup;
                ProcessGetKitchenCCPGroup getKitchenCCPGroup = new ProcessGetKitchenCCPGroup();
                drKitchenCCPGroup = getKitchenCCPGroup.Get(int.Parse(hfKitchenId.Value));
                if (drKitchenCCPGroup.Read())
                {
                    ddlCCPGroup.SelectedValue = drKitchenCCPGroup["KitchenCCPGroupId"].ToString();
                    drKitchenCCPGroup.Close();
                }
                if (drKitchenCCPGroup.IsClosed == false)
                {
                    drKitchenCCPGroup.Close();
                }
            }
        }

    }
    protected void btnCreateCustomCCP_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomCCP.aspx");
    }
    protected void btnEditCCPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CCPGroup.aspx");
    }
}
