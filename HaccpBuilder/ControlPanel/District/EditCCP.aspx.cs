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

public partial class ControlPanel_District_EditCCP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //Get CCP from Database
            if (Request.QueryString["CCPId"] != null && Request.QueryString["GroupId"] != null)
            {
                GetData();
            }
            //if (Request.QueryString["Mode"] == "2")
            //{
            //    rdbSection.SelectedValue = Request.QueryString["Section"];
            //}

        }
    }
    protected void btnCreateChecklistGroup_Click(object sender, ImageClickEventArgs e)
    {
        switch (Request.QueryString["Mode"])
        {
            case "1":
                SaveCCP(1);
                break;
            case "2":
                SaveCCP(2);
                break;
            case "3":
                UpdateCCP();
                break;
        }
        string strGroupId = Request.QueryString["GroupId"];
        Response.Redirect("~/ControlPanel/District/CustomCCP.aspx?GroupId=" + strGroupId);
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomCCP.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    }
    private void GetData()
    {
        ProcessGetCCP getCCP = new ProcessGetCCP();
        //ProcessGetFoodSafetyCCPs getCCP = new ProcessGetFoodSafetyCCPs();

        IDataReader drCCP = getCCP.GetCCPById(int.Parse(Request.QueryString["CCPId"]));
        if (drCCP.Read())
        {
            txtCCP.Text = drCCP["CCP"].ToString();
            txtRequirement.Text = drCCP["Requirement"].ToString();
            txtCPRequirement.Text = drCCP["CPRequirement"].ToString();
            //rdbSection.SelectedValue = getSectionId(drCCP["Section"].ToString()).ToString();
            hfIsAdditional.Value = drCCP["Additional"].ToString();
            hfIsCustom.Value = drCCP["Custom"].ToString();
            hfIsSelected.Value = drCCP["Active"].ToString();
            drCCP.Close();
        }
        if (drCCP.IsClosed == false)
        {
            drCCP.Close();
        }
    }
    private void SaveCCP(int nType)
    {
        CCPs newCCP = new CCPs();
        //FoodSafetyCCP newCCP = new FoodSafetyCCP();
        newCCP.Active = 1;
        if (nType == 2)
        {
            newCCP.Additional = 1;
        }
        newCCP.CCPGroupId = int.Parse(Request.QueryString["GroupId"]);
        newCCP.Custom = 1;
        newCCP.CCP = txtCCP.Text;        
        newCCP.Requirement = txtRequirement.Text;
        newCCP.CPRequirement = txtCPRequirement.Text;
        if (Request.QueryString["CCPId"] != null)
        {
            newCCP.CCPId = int.Parse(Request.QueryString["CCPId"]);
        }
        ProcessCreateCCP createCCP = new ProcessCreateCCP();
        //ProcessCreateFoodSafetyCCP createCCP = new ProcessCreateFoodSafetyCCP();
        createCCP.CCP = newCCP;
        createCCP.Invoke();


    }
    private void UpdateCCP()
    {
       CCPs newCCP = new CCPs();
        //FoodSafetyCCP newCCP = new FoodSafetyCCP();
        newCCP.Active = int.Parse(hfIsSelected.Value);
        newCCP.Additional = int.Parse(hfIsAdditional.Value);
        newCCP.CCPGroupId = int.Parse(Request.QueryString["GroupId"]);
        newCCP.Custom = int.Parse(hfIsCustom.Value);
        newCCP.CCP = txtCCP.Text;
        newCCP.CPRequirement = txtCPRequirement.Text;
        newCCP.Requirement = txtRequirement.Text;
        if (Request.QueryString["CCPId"] != null)
        {
            newCCP.CCPId = int.Parse(Request.QueryString["CCPId"]);
        }
        ProcessSetCCP setCCP = new ProcessSetCCP();
        // ProcessSetFoodSafetyCCP setCCP = new ProcessSetFoodSafetyCCP();
        setCCP.CCP = newCCP;
        setCCP.Invoke();

    }
}
