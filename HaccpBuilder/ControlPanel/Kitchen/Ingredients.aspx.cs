using System;
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
    public partial class IngredientsNew : System.Web.UI.Page
    {
        string mode = "new";
        protected int currentPageNumber = 1;
        private const int PAGE_SIZE = 20;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                //ProcessGetFoodCategories getFoodCategories = new ProcessGetFoodCategories();
                //DataSet dsCategories = getFoodCategories.GetAllFoodCategories();
                //ddlFoodCategory.DataSource = dsCategories;
                //ddlFoodCategory.DataTextField = "Name";
                //ddlFoodCategory.DataValueField = "FoodCategoryID";
                if (TypeId == 7)
                    Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");
                if (Request.QueryString["Id"] != null)
                {
                    mode = "edit";
                    GetData();
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
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
        }
        private void GetData()
        {
            try
            {
                //string strCustom;       
                if (Request.QueryString["Id"] != null && Request.QueryString["Id"] != "")
                {

                    Ingredients ingredient = new Ingredients();
                    ingredient.IngredientID = int.Parse(Request.QueryString["Id"]);
                    ProcessGetIngredient getIngredient = new ProcessGetIngredient();
                    getIngredient.Ingredient = ingredient;
                    getIngredient.Invoke();
                    IDataReader logReader = getIngredient.ResultSet;
                    if (logReader.Read())
                    {
                        txtEntryDate.Text = DateTime.Parse(logReader["Entrydate"].ToString()).ToShortDateString();
                        txtIngredientName.Text = logReader["Name"].ToString();
                        if (logReader["FoodCategoryID"].ToString() == "")
                        {
                            ddlFoodCategory.SelectedIndex = 0;
                        }
                        else
                        {
                            ddlFoodCategory.SelectedValue = logReader["FoodCategoryID"].ToString();
                        }
                        ddlVendor.SelectedValue = logReader["VendorID"].ToString();
                        //ddlCCP.SelectedValue = logReader["CCPId"].ToString();
                        Session["IngredientId"] = int.Parse(logReader["IngredientID"].ToString());
                        logReader.Close();
                    }
                    if (logReader.IsClosed == false)
                    {
                        logReader.Close();
                    }
                }
            }
            catch (Exception exc)
            {
                lblError.Text = exc.Message;
                lblError.Visible = true;
            }


        }
        /// <summary>
        /// AJAX BAsed Function Called by Grid RowCommand, instead of based Query String
        /// </summary>
        /// <param name="nMode"></param>
        /// <returns></returns>
        private void GetData(int nId)
        {            

            Ingredients ingredient = new Ingredients();
            //ingredient.IngredientID = int.Parse(Request.QueryString["Id"]);
            ingredient.IngredientID = nId;
            ProcessGetIngredient getIngredient = new ProcessGetIngredient();
            getIngredient.Ingredient = ingredient;
            getIngredient.Invoke();
            IDataReader logReader = getIngredient.ResultSet;
            if (logReader.Read())
            {
                hfIngredientId.Value = logReader["IngredientID"].ToString();
                txtEntryDate.Text = DateTime.Parse(logReader["Entrydate"].ToString()).ToShortDateString();
                txtIngredientName.Text = logReader["Name"].ToString();
                if (logReader["FoodCategoryID"].ToString() == "")
                {
                    ddlFoodCategory.SelectedIndex = 0;
                }
                else
                {
                    ddlFoodCategory.SelectedValue = logReader["FoodCategoryID"].ToString();
                }
                ddlVendor.SelectedValue = logReader["VendorID"].ToString();
                //ddlCCP.SelectedValue = logReader["CCPId"].ToString();
                Session["IngredientId"] = int.Parse(logReader["IngredientID"].ToString());
                logReader.Close();
            }
            if (logReader.IsClosed == false)
            {
                logReader.Close();
            }
            mode = "edit";
            SetPage();
        }
        private int CheckData(int nMode)
        {
            ProcessGetIngredient getIngrsdient = new ProcessGetIngredient();
            IDataReader drIngredient;
            if (nMode == 1)
            {
                drIngredient = getIngrsdient.GetIngredientsByName(txtIngredientName.Text.Trim(), KitchenId);
                if (drIngredient.Read())
                {
                    drIngredient.Close();
                    return 0;
                }
                else
                {
                    if (drIngredient.IsClosed == false)
                    {
                        drIngredient.Close();
                    }

                    // Check Ingredioent Limit for Free Trial Kitchens
                    if (TypeId == 1 && Session["KitchenId"] != null)
                    {
                        drIngredient = getIngrsdient.GetIngredientsLimit(KitchenId);
                        drIngredient.Read();
                        if (drIngredient["Result"].ToString() != "1")
                        {
                            return 2;
                        }
                        else
                        {
                            return 1;
                        }
                        if (drIngredient.IsClosed == false)
                        {
                            drIngredient.Close();
                        }
                    }
                    else
                    {
                        return 1;
                    }
                }
            }
            else
            {
                return 1;
            }

        }
        private void SetPage()
        {
            if (mode == "new")
            {
                txtEntryDate.Text = DateTime.Today.ToShortDateString();
                txtIngredientName.Text = "";
                txtSearch.Text = "";
                lblError.Text = "";
                lblError.Visible = false;
                ddlFoodCategory.SelectedIndex = 0;
                ddlVendor.SelectedIndex = 0;
                // ddlCCP.SelectedIndex = 0;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                grdSearch.Visible = false;
                grdHotHolding.Visible = true;
                pnlPaging.Visible = true;
                txtIngredientName.Enabled = true;

            }
            if (mode == "edit")
            {
                cmdAdd.Visible = false;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
                grdSearch.Visible = false;
                grdHotHolding.Visible = true;
                pnlPaging.Visible = true;
                txtIngredientName.Enabled = false;
            }
            if (TypeId == 1)
            {
                cmdGetFormat.Enabled = false;
                cmdUpload.Enabled = false;
                File1.Enabled = false;
                cmdDownload.Enabled = false;

            }
            if (TypeId == 7)
            {
                cmdDownload.Visible = false;
                ddlFoodCategory.Visible = false;
                lblFoodCategory.Visible = true;

            }
            else
            {
                ddlFoodCategory.Visible = true;
                lblFoodCategory.Visible = false;
            }
            //grdHotHolding.DataBind();
            if (lblCurrentPageNumber.Text == "")
                currentPageNumber = 1;
            else
                currentPageNumber = int.Parse(lblCurrentPageNumber.Text);
            BindData();
            cmdBack.Visible = false;
        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        private void InsertData()
        {
            try
            {
                Ingredients ingredient = new Ingredients();
                ingredient.EntryDate = DateTime.Parse(txtEntryDate.Text);
                if (TypeId == 7)
                    ingredient.FoodCategoryID = 0;
                else
                    ingredient.FoodCategoryID = int.Parse(ddlFoodCategory.SelectedValue);
                ingredient.KitchenId = KitchenId;
                ingredient.Name = txtIngredientName.Text;
                ingredient.VendorID = int.Parse(ddlVendor.SelectedValue);
                //ingredient.CCPId = int.Parse(ddlCCP.SelectedValue);
                ingredient.CCPId = 0;

                ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
                createIngredient.Ingredient = ingredient;
                createIngredient.Invoke();
            }
            catch (Exception exc)
            {
                lblError.Text = exc.Message;
                lblError.Visible = true;
            }

        }
        private void SubmitData()
        {
            Ingredients ingredient = new Ingredients();
            if (Request.QueryString["Id"] != null)
            {
                ingredient.IngredientID = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["IngredientId"] != null)
                {
                    ingredient.IngredientID = (int)Session["IngredientId"];
                }
                else
                {
                    ingredient.IngredientID = int.Parse(hfIngredientId.Value);
                }
            }
            ingredient.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (TypeId == 7)
                ingredient.FoodCategoryID = 0;
            else
                ingredient.FoodCategoryID = int.Parse(ddlFoodCategory.SelectedValue);

            ingredient.KitchenId = KitchenId;
            ingredient.Name = txtIngredientName.Text;
            ingredient.VendorID = int.Parse(ddlVendor.SelectedValue);
            //ingredient.CCPId = int.Parse(ddlCCP.SelectedValue);
            ingredient.CCPId = 0;

            ProcessSetIngredient setIngredient = new ProcessSetIngredient();
            setIngredient.Ingredient = ingredient;
            setIngredient.Invoke();

        }
        private int RemoveData()
        {

            Ingredients ingredient = new Ingredients();
            if (Request.QueryString["Id"] != null)
            {
                ingredient.IngredientID = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                ingredient.IngredientID = int.Parse(hfIngredientId.Value);
            }
            ProcessDeleteIngredient deleteIngredient = new ProcessDeleteIngredient();
            deleteIngredient.Ingredients = ingredient;
            if (deleteIngredient.DeleteIngredient() == 0)
            {
                lblError.Text = "You must replace Ingredient Relationship in Menu page prior to deleting a ingredient";
                lblError.Visible = true;
                return 0;
            }
            else
            {
                return 1;
            }
            //////////////////////
            // OLD CODE
            //try
            //{
            //    //deleteIngredient.Invoke();
            //}
            //catch (Exception ex)
            //{
            //    //lblError.Text = "Ingredient could not be deleted";
            //    lblError.Text = "You must replace Ingredient Relationship in Menu page prior to deleting a ingredient";
            //    //lblError.Visible = true;
            //    return 0;
            //}
            return 1;

        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int nResult;
                nResult = CheckData(1);
                if (nResult == 1)
                {
                    mode = "new";
                    lblError.Text = "";
                    InsertData();
                    lblCurrentPageNumber.Text = "1";
                    SetPage();
                }

                if (nResult == 0)
                {
                    lblError.Text = txtIngredientName.Text + " already exists, please enter different name";
                    lblError.Visible = true;
                }
                if (nResult == 2)
                {
                    lblError.Text = "Free Trial Ingredients limit filled";
                    lblError.Visible = true;
                }
            }
            catch (Exception exc)
            {
                lblError.Text = exc.Message;
                lblError.Visible = true;
            }
        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int nResult;
                nResult = CheckData(2);
                if (nResult == 1)
                {
                    mode = "new";
                    lblError.Text = "";
                    SubmitData();
                    SetPage();
                }
                if (nResult == 0)
                {
                    lblError.Text = txtIngredientName.Text + " already exists, please enter different name";
                    lblError.Visible = true;
                }
            }
            catch (Exception exc)
            {
                lblError.Text = exc.Message;
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
            try
            {
                if (RemoveData() == 1)
                {
                    mode = "new";
                    SetPage();
                }
            }
            catch (Exception exc)
            {
                lblError.Text = exc.Message;
                lblError.Visible = true;
            }

        }
        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            ProcessGetIngredient getIngredient = new ProcessGetIngredient();
            DataSet dsIngredient = getIngredient.GetIngredientByName(txtSearch.Text, (int)Session["kitchenId"]);
            grdSearch.DataSource = dsIngredient;
            grdSearch.DataBind();
            grdHotHolding.Visible = false;
            grdSearch.Visible = true;
            pnlPaging.Visible = false;
            cmdBack.Visible = true;
        }
        //protected void cmdUpload_Click(object sender, EventArgs e)
        //{
        //    hlDownLoadInvalidIngredient.Visible = false;
        //    lblError.Text = "";
        //    if ((File1.PostedFile != null) && File1.PostedFile.ContentLength > 0)
        //    {
        //        string fileExt = System.IO.Path.GetExtension(File1.PostedFile.FileName);
        //        if (fileExt == ".csv")
        //        {


        //            //ProcessGetIngredient getIngredient = new ProcessGetIngredient();
        //            //ProcessGetVendor getVendor = new ProcessGetVendor();
        //            //IDataReader drIngredients;
        //            //DataSet dsVendors;
        //            string fn = System.IO.Path.GetFileName(File1.PostedFile.FileName);
        //            //// string SaveLocation = "D:\\Data\\" + fn;
        //            ////string SaveLocation = "C:\\Data\\IngredientsSample.xls";
        //            File1.PostedFile.SaveAs(@Server.MapPath("~/ControlPanel/Kitchen/Data/IngredientsSample.csv"));
        //            //string SaveLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data") + "\\" + fn;
        //            string OrignalCSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/IngredientsSample.csv");
        //            //string conStr = "Provider=Microsoft.Jet.OLEDB.12.0;Data Source=" + SaveLocation + ";Extended Properties=Excel 12.0;";
        //            //OleDbConnection connectObj = new OleDbConnection(conStr);
        //            try
        //            {
        //                //connectObj.Open();
        //                //OleDbCommand commandObj = new OleDbCommand("SELECT * FROM [Sheet1$]", connectObj);
        //                //OleDbDataReader reader = commandObj.ExecuteReader();
        //                //while (reader.Read())
        //                //{
        //                //    drIngredients = getIngredient.GetIngredientsByName(Convert.ToString(reader["Ingredient Name"]).Trim(), KitchenId);
        //                //    dsVendors = getVendor.GetVendorsByName(Convert.ToString(reader["vendor name"]).Trim(), KitchenId);
        //                //    /////////////////////////////
        //                //    // INSERT VENDORS
        //                //    /////////////////////////////
        //                //    if (dsVendors.Tables[0].Rows.Count <= 0 && Convert.ToString(reader["vendor name"]) != "")
        //                //    {

        //                //        Vendors vendor = new Vendors();
        //                //        vendor.VendorName = Convert.ToString(reader["vendor name"]);
        //                //        vendor.ContactName = Convert.ToString(reader["contact name"]);
        //                //        vendor.Entrydate = DateTime.Now.Date;
        //                //        vendor.Phone = Convert.ToString(reader["phone number"]);
        //                //        if (Convert.ToString(reader["yes training and certifications"]) == "1")
        //                //        {
        //                //            vendor.Training = 1;
        //                //            vendor.TrainingDetail = Convert.ToString(reader["yes training and certifications comments"]);
        //                //            vendor.CorrectiveAction = null;
        //                //        }
        //                //        if (Convert.ToString(reader["no training and certifications"]) == "1")
        //                //        {
        //                //            vendor.Training = 0;
        //                //            vendor.CorrectiveAction = Convert.ToString(reader["no training and certifications comments"]);
        //                //            vendor.TrainingDetail = null;
        //                //        }
        //                //        vendor.VarifiedDate = DateTime.Parse(Convert.ToString(reader["verified date"]));
        //                //        vendor.VerifiedBy = Convert.ToString(reader["verified by"]);
        //                //        vendor.KitchenId = KitchenId;

        //                //        ProcessCreateVendor createVendor = new ProcessCreateVendor();
        //                //        createVendor.Vendor = vendor;
        //                //        createVendor.Invoke();
        //                //        ddlVendor.DataBind();
        //                //    }
        //                //    /////////////////////////
        //                //    // INSERT INGREDIENTS
        //                //    /////////////////////////
        //                //    if (drIngredients.Read() != true && Convert.ToString(reader["ingredient name"]) != "")
        //                //    {

        //                //        Ingredients ingredient = new Ingredients();
        //                //        ingredient.EntryDate = DateTime.Parse(Convert.ToString(reader["upload date"]));
        //                //        ingredient.FoodCategoryID = getFoodCategoryId(Convert.ToString(reader["FoodCategory"]));
        //                //        ingredient.KitchenId = KitchenId;
        //                //        ingredient.Name = Convert.ToString(reader["Ingredient Name"]);
        //                //        ingredient.VendorID = getVendorId(Convert.ToString(reader["vendor name"]));
        //                //        //ingredient.CCPId = int.Parse(ddlCCP.SelectedValue);
        //                //        ingredient.CCPId = 0;

        //                //        ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
        //                //        createIngredient.Ingredient = ingredient;
        //                //        createIngredient.Invoke();
        //                //    }
        //                //}
        //                DataTable dtIngredient = new DataTable();
        //                DataTable dtInvalidIngredient = new DataTable();
        //                DataTable dtValidIngredient = new DataTable();
        //                string InvalidIngredient_CSVFileLocation = string.Empty;
        //                string ValidIngredient_CSVFileLocation = string.Empty;
        //                bool status = true;
        //                try
        //                {
        //                    dtIngredient = Utilities.csvToDataTable(OrignalCSVFileLocation, true);
        //                    dtInvalidIngredient = dtIngredient.Clone();
        //                    dtValidIngredient = dtIngredient.Clone();
        //                }
        //                catch (Exception ex)
        //                {
        //                    lblError.Text = ex.Message.ToString();
        //                    return;
        //                }
        //                if (dtIngredient.Columns.Count != 12)
        //                {

        //                    lblError.Text = "The CSV format is invalid. Please ensure that number of columns should match the provided sample file.";

        //                    return;
        //                }

        //                try
        //                {

        //                    dtIngredient.Columns["Ingredient_Name"].Unique = true;
        //                }
        //                catch (Exception exx)
        //                {
        //                    lblError.Text = "The CSV format is invalid. Please ensure that Ingredient names should be unique.";

        //                    return;
        //                }
        //                 try
        //                {

        //                    foreach (DataRow DR in dtIngredient.Rows)
        //                    {

        //                        if ((DR["upload_date"] == DBNull.Value) && (DR["Ingredient_Name"] == DBNull.Value) && (DR["FoodCategory"] == DBNull.Value) && (DR["vendor name"] == DBNull.Value) && (DR["contact name"] == DBNull.Value) && (DR["phone_number"] == DBNull.Value) &&
        //                            (DR["yes_training_and_certifications"] == DBNull.Value) && (DR["no_training_and_certifications"] == DBNull.Value) && (DR["verified_by"] == DBNull.Value) && (DR["verified_date"] == DBNull.Value))
        //                        {
        //                            status = false;
        //                            //lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";

        //                        }
        //                        if ((DR["upload_date"].ToString() == "") && (DR["Ingredient_Name"].ToString() == "")&& (DR["FoodCategory"] == DBNull.Value) && (DR["vendor name"] == DBNull.Value) && (DR["contact name"] == DBNull.Value) && (DR["phone_number"].ToString() == "") &&
        //                           (DR["yes_training_and_certifications"].ToString() == "") && (DR["no_training_and_certifications"].ToString() == "") && (DR["verified_by"].ToString() == "") && (DR["verified_date"].ToString() == ""))
        //                        {
        //                            //  lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";
        //                            status = false;


        //                        }
        //                         try
        //                        {
        //                            if (DateTime.Parse(DR["upload_date"].ToString()) > DateTime.Now)
        //                            {
        //                                // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
        //                                status = false;

        //                            }
        //                            if (DateTime.Parse(DR["verified_date"].ToString()) > DateTime.Now)
        //                            {
        //                                // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
        //                                status = false;

        //                            }

        //                        }
        //                        catch (Exception ex)
        //                        {
        //                            if (ex.Message.Contains("String was not recognized as a valid DateTime"))
        //                            {
        //                                status = false;
        //                            }
        //                            else
        //                            {
        //                                status = false;
        //                            }
        //                        }
        //                         try
        //                         {
        //                             ProcessGetKitchenFoodCategoryGroup FoodCategory = new ProcessGetKitchenFoodCategoryGroup();
        //                             IDataReader FoodCategoryReader = FoodCategory.Invoke(DR["FoodCategory"].ToString(), KitchenId);

        //                             if (FoodCategoryReader.Read())
        //                             {

        //                             }
        //                             else
        //                             {
        //                                 status = false;
        //                             }
        //                         }
        //                         catch (Exception exx)
        //                         {
        //                             status = false;
        //                         }

        //                         if (DR["yes_training_and_certifications"].ToString().ToLower() != "0" && DR["yes_training_and_certifications"].ToString().ToLower() != "1")
        //                        {
        //                            // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
        //                            status = false;

        //                        }
        //                        if (DR["no_training_and_certifications"].ToString() != "0" && DR["no_training_and_certifications"].ToString() != "1")
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Value in 'no_training_and_certifications' field should be 0/1.";
        //                            status = false;

        //                        }

        //                        if (DR["yes_training_and_certifications"].ToString() == "1")
        //                        {
        //                            if (DR["yes_training_and_certifications_comments"] == "")
        //                            {
        //                                //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                                status = false;


        //                            }

        //                        }
        //                        else if (DR["yes_training_and_certifications"].ToString() == "0")
        //                        {
        //                            if (DR["yes_training_and_certifications_comments"].ToString() != "")
        //                            {
        //                                // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                                status = false;


        //                            }
        //                        }

        //                        if (DR["no_training_and_certifications"].ToString() == "1")
        //                        {
        //                            if (DR["no_training_and_certifications_comments"].ToString() == "")
        //                            {
        //                                //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                                status = false;


        //                            }

        //                        }
        //                        else if (DR["no_training_and_certifications"] == "0")
        //                        {
        //                            if (DR["no_training_and_certifications_comments"].ToString() != "")
        //                            {
        //                                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                                status = false;


        //                            }
        //                        }
        //                           if (System.Text.RegularExpressions.Regex.IsMatch(DR["Ingredient_Name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }
        //                               if (System.Text.RegularExpressions.Regex.IsMatch(DR["FoodCategory"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }

        //                          if (System.Text.RegularExpressions.Regex.IsMatch(DR["vendor_name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }

        //                        if (System.Text.RegularExpressions.Regex.IsMatch(DR["contact_name"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }
        //                        if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_by"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }

        //                        if (System.Text.RegularExpressions.Regex.IsMatch(DR["upload_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;

        //                        }
        //                        if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
        //                        {
        //                            // do nothing
        //                        }
        //                        else
        //                        {
        //                            // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
        //                            status = false;


        //                        }
        //                         if (status == false)
        //                        {
        //                            //  DataRow InvalidVendor = dtInvalidVendors.NewRow();
        //                            dtInvalidIngredient.ImportRow(DR);
        //                        }
        //                        else
        //                        {
        //                            //DataRow ValidVendor = dtInvalidVendors.NewRow();
        //                            dtValidIngredient.ImportRow(DR);
        //                        }

        //                        status = true;

        //                    }

        //                }
        //                catch (Exception ex)
        //                {
        //                    lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
        //                    status = false;
        //                    return;
        //                }


        //                try
        //                {
        //                    InvalidIngredient_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvInValidIngredient.csv");
        //                    ValidIngredient_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvValidIngredient.csv");
        //                    Utilities.CreateCSVFile(dtValidIngredient, ValidIngredient_CSVFileLocation);
        //                    Utilities.CreateCSVFile(dtInvalidIngredient, InvalidIngredient_CSVFileLocation);
        //                }
        //                catch (Exception ex)
        //                {
        //                    lblError.Text = ex.Message.ToString();
        //                    return;
        //                }


        //                ValidIngredient_CSVFileLocation = "\"" + ValidIngredient_CSVFileLocation + "\"";
        //                ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
        //                IDataReader drResult = createIngredient.Upload(ValidIngredient_CSVFileLocation, KitchenId);

        //                //createVendor.Upload(SaveLocation, KitchenId);
        //                if (drResult.Read())
        //                {
        //                    lblError.Text = drResult["RowInserted"].ToString() + " record(s) inserted";
        //                    grdHotHolding.DataBind();
        //                    drResult.Close();
        //                }
        //                if (drResult.IsClosed == false)
        //                {
        //                    drResult.Close();
        //                }
        //                 if (dtInvalidIngredient.Rows.Count > 0)
        //                {
        //                    hlDownLoadInvalidIngredient.Visible = true;

        //                    lblError.Text += "<br />" + "To Download Invalid vendor(s) list . Please ";
        //                }
        //                else
        //                {
        //                    hlDownLoadInvalidIngredient.Visible = false;

        //                    lblError.Text += "";
        //                }
        //                //lblError.Text = "The file has been uploaded.";
        //                //grdHotHolding.DataBind();
        //                //connectObj.Close();
        //            }
        //            catch (Exception Exc)
        //            {
        //                lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
        //                //connectObj.Close();
        //            }
        //        }
        //        else
        //        {
        //            //Response.Write("Please select a file to upload.");
        //            lblError.Text = "Only .csv files allowed!";

        //        }
        //    }
        //    else
        //    {
        //        lblError.Text = "Please select a file to upload.";
        //    }
        //}
        protected void cmdUpload_Click(object sender, EventArgs e)
        {
            hlDownLoadInvalidIngredient.Visible = false;
            lblError.Text = "";
            if ((File1.PostedFile != null) && File1.PostedFile.ContentLength > 0)
            {
                string fileExt = System.IO.Path.GetExtension(File1.PostedFile.FileName);
                if (fileExt == ".csv")
                {


                    //ProcessGetIngredient getIngredient = new ProcessGetIngredient();
                    //ProcessGetVendor getVendor = new ProcessGetVendor();
                    //IDataReader drIngredients;
                    //DataSet dsVendors;
                    string fn = System.IO.Path.GetFileName(File1.PostedFile.FileName);
                    //// string SaveLocation = "D:\\Data\\" + fn;
                    ////string SaveLocation = "C:\\Data\\IngredientsSample.xls";
                    File1.PostedFile.SaveAs(@Server.MapPath("~/ControlPanel/Kitchen/Data/IngredientsSample.csv"));
                    //string SaveLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data") + "\\" + fn;
                    //string OrignalCSVFileLocation = File1.PostedFile.FileName;
                    string OrignalCSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/IngredientsSample.csv");
                    //string conStr = "Provider=Microsoft.Jet.OLEDB.12.0;Data Source=" + SaveLocation + ";Extended Properties=Excel 12.0;";
                    //OleDbConnection connectObj = new OleDbConnection(conStr);
                    try
                    {
                        //connectObj.Open();
                        //OleDbCommand commandObj = new OleDbCommand("SELECT * FROM [Sheet1$]", connectObj);
                        //OleDbDataReader reader = commandObj.ExecuteReader();
                        //while (reader.Read())
                        //{
                        //    drIngredients = getIngredient.GetIngredientsByName(Convert.ToString(reader["Ingredient Name"]).Trim(), KitchenId);
                        //    dsVendors = getVendor.GetVendorsByName(Convert.ToString(reader["vendor name"]).Trim(), KitchenId);
                        //    /////////////////////////////
                        //    // INSERT VENDORS
                        //    /////////////////////////////
                        //    if (dsVendors.Tables[0].Rows.Count <= 0 && Convert.ToString(reader["vendor name"]) != "")
                        //    {

                        //        Vendors vendor = new Vendors();
                        //        vendor.VendorName = Convert.ToString(reader["vendor name"]);
                        //        vendor.ContactName = Convert.ToString(reader["contact name"]);
                        //        vendor.Entrydate = DateTime.Now.Date;
                        //        vendor.Phone = Convert.ToString(reader["phone number"]);
                        //        if (Convert.ToString(reader["yes training and certifications"]) == "1")
                        //        {
                        //            vendor.Training = 1;
                        //            vendor.TrainingDetail = Convert.ToString(reader["yes training and certifications comments"]);
                        //            vendor.CorrectiveAction = null;
                        //        }
                        //        if (Convert.ToString(reader["no training and certifications"]) == "1")
                        //        {
                        //            vendor.Training = 0;
                        //            vendor.CorrectiveAction = Convert.ToString(reader["no training and certifications comments"]);
                        //            vendor.TrainingDetail = null;
                        //        }
                        //        vendor.VarifiedDate = DateTime.Parse(Convert.ToString(reader["verified date"]));
                        //        vendor.VerifiedBy = Convert.ToString(reader["verified by"]);
                        //        vendor.KitchenId = KitchenId;

                        //        ProcessCreateVendor createVendor = new ProcessCreateVendor();
                        //        createVendor.Vendor = vendor;
                        //        createVendor.Invoke();
                        //        ddlVendor.DataBind();
                        //    }
                        //    /////////////////////////
                        //    // INSERT INGREDIENTS
                        //    /////////////////////////
                        //    if (drIngredients.Read() != true && Convert.ToString(reader["ingredient name"]) != "")
                        //    {

                        //        Ingredients ingredient = new Ingredients();
                        //        ingredient.EntryDate = DateTime.Parse(Convert.ToString(reader["upload date"]));
                        //        ingredient.FoodCategoryID = getFoodCategoryId(Convert.ToString(reader["FoodCategory"]));
                        //        ingredient.KitchenId = KitchenId;
                        //        ingredient.Name = Convert.ToString(reader["Ingredient Name"]);
                        //        ingredient.VendorID = getVendorId(Convert.ToString(reader["vendor name"]));
                        //        //ingredient.CCPId = int.Parse(ddlCCP.SelectedValue);
                        //        ingredient.CCPId = 0;

                        //        ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
                        //        createIngredient.Ingredient = ingredient;
                        //        createIngredient.Invoke();
                        //    }
                        //}
                        //DataTable dtIngredient = new DataTable();
                        //DataTable dtInvalidIngredient = new DataTable();
                        //DataTable dtValidIngredient = new DataTable();
                        //string InvalidIngredient_CSVFileLocation = string.Empty;
                        string ValidIngredient_CSVFileLocation = string.Empty;
                        //bool status = true;
                        //try
                        //{
                        //    dtIngredient = Utilities.csvToDataTable(OrignalCSVFileLocation, true);
                        //    //dtInvalidIngredient = dtIngredient.Clone();
                        //    //dtValidIngredient = dtIngredient.Clone();
                        //}
                        //catch (Exception ex)
                        //{
                        //    lblError.Text = ex.Message.ToString();
                        //    return;
                        //}
                        //if (dtIngredient.Columns.Count != 12)
                        //{

                        //    lblError.Text = "The CSV format is invalid. Please ensure that number of columns should match the provided sample file.";

                        //    return;
                        //}

                        //try
                        //{

                        //    dtIngredient.Columns["Ingredient_Name"].Unique = true;
                        //}
                        //catch (Exception exx)
                        //{
                        //    lblError.Text = "The CSV format is invalid. Please ensure that Ingredient names should be unique.";

                        //    return;
                        //}
                        // try
                        //{

                        //foreach (DataRow DR in dtIngredient.Rows)
                        //{

                        //    if ((DR["upload_date"] == DBNull.Value) && (DR["Ingredient_Name"] == DBNull.Value) && (DR["FoodCategory"] == DBNull.Value) && (DR["vendor name"] == DBNull.Value) && (DR["contact name"] == DBNull.Value) && (DR["phone_number"] == DBNull.Value) &&
                        //        (DR["yes_training_and_certifications"] == DBNull.Value) && (DR["no_training_and_certifications"] == DBNull.Value) && (DR["verified_by"] == DBNull.Value) && (DR["verified_date"] == DBNull.Value))
                        //    {
                        //        status = false;
                        //        //lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";

                        //    }
                        //    if ((DR["upload_date"].ToString() == "") && (DR["Ingredient_Name"].ToString() == "")&& (DR["FoodCategory"] == DBNull.Value) && (DR["vendor name"] == DBNull.Value) && (DR["contact name"] == DBNull.Value) && (DR["phone_number"].ToString() == "") &&
                        //       (DR["yes_training_and_certifications"].ToString() == "") && (DR["no_training_and_certifications"].ToString() == "") && (DR["verified_by"].ToString() == "") && (DR["verified_date"].ToString() == ""))
                        //    {
                        //        //  lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";
                        //        status = false;


                        //    }
                        //     try
                        //    {
                        //        if (DateTime.Parse(DR["upload_date"].ToString()) > DateTime.Now)
                        //        {
                        //            // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                        //            status = false;

                        //        }
                        //        if (DateTime.Parse(DR["verified_date"].ToString()) > DateTime.Now)
                        //        {
                        //            // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                        //            status = false;

                        //        }

                        //    }
                        //    catch (Exception ex)
                        //    {
                        //        if (ex.Message.Contains("String was not recognized as a valid DateTime"))
                        //        {
                        //            status = false;
                        //        }
                        //        else
                        //        {
                        //            status = false;
                        //        }
                        //    }
                        //     try
                        //     {
                        //         ProcessGetKitchenFoodCategoryGroup FoodCategory = new ProcessGetKitchenFoodCategoryGroup();
                        //         IDataReader FoodCategoryReader = FoodCategory.Invoke(DR["FoodCategory"].ToString(), KitchenId);

                        //         if (FoodCategoryReader.Read())
                        //         {

                        //         }
                        //         else
                        //         {
                        //             status = false;
                        //         }
                        //     }
                        //     catch (Exception exx)
                        //     {
                        //         status = false;
                        //     }

                        //     if (DR["yes_training_and_certifications"].ToString().ToLower() != "0" && DR["yes_training_and_certifications"].ToString().ToLower() != "1")
                        //    {
                        //        // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                        //        status = false;

                        //    }
                        //    if (DR["no_training_and_certifications"].ToString() != "0" && DR["no_training_and_certifications"].ToString() != "1")
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Value in 'no_training_and_certifications' field should be 0/1.";
                        //        status = false;

                        //    }

                        //    if (DR["yes_training_and_certifications"].ToString() == "1")
                        //    {
                        //        if (DR["yes_training_and_certifications_comments"] == "")
                        //        {
                        //            //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //            status = false;


                        //        }

                        //    }
                        //    else if (DR["yes_training_and_certifications"].ToString() == "0")
                        //    {
                        //        if (DR["yes_training_and_certifications_comments"].ToString() != "")
                        //        {
                        //            // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //            status = false;


                        //        }
                        //    }

                        //    if (DR["no_training_and_certifications"].ToString() == "1")
                        //    {
                        //        if (DR["no_training_and_certifications_comments"].ToString() == "")
                        //        {
                        //            //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //            status = false;


                        //        }

                        //    }
                        //    else if (DR["no_training_and_certifications"] == "0")
                        //    {
                        //        if (DR["no_training_and_certifications_comments"].ToString() != "")
                        //        {
                        //            //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //            status = false;


                        //        }
                        //    }
                        //       if (System.Text.RegularExpressions.Regex.IsMatch(DR["Ingredient_Name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }
                        //           if (System.Text.RegularExpressions.Regex.IsMatch(DR["FoodCategory"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }

                        //      if (System.Text.RegularExpressions.Regex.IsMatch(DR["vendor_name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }

                        //    if (System.Text.RegularExpressions.Regex.IsMatch(DR["contact_name"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }
                        //    if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_by"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }

                        //    if (System.Text.RegularExpressions.Regex.IsMatch(DR["upload_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;

                        //    }
                        //    if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                        //    {
                        //        // do nothing
                        //    }
                        //    else
                        //    {
                        //        // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                        //        status = false;


                        //    }

                        // if (status == false)
                        //{
                        //    //  DataRow InvalidVendor = dtInvalidVendors.NewRow();
                        //    dtInvalidIngredient.ImportRow(DR);
                        //}
                        //else
                        //{
                        //    //DataRow ValidVendor = dtInvalidVendors.NewRow();
                        //    dtValidIngredient.ImportRow(DR);
                        //}

                        //status = true;

                        //    }

                        //}
                        //catch (Exception ex)
                        //{
                        //    lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                        //    status = false;
                        //    return;
                        //}


                        //try
                        //{
                        //    InvalidIngredient_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvInValidIngredient.csv");
                        //    ValidIngredient_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvValidIngredient.csv");
                        //    Utilities.CreateCSVFile(dtValidIngredient, ValidIngredient_CSVFileLocation);
                        //    Utilities.CreateCSVFile(dtInvalidIngredient, InvalidIngredient_CSVFileLocation);
                        //}
                        //catch (Exception ex)
                        //{
                        //    lblError.Text = ex.Message.ToString();
                        //    return;
                        //}


                        //ValidIngredient_CSVFileLocation = "\"" + ValidIngredient_CSVFileLocation + "\"";
                        ValidIngredient_CSVFileLocation = "\"" + OrignalCSVFileLocation + "\"";

                        ProcessCreateIngredient createIngredient = new ProcessCreateIngredient();
                        // IDataReader drResult = createIngredient.Upload(ValidIngredient_CSVFileLocation, KitchenId);
                        IDataReader drResult = createIngredient.Upload(ValidIngredient_CSVFileLocation, KitchenId);

                        //createVendor.Upload(SaveLocation, KitchenId);
                        if (drResult.Read())
                        {
                            lblError.Text = drResult["RowInserted"].ToString() + " record(s) inserted";
                            lblError.Visible = true;
                            grdHotHolding.DataBind();
                            drResult.Close();
                            BindData();
                        }
                        if (drResult.IsClosed == false)
                        {
                            drResult.Close();
                        }
                        // if (dtInvalidIngredient.Rows.Count > 0)
                        //{
                        //    hlDownLoadInvalidIngredient.Visible = true;

                        //    lblError.Text += "<br />" + "To Download Invalid vendor(s) list . Please ";
                        //}
                        //else
                        //{
                        //    hlDownLoadInvalidIngredient.Visible = false;

                        //    lblError.Text += "";
                        //}
                        //lblError.Text = "The file has been uploaded.";
                        //grdHotHolding.DataBind();
                        //connectObj.Close();
                    }
                    catch (Exception Exc)
                    {
                        lblError.Text = Exc.Message.ToString();
                        lblError.Visible = true;
                        //lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                        //connectObj.Close();
                    }
                }
                else
                {
                    //Response.Write("Please select a file to upload.");
                    lblError.Text = "Only .csv files allowed!";
                    lblError.Visible = true;

                }
            }
            else
            {
                lblError.Text = "Please select a file to upload.";
                lblError.Visible = true;
            }
        }
        protected void cmdDownload_Click(object sender, EventArgs e)
        {
            ProcessGetFoodCategory getFoodCategories = new ProcessGetFoodCategory();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=FoodCategories.xls");
            Response.ContentType = "application/excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            DataGrid dg = new DataGrid();
            dg.DataSource = getFoodCategories.ExportFoodCategoriesByKitchenId(KitchenId);
            dg.DataBind();
            dg.HeaderStyle.Font.Bold = true;
            dg.RenderControl(htw);

            //grdContact.RenderControl(htw);       
            // dg.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
            dg = null;
            dg.Dispose();
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
        }
        protected void cmdGetFormat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Data/IngredientSample.csv");
        }
        protected void cmdBackToList_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void grdHotHolding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CCP")
            {
                int nCCPId = int.Parse(e.CommandArgument.ToString());
                ProcessGetCCP getCCP = new ProcessGetCCP();
                DataSet ds = getCCP.GetCCPByID(nCCPId);
                dtvSOP.DataSource = ds;
                dtvSOP.DataBind();
                ModalPopupExtender1.PopupControlID = this.divPopUp1.ID;
                ModalPopupExtender1.PopupDragHandleControlID = this.panelDragHandle1.ID;
                ModalPopupExtender1.Show();
            }

            if (e.CommandName == "Hazard")
            {
                int nFoodCategoryId = int.Parse(e.CommandArgument.ToString());
                ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
                DataSet ds = getFoodCategory.GetFoodCategoryByID(nFoodCategoryId);
                dtvFoodCategory.DataSource = ds;
                dtvFoodCategory.DataBind();

                DataSet dsCorrectiveAction = getFoodCategory.GetFoodCategoryCorrectiveActions(nFoodCategoryId);
                rptCorrectiveAction.DataSource = dsCorrectiveAction;
                rptCorrectiveAction.DataBind();
                ModalPopupExtender1.PopupControlID = this.divPopUp.ID;
                ModalPopupExtender1.PopupDragHandleControlID = this.panelDragHandle.ID;
                ModalPopupExtender1.Show();
            }
            if (e.CommandName == "Vendors")
            {
                int nIngredientId = int.Parse(e.CommandArgument.ToString());
                ProcessGetIngredient getVendros = new ProcessGetIngredient();
                DataSet ds = getVendros.GetIngredientVendorsById(nIngredientId);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    lblIngredient.Text = dr["Name"].ToString();
                    break;
                }
                grdVendorsList.DataSource = ds;
                grdVendorsList.DataBind();

                ModalPopupExtender1.PopupControlID = this.divVendors.ID;
                //ModalPopupExtender1.PopupDragHandleControlID = this.panelVendors.ID;
                ModalPopupExtender1.Show();
            }
            if (e.CommandName == "Ingredient")
            {
                int nIngredientId = int.Parse(e.CommandArgument.ToString());
                GetData(nIngredientId);
            }
        }
        private int getFoodCategoryId(string strFoodCategory)
        {
            int i = 0;
            string strId = "0";
            for (i = 0; i < ddlFoodCategory.Items.Count; i++)
            {
                if (ddlFoodCategory.Items[i].Text.Trim() == strFoodCategory.Trim())
                {
                    strId = ddlFoodCategory.Items[i].Value;
                }
            }
            return Convert.ToInt32(strId);
        }
        private int getVendorId(string strVendor)
        {
            int i = 0;
            string strId = "0";
            for (i = 0; i < ddlVendor.Items.Count; i++)
            {
                if (ddlVendor.Items[i].Text.Trim() == strVendor.Trim())
                {
                    strId = ddlVendor.Items[i].Value;
                }
            }
            return Convert.ToInt32(strId);
        }
        protected void hfAutoComplete_ValueChanged(object sender, EventArgs e)
        {
            string selectedItem = hfAutoComplete.Value;
            ProcessGetIngredient getVendros = new ProcessGetIngredient();
            DataSet ds = getVendros.GetIngredientByName(selectedItem, (int)Session["KitchenId"]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GetData(int.Parse(ds.Tables[0].Rows[0]["IngredientId"].ToString()));
            }

        }
        /// <summary>
        /// Custom Paging
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
        //    ProcessGetIngredient getIngredients = new ProcessGetIngredient();

        //    DataSet ds = getIngredients.GetIngredientsPagedDataSet(KitchenId, currentPageNumber, PAGE_SIZE);
        //    //ad.Fill(ds);

        //    grdHotHolding.DataSource = ds;
        //    grdHotHolding.DataBind();
        //    currentPageNumber = int.Parse(lblCurrentPageNumber.Text);
        //    // get the total rows 

        //    int totalRows = getIngredients.TotalRecords;

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
        //}
        private void BindData()
        {
            ProcessGetIngredient getIngredients = new ProcessGetIngredient();
            currentPageNumber = grdHotHolding.PageIndex == 0 ? 1 : grdHotHolding.PageIndex;

            DataSet ds = getIngredients.GetIngredientsPagedDataSet(KitchenId, currentPageNumber, PAGE_SIZE);
            grdHotHolding.DataSource = ds;
            grdHotHolding.DataBind();
            int totalRows = getIngredients.TotalRecords;
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
            BindData();
        }
        #endregion

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
    }
}