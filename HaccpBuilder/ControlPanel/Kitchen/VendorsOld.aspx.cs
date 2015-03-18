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
using System.Data.OleDb;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;

public partial class ControlPanel_Kitchen_Vendors : System.Web.UI.Page
{
    string mode = "new";
    protected int currentPageNumber = 1;
    private const int PAGE_SIZE = 20;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
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
    protected void cmdBackToList_Click(object sender, ImageClickEventArgs e)
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
        vendor.KitchenId = (int)Session["KitchenId"];

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
        vendor.KitchenId = (int)Session["KitchenId"];

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
            dsMenuItem = getVendor.GetVendorsByName(txtVendorName.Text.Trim(), (int)Session["KitchenId"]);
            if (dsMenuItem.Tables[0].Rows.Count > 0)
            {
                return 0;
            }
            else
            {
                if (TypeId == 1)
                {
                    // Check Vendors limit for Free Trial Kitchens
                    drVendor = getVendor.GetVendorLimit((int)Session["KitchenId"]);
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
    protected void cmdAdd_Click(object sender, ImageClickEventArgs e)
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
            Master.ShowError(exc.Message);
        }

    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            mode = "new";
            SubmitData();
            SetPage();
        }
        catch (Exception exc)
        {
            Master.ShowError(exc.Message);
        }

    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        mode = "new";
        SetPage();
    }
    protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
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
            Master.ShowError(exc.Message);
        }

    }
    protected void cmdUpload_Click(object sender, EventArgs e)
    {
    hlDownLoadInvalidVendors.Visible = false;
        lblError.Text = "";
        if ((File1.PostedFile != null) && File1.PostedFile.ContentLength > 0)
        {
            string fileExt = System.IO.Path.GetExtension(File1.PostedFile.FileName);
            if (fileExt == ".csv")
            {

                //ProcessGetVendor getVendor = new ProcessGetVendor();
                //DataSet dsMenuItem;
                string fn = System.IO.Path.GetFileName(File1.PostedFile.FileName);
                //string SaveLocation = @Server.MapPath("Data") + "\\" + fn;
                //string SaveLocation = "C:\\Data\\VendorsSample.xls";
                File1.PostedFile.SaveAs(@Server.MapPath("~/ControlPanel/Kitchen/Data/vendortest.csv"));
                //string SaveLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data") + "\\" + fn;
                string OrignalCSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/vendortest.csv");
            
                //File1.PostedFile.SaveAs(SaveLocation);
                // string conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + SaveLocation + ";Extended Properties=Excel 8.0;";
                //OleDbConnection connectObj = new OleDbConnection(conStr);
                try
                {
                //    //connectObj.Open();
                //    //OleDbCommand commandObj = new OleDbCommand("SELECT * FROM [Sheet1$]", connectObj);
                //    //OleDbDataReader reader = commandObj.ExecuteReader();
                //    //while (reader.Read())
                //    //{
                //    //    // INSERT DATA

                //    //    dsMenuItem = getVendor.GetVendorsByName(Convert.ToString(reader["vendor name"]).Trim(), (int)Session["KitchenId"]);
                //    //    if (dsMenuItem.Tables[0].Rows.Count <= 0 && Convert.ToString(reader["vendor name"]) != "")
                //    //    {

                //    //        Vendors vendor = new Vendors();
                //    //        vendor.VendorName = Convert.ToString(reader["vendor name"]);
                //    //        vendor.ContactName = Convert.ToString(reader["contact name"]);
                //    //        vendor.Entrydate = DateTime.Now.Date;
                //    //        vendor.Phone = Convert.ToString(reader["phone number"]);
                //    //        if (Convert.ToString(reader["yes training and certifications"]) == "1")
                //    //        {
                //    //            vendor.Training = 1;
                //    //            vendor.TrainingDetail = Convert.ToString(reader["yes training and certifications comments"]);
                //    //            vendor.CorrectiveAction = null;
                //    //        }
                //    //        if (Convert.ToString(reader["no training and certifications"]) == "1")
                //    //        {
                //    //            vendor.Training = 0;
                //    //            vendor.CorrectiveAction = Convert.ToString(reader["no training and certifications comments"]);
                //    //            vendor.TrainingDetail = null;
                //    //        }
                //    //        vendor.VarifiedDate = DateTime.Parse(Convert.ToString(reader["verified date"]));
                //    //        vendor.VerifiedBy = Convert.ToString(reader["verified by"]);
                //    //        vendor.KitchenId = (int)Session["KitchenId"];

                //    //        ProcessCreateVendor createVendor = new ProcessCreateVendor();
                //    //        createVendor.Vendor = vendor;
                //    //        createVendor.Invoke();
                //    //    }
                //    //}

                //    DataTable dtVendors = new DataTable();
                //    DataTable dtInvalidVendors = new DataTable();
                //    DataTable dtValidVendors = new DataTable();
               // string InvalidVendors_CSVFileLocation = string.Empty;
                  string ValidVendors_CSVFileLocation = string.Empty;
                //    bool status = true;
                //    try
                //    {
                //        dtVendors = Utilities.csvToDataTable(OrignalCSVFileLocation, true);
                //        dtInvalidVendors = dtVendors.Clone();
                //        dtValidVendors = dtVendors.Clone();
                //    }
                //    catch (Exception ex)
                //    {
                //        lblError.Text = ex.Message.ToString();
                //        return;
                //    }

                //    if (dtVendors.Columns.Count != 10)
                //    {

                //        lblError.Text = "The CSV format is invalid. Please ensure that number of columns should match the provided sample file.";

                //        return;
                //    }

                //    try
                //    {

                //        dtVendors.Columns["vendor_name"].Unique = true;
                //    }
                //    catch (Exception exx)
                //    {
                //        lblError.Text = "The CSV format is invalid. Please ensure that Vendor names should be unique.";

                //        return;
                //    }


                //    try
                //    {

                //        foreach (DataRow DR in dtVendors.Rows)
                //        {

                //            if ((DR["upload_date"] == DBNull.Value) && (DR["vendor_name"] == DBNull.Value) && (DR["contact_name"] == DBNull.Value) && (DR["phone_number"] == DBNull.Value) &&
                //                (DR["yes_training_and_certifications"] == DBNull.Value) && (DR["no_training_and_certifications"] == DBNull.Value) && (DR["verified_by"] == DBNull.Value) && (DR["verified_date"] == DBNull.Value))
                //            {
                //                status = false;
                //                //lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";

                //            }
                //            if ((DR["upload_date"].ToString() == "") && (DR["vendor_name"].ToString() == "") && (DR["contact_name"].ToString() == "") && (DR["phone_number"].ToString() == "") &&
                //               (DR["yes_training_and_certifications"].ToString() == "") && (DR["no_training_and_certifications"].ToString() == "") && (DR["verified_by"].ToString() == "") && (DR["verified_date"].ToString() == ""))
                //            {
                //                //  lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";
                //                status = false;


                //            }
                //            try
                //            {
                //                if (DateTime.Parse(DR["upload_date"].ToString()) > DateTime.Now)
                //                {
                //                    // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                //                    status = false;

                //                }
                //                if (DateTime.Parse(DR["verified_date"].ToString()) > DateTime.Now)
                //                {
                //                    // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                //                    status = false;

                //                }

                //            }
                //            catch (Exception ex)
                //            {
                //                if (ex.Message.Contains("String was not recognized as a valid DateTime"))
                //                {
                //                    status = false;
                //                }
                //                else
                //                {
                //                    status = false;
                //                }
                //            }

                    


                //            if (DR["yes_training_and_certifications"].ToString().ToLower() != "0" && DR["yes_training_and_certifications"].ToString().ToLower() != "1")
                //            {
                //                // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                //                status = false;

                //            }
                //            if (DR["no_training_and_certifications"].ToString() != "0" && DR["no_training_and_certifications"].ToString() != "1")
                //            {
                //                //lblError.Text = "The CSV format is invalid. Value in 'no_training_and_certifications' field should be 0/1.";
                //                status = false;

                //            }

                //            if (DR["yes_training_and_certifications"].ToString() == "1")
                //            {
                //                if (DR["yes_training_and_certifications_comments"] == "")
                //                {
                //                    //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                    status = false;


                //                }

                //            }
                //            else if (DR["yes_training_and_certifications"].ToString() == "0")
                //            {
                //                if (DR["yes_training_and_certifications_comments"].ToString() != "")
                //                {
                //                    // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                    status = false;


                //                }
                //            }

                //            if (DR["no_training_and_certifications"].ToString() == "1")
                //            {
                //                if (DR["no_training_and_certifications_comments"].ToString() == "")
                //                {
                //                    //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                    status = false;


                //                }

                //            }
                //            else if (DR["no_training_and_certifications"] == "0")
                //            {
                //                if (DR["no_training_and_certifications_comments"].ToString() != "")
                //                {
                //                    //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                    status = false;


                //                }
                //            }

                //            if (System.Text.RegularExpressions.Regex.IsMatch(DR["vendor_name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
                //            {
                //                // do nothing
                //            }
                //            else
                //            {
                //                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                status = false;

                //            }

                //            if (System.Text.RegularExpressions.Regex.IsMatch(DR["contact_name"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                //            {
                //                // do nothing
                //            }
                //            else
                //            {
                //                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                status = false;

                //            }
                //            if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_by"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                //            {
                //                // do nothing
                //            }
                //            else
                //            {
                //                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                status = false;

                //            }

                //            if (System.Text.RegularExpressions.Regex.IsMatch(DR["upload_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                //            {
                //                // do nothing
                //            }
                //            else
                //            {
                //                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                status = false;

                //            }
                //            if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                //            {
                //                // do nothing
                //            }
                //            else
                //            {
                //                // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                //                status = false;


                //            }



                //            if (status == false)
                //            {
                //                //  DataRow InvalidVendor = dtInvalidVendors.NewRow();
                //                dtInvalidVendors.ImportRow(DR);
                //            }
                //            else
                //            {
                //                //DataRow ValidVendor = dtInvalidVendors.NewRow();
                //                dtValidVendors.ImportRow(DR);
                //            }

                //            status = true;

                //        }

                //    }
                //    catch (Exception ex)
                //    {
                //        lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                //        status = false;
                //        return;
                //    }


                //    try
                //    {
                 // InvalidVendors_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvInValidVendors.csv");
                //        ValidVendors_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvValidVendors.csv");
                //        Utilities.CreateCSVFile(dtValidVendors, ValidVendors_CSVFileLocation);
                //        Utilities.CreateCSVFile(dtInvalidVendors, InvalidVendors_CSVFileLocation);
                //    }
                //    catch (Exception ex)
                //    {
                //        lblError.Text = ex.Message.ToString();
                //        return;
                //    }


                  ValidVendors_CSVFileLocation = "\"" + OrignalCSVFileLocation + "\"";

                    ProcessCreateVendor createVendor = new ProcessCreateVendor();
                    IDataReader drResult = createVendor.Upload(ValidVendors_CSVFileLocation, (int)Session["KitchenId"]);

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
                    //if (dtInvalidVendors.Rows.Count > 0)
                    //{
                    //    hlDownLoadInvalidVendors.Visible = true;

                    //    lblError.Text += "<br />" + "To Download Invalid vendor(s) list . Please ";
                    //}
                    //else
                    //{
                    //   hlDownLoadInvalidVendors.Visible = false;

                    //    lblError.Text += "";
                    //}
                }
                catch (Exception Exc)
                {
                    lblError.Text = Exc.Message.ToString(); //"The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                    Master.ShowError(Exc.Message);
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
    protected void cmdSearch_Click(object sender, ImageClickEventArgs e)
    {
        ProcessGetVendor getVendor = new ProcessGetVendor();
        DataSet dsVendor = getVendor.GetVendorsByName(txtSearch.Text, (int)Session["KitchenId"]);
        grdSearch.DataSource = dsVendor;
        grdSearch.DataBind();
        grdHotHolding.Visible = false;
        grdSearch.Visible = true;
        pnlPaging.Visible = false;
        cmdBack.Visible = true;
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
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
    //    ProcessGetVendor getVendors = new ProcessGetVendor();

    //    DataSet ds = getVendors.GetVendorByKitchenIdPaging((int)Session["KitchenId"], currentPageNumber, PAGE_SIZE);
    //    //ad.Fill(ds);

    //    grdHotHolding.DataSource = ds;
    //    grdHotHolding.DataBind();
    //    currentPageNumber = int.Parse(lblCurrentPageNumber.Text);
    //    // get the total rows 

    //    int totalRows = getVendors.TotalRecords;

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
        ProcessGetVendor getVendors = new ProcessGetVendor();
        currentPageNumber = grdHotHolding.PageIndex == 0 ? 1 : grdHotHolding.PageIndex;

        DataSet ds = getVendors.GetVendorByKitchenIdPaging((int)Session["KitchenId"], currentPageNumber, PAGE_SIZE);
        grdHotHolding.DataSource = ds;
        grdHotHolding.DataBind();
        int totalRows = getVendors.TotalRecords;
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

}
