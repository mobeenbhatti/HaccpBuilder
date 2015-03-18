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
using System.Globalization;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;

public partial class ControlPanel_Location_ThermoCalibrationLog : System.Web.UI.Page
{
    public string mode = "new";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
            CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString(); 
            //cmdBack.Attributes.Add("onclick", "MoveBack( )");
            GetInitialData();
            if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
            {
                // ItemId = int.Parse(Request.QueryString["Id"]);
                mode = "edit";
                SetPage();
                GetData();
            }
            else
            {
                SetPage();
            }
        }

 
       

    }
    protected void cmdBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    private void GetInitialData()
    {        
        cldMealDate.SelectedDate = DateTime.Today;
        cldVerifiedDate.SelectedDate = DateTime.Today;
        txtEntryDate.Text = DateTime.Now.ToString();

        if ((int)Session["TypeId"] != 1)
        {
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            DataSet dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId((int)Session["KitchenId"], 6);
            if (dsTemperature.Tables[0].Rows.Count > 0)
            {
                hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["TempMax"].ToString();
                hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["TempMin"].ToString();
            }
        }
        else
        {
            hfTempHigh.Value = "NA";
            hfTempLow.Value = "NA";
        }

    }
 //   protected void ValidateTemp1(object source, ServerValidateEventArgs args)
   // {
        //int nResult = 0;
        //if (hfTempHigh.Value != "NA" && hfTempHigh.Value != "")
        //{
        //    if (txtTemperature.Text != "")
        //    {
        //        if (float.Parse(txtTemperature.Text) < float.Parse(hfTempLow.Value) || float.Parse(txtTemperature.Text) > float.Parse(hfTempHigh.Value))
        //        {
        //            for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
        //            {
        //                if (rdlCorrectiveAction1.Items[i].Selected == true)
        //                {
        //                    nResult = 1;
        //                    break;
        //                }
        //            }
        //            if (nResult == 0)
        //            {
        //                args.IsValid = false;
        //            }
        //        }
        //    }
        //}
 //   }
    private void GetData()
    {
       // string strCustom;
        if (Request.QueryString["Id"] != null)
        {
            ThermoCalibrationLog ThermoCalibrationLog = new ThermoCalibrationLog();
            ThermoCalibrationLog.ThermoCalibrationLogId = int.Parse(Request.QueryString["Id"]);
            ProcessGetThermoCalibrationLog getThermoCalibrationLog = new ProcessGetThermoCalibrationLog();
            getThermoCalibrationLog.ThermoCalibrationLog = ThermoCalibrationLog;
            getThermoCalibrationLog.Invoke();
          //  rdlCorrectiveAction1.DataBind();
            IDataReader logReader = getThermoCalibrationLog.ResultSet;
            if (logReader.Read())
            {
                cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                //txtThermometer.Text = logReader["Thermometer"].ToString();
                if (logReader["ThermometerID"].ToString() == "")
                {

                    ddlThermometerDevice.SelectedIndex = 0;
                }
                else
                {
                    ddlThermometerDevice.SelectedValue = logReader["ThermometerID"].ToString();
                }
                if (logReader["Temperature"].ToString() != "99999.00")
                {
                    txtTemperature.Text = logReader["Temperature"].ToString();

                }
                else
                {
                    txtTemperature.Text = "";

                }
                if (logReader["Temperature2"].ToString() != "99999.00")
                {
                    txtTemperature2.Text = logReader["Temperature2"].ToString();

                }
                else
                {
                    txtTemperature2.Text = "";

                }
                if (logReader["Temperature3"].ToString() != "99999.00")
                {
                    txtTemperature3.Text = logReader["Temperature3"].ToString();

                }
                else
                {
                    txtTemperature3.Text = "";

                }

                if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                {
                    SetPageInEditMode("edit");
                }
                else
                {
                    SetPageInEditMode("new");
                }
        // txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                txtEntryDate.Text =logReader["EntryDate"].ToString();
                //for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                //{
                //    if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction"].ToString())
                //    {
                //        rdlCorrectiveAction1.Items[i].Selected = true;
                //        break;
                //    }
                //}
            }
        }
        else
        {
            if (Request.QueryString["date"] != null)
            {
                ProcessGetThermoCalibrationLog getThermoCalibrationLog = new ProcessGetThermoCalibrationLog();
                IDataReader logReader = getThermoCalibrationLog.GetThermoCalibrationLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()),(int)Session["KitchenId"]);
                if (logReader.Read())
                {
                    Session["ThermoCalibrationLogId"] = int.Parse(logReader["Id"].ToString());
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    //txtThermometer.Text = logReader["Thermometer"].ToString();
                    if (logReader["ThermometerID"].ToString() == "")
                    {

                        ddlThermometerDevice.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlThermometerDevice.SelectedValue = logReader["ThermometerID"].ToString();
                    }
                    if (logReader["Temperature"].ToString() != "99999.00")
                    {
                        txtTemperature.Text = logReader["Temperature"].ToString();

                    }
                    else
                    {
                        txtTemperature.Text = "";

                    }
                    if (logReader["Temperature2"].ToString() != "99999.00")
                    {
                        txtTemperature2.Text = logReader["Temperature2"].ToString();

                    }
                    else
                    {
                        txtTemperature2.Text = "";

                    }
                    if (logReader["Temperature3"].ToString() != "99999.00")
                    {
                        txtTemperature3.Text = logReader["Temperature3"].ToString();

                    }
                    else
                    {
                        txtTemperature3.Text = "";

                    }
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");
                    }
                    else
                    {
                        SetPageInEditMode("new");
                    }
                   //txtCorrectiveAction.Text = logReader["CorrectiveAction"].ToString();
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
                    //for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                    //{
                    //    if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction"].ToString())
                    //    {
                    //        rdlCorrectiveAction1.Items[i].Selected = true;
                    //        break;
                    //    }
                    //}
                }
                else
                {
                    mode = "new";
                    SetPage();
                }
                
            }
        }


    }
    private void SetPageInEditMode(string type)
    {
        if (type == "new")
        {
            txtTemperature.Enabled = true;
            txtTemperature2.Enabled = true;
            txtTemperature3.Enabled = true;
            //txtThermometer.Enabled = true;
            ddlThermometerDevice.Enabled = true;
            txtVerifiedBy.Enabled = true;
            cldVerifiedDate.Enabled = true;
            cldMealDate.Enabled = true;
            cmdAdd.Visible = false;
            cmdCancel.Visible = true;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;

        }
        else if (type == "edit")
        {
            txtVerifiedBy.Enabled = false;
            txtTemperature.Enabled = false;
            txtTemperature2.Enabled = false;
            txtTemperature3.Enabled = false;
            //txtThermometer.Enabled = false;
            ddlThermometerDevice.Enabled = false;
            txtVerifiedBy.Enabled = false;
            cldVerifiedDate.Enabled = false;
            cldMealDate.Enabled = false;
            cmdAdd.Visible = false;
            cmdCancel.Visible = true;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = false;


        }
    }
    private void SetPage()
    {
        if (mode == "new")
        {
            SetPageInEditMode("new");
            if (Request.QueryString["date"] != null)
            {
                cldMealDate.SelectedDate = DateTime.Parse(Request.QueryString["date"].ToString());
            }
            else
            {
                cldMealDate.SelectedDate = DateTime.Today;
            }
            cldVerifiedDate.SelectedDate = DateTime.Today;
            //txtThermometer.Text = "";
            ddlThermometerDevice.SelectedIndex = 0;
            txtTemperature.Text = "";
            txtTemperature2.Text = "";
            GetInitialData();
           
            txtTemperature3.Text = "";
            //txtCorrectiveAction.Text = "";
           // rdlCorrectiveAction1.SelectedIndex = -1;
            //txtVerifiedBy.Text = Session["Initials"].ToString();
            txtVerifiedBy.Text = "";
            txtEntryDate.Text = DateTime.Now.ToString();
            cmdAdd.Visible = true;
            cmdCancel.Visible = true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;


        }
        if (mode == "edit")
        {
            SetPageInEditMode("edit");
        }
        grdHotHolding.DataBind();
       
       // rdlCorrectiveAction1.DataBind();
    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
        mode = "new";
        InsertData();
        SetPage();
        }
        else
        {
        }
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (this.IsValid == true)
        {
            mode = "new";
            SubmitData();
            SetPage();
        }
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        mode = "new";
        RemoveData();
        SetPage();
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        mode = "new";
        SetPage();

    }
    protected void cmdAddNew_Click(object sender, EventArgs e)
    {
        mode = "new";
        SetPage();
    }
    private void InsertData()
    {
        ThermoCalibrationLog thermoCalibrationLog = new ThermoCalibrationLog();
        thermoCalibrationLog.MealDate = cldMealDate.SelectedDate;
        int nWeekNumber = GetWeekNumber(cldMealDate.SelectedDate);
        if (txtTemperature.Text != "")
        {
            thermoCalibrationLog.Temperature = float.Parse(txtTemperature.Text);
        }
        if (txtTemperature2.Text != "")
        {
            thermoCalibrationLog.Temperature2 = float.Parse(txtTemperature2.Text);
        }
        if (txtTemperature3.Text != "")
        {
            thermoCalibrationLog.Temperature3 = float.Parse(txtTemperature3.Text);
        }
        //thermoCalibrationLog.Thermometer = txtThermometer.Text;
        thermoCalibrationLog.ThermometerID = int.Parse(ddlThermometerDevice.SelectedValue);
        
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    thermoCalibrationLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    thermoCalibrationLog.CorrectiveAction = null;
        //}
        thermoCalibrationLog.VerifiedBy = txtVerifiedBy.Text;
        thermoCalibrationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        thermoCalibrationLog.EntryDate =DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            thermoCalibrationLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            thermoCalibrationLog.UserName = (string)Session["UserName"];
        }
        //if (rdlCorrectiveAction1.SelectedIndex == -1)
        //{
        //    thermoCalibrationLog.CorrectiveAction1 = 0;
        //}
        //else
        //{
        //    thermoCalibrationLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        //}
        thermoCalibrationLog.Week = nWeekNumber;
        thermoCalibrationLog.MobileId = (int)Session["MobileId"];
        ProcessCreateThermoCalibrationLog createThermoCalibrationLog = new ProcessCreateThermoCalibrationLog();
        createThermoCalibrationLog.ThermoCalibrationLog = thermoCalibrationLog;
        createThermoCalibrationLog.Invoke();
        

    }
    private void SubmitData()
    {
        ThermoCalibrationLog thermoCalibrationLog = new ThermoCalibrationLog();
        if (Request.QueryString["Id"] != null)
        {
            thermoCalibrationLog.ThermoCalibrationLogId = int.Parse(Request.QueryString["Id"].ToString());
        }
        else
        {
            if (Session["ThermoCalibrationLogId"] != null)
            {
                thermoCalibrationLog.ThermoCalibrationLogId = (int)Session["ThermoCalibrationLogId"];
            }
        }

        thermoCalibrationLog.MealDate = cldMealDate.SelectedDate;
        int nWeekNumber = GetWeekNumber(cldMealDate.SelectedDate);
        if (txtTemperature.Text != "")
        {
            thermoCalibrationLog.Temperature = float.Parse(txtTemperature.Text);
        }
        if (txtTemperature2.Text != "")
        {
            thermoCalibrationLog.Temperature2 = float.Parse(txtTemperature2.Text);
        }
        if (txtTemperature3.Text != "")
        {
            thermoCalibrationLog.Temperature3 = float.Parse(txtTemperature3.Text);
        }
        //thermoCalibrationLog.Thermometer = txtThermometer.Text;
        thermoCalibrationLog.ThermometerID = int.Parse(ddlThermometerDevice.SelectedValue);
        //if (txtCorrectiveAction.Text.Trim() != "")
        //{
        //    thermoCalibrationLog.CorrectiveAction = txtCorrectiveAction.Text;
        //}
        //else
        //{
        //    thermoCalibrationLog.CorrectiveAction = null;
        //}
        thermoCalibrationLog.VerifiedBy = txtVerifiedBy.Text;
        thermoCalibrationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
        thermoCalibrationLog.EntryDate =DateTime.Parse(txtEntryDate.Text);
        if (Session["KitchenId"] != null)
        {
            thermoCalibrationLog.KitchenId = (int)Session["KitchenId"];
        }
        if (Session["UserName"] != null)
        {
            thermoCalibrationLog.UserName = (string)Session["UserName"];
        }
        //if (rdlCorrectiveAction1.SelectedIndex == -1)
        //{
        //    thermoCalibrationLog.CorrectiveAction1 = 0;
        //}
        //else
        //{
        //    thermoCalibrationLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
        //}
        thermoCalibrationLog.Week = nWeekNumber;
        thermoCalibrationLog.MobileId = (int)Session["MobileId"];
        ProcessSetThermoCalibrationLog setThermoCalibrationLog = new ProcessSetThermoCalibrationLog();
        setThermoCalibrationLog.ThermoCalibrationLog = thermoCalibrationLog;
        setThermoCalibrationLog.Invoke();


    }
    private void RemoveData()
    {
        ThermoCalibrationLog thermoCalibrationLog = new ThermoCalibrationLog();
        thermoCalibrationLog.ThermoCalibrationLogId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteThermoCalibrationLog removeThermoCalibrationLog = new ProcessDeleteThermoCalibrationLog();
        removeThermoCalibrationLog.ThermoCalibrationLog = thermoCalibrationLog;
        removeThermoCalibrationLog.Invoke();

    }
    protected void cmdAddNew_Click1(object sender, ImageClickEventArgs e)
    {
        mode = "new";
    }
    public int GetWeekNumber(DateTime dtPassed)
    {
        CultureInfo ciCurr = CultureInfo.CurrentCulture;
        int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
        return weekNum;
    }
}
