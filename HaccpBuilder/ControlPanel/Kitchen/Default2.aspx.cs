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
//using HtmToPdf;
using System.IO;




public partial class ControlPanel_Kitchen_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["task"] != null)
        {
            string strTask = Request.QueryString["task"].ToString();
            switch (strTask.ToUpper().Trim())
            {
                case "CLEANING AND SANITIZATION LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/CleaningLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/CleaningLog.aspx");
                    }
                    break;
                case "TEMPERATURE LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/TemperatureLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }            
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/TemperatureLog.aspx");
                    }
                    break;
                case "END POINT TEMPERATURE LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/TemperatureLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }            
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/TemperatureLog.aspx");
                    }
                    break;
                case "HOT HOLDING LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/HotHoldingLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/HotHoldingLog.aspx");
                    }
                    break;
                case "COLD HOLDING LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ColdHoldingLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ColdHoldingLog.aspx");
                    }
                    break;
                case "FREEZER LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/FreezerNewLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/FreezerNewLog.aspx");
                    }
                    break;
                case "MAINTENANCE LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/MaintenanceLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/MaintenanceLog.aspx");
                    }
                    break;
                case "PH LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/PhLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/PhLog.aspx");
                    }
                    break;
                case "PEST CONTROL LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/PestLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/PestLog.aspx");
                    }
                    break;
                case "SHIPPING LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ShippingLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ShippingLog.aspx");
                    }
                    break;
                case "RECEIVING LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/RecieivingLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ReceivingLog.aspx");
                    }
                    break;
                case "COOLING TEMPERATURE LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/FreezerLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/FreezerLog.aspx");
                    }
                    break;
                case "REFRIGERATION LOG":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/RefrigerationLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/RefrigerationLog.aspx");
                    }
                    break;
                case "FOOD SAFETY CHECK LIST":
                    if (Request.QueryString["date"] != null)
                    {
                        int week = GetWeekNumber(DateTime.Parse(Request.QueryString["date"].ToString()));
                        //int week = WeekNumber_Entire4DayWeekRule(DateTime.Parse(Request.QueryString["date"].ToString()));
                        int year = DateTime.Parse(Request.QueryString["date"].ToString()).Year;
                        int nHistoryId = 0 ;
                        if(Request.QueryString["HistoryId"] != null)
                        nHistoryId = int.Parse(Request.QueryString["HistoryId"]);
                        if (Request.QueryString["Print"] != null)
                        {
                            Response.Redirect("~/ControlPanel/Kitchen/PrintChecklist.aspx?Week=" + week.ToString() + "&Date=" + Request.QueryString["date"] + "&year=" + year.ToString() + "&HistoryId=" + nHistoryId.ToString());
                        }
                        else
                        {

                            Response.Redirect("~/ControlPanel/Kitchen/FoodSafetyChecklist.aspx?week=" + week.ToString() + "&year=" + year.ToString() + "&Date=" + Request.QueryString["date"].ToString());
                            //Response.Redirect("~/ControlPanel/Kitchen/Datalist.aspx?week=" + week.ToString());

                        }
                        break;
                    }
                    else
                    {
                        int week = GetWeekNumber(DateTime.Today);
                        //int week = WeekNumber_Entire4DayWeekRule(DateTime.Today);
                        Response.Redirect("~/ControlPanel/Kitchen/FoodSafetyChecklist.aspx?week=" + week.ToString() + "&Date=" + DateTime.Today.ToShortDateString());
                    }
                    break;

                case "THERMOMETER CALIBRATION":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ThermoCalibrationLog.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ThermoCalibrationLog.aspx");
                    }
                    break;
                case "VALIDATION CHECKLIST":
                    if (Request.QueryString["date"] != null)
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ValidationChecklist.aspx?date=" + Request.QueryString["date"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/ControlPanel/Kitchen/ValidationChecklist.aspx?date=" + DateTime.Today.ToShortDateString());
                    }
                    break;

            }

        }
        ///  NEW CHANGE FOR ENABLING VIEW HACCP PLAN 07-10-09

        //if (Request.QueryString["PrintPlan"] != null || Request.QueryString["ViewPlan"] != null)
        //{
        //    ProcessGetDistrict district = new ProcessGetDistrict();
        //    if (district.IsPrintingAllowed((int)Session["KitchenId"]))
        //    {
        //        if (Request.QueryString["PrintPlan"] != null)
        //        { Response.Redirect("~/ControlPanel/Kitchen/PrintHaccpPlanSOP.aspx"); }
        //        else
        //        //{ Response.Redirect("~/ControlPanel/Kitchen/ViewHaccpBuilderPlan.aspx"); }
        //        { Response.Redirect("~/ControlPanel/Kitchen/ViewHaccpPlanNew.aspx"); }

        //    }
        //    else
        //    {
        //        Response.Redirect("~/ControlPanel/Kitchen/PrintError.aspx"); 
        //    }
        //}

        if (Request.QueryString["PrintPlan"] != null)
        {
            ProcessGetDistrict district = new ProcessGetDistrict();
            if (district.IsPrintingAllowed((int)Session["KitchenId"]))
            {
                Response.Redirect("~/ControlPanel/Kitchen/HaccpPlanNew.aspx");
             //   Response.Redirect("~/ControlPanel/Kitchen/PrintHaccpPlanSOP.aspx");
               //// GenerateHaccpPlanPDF("ViewHaccpPlanNew");
            }
            else
            {
                Response.Redirect("~/ControlPanel/Kitchen/PrintError.aspx");
            }
        }

        if (Request.QueryString["ViewPlan"] != null)
        {
     
            //GenerateHaccpPlanPDF("ViewHaccpPlanNew");
            Response.Redirect("~/ControlPanel/Kitchen/HaccpPlanNew.aspx");
        }


    }
    private void GenerateHaccpPlanPDF()
    {


        string HaccpPlan_FileName = "ViewHaccpPlanNew";
        TextWriter ViewHaccpPlanData = new StringWriter();

        Boolean PDFCreated = false;
        Server.Execute("~/ControlPanel/Kitchen/" + HaccpPlan_FileName + ".aspx", ViewHaccpPlanData);


        string PDFFile = @Server.MapPath("~/ControlPanel/Kitchen/Data/" + HaccpPlan_FileName + (int)Session["KitchenId"] + ".pdf");


        string PDFUrl = @Server.MapPath("~/ControlPanel/Kitchen/Data/" + HaccpPlan_FileName + (int)Session["KitchenId"] + ".htm");

        StreamWriter ViewHaccpPlan;
        //string HTMFile = @Server.MapPath("~/ControlPanel/Kitchen/Data/ViewHaccpPlan.htm");

        if (System.IO.File.Exists(PDFUrl))
        {
            System.IO.File.Delete(PDFUrl);
            ViewHaccpPlan = System.IO.File.CreateText(PDFUrl);
        }
        else
        {
            ViewHaccpPlan = System.IO.File.CreateText(PDFUrl);
        }

        ViewHaccpPlan.Write(ViewHaccpPlanData);
        ViewHaccpPlan.AutoFlush = true;
        ViewHaccpPlan.Close();

        try
        {
            //HtmToPdf.Convert.CreatePDFFile(PDFUrl, PDFFile);
            PDFCreated = true;
        }
        catch (Exception exx)
        {
            PDFCreated = false;
        }

        File.Delete(PDFUrl);

        //if (PDFCreated)
        //{

        //    Response.Redirect("~/ControlPanel/Kitchen/Data/" + HaccpPlan_FileName + (int)Session["KitchenId"] + ".pdf");


        //}

    }
    public int GetWeekNumber(DateTime dtPassed)
    {
        CultureInfo ciCurr = CultureInfo.CurrentCulture;
        int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
        return weekNum;
    }
    private int WeekNumber_Entire4DayWeekRule(DateTime date)
    {

        const int JAN = 1;
        const int DEC = 12;
        const int LASTDAYOFDEC = 31;
        const int FIRSTDAYOFJAN = 1;
        const int THURSDAY = 4;
        bool ThursdayFlag = false;

        int DayOfYear = date.DayOfYear;

        int StartWeekDayOfYear =
        (int)(new DateTime(date.Year, JAN, FIRSTDAYOFJAN)).DayOfWeek;
        int EndWeekDayOfYear =
        (int)(new DateTime(date.Year, DEC, LASTDAYOFDEC)).DayOfWeek;

        //StartWeekDayOfYear = StartWeekDayOfYear;
        //EndWeekDayOfYear = EndWeekDayOfYear;
        if (StartWeekDayOfYear == 0)
            StartWeekDayOfYear = 7;
        if (EndWeekDayOfYear == 0)
            EndWeekDayOfYear = 7;

        int DaysInFirstWeek = 8 - (StartWeekDayOfYear);
        int DaysInLastWeek = 8 - (EndWeekDayOfYear);

        if (StartWeekDayOfYear == THURSDAY || EndWeekDayOfYear == THURSDAY)
            ThursdayFlag = true;

        int FullWeeks = (int)Math.Ceiling((DayOfYear - (DaysInFirstWeek)) / 7.0);

        int WeekNumber = FullWeeks;

        if (DaysInFirstWeek >= THURSDAY)
            WeekNumber = WeekNumber + 1;

        if (WeekNumber > 52 && !ThursdayFlag)
            WeekNumber = 1;

        if (WeekNumber == 0)
            WeekNumber = WeekNumber_Entire4DayWeekRule(
            new DateTime(date.Year - 1, DEC, LASTDAYOFDEC));
        return WeekNumber;
    }
}
