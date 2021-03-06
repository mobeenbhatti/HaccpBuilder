﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class MenuItemsNew1 : System.Web.UI.Page
    {
        string mode = "new";
        protected int currentPageNumber = 1;
        private const int PAGE_SIZE = 20;
        private static int currentPage = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                if (TypeId == 7)
                    Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");
                GetInitialData();
                SetPage();
                if (Request.QueryString["Id"] != null)
                {
                    mode = "edit";
                    GetData(int.Parse(Request.QueryString["Id"]));
                    SetPage();
                }
                else
                {
                    mode = "new";
                    txtEntryDate.Text = DateTime.Today.ToShortDateString();
                    SetPage();
                }

            }

        }
        private void GetInitialData()
        {
            // Bind Process Checklist
            /////////////////////////////////
            //ProcessGetCustomMenuItems getMenuItem = new ProcessGetCustomMenuItems();
            // IDataReader drProcess = getMenuItem.GetProcesses();

            ProcessGetProcess getProcess = new ProcessGetProcess();
            DataSet dsProcess = getProcess.GetProcessesByKitchenId(KitchenId);
            foreach (DataRow drProcess in dsProcess.Tables[0].Rows)
            {
                ListItem processItem = new ListItem();
                //processItem.Text = drProcess["ProcessShortName"].ToString() + "<a href=ProcessDetail.aspx?ProcessId=" + drProcess["ProcessId"].ToString() + " target=_blank>  - View Description</a>";
                processItem.Text = drProcess["ProcessShortName"].ToString();
                processItem.Value = drProcess["ProcessId"].ToString();
                this.ddlProcess.Items.Add(processItem);
                //<a href='+ ltrim(cast(link as varchar))+ ' target= _blank>' + ltrim(cast(name as varchar)) + '</a>
            }
        }
        private void GetData()
        {
            //string strCustom;       
            if (Request.QueryString["Id"] != null)
            {
                MenuItemsNew menuItem = new MenuItemsNew();
                menuItem.MenuItemId = int.Parse(Request.QueryString["Id"]);
                ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
                getMenuItem.MenuItemNew = menuItem;
                getMenuItem.Invoke();
                IDataReader dtMenuItem = getMenuItem.ResultSet;
                if (dtMenuItem.Read())
                {
                    txtEntryDate.Text = DateTime.Parse(dtMenuItem["EntryDate"].ToString()).ToShortDateString();
                    txtName.Text = dtMenuItem["Name"].ToString();
                    if (TypeId != 6 || TypeId != 1)
                    {
                        txtRecipe.Text = dtMenuItem["Instructions"].ToString();
                    }
                    txtRecipeNumber.Text = dtMenuItem["RecipeNumber"].ToString();
                    if (int.Parse(dtMenuItem["PreparationTypeId"].ToString()) == 1)
                    {
                        rdbPreMade.Checked = true;
                    }
                    if (int.Parse(dtMenuItem["PreparationTypeId"].ToString()) == 2)
                    {
                        rdbOnsite.Checked = true;
                    }
                    if (int.Parse(dtMenuItem["Ready"].ToString()) == 1)
                    {
                        rdbYes.Checked = true;
                    }
                    else
                    {
                        rdbNo.Checked = true;
                    }
                    int nProcessId = int.Parse(dtMenuItem["ProcessId"].ToString());
                    foreach (ListItem item in ddlProcess.Items)
                    {
                        if (item.Value == (nProcessId).ToString())
                        {
                            ddlProcess.SelectedValue = item.Value;
                        }
                    }
                    //ddlProcess.SelectedValue = (nProcessId).ToString();
                    dtMenuItem.Close();
                }
                if (dtMenuItem.IsClosed == false)
                {
                    dtMenuItem.Close();
                }

                ProcessGetIngredient getIngredients = new ProcessGetIngredient();
                IDataReader drIngredient = getIngredients.GetIngredientsByMenuItemId(menuItem.MenuItemId);
                SelectIngredients(drIngredient);
                //DataSet dsIngredients = getIngredients.GetIngredientsByKitchenMenuItemId(KitchenId, menuItem.MenuItemId);
                //lstIngredients.DataSource = dsIngredients;
                lstIngredients.DataBind();
                //rptIngredients.DataSource = dsIngredients;
                //rptIngredients.DataBind();
                //AddIngredients(dsIngredients);
                while (drIngredient.Read())
                {
                //lstIngredient.DataTextField = "Name";
                //lstIngredient.DataValueField = "IngredientID";
                //lstIngredient.DataSource = drIngredient;
                //lstIngredient.DataBind();
                    for (int i = 0; i < lstIngredients.Items.Count; i++)
                    {
                        if (lstIngredients.Items[i].Value == drIngredient["IngredientID"].ToString())
                            lstIngredients.Items[i].Selected = true;
                    }
                }   

            }

        }
        private void GetData(int nMenuItemId)
        {
            //string strCustom;       
            //if (Request.QueryString["Id"] != null)
            //{
            MenuItemsNew menuItem = new MenuItemsNew();
            menuItem.MenuItemId = nMenuItemId;
            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
            getMenuItem.MenuItemNew = menuItem;
            getMenuItem.Invoke();
            IDataReader dtMenuItem = getMenuItem.ResultSet;
            if (dtMenuItem.Read())
            {
                Session["MenuItemId"] = nMenuItemId;
                txtEntryDate.Text = DateTime.Parse(dtMenuItem["EntryDate"].ToString()).ToShortDateString();
                txtName.Text = dtMenuItem["Name"].ToString();
                if (TypeId != 6 && TypeId != 1)
                {
                    txtRecipe.Text = dtMenuItem["RecipeNumber"].ToString();
                }
                txtRecipeNumber.Text = dtMenuItem["RecipeNumber"].ToString();
                if (int.Parse(dtMenuItem["PreparationTypeId"].ToString()) == 1)
                {
                    rdbPreMade.Checked = true;
                }
                if (int.Parse(dtMenuItem["PreparationTypeId"].ToString()) == 2)
                {
                    rdbOnsite.Checked = true;
                }
                if (int.Parse(dtMenuItem["Ready"].ToString()) == 1)
                {
                    rdbYes.Checked = true;
                }
                else
                {
                    rdbNo.Checked = true;
                }
                int nProcessId = dtMenuItem["ProcessId"].ToString() != "" ? int.Parse(dtMenuItem["ProcessId"].ToString()) : 0;
                foreach (ListItem item in ddlProcess.Items)
                {
                    if (item.Value == (nProcessId).ToString())
                    {
                        ddlProcess.SelectedValue = item.Value;
                    }
                }
                //ddlProcess.SelectedValue = (nProcessId).ToString();
                dtMenuItem.Close();
            }
            if (dtMenuItem.IsClosed == false)
            {
                dtMenuItem.Close();
            }
            ProcessGetIngredient getIngredients = new ProcessGetIngredient();
            IDataReader drIngredient = getIngredients.GetIngredientsByMenuItemId(menuItem.MenuItemId);
            SelectIngredients(drIngredient);
            //lstIngredient.DataTextField = "Name";
            //lstIngredient.DataValueField = "IngredientID";
            //lstIngredient.DataSource = drIngredient;
            //lstIngredient.DataBind();
            lstIngredients.DataBind();
            while (drIngredient.Read())
            {
                //lstIngredient.DataTextField = "Name";
                //lstIngredient.DataValueField = "IngredientID";
                //lstIngredient.DataSource = drIngredient;
                //lstIngredient.DataBind();
                for (int i = 0; i < lstIngredients.Items.Count; i++)
                {
                    if (lstIngredients.Items[i].Value == drIngredient["IngredientID"].ToString())
                        lstIngredients.Items[i].Selected = true;
                }
            }   
            mode = "edit";
            SetPage();

        }
        private void SetPage()
        {
            if (mode == "new")
            {

                txtEntryDate.Text = DateTime.Today.ToShortDateString();
                txtName.Text = "";
                txtName.Enabled = true;
                if (TypeId != 6 && TypeId != 1)
                {
                    txtRecipe.Visible = true;
                    txtRecipe.Text = "";
                    hlRecipe.Visible = false;
                }

                txtRecipeNumber.Text = "";
                rdbNo.Checked = false;
                rdbOnsite.Checked = false;
                rdbPreMade.Checked = false;
                rdbYes.Checked = false;
                ClearAll();
                lblError.Visible = false;
                //for (int i = 0; i < lstIngredient.Items.Count; i++)
                //{
                //    lstIngredient.Items[i].Selected = false;
                //}
                //txtIngredientName.Text = "";
                //ddlFoodCategory.SelectedIndex = 0;
                //ddlVendor.SelectedIndex = 0;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                grdHotHolding.Visible = true;
                grdSearch.Visible = false;
                pnlPaging.Visible = true;
                txtSearchItem.Text = "";

            }
            if (mode == "edit")
            {
                cmdAdd.Visible = false;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
                grdHotHolding.Visible = true;
                grdSearch.Visible = false;
                pnlPaging.Visible = true;
                txtName.Enabled = false;
                if (TypeId == 6 || TypeId == 1)
                {
                    hlRecipe.Visible = true;
                    //hlRecipe.NavigateUrl = "~/ControlPanel/Kitchen/MenuRecipe.aspx?MenuId=" + Session["MenuItemId"].ToString();
                    txtRecipe.Visible = false;
                }
            }
            //if (TypeId == 1)
            //{
            //    cmdGetFormat.Enabled = false;
            //    cmdUpload.Enabled = false;
            //}

            ViewState["title"] = null;
            ViewState["Searchtitle"] = null;
            //grdHotHolding.DataBind();
            lblInfo.Text = "";
            currentPageNumber = int.Parse(lblCurrentPageNumber.Text);
            BindData();
            cmdBack.Visible = false;

        }
        private int CheckData(int nMode)
        {
            int nResult = 1, anyItemSelected = 0;
            IDataReader drMenuItems;
            DataSet dsMenuItems;
            ProcessGetMenuItemNew getMenuItems = new ProcessGetMenuItemNew();
            //if (lstIngredient.Items.Count == 0)
            //{
            //    nResult = 0;
            //    lblError.Text = "Please select Ingredient.<br/>";
            //    lblError.Visible = true;
            //}
            for (int i = 0; i < lstIngredients.Items.Count; i++)
            {
                if (lstIngredients.Items[i].Selected == true)
                    anyItemSelected = 1;
            }
            if(anyItemSelected == 0)
            {
                lblError.Text = "Please select Ingredient.<br/>";
                lblError.Visible = true;
            }

            if (rdbOnsite.Checked == false && rdbPreMade.Checked == false)
            {
                nResult = 0;
                lblError.Text += "Please select Preparation type.<br/>";
                lblError.Visible = true;

            }
            if (rdbNo.Checked == false && rdbYes.Checked == false)
            {
                nResult = 0;
                lblError.Text += "Please select Ready to eat.<br/>";
                lblError.Visible = true;
            }
            if (nMode == 1)
            {
                dsMenuItems = getMenuItems.GetMenuItemNewByName(txtName.Text.Trim(), KitchenId);

                //drIngredient = getIngrsdient.GetIngredientsByName();
                if (dsMenuItems.Tables[0].Rows.Count > 0)
                {
                    nResult = 0;
                    lblError.Text += txtName.Text.Trim() + "already exists.Please enter different name<br/>";
                    lblError.Visible = true;
                }
                else
                {
                    if (TypeId == 1)
                    {
                        // Check Menu Items limit for Free Trilal Kitchen
                        drMenuItems = getMenuItems.GetMenuItemNewLimit(KitchenId);
                        drMenuItems.Read();
                        if (drMenuItems["Result"].ToString() != "1")
                        {
                            nResult = 0;
                            lblError.Text += "Free Trial Menu Items limit filled<br/>";
                            lblError.Visible = true;
                            drMenuItems.Close();
                        }
                        else
                        {
                            nResult = 1;
                        }
                    }
                    else
                    {
                        nResult = 1;
                    }
                }
            }

            return nResult;
        }
        private void AddIngredients(DataSet dsItems)
        {
            ClearAll();
            int i = 0;
            DataTable dt = dsItems.Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                //chkList.Items.Add(dr["Name"].ToString());
                //chkList.Items[i].Value = dr["IngredientID"].ToString();
                //if (dr["IngredientID"].ToString() == "1")
                //{
                //    chkList.Items[i].Selected = true;
                //}
            }

        }
        private void ClearAll()
        {

            for (int i = 0; i < ddlProcess.Items.Count; i++)
            {
                ddlProcess.Items[i].Selected = false;
            }
            for (int i = 0; i < lstIngredients.Items.Count; i++)
            {
                lstIngredients.Items[i].Selected = false;
            }
            //while (lstIngredient.Items.Count > 0)
            //{
            //    lstIngredient.Items.RemoveAt(0);
            //}
            //ProcessGetIngredient getIngredients = new ProcessGetIngredient();
            //DataSet dsIngredient = getIngredients.GetIngredientByKitchenId(KitchenId);
            //lstIngredients.DataTextField = "Name";
            //lstIngredients.DataValueField = "IngredientID";
            //lstIngredients.DataSource = dsIngredient;
            //lstIngredients.DataBind();

            //rptIngredients.DataSource = dsIngredient;
            //rptIngredients.DataBind();
        }
        private void SelectIngredients(IDataReader drIngredients)
        {

        }
        private void InsertData()
        {
            //Ingredients ingredient = new Ingredients();
            //ingredient.EntryDate = DateTime.Parse(txtEntryDate.Text);
            //ingredient.FoodCategoryID = int.Parse(ddlFoodCategory.SelectedValue);
            //ingredient.KitchenId = KitchenId;
            //ingredient.Name = txtIngredientName.Text;
            //ingredient.VendorID = int.Parse(ddlVendor.SelectedValue);
            int nMenuItemId;
            MenuItemsNew menuItem = new MenuItemsNew();
            //menuItem.Instructions = txtRecipe.Text;
            menuItem.Instructions = "";
            menuItem.KitchenId = KitchenId;
            menuItem.Name = txtName.Text;
            if (rdbPreMade.Checked == true)
            {
                menuItem.PreparationTypeId = 1;
            }
            else
            {
                menuItem.PreparationTypeId = 2;
            }
            // menuItem.ProcessId = ddlProcess.SelectedIndex;
            menuItem.ProcessId = int.Parse(ddlProcess.SelectedValue);
            if (rdbYes.Checked == true)
            {
                menuItem.Ready = 1;
            }
            else
            {
                menuItem.Ready = 0;
            }
            if (TypeId != 6 && TypeId != 1)
            {
                menuItem.Instructions = txtRecipe.Text;
            }
            menuItem.RecipeNumber = txtRecipeNumber.Text;
            menuItem.Selected = 1;
            menuItem.EntryDate = DateTime.Today;
            ProcessCreateMenuItemNew createMenuItem = new ProcessCreateMenuItemNew();
            createMenuItem.MenuItemNew = menuItem;
            nMenuItemId = createMenuItem.Insert();
            // Add Ingredients in Menu
            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
            nMenuItemId = getMenuItem.GetMaxMenuItemId();
            foreach (ListItem lst in lstIngredients.Items)
            {                
                if (lst.Selected == true)
                {
                    createMenuItem.InsertMenuIngredient(nMenuItemId, int.Parse(lst.Value));
                }               
            }
            // Add Recipe for Command Central
            //if (TypeId == 6 || TypeId == 1)
            //{
            //    ProcessCreateMenuRecipe createMenuRecipe = new ProcessCreateMenuRecipe();
            //    MenuRecipe recipe = new MenuRecipe();
            //    recipe.MenuID = (int)Session["MenuItemId"];
            //    recipe.PortionSize = null;
            //    recipe.Preparation = null;
            //    recipe.WrittenBy = null;
            //    recipe.Yield = null;
            //}       
            //ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
            //createIngredient.Ingredient = ingredient;
            //createIngredient.Invoke();

        }
        private void SubmitData()
        {
            MenuItemsNew menuItem = new MenuItemsNew();
            if (Request.QueryString["Id"] != null)
            {
                menuItem.MenuItemId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["MenuItemId"] != null)
                {
                    menuItem.MenuItemId = (int)Session["MenuItemId"];
                }
            }
            //menuItem.Instructions = txtRecipe.Text;
            menuItem.Instructions = "";
            menuItem.KitchenId = KitchenId;
            menuItem.Name = txtName.Text;
            if (rdbPreMade.Checked == true)
            {
                menuItem.PreparationTypeId = 1;
            }
            else
            {
                menuItem.PreparationTypeId = 2;
            }
            menuItem.ProcessId = int.Parse(ddlProcess.SelectedValue);
            if (rdbYes.Checked == true)
            {
                menuItem.Ready = 1;
            }
            else
            {
                menuItem.Ready = 0;
            }
            menuItem.RecipeNumber = txtRecipeNumber.Text;
            if (TypeId != 6 && TypeId != 1)
            {
                menuItem.Instructions = txtRecipe.Text;
            }
            menuItem.Selected = 1;



            ProcessSetMenuItemNew setMenuItem = new ProcessSetMenuItemNew();
            setMenuItem.MenuItemNew = menuItem;
            setMenuItem.Invoke();

            //Ingredients ingredient = new Ingredients();
            //ingredient.IngredientID = int.Parse(Request.QueryString["Id"].ToString());
            //ProcessDeleteIngredient deleteIngredient = new ProcessDeleteIngredient();        
            //deleteIngredient.DeleteIngredientByMenuItemId(menuItem.MenuItemId);
            //ProcessCreateMenuItemNew createMenuItem = new ProcessCreateMenuItemNew();
            //for (int i = 0; i < lstIngredient.Items.Count; i++)
            //{
            //    //if (lstIngredient.Items[i].Selected == true)
            //    //{
            //        createMenuItem.InsertMenuIngredient(menuItem.MenuItemId, int.Parse(lstIngredient.Items[i].Value));
            //    //}

            //}
            UpdateIngredients(menuItem.MenuItemId);
            if (TypeId == 6 || TypeId == 1)
            {
                UpdateMenuRecipe(menuItem.MenuItemId);
            }
        }
        private void UpdateIngredients(int nMenuItemId)
        {
            ProcessDeleteIngredient deleteIngredient = new ProcessDeleteIngredient();
            deleteIngredient.DeleteIngredientByMenuItemId(nMenuItemId);
            ProcessCreateMenuItemNew createMenuItem = new ProcessCreateMenuItemNew();
            foreach (ListItem lst in lstIngredients.Items)
            {
                if (lst.Selected == true)
                {
                    createMenuItem.InsertMenuIngredient(nMenuItemId, int.Parse(lst.Value));
                }
            }
        }
        private void UpdateMenuRecipe(int nMenuItemId)
        {
            ProcessSetMenuRecipeDetails setMenuRecipeDetail = new ProcessSetMenuRecipeDetails();
            setMenuRecipeDetail.UpdateIngredients(nMenuItemId);
        }
        private int RemoveData()
        {
            MenuItemsNew menuItem = new MenuItemsNew();
            if (Request.QueryString["Id"] != null)
            {
                menuItem.MenuItemId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["MenuItemId"] != null)
                {
                    menuItem.MenuItemId = (int)Session["MenuItemId"];
                }
            }
            ProcessDeleteMenuItemNew deleteMenuItem = new ProcessDeleteMenuItemNew();
            deleteMenuItem.MenuItemsNew = menuItem;
            try
            {
                deleteMenuItem.Invoke();
            }
            catch (Exception ex)
            {
                lblError.Text = "Menu Item could not be deleted";
                lblError.Visible = true;
                return 0;
            }
            return 1;
        }

        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            if (CheckData(1) == 1)
            {
                mode = "new";
                InsertData();
                SetPage();
            }
            else
            {

                lblError.Visible = true;
            }
        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            if (CheckData(2) == 1)
            {
                mode = "new";
                SubmitData();
                SetPage();
            }
            else
            {

                lblError.Visible = true;
            }
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {

            if (RemoveData() == 1)
            {
                mode = "new";
                SetPage();
            }

        }
        //protected void cmdSelect_Click(object sender, ImageClickEventArgs e)
        //{
        //    // Add selected item from dropdown to the list
        //    lstIngredient.Items.Clear();
        //    ListItem ingredient = new ListItem();
        //    foreach (ListItem lst in lstIngredients.Items)
        //    {
        //        if (lst.Selected == true)
        //        {
        //            ingredient.Text = lst.Text;
        //            ingredient.Value = lst.Value;
        //            lstIngredient.Items.Add(ingredient);
        //        }
        //    }

        //}
        //protected void cmdRemove_Click(object sender, EventArgs e)
        //{
        //    lblInfo.Text = "";
        //    if (lstIngredient.Items.Count == 0)
        //    {
        //        lblInfo.Text = "First add Ingredient and try again.";
        //        lblInfo.Visible = true;
        //    }
        //    else if (lstIngredient.SelectedIndex == -1)
        //    {
        //        lblInfo.Text = "Please Select Ingredient";
        //        lblInfo.Visible = true;

        //    }
        //    else
        //    {
        //        for (int i = 0; i < lstIngredient.Items.Count; i++)
        //        {
        //            if (lstIngredient.Items[i].Selected == true)
        //            {
        //                lstIngredient.Items.RemoveAt(i);
        //                hlRecipe.Visible = false;
        //            }

        //        }

        //        /////////////
        //        /// Updated 11-03-11
        //        /// Ingredients should not updated, untill user click on Update button/Insert Button/Edit Recipe link button
        //        //if(Session["MenuItemId"] != null)
        //        //UpdateIngredients((int)Session["MenuItemId"]);
        //        ////////////
        //    }
        //}
        //protected void cmdSelect_Click(object sender, EventArgs e)
        //{
        //    int nMatch;
        //    ListItem ingredient = new ListItem();
        //    foreach (ListItem lst in lstIngredients.Items)
        //    {
        //        nMatch = 0;
        //        if (lst.Selected == true)
        //        {
        //            //ingredient.Text = lst.Text;
        //            //ingredient.Value = lst.Value;
        //            for (int i = 0; i < lstIngredient.Items.Count; i++)
        //            {
        //                if (lstIngredient.Items[i].Value == lst.Value)
        //                {
        //                    nMatch = 1;
        //                }

        //            }
        //            if (nMatch == 1)
        //            {
        //                lblInfo.Text += lst.Text + " already selected<br/>";
        //                lblInfo.Visible = true;
        //            }
        //            else
        //            {
        //                lstIngredient.Items.Add(new ListItem(lst.Text, lst.Value));
        //                hlRecipe.Visible = false;
        //                //lblInfo.Text = "";
        //            }

        //        }
        //    }
        //    /////////////
        //    /// Updated 11-03-11
        //    /// Ingredients should not updated, untill user click on Update button/Insert Button/Edit Recipe link button
        //    //if (Session["MenuItemId"] != null)
        //    //{
        //    //    UpdateIngredients((int)Session["MenuItemId"]);
        //    //}
        //    /////////////

        //    //lblInfo.Text = "";
        //    //// Add selected item from dropdown to the list
        //    //if (ddlIngredient.Items.Count > 0)
        //    //{
        //    //    int nMatch = 0;
        //    //    ListItem ingredient = new ListItem();
        //    //    ingredient.Text = ddlIngredient.SelectedItem.Text;
        //    //    ingredient.Value = ddlIngredient.SelectedValue;

        //    //    for (int i = 0; i < lstIngredient.Items.Count; i++)
        //    //    {
        //    //        if (lstIngredient.Items[i].Value == ingredient.Value)
        //    //        {
        //    //            nMatch = 1;
        //    //        }

        //    //    }
        //    //    if (nMatch == 1)
        //    //    {
        //    //        lblInfo.Text = ingredient.Text + " already selected";
        //    //    }
        //    //    else
        //    //    {
        //    //        lstIngredient.Items.Add(ingredient);
        //    //        lblInfo.Text = "";
        //    //    }

        //    //}
        //    //else
        //    //{
        //    //    lblInfo.Text = "Please add ingredient in ingredient's section and try again.";
        //    //}

        //}
        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
            DataSet dsMenuItem = getMenuItem.GetMenuItemNewByName(txtSearchItem.Text, KitchenId);
            grdSearch.DataSource = dsMenuItem;
            grdSearch.DataBind();
            grdHotHolding.Visible = false;
            grdSearch.Visible = true;
            pnlPaging.Visible = false;
            cmdBack.Visible = true;
        }
        protected void cmdBackToList_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");
        }

        protected void grdHotHolding_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblProcess = (Label)e.Row.FindControl("lblProcess");
                LinkButton hlMenuItem = (LinkButton)e.Row.FindControl("hlName");
                //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



                string strval = hlMenuItem.Text;
                //string strval = hlMenuItem.;
                string title = (string)ViewState["title"];
                if (title == strval)
                {
                    hlMenuItem.Visible = false;
                    hlMenuItem.Text = string.Empty;
                    lblProcess.Visible = false;
                    lblProcess.Text = string.Empty;

                    //titleLabel.Visible = false;
                    //titleLabel.Text = string.Empty;
                }
                else
                {
                    title = strval;
                    ViewState["title"] = title;
                    hlMenuItem.Visible = true;
                    lblProcess.Visible = true;
                    //titleLabel.Visible = true;
                    //titleLabel.Text = getCategory(title);
                }
            }
        }
        protected void grdSearch_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblProcess = (Label)e.Row.FindControl("lblProcess");
                HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



                string strval = hlMenuItem.Text;
                string title = (string)ViewState["Searchtitle"];
                if (title == strval)
                {
                    hlMenuItem.Visible = false;
                    hlMenuItem.Text = string.Empty;
                    lblProcess.Visible = false;
                    lblProcess.Text = string.Empty;

                    //titleLabel.Visible = false;
                    //titleLabel.Text = string.Empty;
                }
                else
                {
                    title = strval;
                    ViewState["Searchtitle"] = title;
                    hlMenuItem.Visible = true;
                    lblProcess.Visible = true;
                    //titleLabel.Visible = true;
                    //titleLabel.Text = getCategory(title);
                }
            }
        }
        protected void grdHotHolding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MenuItem")
            {
                int nMenuItemId = int.Parse(e.CommandArgument.ToString());
                GetData(nMenuItemId);
            }
        }
        #region Custom Paging
        //protected void ChangePage(object sender, CommandEventArgs e)
        //{

        //    switch (e.CommandName)
        //    {
        //        case "Previous":
        //            currentPageNumber = Int32.Parse(lblCurrentPage.Text) - 1;
        //            lblCurrentPageNumber.Text = currentPageNumber.ToString();
        //            break;

        //        case "Next":
        //            currentPageNumber = Int32.Parse(lblCurrentPage.Text) + 1;
        //            lblCurrentPageNumber.Text = currentPageNumber.ToString();
        //            break;
        //    }

        //    BindData();
        //}
        private int CalculateTotalPages(double totalRows)
        {
            int totalPages = (int)Math.Ceiling(totalRows / PAGE_SIZE);

            return totalPages;
        }
        //private void BindData()
        //{
        //    ProcessGetMenuItemNew getMenuItems = new ProcessGetMenuItemNew();
        //    currentPageNumber = grdHotHolding.PageIndex == 0 ? 1 : grdHotHolding.PageIndex;

        //    DataSet ds = getMenuItems.GetMenuItemNewByKitchenIdPaging(KitchenId, currentPageNumber, PAGE_SIZE);
        //    //ad.Fill(ds);

        //    grdHotHolding.DataSource = ds;
        //    grdHotHolding.DataBind();
        //    //currentPageNumber = int.Parse(lblCurrentPageNumber.Text);

        //    // get the total rows 

        //    int totalRows = getMenuItems.TotalRecords;
        //    int totalPages = CalculateTotalPages(totalRows);
        //    lblTotalPages.Text = CalculateTotalPages(totalRows).ToString();

        //    lblCurrentPage.Text = currentPageNumber.ToString();

        //    if (currentPageNumber == 1)
        //    {
        //        Btn_Previous.Enabled = false;

        //        if (Int32.Parse(lblTotalPages.Text) > 0)
        //        {
        //            Btn_Next.Enabled = true;
        //        }
        //        else
        //            Btn_Next.Enabled = false;

        //    }

        //    else
        //    {
        //        Btn_Previous.Enabled = true;

        //        if (currentPageNumber == Int32.Parse(lblTotalPages.Text))
        //            Btn_Next.Enabled = false;
        //        else Btn_Next.Enabled = true;
        //    }
        //    //////////////////////////
        //    // CUSTOM PAGING CONTROL
        //    //////////////////////////
        //    //custPager.TotalPages = totalPages % grdPagingDemo.PageSize == 0 ? totalPages / grdPagingDemo.PageSize : totalPages / grdPagingDemo.PageSize + 1;
        //    custPager.TotalPages = totalPages ;
        //}
        private void BindData()
        {
            ProcessGetMenuItemNew getMenuItems = new ProcessGetMenuItemNew();
            currentPageNumber = grdHotHolding.PageIndex == 0 ? 1 : grdHotHolding.PageIndex;
            // currentPageNumber = currentPage == 0 ? 1 : currentPage;

            DataSet ds = getMenuItems.GetMenuItemNewByKitchenIdPaging(KitchenId, currentPageNumber, PAGE_SIZE);
            grdHotHolding.DataSource = ds;
            grdHotHolding.DataBind();
            int totalRows = getMenuItems.TotalRecords;
            int totalPages = CalculateTotalPages(totalRows);

            //////////////////////////
            // CUSTOM PAGING CONTROL
            //////////////////////////
            //custPager.TotalPages = totalPages % grdPagingDemo.PageSize == 0 ? totalPages / grdPagingDemo.PageSize : totalPages / grdPagingDemo.PageSize + 1;
            custPager.TotalPages = totalPages;
        }
        protected void custPager_PageChanged(object sender, CustomPageChangeArgs e)
        {
            grdHotHolding.PageSize = e.CurrentPageSize;
            grdHotHolding.PageIndex = e.CurrentPageNumber;
            currentPage = e.CurrentPageNumber;
            BindData();
        }
        #endregion
       
        
       

        protected void hlRecipe_Click(object sender, EventArgs e)
        {
            UpdateIngredients((int)Session["MenuItemId"]);
            string strUrl = "~/ControlPanel/Kitchen/MenuRecipe.aspx?MenuId=" + Session["MenuItemId"].ToString();
            Response.Redirect(strUrl);

        }
        public int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
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

        protected void hfAutoComplete_ValueChanged(object sender, EventArgs e)
        {
            string selectedItem = hfAutoComplete.Value;
            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
            DataSet dsMenuItem = getMenuItem.GetMenuItemNewByName(selectedItem, (int)Session["KitchenId"]);
            if (dsMenuItem.Tables[0].Rows.Count > 0)
            {
                GetData(int.Parse(dsMenuItem.Tables[0].Rows[0]["MenuItemId"].ToString()));
            }
            
        }

      
    }
}