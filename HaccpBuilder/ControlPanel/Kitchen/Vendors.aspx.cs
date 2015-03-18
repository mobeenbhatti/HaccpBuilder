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
    public partial class VendorsNew : System.Web.UI.Page
    {
        string mode = "new";
        protected int currentPageNumber = 1;
        private const int PAGE_SIZE = 20;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                if (TypeId == 7)
                    Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");
                CV_cldVerifyDate.ValueToCompare = DateTime.Now.ToShortDateString();
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
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetData()
        {
            //string strCustom;       
            if (Request.QueryString["Id"] != null)
            {

                Vendors vendor = new Vendors();
                vendor.VendorID = int.Parse(Request.QueryString["Id"]);
                ProcessGetVendor getVendors = new ProcessGetVendor();
                getVendors.Vendor = vendor;
                getVendors.Invoke();

                IDataReader logReader = getVendors.ResultSet;
                if (logReader.Read())
                {
                    txtContactName.Text = logReader["ContactName"].ToString();
                    txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtEntryDate.Text = DateTime.Parse(logReader["Entrydate"].ToString()).ToShortDateString();
                    txtPhone.Text = logReader["Phone"].ToString();
                    txtTraining.Text = logReader["TrainingDetail"].ToString();
                    txtVendorName.Text = logReader["VendorName"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VarifiedDate"].ToString());
                    if (logReader["Training"].ToString() == "1")
                    {
                        rdbYes.Checked = true;
                        reqValidateCorrectiveAction.Enabled = false;
                        txtCorrectiveAction.Enabled = false;

                    }
                    else
                    {
                        rdbNo.Checked = true;
                        reqValidateTraining.Enabled = false;
                        txtTraining.Enabled = false;
                    }
                    Session["VendorId"] = int.Parse(logReader["VendorID"].ToString());
                    logReader.Close();

                }
                if (logReader.IsClosed == false)
                {
                    logReader.Close();
                }
            }

        }
        private void GetData(int nVendorId)
        {
            //string strCustom; 
            Vendors vendor = new Vendors();
            vendor.VendorID = nVendorId;
            ProcessGetVendor getVendors = new ProcessGetVendor();
            getVendors.Vendor = vendor;
            getVendors.Invoke();

            IDataReader logReader = getVendors.ResultSet;
            if (logReader.Read())
            {
                hfVendorId.Value = logReader["VendorID"].ToString();
                txtContactName.Text = logReader["ContactName"].ToString();
                txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                txtEntryDate.Text = DateTime.Parse(logReader["Entrydate"].ToString()).ToShortDateString();
                txtPhone.Text = logReader["Phone"].ToString();
                txtTraining.Text = logReader["TrainingDetail"].ToString();
                txtVendorName.Text = logReader["VendorName"].ToString();
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VarifiedDate"].ToString());
                if (logReader["Training"].ToString() == "1")
                {
                    rdbYes.Checked = true;
                    reqValidateCorrectiveAction.Enabled = false;
                    txtCorrectiveAction.Enabled = false;
                    txtTraining.Enabled = true;

                }
                else
                {
                    rdbNo.Checked = true;
                    reqValidateTraining.Enabled = false;
                    txtTraining.Enabled = false;
                    txtCorrectiveAction.Enabled = true;
                }
                Session["VendorId"] = int.Parse(logReader["VendorID"].ToString());
                logReader.Close();

            }
            if (logReader.IsClosed == false)
            {
                logReader.Close();
            }
            mode = "edit";
            SetPage();
        }
        private void SetPage()
        {
            if (mode == "new")
            {
                txtContactName.Text = "";
                txtCorrectiveAction.Text = "";
                txtEntryDate.Text = DateTime.Today.ToShortDateString();
                txtPhone.Text = "";
                txtTraining.Text = "";
                txtVendorName.Text = "";
                txtVerifiedBy.Text = "";
                txtSearch.Text = "";
                grdSearch.Visible = false;
                grdHotHolding.Visible = true;
                pnlPaging.Visible = true;
                cldVerifiedDate.SelectedDate = DateTime.Today;
                rdbYes.Checked = true;
                lblError.Text = "";
                txtCorrectiveAction.Enabled = false;
                reqValidateCorrectiveAction.Enabled = false;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                txtVendorName.Enabled = true;


            }
            if (mode == "edit")
            {
                grdSearch.Visible = false;
                grdHotHolding.Visible = true;
                pnlPaging.Visible = true;
                cmdAdd.Visible = false;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
                txtVendorName.Enabled = false;
                cmdSubmit.Focus();
            }
            if (TypeId == 1)
            {
                cmdGetFormat.Enabled = false;
                cmdUpload.Enabled = false;
                File1.Enabled = false;
            }
            //grdHotHolding.DataBind();
            if (lblCurrentPageNumber.Text == "")
                currentPageNumber = 1;
            else
                currentPageNumber = int.Parse(lblCurrentPageNumber.Text);
            BindData();
            cmdBack.Visible = false;
        }
        protected void cmdBackToList_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();
        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
        }
        private void InsertData()
        {

            Vendors vendor = new Vendors();
            vendor.VendorName = txtVendorName.Text;
            vendor.ContactName = txtContactName.Text;
            vendor.Entrydate = DateTime.Parse(txtEntryDate.Text);
            vendor.Phone = txtPhone.Text;
            if (rdbYes.Checked == true)
            {
                vendor.Training = 1;
                vendor.TrainingDetail = txtTraining.Text;
                vendor.CorrectiveAction = null;
            }
            if (rdbNo.Checked == true)
            {
                vendor.Training = 0;
                vendor.CorrectiveAction = txtCorrectiveAction.Text;
                vendor.TrainingDetail = null;
            }
            vendor.VarifiedDate = cldVerifiedDate.SelectedDate;
            vendor.VerifiedBy = txtVerifiedBy.Text;
            vendor.KitchenId = KitchenId;

            ProcessCreateVendor createVendor = new ProcessCreateVendor();
            createVendor.Vendor = vendor;
            createVendor.Invoke();

        }
        private void SubmitData()
        {
            Vendors vendor = new Vendors();
            if (Request.QueryString["Id"] != null)
            {
                vendor.VendorID = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["VendorId"] != null)
                {
                    vendor.VendorID = (int)Session["VendorId"];
                }
                else
                {
                    vendor.VendorID = int.Parse(hfVendorId.Value);
                }
            }

            vendor.VendorName = txtVendorName.Text;
            vendor.ContactName = txtContactName.Text;
            vendor.Entrydate = DateTime.Parse(txtEntryDate.Text);
            vendor.Phone = txtPhone.Text;
            if (rdbYes.Checked == true)
            {
                vendor.Training = 1;
                vendor.TrainingDetail = txtTraining.Text;
                vendor.CorrectiveAction = null;
            }
            if (rdbNo.Checked == true)
            {
                vendor.Training = 0;
                vendor.CorrectiveAction = txtCorrectiveAction.Text;
                vendor.TrainingDetail = null;
            }
            vendor.VarifiedDate = cldVerifiedDate.SelectedDate;
            vendor.VerifiedBy = txtVerifiedBy.Text;
            vendor.KitchenId = KitchenId;

            ProcessSetVendor setVendors = new ProcessSetVendor();
            setVendors.Vendor = vendor;
            setVendors.Invoke();

        }
        private int RemoveData()
        {
            Vendors vendor = new Vendors();
            if (Request.QueryString["Id"] != null)
            {
                vendor.VendorID = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                vendor.VendorID = int.Parse(hfVendorId.Value);
            }
            ProcessGetIngredient getIngredients = new ProcessGetIngredient();
            DataSet ds = getIngredients.GetIngredientsByVendorId(vendor.VendorID);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblError.Text = "You must replace Vendor Relationship in Ingredient page prior to deleting a vendor";
                return 0;
            }
            ProcessDeleteVendor removeVendor = new ProcessDeleteVendor();
            removeVendor.Vendors = vendor;
            try
            {
                removeVendor.Invoke();
            }
            catch (Exception ex)
            {
                //lblError.Text = "Vendor could not be deleted";
                lblError.Text = "You must replace Vendor Relationship in Ingredient page prior to deleting a vendor";
                return 0;
            }
            return 1;

        }
        private int CheckData(int nMode)
        {
            ProcessGetVendor getVendor = new ProcessGetVendor();
            IDataReader drVendor;
            DataSet dsMenuItem;
            if (nMode == 1)
            {
                dsMenuItem = getVendor.GetVendorsByName(txtVendorName.Text.Trim(), KitchenId);
                if (dsMenuItem.Tables[0].Rows.Count > 0)
                {
                    return 0;
                }
                else
                {
                    if (TypeId == 1)
                    {
                        // Check Vendors limit for Free Trial Kitchens
                        drVendor = getVendor.GetVendorLimit(KitchenId);
                        drVendor.Read();
                        if (drVendor["Result"].ToString() != "1")
                        {
                            return 2;
                        }
                        else
                        {
                            return 1;
                        }
                        drVendor.Close();
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
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int nResult;
                nResult = CheckData(1);
                if (nResult == 1)
                {
                    mode = "new";
                    InsertData();
                    lblCurrentPageNumber.Text = "1";
                    SetPage();
                }
                if (nResult == 2)
                {
                    lblError.Text = "Free Trial Vendors Limit Filled";
                    lblError.Visible = true;
                }
                if (nResult == 0)
                {
                    lblError.Text = txtVendorName.Text.Trim() + " already exists, Please select different name";
                    lblError.Visible = true;
                    //grdHotHolding.DataBind();
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
                mode = "new";
                SubmitData();
                SetPage();
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
        protected void cmdUpload_Click(object sender, EventArgs e)
        {           
            lblError.Text = "";
            if ((File1.PostedFile != null) && File1.PostedFile.ContentLength > 0)
            {
                string fileExt = System.IO.Path.GetExtension(File1.PostedFile.FileName);
                if (fileExt == ".csv")
                {                   
                    string fn = System.IO.Path.GetFileName(File1.PostedFile.FileName);                    
                    File1.PostedFile.SaveAs(@Server.MapPath("~/ControlPanel/Kitchen/Data/vendortest.csv"));                   
                    string OrignalCSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/vendortest.csv");

                    try
                    {                        
                        string ValidVendors_CSVFileLocation = string.Empty;
                       
                        ValidVendors_CSVFileLocation = "\"" + OrignalCSVFileLocation + "\"";

                        ProcessCreateVendor createVendor = new ProcessCreateVendor();
                        IDataReader drResult = createVendor.Upload(ValidVendors_CSVFileLocation, KitchenId);

                        if (drResult.Read())
                        {
                            lblError.Text = drResult["RowInserted"].ToString() + " record(s) inserted";

                            drResult.Close();
                            grdHotHolding.DataBind();
                            BindData();
                        }
                        if (drResult.IsClosed == false)
                        {
                            drResult.Close();
                        }
                     
                    }
                    catch (Exception Exc)
                    {
                        lblError.Text = Exc.Message.ToString(); //"The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                        lblError.Text = Exc.Message;
                        lblError.Visible = true;
                    }
                }

                else
                {
                    //Response.Write("Please select a file to upload.");
                    lblError.Text = "Only .csv files allowed!";
                }
            }

            else
            {
                lblError.Text = "Please select a file to upload.";
            }
        }
        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            ProcessGetVendor getVendor = new ProcessGetVendor();
            DataSet dsVendor = getVendor.GetVendorsByName(txtSearch.Text, KitchenId);
            grdSearch.DataSource = dsVendor;
            grdSearch.DataBind();
            grdHotHolding.Visible = false;
            grdSearch.Visible = true;
            pnlPaging.Visible = false;
            cmdBack.Visible = true;
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Ingredients.aspx");
        }
        protected void cmdGetFormat_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Data/VendorSample.csv");
        }
        protected void grdHotHolding_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Vendor")
            {
                int nVendorId = int.Parse(e.CommandArgument.ToString());
                GetData(nVendorId);
            }
        }
        protected void hfAutoComplete_ValueChanged(object sender, EventArgs e)
        {
            string selectedItem = hfAutoComplete.Value;
            ProcessGetVendor getVendors = new ProcessGetVendor();
            DataSet ds = getVendors.GetVendorsByName(selectedItem, (int)Session["KitchenId"]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                GetData(int.Parse(ds.Tables[0].Rows[0]["VendorId"].ToString()));
            }

        }
        /// <summary>
        /// Custom Paging
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region Custom Paging
        
        private int CalculateTotalPages(double totalRows)
        {
            int totalPages = (int)Math.Ceiling(totalRows / PAGE_SIZE);

            return totalPages;
        }
        
        private void BindData()
        {
            ProcessGetVendor getVendors = new ProcessGetVendor();
            currentPageNumber = grdHotHolding.PageIndex == 0 ? 1 : grdHotHolding.PageIndex;

            DataSet ds = getVendors.GetVendorByKitchenIdPaging(KitchenId, currentPageNumber, PAGE_SIZE);
            grdHotHolding.DataSource = ds;
            grdHotHolding.DataBind();
            int totalRows = getVendors.TotalRecords;
            int totalPages = CalculateTotalPages(totalRows);
            
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