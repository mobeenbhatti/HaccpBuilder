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

public partial class ControlPanel_District_KitchenValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreateGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationGroup.aspx");
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnCreateQuestion_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx");
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        SaveKitchenCheckListGroup();
        Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx");
    }
    private void SaveKitchenCheckListGroup()
    {
        int i, totalItems;
        totalItems = grdhKitchenGroup.Rows.Count;
        for (i = 0; i < totalItems; i++)
        {
            DropDownList ddlCheckList = (DropDownList)grdhKitchenGroup.Rows[i].FindControl("ddlCheckListGroup");
            HiddenField hfKitchen = (HiddenField)grdhKitchenGroup.Rows[i].FindControl("hfKitchenId");


            if (ddlCheckList != null || hfKitchen != null)
            {
                /////////////////////////////////////
                ///Save KitchenValidationGroup///////
                /////////////////////////////////////

                KitchenValidationGroup kitchenValidationGroup = new KitchenValidationGroup();
                kitchenValidationGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenValidationGroup.ValidationGroupId = int.Parse(ddlCheckList.SelectedValue);
                //KitchenCheckListGroup kitchenCheckLsitGroup = new KitchenCheckListGroup();
                //kitchenCheckLsitGroup.KitchenId = int.Parse(hfKitchen.Value);
                //kitchenCheckLsitGroup.CheckListGroupId = int.Parse(ddlCheckList.SelectedValue);

                ProcessDeleteKitchenValidationGroup deleteKitchenValidationGroup = new ProcessDeleteKitchenValidationGroup();
                deleteKitchenValidationGroup.KitchenValidationGroup = kitchenValidationGroup;
                deleteKitchenValidationGroup.Invoke();

                //ProcessDeleteKitchenCheckListGroup deleteKitchenCheckListGroup = new ProcessDeleteKitchenCheckListGroup();
                //deleteKitchenCheckListGroup.KitchenCheckListGroup = kitchenCheckLsitGroup;
                //deleteKitchenCheckListGroup.Invoke();
                ProcessCreateKitchenValidationGroup createKitchenValidationGroup = new ProcessCreateKitchenValidationGroup();
                createKitchenValidationGroup.kitchenValidationGroup = kitchenValidationGroup;
                createKitchenValidationGroup.Invoke();

                //ProcessCreateKitchenCheckListGroup createKitchenCheckListGroup = new ProcessCreateKitchenCheckListGroup();
                //createKitchenCheckListGroup.kitchenCheckListGroup = kitchenCheckLsitGroup;
                //createKitchenCheckListGroup.Invoke();


            }
        }

    }
    protected void grdhKitchenGroup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfKitchenId = (HiddenField)e.Row.FindControl("hfKitchenId");
            DropDownList ddlCheckList = (DropDownList)e.Row.FindControl("ddlCheckListGroup");
            if (ddlCheckList != null || hfKitchenId != null)
            {
                IDataReader drKitchenCheckListGroup;
                ProcessGetKitchenValidationGroup getKitcehnValidationGroup = new ProcessGetKitchenValidationGroup();
                drKitchenCheckListGroup = getKitcehnValidationGroup.Get(int.Parse(hfKitchenId.Value));
                //ProcessGetKitchenCheckListGroup getKitchenCheckListGroup = new ProcessGetKitchenCheckListGroup();
                //drKitchenCheckListGroup = getKitchenCheckListGroup.Get(int.Parse(hfKitchenId.Value));
                if (drKitchenCheckListGroup.Read())
                {
                    ddlCheckList.SelectedValue = drKitchenCheckListGroup["ValidationGroupId"].ToString();
                    drKitchenCheckListGroup.Close();

                }
                if (drKitchenCheckListGroup.IsClosed == false)
                {
                    drKitchenCheckListGroup.Close();
                }
            }
        }

    }
}
