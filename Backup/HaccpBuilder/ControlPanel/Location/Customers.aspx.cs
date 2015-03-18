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

public partial class ControlPanel_Location_Customers : System.Web.UI.Page
{
    string mode = "new";
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

            Customers Customer = new Customers();
            Customer.CustomerID = int.Parse(Request.QueryString["Id"]);
            ProcessGetCustomer getCustomers = new ProcessGetCustomer();
            getCustomers.Customer = Customer;
            getCustomers.Invoke();

            IDataReader logReader = getCustomers.ResultSet;
            if (logReader.Read())
            {
                txtContactName.Text = logReader["ContactName"].ToString();
                txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                txtEntryDate.Text =DateTime.Parse(logReader["Entrydate"].ToString()).ToShortDateString();
                txtPhone.Text = logReader["Phone"].ToString();
                txtTraining.Text = logReader["TrainingDetail"].ToString();
                txtCompanyName.Text = logReader["CompanyName"].ToString();
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
                Session["CustomerId"] = int.Parse(logReader["CustomerID"].ToString());
                logReader.Close();

            }
            if (logReader.IsClosed == false)
            {
                logReader.Close();
            }
        }

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
            txtCompanyName.Text = "";
            txtVerifiedBy.Text = "";
            txtSearch.Text = "";
            grdSearch.Visible = false;
            grdHotHolding.Visible = true;
            cldVerifiedDate.SelectedDate = DateTime.Today;
            rdbYes.Checked = true;
            lblError.Text = "";
            txtCorrectiveAction.Enabled = false;
            reqValidateCorrectiveAction.Enabled = false;
            cmdAdd.Visible = true;
            cmdCancel.Visible = true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;
            txtCompanyName.Enabled = true;

        }
        if (mode == "edit")
        {
            grdSearch.Visible = false;
            grdHotHolding.Visible = true;
            cmdAdd.Visible = false;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
            txtCompanyName.Enabled = false;
        }
        if ((int)Session["TypeId"] == 1)
        {
            cmdGetFormat.Enabled = false;
            cmdUpload.Enabled = false;
            File1.Enabled = false;
        }
        grdHotHolding.DataBind();

    }
    protected void cmdAddNew_Click(object sender, EventArgs e)
    {
        mode = "new";
    }
    private void InsertData()
    {

        Customers Customer = new Customers();
        Customer.CompanyName = txtCompanyName.Text;
        Customer.ContactName = txtContactName.Text;
        Customer.Entrydate = DateTime.Parse(txtEntryDate.Text);
        Customer.Phone = txtPhone.Text;
        if (rdbYes.Checked == true)
        {
            Customer.Training = 1;
            Customer.TrainingDetail = txtTraining.Text;
            Customer.CorrectiveAction = null;
        }
        if (rdbNo.Checked == true)
        {
            Customer.Training = 0;
            Customer.CorrectiveAction = txtCorrectiveAction.Text;
            Customer.TrainingDetail = null;
        }
        Customer.VarifiedDate = cldVerifiedDate.SelectedDate;
        Customer.VerifiedBy = txtVerifiedBy.Text;
        Customer.KitchenId = (int)Session["KitchenId"];

        ProcessCreateCustomer createCustomer = new ProcessCreateCustomer();
        createCustomer.Customer = Customer;
        createCustomer.Invoke();

    }
    private void SubmitData()
    {
        Customers Customer = new Customers();
        if (Request.QueryString["Id"] != null)
        {
            Customer.CustomerID = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["CustomerId"] != null)
            {
                Customer.CustomerID = (int)Session["CustomersId"];
            }
        }
        Customer.CompanyName = txtCompanyName.Text;
        Customer.ContactName = txtContactName.Text;
        Customer.Entrydate = DateTime.Parse(txtEntryDate.Text);
        Customer.Phone = txtPhone.Text;
        if (rdbYes.Checked == true)
        {
            Customer.Training = 1;
            Customer.TrainingDetail = txtTraining.Text;
            Customer.CorrectiveAction = null;
        }
        if (rdbNo.Checked == true)
        {
            Customer.Training = 0;
            Customer.CorrectiveAction = txtCorrectiveAction.Text;
            Customer.TrainingDetail = null;
        }
        Customer.VarifiedDate = cldVerifiedDate.SelectedDate;
        Customer.VerifiedBy = txtVerifiedBy.Text;
        Customer.KitchenId = (int)Session["KitchenId"];

        ProcessSetCustomer setCustomers = new ProcessSetCustomer();
        setCustomers.Customer = Customer;
        setCustomers.Invoke();

    }
    private int RemoveData()
    {
        Customers Customer = new Customers();
        Customer.CustomerID = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteCustomer removeCustomer = new ProcessDeleteCustomer();
        removeCustomer.Customers = Customer;
        try
        {
            removeCustomer.Invoke();
        }
        catch (Exception ex)
        {
            lblError.Text = "Customer could not be deleted";
            return 0;
        }
        return 1;

    }
    private int CheckData(int nMode)
    {
        ProcessGetCustomer getCustomer = new ProcessGetCustomer();
        IDataReader drCustomer;
        DataSet dsMenuItem;
        if (nMode == 1)
        {
            dsMenuItem = getCustomer.GetCustomersByName(txtCompanyName.Text.Trim(), (int)Session["KitchenId"]);
            if (dsMenuItem.Tables[0].Rows.Count > 0)
            {
                return 0;
            }
            else
            {
                if ((int)Session["TypeId"] == 1)
                {
                    // Check Customers limit for Free Trial Kitchens
                    drCustomer = getCustomer.GetCustomerLimit((int)Session["KitchenId"]);
                    drCustomer.Read();
                    if (drCustomer["Result"].ToString() != "1")
                    {
                        return 2;
                    }
                    else
                    {
                        return 1;
                    }
                    drCustomer.Close();
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
        int nResult;
        nResult = CheckData(1);
        if (nResult == 1)
        {
            mode = "new";
            InsertData();
            SetPage();
        }
        if (nResult == 2)
        {
            lblError.Text = "Free Trial Customers Limit Filled";
            lblError.Visible = true;
            
        }
        if (nResult == 0)
        {
            lblError.Text = txtCompanyName.Text.Trim() + " already exists, Please select different name";
            lblError.Visible = true;
            grdHotHolding.DataBind();
        }
    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        mode = "new";
        SubmitData();
        SetPage();
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        mode = "new";
        SetPage();
    }
    protected void cmdDelete_Click(object sender, ImageClickEventArgs e)
    {

        if (RemoveData() == 1)
        {
            mode = "new";
            SetPage();
        }

    }
    protected void cmdUpload_Click(object sender, EventArgs e)
    {
        hlDownLoadInvalidCustomers.Visible = false;
        lblError.Text = "";
        if ((File1.PostedFile != null) && File1.PostedFile.ContentLength > 0)
        {
            string fileExt = System.IO.Path.GetExtension(File1.PostedFile.FileName);
            if (fileExt == ".csv")
            {

                //ProcessGetCustomer getCustomer = new ProcessGetCustomer();
                //DataSet dsMenuItem;
                string fn = System.IO.Path.GetFileName(File1.PostedFile.FileName);
                //string SaveLocation = @Server.MapPath("Data") + "\\" + fn;
                //string SaveLocation = "C:\\Data\\CustomersSample.xls";
                File1.PostedFile.SaveAs(@Server.MapPath("~/ControlPanel/Kitchen/Data/CustomerSample.csv"));
                //string SaveLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data") + "\\" + fn;
                string OrignalCSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/CustomerSample.csv");
                //File1.PostedFile.SaveAs(SaveLocation);
                // string conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + SaveLocation + ";Extended Properties=Excel 8.0;";
                //OleDbConnection connectObj = new OleDbConnection(conStr);
                try
                {
                    //connectObj.Open();
                    //OleDbCommand commandObj = new OleDbCommand("SELECT * FROM [Sheet1$]", connectObj);
                    //OleDbDataReader reader = commandObj.ExecuteReader();
                    //while (reader.Read())
                    //{
                    //    // INSERT DATA

                    //    dsMenuItem = getCustomer.GetCustomersByName(Convert.ToString(reader["Customer name"]).Trim(), (int)Session["KitchenId"]);
                    //    if (dsMenuItem.Tables[0].Rows.Count <= 0 && Convert.ToString(reader["Customer name"]) != "")
                    //    {

                    //        Customers Customer = new Customers();
                    //        Customer.CompanyName = Convert.ToString(reader["Customer name"]);
                    //        Customer.ContactName = Convert.ToString(reader["contact name"]);
                    //        Customer.Entrydate = DateTime.Now.Date;
                    //        Customer.Phone = Convert.ToString(reader["phone number"]);
                    //        if (Convert.ToString(reader["yes training and certifications"]) == "1")
                    //        {
                    //            Customer.Training = 1;
                    //            Customer.TrainingDetail = Convert.ToString(reader["yes training and certifications comments"]);
                    //            Customer.CorrectiveAction = null;
                    //        }
                    //        if (Convert.ToString(reader["no training and certifications"]) == "1")
                    //        {
                    //            Customer.Training = 0;
                    //            Customer.CorrectiveAction = Convert.ToString(reader["no training and certifications comments"]);
                    //            Customer.TrainingDetail = null;
                    //        }
                    //        Customer.VarifiedDate = DateTime.Parse(Convert.ToString(reader["verified date"]));
                    //        Customer.VerifiedBy = Convert.ToString(reader["verified by"]);
                    //        Customer.KitchenId = (int)Session["KitchenId"];

                    //        ProcessCreateCustomer createCustomer = new ProcessCreateCustomer();
                    //        createCustomer.Customer = Customer;
                    //        createCustomer.Invoke();
                    //    }
                    //}
                    DataTable dtCustomers = new DataTable();
                    DataTable dtInvalidCustomers = new DataTable();
                    DataTable dtValidCustomers = new DataTable();
                    string InvalidCustomers_CSVFileLocation = string.Empty;
                    string ValidCustomers_CSVFileLocation = string.Empty;
                    bool status = true;
                    try
                    {
                        dtCustomers = Utilities.csvToDataTable(OrignalCSVFileLocation, true);
                        dtInvalidCustomers = dtCustomers.Clone();
                        dtValidCustomers = dtCustomers.Clone();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message.ToString();
                        return;
                    }

                    if (dtCustomers.Columns.Count != 10)
                    {

                        lblError.Text = "The CSV format is invalid. Please ensure that number of columns should match the provided sample file.";

                        return;
                    }

                    try
                    {

                        dtCustomers.Columns["customer_name"].Unique = true;
                    }
                    catch (Exception exx)
                    {
                        lblError.Text = "The CSV format is invalid. Please ensure that Customer names should be unique.";

                        return;
                    }


                    try
                    {

                        foreach (DataRow DR in dtCustomers.Rows)
                        {

                            if ((DR["upload_date"] == DBNull.Value) && (DR["customer_name"] == DBNull.Value) && (DR["contact_name"] == DBNull.Value) && (DR["phone_number"] == DBNull.Value) &&
                                (DR["yes_training_and_certifications"] == DBNull.Value) && (DR["no_training_and_certifications"] == DBNull.Value) && (DR["verified_by"] == DBNull.Value) && (DR["verified_date"] == DBNull.Value))
                            {
                                status = false;
                                //lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";

                            }
                            if ((DR["upload_date"].ToString() == "") && (DR["customer_name"].ToString() == "") && (DR["contact_name"].ToString() == "") && (DR["phone_number"].ToString() == "") &&
                               (DR["yes_training_and_certifications"].ToString() == "") && (DR["no_training_and_certifications"].ToString() == "") && (DR["verified_by"].ToString() == "") && (DR["verified_date"].ToString() == ""))
                            {
                                //  lblError.Text = "The CSV format is invalid. Values in some column(s) are missing.";
                                status = false;


                            }


                            try
                            {
                                if (DateTime.Parse(DR["upload_date"].ToString()) > DateTime.Now)
                                {
                                    // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                                    status = false;

                                }
                                if (DateTime.Parse(DR["verified_date"].ToString()) > DateTime.Now)
                                {
                                    // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                                    status = false;

                                }

                            }
                            catch (Exception ex)
                            {
                                if (ex.Message.Contains("String was not recognized as a valid DateTime"))
                                {
                                    status = false;
                                }
                                else
                                {
                                    status = false;
                                }
                            }
                            
                          

                            if (DR["yes_training_and_certifications"].ToString().ToLower() != "0" && DR["yes_training_and_certifications"].ToString().ToLower() != "1")
                            {
                                // lblError.Text = "The CSV format is invalid. Value in 'yes_training_and_certifications' field should be 0/1.";
                                status = false;

                            }
                            if (DR["no_training_and_certifications"].ToString() != "0" && DR["no_training_and_certifications"].ToString() != "1")
                            {
                                //lblError.Text = "The CSV format is invalid. Value in 'no_training_and_certifications' field should be 0/1.";
                                status = false;

                            }

                            if (DR["yes_training_and_certifications"].ToString() == "1")
                            {
                                if (DR["yes_training_and_certifications_comments"] == "")
                                {
                                    //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                    status = false;


                                }

                            }
                            else if (DR["yes_training_and_certifications"].ToString() == "0")
                            {
                                if (DR["yes_training_and_certifications_comments"].ToString() != "")
                                {
                                    // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                    status = false;


                                }
                            }

                            if (DR["no_training_and_certifications"].ToString() == "1")
                            {
                                if (DR["no_training_and_certifications_comments"].ToString() == "")
                                {
                                    //  lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                    status = false;


                                }

                            }
                            else if (DR["no_training_and_certifications"] == "0")
                            {
                                if (DR["no_training_and_certifications_comments"].ToString() != "")
                                {
                                    //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                    status = false;


                                }
                            }

                            if (System.Text.RegularExpressions.Regex.IsMatch(DR["customer_name"].ToString(), "^[A-Za-z0-9.\\-_& ]+$"))
                            {
                                // do nothing
                            }
                            else
                            {
                                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                status = false;

                            }

                            if (System.Text.RegularExpressions.Regex.IsMatch(DR["contact_name"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                            {
                                // do nothing
                            }
                            else
                            {
                                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                status = false;

                            }
                            if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_by"].ToString(), "^[A-Za-z0-9.\\-_ ]+$"))
                            {
                                // do nothing
                            }
                            else
                            {
                                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                status = false;

                            }

                            if (System.Text.RegularExpressions.Regex.IsMatch(DR["upload_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                            {
                                // do nothing
                            }
                            else
                            {
                                //lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                status = false;

                            }
                            if (System.Text.RegularExpressions.Regex.IsMatch(DR["verified_date"].ToString(), "^\\d{1,2}/\\d{1,2}/\\d{2,4}$"))
                            {
                                // do nothing
                            }
                            else
                            {
                                // lblError.Text = "The CSV format is invalid. Please ensure that the fields in your CSV file matches with the provided sample file.";
                                status = false;


                            }



                            if (status == false)
                            {
                                //  DataRow InvalidVendor = dtInvalidVendors.NewRow();
                                dtInvalidCustomers.ImportRow(DR);
                            }
                            else
                            {
                                //DataRow ValidVendor = dtInvalidVendors.NewRow();
                                dtValidCustomers.ImportRow(DR);
                            }

                            status = true;

                        }

                    }
                    catch (Exception ex)
                    {
                       lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";
                        status = false;
                        return;
                    }


                    try
                    {
                        InvalidCustomers_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvInValidCustomers.csv");
                        ValidCustomers_CSVFileLocation = @Server.MapPath("~/ControlPanel/Kitchen/Data/csvValidCustomers.csv");
                        Utilities.CreateCSVFile(dtValidCustomers, ValidCustomers_CSVFileLocation);
                        Utilities.CreateCSVFile(dtInvalidCustomers, InvalidCustomers_CSVFileLocation);
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message.ToString();
                        return;
                    }


                    ValidCustomers_CSVFileLocation = "\"" + ValidCustomers_CSVFileLocation + "\"";

                    ProcessCreateCustomer createCustomer = new ProcessCreateCustomer();
                    IDataReader drResult = createCustomer.Upload(ValidCustomers_CSVFileLocation, (int)Session["KitchenId"]);
                    if (drResult.Read())
                    {
                        lblError.Text = drResult["RowInserted"].ToString() + " record(s) inserted";
                        drResult.Close();
                       
                        grdHotHolding.DataBind();
                    }
                    if (drResult.IsClosed == false)
                    {
                        drResult.Close();
                    }
                    if (dtInvalidCustomers.Rows.Count > 0)
                    {
                        hlDownLoadInvalidCustomers.Visible = true;

                        lblError.Text += "<br />" + "To Download Invalid customer(s) list . Please ";
                    }
                    else
                    {
                        hlDownLoadInvalidCustomers.Visible = false;

                        lblError.Text += "";
                    }
                }
                catch (Exception Exc)
                {
                    lblError.Text = "The CSV format is invalid. Please ensure that the data in your CSV file follow the pattren used in provided sample file.";

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
        ProcessGetCustomer getCustomer = new ProcessGetCustomer();
        DataSet dsCustomer = getCustomer.GetCustomersByName(txtSearch.Text, (int)Session["KitchenId"]);
        grdSearch.DataSource = dsCustomer;
        grdSearch.DataBind();
        grdHotHolding.Visible = false;
        grdSearch.Visible = true;
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
       Response.Redirect("~/ControlPanel/Kitchen/ShippingLog.aspx");
    }
    protected void cmdGetFormat_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Data/CustomerSample.csv");
    }
}

