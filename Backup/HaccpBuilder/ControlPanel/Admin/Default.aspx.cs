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

public partial class ControlPanel_Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }
    }
    protected void cmdCreateDistrict_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Admin/CreateDistrict.aspx");
    }
    protected void cmdSearchByDistrict_Click(object sender, EventArgs e)
    {
        GetData("DISTRICTNAME");
    }
    protected void cmdSearchByDistrictUser_Click(object sender, EventArgs e)
    {
        GetData("DISTRICTUSER");
    }
    protected void cmdSearchByDistrictType_Click(object sender, EventArgs e)
    {
        GetData("DISTRICTTYPE");
    }
    protected void cmdSearchByDistrictId_Click(object sender, EventArgs e)
    {
        GetData("DISTRICTID");
    }
    private void GetData(string strSearchType)
    {
        DataSet dsDistrict;
        ProcessGetDistrict getDistrict = new ProcessGetDistrict();
        grdDistrict.Visible = false;
        grdDistrictSearch.Visible = true;
        switch (strSearchType)
        {
            case "DISTRICTNAME":
                dsDistrict = getDistrict.GetDistrictDetailByName(txtDistrict.Text);
                if (dsDistrict.Tables[0].Rows.Count > 0)
                {
                    grdDistrictSearch.DataSource = dsDistrict;
                    grdDistrictSearch.DataBind();
                }
                else
                {
                    lblInfo.Visible = true;
                    lblInfo.Text = "No Data Found";
                    grdDistrictSearch.Visible = false;
                }
                break;
            case "DISTRICTUSER":
                dsDistrict = getDistrict.GetDistrictDetailByUserId(txtDistrictUser.Text);
                if (dsDistrict.Tables[0].Rows.Count > 0)
                {
                    grdDistrictSearch.DataSource = dsDistrict;
                    grdDistrictSearch.DataBind();
                }
                else
                {
                    lblInfo.Visible = true;
                    lblInfo.Text = "No Data Found";
                    grdDistrictSearch.Visible = false;
                }
                break;
            case "DISTRICTTYPE":
                dsDistrict = getDistrict.GetDistrictDetailByType(int.Parse(ddlDistrictType.SelectedItem.Value));
                if (dsDistrict.Tables[0].Rows.Count > 0)
                {
                    grdDistrictSearch.DataSource = dsDistrict;
                    grdDistrictSearch.DataBind();
                    
                }
                else
                {
                    lblInfo.Visible = true;
                    lblInfo.Text = "No Data Found";
                    grdDistrictSearch.Visible = false;
                }
                break;
            case "DISTRICTID":
                dsDistrict = getDistrict.GetDistrictDetailByID(int.Parse(txtDistrictId.Text));
                if (dsDistrict.Tables[0].Rows.Count > 0)
                {
                    grdDistrictSearch.DataSource = dsDistrict;
                    grdDistrictSearch.DataBind();
                }
                else
                {
                    lblInfo.Visible = true;
                    lblInfo.Text = "No Data Found";
                    grdDistrictSearch.Visible = false;
                }
                break;
        }
    }
    protected void grdDistrict_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    LinkButton l = (LinkButton)e.Row.FindControl("lkbDelete");
        //    l.Attributes.Add("onclick", "javascript:return " +
        //    "confirm('Are you sure you want to delete this record " +
        //    DataBinder.Eval(e.Row.DataItem, "DistrictId") + "')");
        //}
    }
    protected void grdDistrict_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            // get the categoryID of the clicked row

            int nKitchenId = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            ProcessDeleteKitchen deleteKitchen = new ProcessDeleteKitchen();
            deleteKitchen.Invoke(nKitchenId);  
        }
        if (e.CommandName == "Remove")
        {
            // get the categoryID of the clicked row

            int nDistrictId = Convert.ToInt32(e.CommandArgument);
            // Delete the record 

            ProcessDeleteDistrict deleteDistrict = new ProcessDeleteDistrict();
            deleteDistrict.Invoke(nDistrictId);
            grdDistrict.DataBind();

        }
    }



    protected void grdDistrictSearch_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            // get the categoryID of the clicked row

            int nDistrictId = Convert.ToInt32(e.CommandArgument);
            // Delete the record 

            ProcessDeleteDistrict deleteDistrict = new ProcessDeleteDistrict();
            deleteDistrict.Invoke(nDistrictId);
            grdDistrictSearch.DataBind();
            

        }
    }
    protected void grdFreeTrail_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            FreeTrialRequest request = new FreeTrialRequest();
            request.FreeTrialRequestId = e.CommandArgument.ToString();
            ProcessDeleteFreeTrialRequest deleteRequest = new ProcessDeleteFreeTrialRequest();
            deleteRequest.FreeTrialRequest = request;
            deleteRequest.Invoke();
            grdFreeTrail.DataBind();
        }
    }

    protected void grdKitchen_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {            
            ProcessDeleteKitchen deleteKitchen = new ProcessDeleteKitchen();
            deleteKitchen.Invoke(int.Parse(e.CommandArgument.ToString()));
            grdKitchen.DataBind();
        }
    }
}
