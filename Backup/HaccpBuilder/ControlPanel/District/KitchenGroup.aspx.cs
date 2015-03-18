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


public partial class ControlPanel_District_KitchenGroup : System.Web.UI.Page
{
    private static Boolean setSop = true, setFscl = true, setValidation = true, setCcp = true, setFoodCategory = true, setProcess = true, setChecklist = true, setCtpat = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (TypeId == (int)DistrictTypeEnum.Ctpat)
            {
                setSop = false;
                setFscl = false;
                setValidation = false;
                setCcp = false;               
                setFoodCategory = false;
                setProcess = true;
                setChecklist = true;
                setCtpat = true;
                

            }
            if (TypeId == (int)DistrictTypeEnum.HaccpBuilder)
            {
                setSop = true;
                setFscl = true;
                setValidation = true;
                setCcp = true;
                setFoodCategory = true;
                setProcess = true;
                setChecklist = true;
                setCtpat = false;
            }
            if (TypeId == (int)DistrictTypeEnum.HaccpCtpat)
            {
                setSop = true;
                setFscl = true;
                setValidation = true;
                setCcp = true;
                setFoodCategory = true;
                setProcess = true;
                setChecklist = true;
                setCtpat = true;
            }
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        SaveKitchenSOPGroup();
        Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
    }
    private void SaveKitchenSOPGroup()
    {
        int i, totalItems;
        totalItems = GridView1.Rows.Count;
        for (i = 0; i < totalItems; i++)
        {
            DropDownList ddlSOP = (DropDownList)GridView1.Rows[i].FindControl("ddlSOPGroup");
            HiddenField hfKitchen = (HiddenField)GridView1.Rows[i].FindControl("hfKitchenId");
            DropDownList ddlFSCL = (DropDownList)GridView1.Rows[i].FindControl("ddlFSCL");
            DropDownList ddlValidation = (DropDownList)GridView1.Rows[i].FindControl("ddlValidation");
            DropDownList ddlCCP = (DropDownList)GridView1.Rows[i].FindControl("ddlCCP");
            DropDownList ddlFoodCategory = (DropDownList)GridView1.Rows[i].FindControl("ddlFoodCategory");
            DropDownList ddlProcess = (DropDownList)GridView1.Rows[i].FindControl("ddlProcess");
            DropDownList ddlChecklist = (DropDownList)GridView1.Rows[i].FindControl("ddlChecklist");
            DropDownList ddlCtpat = (DropDownList)GridView1.Rows[i].FindControl("ddlCtpat");

            if(setSop)
            if (ddlSOP != null || hfKitchen != null)
            {
                //////////////////////////////
                ///Save KitchenSOPGroup///////

                KitchenSOPGroup kitchenSOPGroup = new KitchenSOPGroup();
                kitchenSOPGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenSOPGroup.SOPGroupId = int.Parse(ddlSOP.SelectedValue);

                ProcessDeleteKitchenSOPGroup deleteKistchenSOPGroup = new ProcessDeleteKitchenSOPGroup();
                deleteKistchenSOPGroup.KitchenSOPGroup = kitchenSOPGroup;
                deleteKistchenSOPGroup.Invoke();

                ProcessCreateKitchenSOPGroup createKitchenSOPGroup = new ProcessCreateKitchenSOPGroup();
                createKitchenSOPGroup.kitchenSOPGroup = kitchenSOPGroup;
                createKitchenSOPGroup.Invoke();


            }
            if(setFscl)
            if (ddlFSCL != null)
            {
                //////////////////////////////
                ///Save KitchenCheckListGroup///////

                KitchenCheckListGroup kitchenCheckListGroup = new KitchenCheckListGroup();
                kitchenCheckListGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenCheckListGroup.CheckListGroupId = int.Parse(ddlFSCL.SelectedValue);

                ProcessDeleteKitchenCheckListGroup deleteKistchenCheckListGroup = new ProcessDeleteKitchenCheckListGroup();
                deleteKistchenCheckListGroup.KitchenCheckListGroup = kitchenCheckListGroup;
                deleteKistchenCheckListGroup.Invoke();

                ProcessCreateKitchenCheckListGroup createKitchenCheckListGroup = new ProcessCreateKitchenCheckListGroup();
                createKitchenCheckListGroup.kitchenCheckListGroup = kitchenCheckListGroup;
                createKitchenCheckListGroup.Invoke();


            }
            if(setValidation)
            if (ddlValidation != null)
            {
                //////////////////////////////
                ///Save KitchenValidationGroup///////

                KitchenValidationGroup kitchenValidationGroup = new KitchenValidationGroup();
                kitchenValidationGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenValidationGroup.ValidationGroupId = int.Parse(ddlValidation.SelectedValue);

                ProcessDeleteKitchenValidationGroup deleteKistchenValidationGroup = new ProcessDeleteKitchenValidationGroup();
                deleteKistchenValidationGroup.KitchenValidationGroup = kitchenValidationGroup;
                deleteKistchenValidationGroup.Invoke();

                ProcessCreateKitchenValidationGroup createKitchenValidationGroup = new ProcessCreateKitchenValidationGroup();
                createKitchenValidationGroup.kitchenValidationGroup = kitchenValidationGroup;
                createKitchenValidationGroup.Invoke();


            }            
            if (ddlCCP != null)
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
            if(setFoodCategory)
            if (ddlFoodCategory != null)
            
            {
                //////////////////////////////
                ///Save KitchenFoodCategoryGroup///////

                KitchenFoodCategoryGroup kitchenFoodCategoryGroup = new KitchenFoodCategoryGroup();
                kitchenFoodCategoryGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenFoodCategoryGroup.FoodCategoryGroupId = int.Parse(ddlFoodCategory.SelectedValue);

                ProcessGetKitchenFoodCategoryGroup getKitchenFoodCategoryGroup = new ProcessGetKitchenFoodCategoryGroup();
                IDataReader drKitchenFoodCategoryGroup = getKitchenFoodCategoryGroup.Get(int.Parse(hfKitchen.Value));
                if (drKitchenFoodCategoryGroup.Read())
                {
                    if (int.Parse(drKitchenFoodCategoryGroup["FoodCategoryGroupId"].ToString()) != int.Parse(ddlFoodCategory.SelectedValue))
                    {

                        ProcessDeleteKitchenFoodCategoryGroup deleteKistchenFoodCategoryGroup = new ProcessDeleteKitchenFoodCategoryGroup();
                        deleteKistchenFoodCategoryGroup.KitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                        deleteKistchenFoodCategoryGroup.Invoke();

                        ProcessCreateKitchenFoodCategoryGroup createKitchenFoodCategoryGroup = new ProcessCreateKitchenFoodCategoryGroup();
                        createKitchenFoodCategoryGroup.kitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                        createKitchenFoodCategoryGroup.Invoke();

                        // Remove the FoodCAtegory IDs from Ingredient table related to that Kitchen
                        // so that Kitchen Manager can update Ingreients according to new Food Category Group
                        ProcessSetIngredient setIngredient = new ProcessSetIngredient();
                        setIngredient.SetIngredientFoodCategory(int.Parse(hfKitchen.Value));
                    }
                    drKitchenFoodCategoryGroup.Close();
                }
                if (drKitchenFoodCategoryGroup.IsClosed == false)
                {
                    drKitchenFoodCategoryGroup.Close();
                }
            }
            if(setProcess)
            if (ddlProcess != null)
            {
                //////////////////////////////
                ///Save KitchenProcessGroup///////

                KitchenProcessGroup kitchenProcessGroup = new KitchenProcessGroup();
                kitchenProcessGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenProcessGroup.ProcessGroupId = int.Parse(ddlProcess.SelectedValue);

                ProcessDeleteKitchenProcessGroup deleteKistchenProcessGroup = new ProcessDeleteKitchenProcessGroup();
                deleteKistchenProcessGroup.KitchenProcessGroup = kitchenProcessGroup;
                deleteKistchenProcessGroup.Invoke();

                ProcessCreateKitchenProcessGroup createKitchenProcessGroup = new ProcessCreateKitchenProcessGroup();
                createKitchenProcessGroup.kitchenProcessGroup = kitchenProcessGroup;
                createKitchenProcessGroup.Invoke();


            }
            if(setChecklist)
            if (ddlChecklist != null && ddlChecklist.Items.Count > 0)
            {
                //////////////////////////////
                ///Save KitchenProcessGroup///////

                KitchenCheckListAddOnGroup kitchenChecklistGroup = new KitchenCheckListAddOnGroup();
                kitchenChecklistGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenChecklistGroup.CheckListAddOnGroupId = int.Parse(ddlChecklist.SelectedValue);

                ProcessDeleteKitchenCheckListAddOnGroup deleteKistchenCheckListGroup = new ProcessDeleteKitchenCheckListAddOnGroup();
                deleteKistchenCheckListGroup.KitchenCheckListGroup = kitchenChecklistGroup;
                deleteKistchenCheckListGroup.Invoke();

                ProcessCreateKitchenCheckListAddOnGroup createKitchenCheckListGroup = new ProcessCreateKitchenCheckListAddOnGroup();
                createKitchenCheckListGroup.KitchenCheckListGroup = kitchenChecklistGroup;
                createKitchenCheckListGroup.Invoke();


            }
            if (setCtpat)
                if (ddlCtpat != null && ddlCtpat.Items.Count > 0)
                {
                    //////////////////////////////
                    ///Save KitchenProcessGroup///////

                    KitchenCtpatGroup kitchenCtpatGroup = new KitchenCtpatGroup();
                    kitchenCtpatGroup.KitchenId = int.Parse(hfKitchen.Value);
                    kitchenCtpatGroup.CtpatGroupId = int.Parse(ddlCtpat.SelectedValue);

                    ProcessDeleteKitchenCtpatGroup deleteKistchenCtpatGroup = new ProcessDeleteKitchenCtpatGroup();
                    deleteKistchenCtpatGroup.KitchenCtpatGroup = kitchenCtpatGroup;
                    deleteKistchenCtpatGroup.Invoke();

                    ProcessCreateKitchenCtpatGroup createKitchenCtpatGroup = new ProcessCreateKitchenCtpatGroup();
                    createKitchenCtpatGroup.KitchenCtpatGroup = kitchenCtpatGroup;
                    createKitchenCtpatGroup.Invoke();


                }
        }
         //totalItems = GridView2.Rows.Count;
         //for (i = 0; i < totalItems; i++)
         //{
         //    HiddenField hfKitchen = (HiddenField)GridView2.Rows[i].FindControl("hfKitchenId");
         //    DropDownList ddlCCP = (DropDownList)GridView2.Rows[i].FindControl("ddlCCP");
         //    DropDownList ddlFoodCategory = (DropDownList)GridView2.Rows[i].FindControl("ddlFoodCategory");
         //    if (ddlCCP != null)
         //    {
         //        //////////////////////////////
         //        ///Save KitchenCCPGroup///////

         //        KitchenCCPGroup kitchenCCPGroup = new KitchenCCPGroup();
         //        kitchenCCPGroup.KitchenId = int.Parse(hfKitchen.Value);
         //        kitchenCCPGroup.CCPGroupId = int.Parse(ddlCCP.SelectedValue);

         //        ProcessDeleteKitchenCCPGroup deleteKistchenCCPGroup = new ProcessDeleteKitchenCCPGroup();
         //        deleteKistchenCCPGroup.KitchenCCPGroup = kitchenCCPGroup;
         //        deleteKistchenCCPGroup.Invoke();

         //        ProcessCreateKitchenCCPGroup createKitchenCCPGroup = new ProcessCreateKitchenCCPGroup();
         //        createKitchenCCPGroup.kitchenCCPGroup = kitchenCCPGroup;
         //        createKitchenCCPGroup.Invoke();


         //    }
         //    if (ddlFoodCategory != null)
         //    {
         //        //////////////////////////////
         //        ///Save KitchenFoodCategoryGroup///////

         //        KitchenFoodCategoryGroup kitchenFoodCategoryGroup = new KitchenFoodCategoryGroup();
         //        kitchenFoodCategoryGroup.KitchenId = int.Parse(hfKitchen.Value);
         //        kitchenFoodCategoryGroup.FoodCategoryGroupId = int.Parse(ddlFoodCategory.SelectedValue);

         //        ProcessDeleteKitchenFoodCategoryGroup deleteKistchenFoodCategoryGroup = new ProcessDeleteKitchenFoodCategoryGroup();
         //        deleteKistchenFoodCategoryGroup.KitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
         //        deleteKistchenFoodCategoryGroup.Invoke();

         //        ProcessCreateKitchenFoodCategoryGroup createKitchenFoodCategoryGroup = new ProcessCreateKitchenFoodCategoryGroup();
         //        createKitchenFoodCategoryGroup.kitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
         //        createKitchenFoodCategoryGroup.Invoke();


         //    }
         //}

    }
    protected void grdhKitchenGroup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfKitchenId = (HiddenField)e.Row.FindControl("hfKitchenId");
            DropDownList ddlSOPGroup = (DropDownList)e.Row.FindControl("ddlSOPGroup");
           
            if (ddlSOPGroup != null || hfKitchenId != null)
            {
                IDataReader drKitchenSOPGroup;
                ProcessGetKitchenSOPGroup getKitchenSOPGroup = new ProcessGetKitchenSOPGroup();
                drKitchenSOPGroup = getKitchenSOPGroup.Get(int.Parse(hfKitchenId.Value));
                if (drKitchenSOPGroup.Read())
                {
                    ddlSOPGroup.SelectedValue = drKitchenSOPGroup["KitchenGroupId"].ToString();
                    drKitchenSOPGroup.Close();

                }
                if (drKitchenSOPGroup.IsClosed == false)
                {
                    drKitchenSOPGroup.Close();
                }
            }
        }

    }
    protected void btnCreateCustomSOP_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void btnEditSOPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/SOPGroup.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfKitchenId = (HiddenField)e.Row.FindControl("hfKitchenId");
            DropDownList ddlSOPGroup = (DropDownList)e.Row.FindControl("ddlSOPGroup");
            DropDownList ddlFSCL = (DropDownList)e.Row.FindControl("ddlFSCL");
            DropDownList ddlValidation = (DropDownList)e.Row.FindControl("ddlValidation");
            DropDownList ddlCCP = (DropDownList)e.Row.FindControl("ddlCCP");
            DropDownList ddlFoodCategory = (DropDownList)e.Row.FindControl("ddlFoodCategory");
            DropDownList ddlProcess = (DropDownList)e.Row.FindControl("ddlProcess");
            DropDownList ddlChecklist = (DropDownList)e.Row.FindControl("ddlChecklist");
            DropDownList ddlCtpat = (DropDownList)e.Row.FindControl("ddlCtpat");

            Label lblSop = (Label)e.Row.FindControl("lblSOP");
            Label lblChecklist = (Label)e.Row.FindControl("lblChecklist");
            Label lblValidation = (Label)e.Row.FindControl("lblValidation");
            Label lblFoodCategory = (Label)e.Row.FindControl("lblFoodCategory");
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblcheckListAddOn = (Label)e.Row.FindControl("lblcheckListAddOn");
            Label lblCtpat = (Label)e.Row.FindControl("lblCtpat");
            
            if (ddlSOPGroup != null || hfKitchenId != null  )
            {
                if (setSop == true)
                {
                    IDataReader drKitchenSOPGroup;
                    ProcessGetKitchenSOPGroup getKitchenSOPGroup = new ProcessGetKitchenSOPGroup();
                    drKitchenSOPGroup = getKitchenSOPGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drKitchenSOPGroup.Read())
                    {
                        ddlSOPGroup.SelectedValue = drKitchenSOPGroup["KitchenGroupId"].ToString();
                        drKitchenSOPGroup.Close();

                    }
                    if (drKitchenSOPGroup.IsClosed == false)
                    {
                        drKitchenSOPGroup.Close();
                    }
                }
                else
                {
                    ddlSOPGroup.Visible = false;
                    lblSop.Visible = false;
                }
            }
            
            if (ddlFSCL != null)
            {
                if (setFscl == true)
                {
                    IDataReader drFSCL;
                    ProcessGetKitchenCheckListGroup getKitchenCheckListGroup = new ProcessGetKitchenCheckListGroup();
                    drFSCL = getKitchenCheckListGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drFSCL.Read())
                    {
                        ddlFSCL.SelectedValue = drFSCL["ChecklistGroupId"].ToString();
                        drFSCL.Close();
                    }
                    if (drFSCL.IsClosed == false)
                    {
                        drFSCL.Close();
                    }
                }
                else
                {
                    ddlFSCL.Visible = false;
                    lblChecklist.Visible = false;
                }
            }
            if (ddlValidation != null)
            {
                if (setValidation == true)
                {
                    IDataReader drValidation;
                    ProcessGetKitchenValidationGroup getKitchenValidationGroup = new ProcessGetKitchenValidationGroup();
                    drValidation = getKitchenValidationGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drValidation.Read())
                    {
                        ddlValidation.SelectedValue = drValidation["ValidationGroupId"].ToString();
                        drValidation.Close();
                    }
                    if (drValidation.IsClosed == false)
                    {
                        drValidation.Close();
                        
                    }
                }
                else
                {
                    ddlValidation.Visible = false;
                    lblValidation.Visible = false;
                }
            }
            if (ddlCCP != null)
            {
                if (setCcp == true)
                {
                    IDataReader drCCP;
                    ProcessGetKitchenCCPGroup getKitchenCCPGroup = new ProcessGetKitchenCCPGroup();
                    drCCP = getKitchenCCPGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drCCP.Read())
                    {
                        ddlCCP.SelectedValue = drCCP["CCPGroupId"].ToString();
                        drCCP.Close();
                    }
                    if (drCCP.IsClosed == false)
                    {
                        drCCP.Close();
                    }
                }
                else
                {
                    ddlCCP.Visible = false;
                }
            }
            if (ddlFoodCategory != null)
            {
                if (setFoodCategory == true)
                {
                    IDataReader drFoodCategory;
                    ProcessGetKitchenFoodCategoryGroup getKitchenFoodCategoryGroup = new ProcessGetKitchenFoodCategoryGroup();
                    drFoodCategory = getKitchenFoodCategoryGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drFoodCategory.Read())
                    {
                        ddlFoodCategory.SelectedValue = drFoodCategory["FoodCategoryGroupId"].ToString();
                        drFoodCategory.Close();
                    }
                    if (drFoodCategory.IsClosed == false)
                    {
                        drFoodCategory.Close();
                    }
                }
                else
                {
                    ddlFoodCategory.Visible = false;
                    lblFoodCategory.Visible=false;
                }
            }
            if (ddlProcess != null)
            {
                if (setProcess == true)
                {
                    IDataReader drProcess;
                    ProcessGetKitchenProcessGroup getKitchenProcessGroup = new ProcessGetKitchenProcessGroup();
                    drProcess = getKitchenProcessGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drProcess.Read())
                    {
                        ddlProcess.SelectedValue = drProcess["ProcessGroupId"].ToString();
                        drProcess.Close();
                    }
                    if (drProcess.IsClosed == false)
                    {
                        drProcess.Close();
                    }
                }
                else
                {
                    ddlProcess.Visible = false;
                    lblProcess.Visible=false;
                }
                
            }
            if (ddlChecklist != null)
            {
                if (setChecklist == true)
                {
                    IDataReader drProcess;
                    ProcessGetKitchenCheckListAddOnGroup getKitchenChecklistGroup = new ProcessGetKitchenCheckListAddOnGroup();
                    drProcess = getKitchenChecklistGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drProcess.Read())
                    {
                        ddlChecklist.SelectedValue = drProcess["ChecklistAddOnGroupId"].ToString();
                        drProcess.Close();
                    }
                    if (drProcess.IsClosed == false)
                    {
                        drProcess.Close();
                    }
                }
                else
                {
                    ddlChecklist.Visible = false;
                    lblcheckListAddOn.Visible=false;
                }
            }
            if (ddlCtpat != null)
            {
                if (setCtpat == true)
                {
                    IDataReader drProcess;
                    ProcessGetKitchenCtpatGroup getKitchenCtpatGroup = new ProcessGetKitchenCtpatGroup();
                    drProcess = getKitchenCtpatGroup.Get(int.Parse(hfKitchenId.Value));
                    if (drProcess.Read())
                    {
                        ddlCtpat.SelectedValue = drProcess["CtpatGroupId"].ToString();
                        drProcess.Close();
                    }
                    if (drProcess.IsClosed == false)
                    {
                        drProcess.Close();
                    }
                }
                else
                {
                    ddlCtpat.Visible = false;
                    lblCtpat.Visible=false;
                }
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Submit")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            HiddenField hfKitchen = (HiddenField)row.FindControl("hfKitchenId");
            DropDownList ddlSOP = (DropDownList)row.FindControl("ddlSOPGroup");
            DropDownList ddlFSCL = (DropDownList)row.FindControl("ddlFSCL");
            DropDownList ddlValidation = (DropDownList)row.FindControl("ddlValidation");
            DropDownList ddlCCP = (DropDownList)row.FindControl("ddlCCP");
            DropDownList ddlFoodCategory = (DropDownList)row.FindControl("ddlFoodCategory");
            DropDownList ddlProcess = (DropDownList)row.FindControl("ddlProcess");
            DropDownList ddlChecklist = (DropDownList)row.FindControl("ddlChecklist");
            DropDownList ddlCtpat = (DropDownList)row.FindControl("ddlCtpat");

           if(setSop == true)
            if (ddlSOP != null || hfKitchen != null)
            {
                //////////////////////////////
                ///Save KitchenSOPGroup///////

                KitchenSOPGroup kitchenSOPGroup = new KitchenSOPGroup();
                kitchenSOPGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenSOPGroup.SOPGroupId = int.Parse(ddlSOP.SelectedValue);

                ProcessDeleteKitchenSOPGroup deleteKistchenSOPGroup = new ProcessDeleteKitchenSOPGroup();
                deleteKistchenSOPGroup.KitchenSOPGroup = kitchenSOPGroup;
                deleteKistchenSOPGroup.Invoke();

                ProcessCreateKitchenSOPGroup createKitchenSOPGroup = new ProcessCreateKitchenSOPGroup();
                createKitchenSOPGroup.kitchenSOPGroup = kitchenSOPGroup;
                createKitchenSOPGroup.Invoke();


            }
            if(setFscl)
            if (ddlFSCL != null)
            {
                //////////////////////////////
                ///Save KitchenCheckListGroup///////

                KitchenCheckListGroup kitchenCheckListGroup = new KitchenCheckListGroup();
                kitchenCheckListGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenCheckListGroup.CheckListGroupId = int.Parse(ddlFSCL.SelectedValue);

                ProcessDeleteKitchenCheckListGroup deleteKistchenCheckListGroup = new ProcessDeleteKitchenCheckListGroup();
                deleteKistchenCheckListGroup.KitchenCheckListGroup = kitchenCheckListGroup;
                deleteKistchenCheckListGroup.Invoke();

                ProcessCreateKitchenCheckListGroup createKitchenCheckListGroup = new ProcessCreateKitchenCheckListGroup();
                createKitchenCheckListGroup.kitchenCheckListGroup = kitchenCheckListGroup;
                createKitchenCheckListGroup.Invoke();


            }
            if(setValidation)
            if (ddlValidation != null)
            {
                //////////////////////////////
                ///Save KitchenValidationGroup///////

                KitchenValidationGroup kitchenValidationGroup = new KitchenValidationGroup();
                kitchenValidationGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenValidationGroup.ValidationGroupId = int.Parse(ddlValidation.SelectedValue);

                ProcessDeleteKitchenValidationGroup deleteKistchenValidationGroup = new ProcessDeleteKitchenValidationGroup();
                deleteKistchenValidationGroup.KitchenValidationGroup = kitchenValidationGroup;
                deleteKistchenValidationGroup.Invoke();

                ProcessCreateKitchenValidationGroup createKitchenValidationGroup = new ProcessCreateKitchenValidationGroup();
                createKitchenValidationGroup.kitchenValidationGroup = kitchenValidationGroup;
                createKitchenValidationGroup.Invoke();


            }
            if (ddlCCP != null)
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
            if(setFoodCategory)
            if (ddlFoodCategory != null)
            {
                //////////////////////////////
                ///Save KitchenFoodCategoryGroup///////

                KitchenFoodCategoryGroup kitchenFoodCategoryGroup = new KitchenFoodCategoryGroup();
                kitchenFoodCategoryGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenFoodCategoryGroup.FoodCategoryGroupId = int.Parse(ddlFoodCategory.SelectedValue);

                ProcessGetKitchenFoodCategoryGroup getKitchenFoodCategoryGroup = new ProcessGetKitchenFoodCategoryGroup();
                IDataReader drKitchenFoodCategoryGroup = getKitchenFoodCategoryGroup.Get(int.Parse(hfKitchen.Value));
                if (drKitchenFoodCategoryGroup.Read())
                {
                    if (int.Parse(drKitchenFoodCategoryGroup["FoodCategoryGroupId"].ToString()) != int.Parse(ddlFoodCategory.SelectedValue))
                    {

                        ProcessDeleteKitchenFoodCategoryGroup deleteKistchenFoodCategoryGroup = new ProcessDeleteKitchenFoodCategoryGroup();
                        deleteKistchenFoodCategoryGroup.KitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                        deleteKistchenFoodCategoryGroup.Invoke();

                        ProcessCreateKitchenFoodCategoryGroup createKitchenFoodCategoryGroup = new ProcessCreateKitchenFoodCategoryGroup();
                        createKitchenFoodCategoryGroup.kitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                        createKitchenFoodCategoryGroup.Invoke();

                        // Remove the FoodCAtegory IDs from Ingredient table related to that Kitchen
                        // so that Kitchen Manager can update Ingreients according to new Food Category Group
                        ProcessSetIngredient setIngredient = new ProcessSetIngredient();
                        setIngredient.SetIngredientFoodCategory(int.Parse(hfKitchen.Value));
                    }
                    drKitchenFoodCategoryGroup.Close();
                }

                if (drKitchenFoodCategoryGroup.IsClosed == false)
                {
                    drKitchenFoodCategoryGroup.Close();
                }

            }
            if(setProcess)
            if (ddlProcess != null)
            {
                //////////////////////////////
                ///Save KitchenProcessGroup///////

                KitchenProcessGroup kitchenProcessGroup = new KitchenProcessGroup();
                kitchenProcessGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenProcessGroup.ProcessGroupId = int.Parse(ddlProcess.SelectedValue);

                ProcessGetKitchenProcessGroup getProcessGroup = new ProcessGetKitchenProcessGroup();
                IDataReader drProcessGroup = getProcessGroup.Get(int.Parse(hfKitchen.Value));
                if (drProcessGroup.Read())
                {
                    if (int.Parse(drProcessGroup["ProcessGroupId"].ToString()) != int.Parse(ddlProcess.SelectedValue))
                    {
                        ProcessDeleteKitchenProcessGroup deleteKistchenProcessGroup = new ProcessDeleteKitchenProcessGroup();
                        deleteKistchenProcessGroup.KitchenProcessGroup = kitchenProcessGroup;
                        deleteKistchenProcessGroup.Invoke();

                        ProcessCreateKitchenProcessGroup createKitchenProcessGroup = new ProcessCreateKitchenProcessGroup();
                        createKitchenProcessGroup.kitchenProcessGroup = kitchenProcessGroup;
                        createKitchenProcessGroup.Invoke();

                        // Remove the Process IDs from Menu Items table related to that Kitchen
                        // so that Kitchen Manager can update Menu Items according to new Process Group
                        ProcessSetMenuItemNew updateMenuProcess = new ProcessSetMenuItemNew();
                        updateMenuProcess.SetMenuProcess(int.Parse(hfKitchen.Value));
                    }
                }
            }
            if(setChecklist)
            if (ddlChecklist != null && ddlChecklist.Items.Count > 0)
            {
                //////////////////////////////
                ///Save KitchenProcessGroup///////

                KitchenCheckListAddOnGroup kitchenChecklistGroup = new KitchenCheckListAddOnGroup();
                kitchenChecklistGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenChecklistGroup.CheckListAddOnGroupId = int.Parse(ddlChecklist.SelectedValue);

                ProcessDeleteKitchenCheckListAddOnGroup deleteKistchenCheckListGroup = new ProcessDeleteKitchenCheckListAddOnGroup();
                deleteKistchenCheckListGroup.KitchenCheckListGroup = kitchenChecklistGroup;
                deleteKistchenCheckListGroup.Invoke();

                ProcessCreateKitchenCheckListAddOnGroup createKitchenCheckListGroup = new ProcessCreateKitchenCheckListAddOnGroup();
                createKitchenCheckListGroup.KitchenCheckListGroup = kitchenChecklistGroup;
                createKitchenCheckListGroup.Invoke();


            }
            if (setCtpat)
                if (ddlCtpat != null)
                {
                    //////////////////////////////
                    ///Save KitchenCtpatGroup///////

                    KitchenCtpatGroup kitchenCtpatGroup = new KitchenCtpatGroup();
                    kitchenCtpatGroup.KitchenId = int.Parse(hfKitchen.Value);
                    kitchenCtpatGroup.CtpatGroupId = int.Parse(ddlCtpat.SelectedValue);

                    ProcessDeleteKitchenCtpatGroup deleteKistchenCtpatGroup = new ProcessDeleteKitchenCtpatGroup();
                    deleteKistchenCtpatGroup.KitchenCtpatGroup = kitchenCtpatGroup;
                    deleteKistchenCtpatGroup.Invoke();

                    ProcessCreateKitchenCtpatGroup createKitchenCtpatGroup = new ProcessCreateKitchenCtpatGroup();
                    createKitchenCtpatGroup.KitchenCtpatGroup = kitchenCtpatGroup;
                    createKitchenCtpatGroup.Invoke();


                }

        }

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hfKitchenId = (HiddenField)e.Row.FindControl("hfKitchenId");
            DropDownList ddlCCP = (DropDownList)e.Row.FindControl("ddlCCP");
            DropDownList ddlFoodCategory = (DropDownList)e.Row.FindControl("ddlFoodCategory");
            if (ddlCCP != null)
            {
                IDataReader drCCP;
                ProcessGetKitchenCCPGroup getKitchenCCPGroup = new ProcessGetKitchenCCPGroup();
                drCCP = getKitchenCCPGroup.Get(int.Parse(hfKitchenId.Value));
                if (drCCP.Read())
                {
                    ddlCCP.SelectedValue = drCCP["CCPGroupId"].ToString();
                    drCCP.Close();
                }
                if (drCCP.IsClosed == false)
                {
                    drCCP.Close();
                }
            }
            if (ddlFoodCategory != null)
            {
                IDataReader drFoodCategory;
                ProcessGetKitchenFoodCategoryGroup getKitchenFoodCategoryGroup = new ProcessGetKitchenFoodCategoryGroup();
                drFoodCategory = getKitchenFoodCategoryGroup.Get(int.Parse(hfKitchenId.Value));
                if (drFoodCategory.Read())
                {
                    ddlFoodCategory.SelectedValue = drFoodCategory["FoodCategoryGroupId"].ToString();
                    drFoodCategory.Close();
                }
                if (drFoodCategory.IsClosed == false)
                {
                    drFoodCategory.Close();
                }
            }
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Submit")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            HiddenField hfKitchen = (HiddenField)row.FindControl("hfKitchenId");
            DropDownList ddlCCP = (DropDownList)row.FindControl("ddlCCP");
            DropDownList ddlFoodCategory = (DropDownList)row.FindControl("ddlFoodCategory");

            if (ddlCCP != null)
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
            if (ddlFoodCategory != null)
            {
                //////////////////////////////
                ///Save KitchenFoodCategoryGroup///////

                KitchenFoodCategoryGroup kitchenFoodCategoryGroup = new KitchenFoodCategoryGroup();
                kitchenFoodCategoryGroup.KitchenId = int.Parse(hfKitchen.Value);
                kitchenFoodCategoryGroup.FoodCategoryGroupId = int.Parse(ddlFoodCategory.SelectedValue);

                ProcessDeleteKitchenFoodCategoryGroup deleteKistchenFoodCategoryGroup = new ProcessDeleteKitchenFoodCategoryGroup();
                deleteKistchenFoodCategoryGroup.KitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                deleteKistchenFoodCategoryGroup.Invoke();

                ProcessCreateKitchenFoodCategoryGroup createKitchenFoodCategoryGroup = new ProcessCreateKitchenFoodCategoryGroup();
                createKitchenFoodCategoryGroup.kitchenFoodCategoryGroup = kitchenFoodCategoryGroup;
                createKitchenFoodCategoryGroup.Invoke();


            }
        }
    }
    public int TypeId
    {
        get
        {
            if (Session["TypeId"] != null)
                return (int)Session["TypeId"];
            else
            {
                Response.Redirect("~/ControlPanel/LogOut.aspx");
                return 0;
            }

        }
    }
  
           
}
