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

public partial class ControlPanel_District_EditFoodCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //Get FoodCategory from Database
            if (Request.QueryString["FoodCategoryId"] != null && Request.QueryString["GroupId"] != null)
            {
                GetData();

            }
            //if (Request.QueryString["Mode"] == "2")
            //{
            //    rdbSection.SelectedValue = Request.QueryString["Section"];
            //}
            if (Request.QueryString["GroupId"] != null)
            {
                hlCancel.NavigateUrl = "~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"];
            }
        }
    }
    //protected void btnCreateChecklistGroup_Click(object sender, ImageClickEventArgs e)
    //{
    //    switch (Request.QueryString["Mode"])
    //    {
    //        case "1":
    //            SaveFoodCategory(1);
    //            break;
    //        case "2":
    //            SaveFoodCategory(2);
    //            break;
    //        case "3":
    //            UpdateFoodCategory();
    //            break;
    //    }
    //    string strGroupId = Request.QueryString["GroupId"];
    //    Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + strGroupId);
    //}
    //protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    // {
    //     Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    // }
    private void GetData()
    {
        ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
        //ProcessGetFoodSafetyFoodCategories getFoodCategory = new ProcessGetFoodSafetyFoodCategories();

        IDataReader drFoodCategory = getFoodCategory.GetFoodCategoryById(int.Parse(Request.QueryString["FoodCategoryId"]));
        if (drFoodCategory.Read())
        {
            txtFoodCategory.Text  = drFoodCategory["FoodCategory"].ToString();
            txtBiological.Text = drFoodCategory["BiologicalHazard"].ToString();
            txtPhysical.Text = drFoodCategory["PhysicalHazard"].ToString();
            txtChemical.Text = drFoodCategory["ChemicalHazard"].ToString();
            txtCCP.Text = drFoodCategory["CCP"].ToString();
            txtCP.Text = drFoodCategory["CP"].ToString();
            if (drFoodCategory["CCPLimit"] != null)
            {
                //    txtCCPLimit.Text = drFoodCategory["CCPLimit"].ToString();
                hfCCPLimit.Value = drFoodCategory["CCPLimit"].ToString();
            }
            if (drFoodCategory["CorrectiveAction"] != null)
            {
                //    txtCorrectiveAction.Text = drFoodCategory["CorrectiveAction"].ToString();
                hfCorrectiveAction.Value = drFoodCategory["CorrectiveAction"].ToString();
            }
            //rdbSection.SelectedValue = getSectionId(drFoodCategory["Section"].ToString()).ToString();
            hfIsAdditional.Value = drFoodCategory["Additional"].ToString();
            hfIsCustom.Value = drFoodCategory["Custom"].ToString();
            hfIsSelected.Value = drFoodCategory["Active"].ToString();
            hfSortOrder.Value = drFoodCategory["SortOrder"].ToString();
            hfGroupId.Value = drFoodCategory["FoodCategoryGroupId"].ToString();
            drFoodCategory.Close();
        }
        if (drFoodCategory.IsClosed == false)
        {
            drFoodCategory.Close();
        }
    }
    private bool CheckData(int nmode)
    {
        lblInfo.Text = "";
        bool RecordExist = true;
        if (nmode == 1)
        {
            if (txtFoodCategory.Text != string.Empty)
            {
                ProcessGetFoodCategory FoodCategory = new ProcessGetFoodCategory();
                DataSet dsFoodCategory = FoodCategory.GetFoodCategoryByName(txtFoodCategory.Text.Trim(), int.Parse(Request.QueryString["GroupId"]));
                if (dsFoodCategory.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "Food Category already exists.";
                    lblInfo.Visible = true;
                    RecordExist = false;
                }
                else
                {
                    RecordExist = true;
                    lblInfo.Visible = false;
                }
            }
            else
            {
                lblInfo.Text = "Please enter food category.";
                lblInfo.Visible = true;
                RecordExist = false;
            }
        }

        if (nmode == 2)
        {
            if (txtFoodCategory.Text != "")
            {
                ProcessGetFoodCategory FoodCategory = new ProcessGetFoodCategory();
                DataSet dsFoodCategory = FoodCategory.GetFoodCategoryByNameAndId(txtFoodCategory.Text.Trim(), int.Parse(Request.QueryString["FoodCategoryId"]), int.Parse(hfGroupId.Value));
                if (dsFoodCategory.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "Food Category already exists.";
                    lblInfo.Visible = true;
                    RecordExist = false;
                }
                else
                {
                    RecordExist = true;
                }
            }
            else
            {
                lblInfo.Text = "Please enter food category.";
                lblInfo.Visible = true;
                RecordExist = false;
            }
        }
        return RecordExist;



    }
    private bool SaveFoodCategory(int nType)
    {
        bool status = CheckData(1);
        if (status == true)
        {
            FoodCategories newFoodCategory = new FoodCategories();
            //FoodSafetyFoodCategory newFoodCategory = new FoodSafetyFoodCategory();
            newFoodCategory.Active = 1;
            if (nType == 2)
            {
                newFoodCategory.Additional = 1;
            }
            newFoodCategory.FoodCategoryGroupId = int.Parse(Request.QueryString["GroupId"]);
            newFoodCategory.Custom = 1;
            newFoodCategory.FoodCategory = txtFoodCategory.Text;
            newFoodCategory.BiologicalHazard = txtBiological.Text;
            newFoodCategory.ChemicalHazard = txtChemical.Text;
            newFoodCategory.PhysicalHazard = txtPhysical.Text;
            newFoodCategory.CCP = txtCCP.Text;
            newFoodCategory.CP = txtCP.Text;
            if (Request.QueryString["FoodCategoryId"] != null)
            {
                newFoodCategory.FoodCategoryId = int.Parse(Request.QueryString["FoodCategoryId"]);
            }
            if (!hfCCPLimit.Value.Equals(string.Empty))
            {
                newFoodCategory.CCPLimit = int.Parse(hfCCPLimit.Value);
            }
            else
            {
                newFoodCategory.CCPLimit = 0;
            }
            if (!hfCorrectiveAction.Value.Equals(string.Empty))
            {
                newFoodCategory.CorrectiveAction = hfCorrectiveAction.Value;
            }
            else
            {
                newFoodCategory.CorrectiveAction = "";
            }
            if (!hfSortOrder.Value.Equals(string.Empty))
            {
                newFoodCategory.SortOrder = int.Parse(hfSortOrder.Value);
            }
            else
            {
                newFoodCategory.SortOrder = 999;
            }
            //if (!txtCCPLimit.Text.Equals(string.Empty))
            //{
            //    newFoodCategory.CCPLimit = int.Parse(txtCCPLimit.Text);
            //}
            //if (!txtCorrectiveAction.Text.Equals(string.Empty))
            //{
            //    newFoodCategory.CorrectiveAction = txtCorrectiveAction.Text;
            //}
            ProcessCreateFoodCategory createFoodCategory = new ProcessCreateFoodCategory();
            //ProcessCreateFoodSafetyFoodCategory createFoodCategory = new ProcessCreateFoodSafetyFoodCategory();
            createFoodCategory.FoodCategory = newFoodCategory;
            createFoodCategory.Invoke();
        }
        return status;

    }
    private bool UpdateFoodCategory()
    {
        bool status = CheckData(2);
        if (status == true)
        {
            FoodCategories newFoodCategory = new FoodCategories();
            //FoodSafetyFoodCategory newFoodCategory = new FoodSafetyFoodCategory();
            newFoodCategory.Active = int.Parse(hfIsSelected.Value);
            newFoodCategory.Additional = int.Parse(hfIsAdditional.Value);
            newFoodCategory.FoodCategoryGroupId = int.Parse(Request.QueryString["GroupId"]);
            newFoodCategory.Custom = int.Parse(hfIsCustom.Value);
            newFoodCategory.FoodCategory = txtFoodCategory.Text;
            newFoodCategory.BiologicalHazard = txtBiological.Text;
            newFoodCategory.ChemicalHazard = txtChemical.Text;
            newFoodCategory.PhysicalHazard = txtPhysical.Text;
            newFoodCategory.CCP = txtCCP.Text;
            newFoodCategory.CP = txtCP.Text;
            newFoodCategory.SortOrder = int.Parse(hfSortOrder.Value);
            if (Request.QueryString["FoodCategoryId"] != null)
            {
                newFoodCategory.FoodCategoryId = int.Parse(Request.QueryString["FoodCategoryId"]);
            }
            //if (!txtCCPLimit.Text.Equals(string.Empty))
            //{
            //    newFoodCategory.CCPLimit = int.Parse(txtCCPLimit.Text);
            //}
            //if (!txtCorrectiveAction.Text.Equals(string.Empty))
            //{
            //    newFoodCategory.CorrectiveAction = txtCorrectiveAction.Text;
            //}
            if (!hfCCPLimit.Value.Equals(string.Empty))
            {
                newFoodCategory.CCPLimit = int.Parse(hfCCPLimit.Value);
            }
            else
            {
                newFoodCategory.CCPLimit = 0;
            }
            if (!hfCorrectiveAction.Value.Equals(string.Empty))
            {
                newFoodCategory.CorrectiveAction = hfCorrectiveAction.Value;
            }
            else
            {
                newFoodCategory.CorrectiveAction = "";
            }
            if (!hfSortOrder.Value.Equals(string.Empty))
            {
                newFoodCategory.SortOrder = int.Parse(hfSortOrder.Value);
            }
            else
            {
                newFoodCategory.SortOrder = 0;
            }
            ProcessSetFoodCategory setFoodCategory = new ProcessSetFoodCategory();
            // ProcessSetFoodSafetyFoodCategory setFoodCategory = new ProcessSetFoodSafetyFoodCategory();
            setFoodCategory.FoodCategory = newFoodCategory;
            setFoodCategory.Invoke();
        }
        return status;
    }
    protected void btnCreateChecklistGroup_Click1(object sender, EventArgs e)
    {
        lblInfo.Text = "";
        bool result = true;
        switch (Request.QueryString["Mode"])
        {
            case "1":
                result = SaveFoodCategory(1);
                break;
            case "2":
                result = SaveFoodCategory(2);
                break;
            case "3":
                result = UpdateFoodCategory();
                break;
        }
        if (result == true)
        {
            string strGroupId = Request.QueryString["GroupId"];
            Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + strGroupId);
        }
    }
    protected void btnAddKitchens_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    }
    //protected void ValidateFoodCategory(object source, ServerValidateEventArgs args)
    //{
    //    int nResult = 0;
    //    //if (rdbNoItem.Checked != true)
    //    //{
    //    if (txtFoodCategory.Value != "")
    //    {
    //        nResult = 1;


    //    }
    //    if (nResult == 0)
    //    {

    //        args.IsValid = false;
    //    }
    //}

}
