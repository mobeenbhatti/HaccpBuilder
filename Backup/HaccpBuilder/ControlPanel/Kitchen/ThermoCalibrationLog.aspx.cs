using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
using System.Globalization;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class ThermoCalibrationLogNew : System.Web.UI.Page
    {
        public string mode = "new";
        public DateTime currentTime = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                
                currentTime = Utilities.GetTimeByZone(KitchenId);
                GetInitialData();
                if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
                {                   
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
            cldMealDate.SelectedDate = currentTime.Date;
            cldVerifiedDate.SelectedDate = currentTime.Date;
            txtEntryDate.Text = currentTime.ToString();
            string Info1 = "<b>No Record Found.</b>";
            string Info2 = "<b>No Record Found.</b>";
            string Info3 = "<b>No Record Found.</b>";
            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetKitchen getKitchen = new ProcessGetKitchen();
                DataSet dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId(KitchenId, 6);
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
            Info1 = "<br/><b> This is the temperature reading you get when you first use your reference standard(whether ice water or boiling).</b><br/>";
            Img_helpcoolingTemp1.Attributes.Add("onmouseover", "return overlib('" + Info1 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
            Img_helpcoolingTemp1.Attributes.Add("onmouseout", "return nd();");

            Info2 = "<br/><b> If the instrument is out of range, here is where you record the degree variance for the instrument.<br/>  This is recorded in tenths and is known as \"offset depression\"..</b><br/>";
            Img_helpcoolingTemp2.Attributes.Add("onmouseover", "return overlib('" + Info2 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
            Img_helpcoolingTemp2.Attributes.Add("onmouseout", "return nd();");

            Info3 = "<br/><b> This is where you record the temperature that matches your calibration standard.</b><br/>";
            Img_helpcoolingTemp3.Attributes.Add("onmouseover", "return overlib('" + Info3 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
            Img_helpcoolingTemp3.Attributes.Add("onmouseout", "return nd();");

        }       
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
                IDataReader logReader = getThermoCalibrationLog.ResultSet;
                if (logReader.Read())
                {
                    cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());                    
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
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
                    hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";                    
                }
            }
            else
            {
                if (Request.QueryString["date"] != null)
                {
                    ProcessGetThermoCalibrationLog getThermoCalibrationLog = new ProcessGetThermoCalibrationLog();
                    IDataReader logReader = getThermoCalibrationLog.GetThermoCalibrationLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), KitchenId);
                    if (logReader.Read())
                    {
                        Session["ThermoCalibrationLogId"] = int.Parse(logReader["Id"].ToString());
                        cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());                       
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
                        txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                        cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                        txtEntryDate.Text = logReader["EntryDate"].ToString();
                        hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";                        
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
                txtTemperature.Enabled = false;
                txtTemperature2.Enabled = false;
                txtTemperature3.Enabled = false;                
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
                    cldMealDate.SelectedDate = currentTime.Date;
                }
                cldVerifiedDate.SelectedDate = currentTime.Date;               
                ddlThermometerDevice.SelectedIndex = 0;
                txtTemperature.Text = "";
                txtTemperature2.Text = "";
                GetInitialData();

                txtTemperature3.Text = "";               
                txtVerifiedBy.Text = "";
                txtEntryDate.Text = currentTime.ToString();
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
            thermoCalibrationLog.ThermometerID = int.Parse(ddlThermometerDevice.SelectedValue);
            thermoCalibrationLog.VerifiedBy = txtVerifiedBy.Text;
            thermoCalibrationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            thermoCalibrationLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                thermoCalibrationLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                thermoCalibrationLog.UserName = (string)Session["UserName"];
            }           
            thermoCalibrationLog.Week = nWeekNumber;
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
            thermoCalibrationLog.ThermometerID = int.Parse(ddlThermometerDevice.SelectedValue);           
            thermoCalibrationLog.VerifiedBy = txtVerifiedBy.Text;
            thermoCalibrationLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            thermoCalibrationLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                thermoCalibrationLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                thermoCalibrationLog.UserName = (string)Session["UserName"];
            }
           
            thermoCalibrationLog.Week = nWeekNumber;
            thermoCalibrationLog.MobileId = int.Parse(hfMobileId.Value);
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
        protected void cmdAddNew_Click1(object sender, EventArgs e)
        {
            mode = "new";
        }
        public int GetWeekNumber(DateTime dtPassed)
        {
            CultureInfo ciCurr = CultureInfo.CurrentCulture;
            int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            return weekNum;
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