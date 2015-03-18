using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class PlanIndexPrintLogs : System.Web.UI.Page
    {
        protected string pgTitle = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Log"] != null)
        {
            string strTask = Request.QueryString["Log"].ToString();
            DataSet dsCorrectiveAction;
            ProcessGetKitchenCorrectiveAction getCorrectiveActions = new ProcessGetKitchenCorrectiveAction();
            switch (strTask.ToUpper().Trim())
            {
                case "CLEANING AND SANITIZATION LOG":
                    imgLog.ImageUrl="~/images/LogsImages/CleaningLog.png";
                    lblLog.InnerText = "CLEANING AND SANITIZATION LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 12);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "CLEANING AND SANITIZATION LOG";
                    break;
                case "TEMPERATURE LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/TemperatureLog.gif";
                    lblLog.InnerText = "TEMPERATURE LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 6);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle="TEMPERATURE LOG";
                    break;
                case "HOT HOLDING LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/HotHoldingLog.gif";
                    lblLog.InnerText = "HOT HOLDING LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 3);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "HOT HOLDING LOG";
                    break;
                case "COLD HOLDING LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/ColdHoldingLog.gif";
                    lblLog.InnerText = "COLD HOLDING LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 1);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "COLD HOLDING LOG";
                    break;
                case "FREEZER LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/FreezerLog.gif";
                    lblLog.InnerText = "FREEZER LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 7);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "FREEZER LOG";
                    break;
                case "MAINTENANCE LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/MaintenanceLog.gif";
                    lblLog.InnerText = "MAINTENANCE LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 11);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "MAINTENANCE LOG";
                    break;
                case "PH LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/PhLog.png";
                    lblLog.InnerText = "PH LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 9);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "PH LOG";
                    break;
                case "PEST CONTROL LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/PestLog.gif";
                    lblLog.InnerText = "PEST CONTROL LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 10);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "PEST CONTROL LOG";
                    break;
                case "SHIPPING LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/ShippingLog.gif";
                    lblLog.InnerText = "SHIPPING LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 8);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "SHIPPING LOG";
                    break;
                case "RECEIVING LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/ReceivingLog.png";
                    lblLog.InnerText = "RECEIVING LOG";
                    dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 4);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "RECEIVING LOG";
                    break;
                case "COOLING TEMPERATURE LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/CoolingLog.gif";
                    lblLog.InnerText = "COOLING TEMPERATURE LOG";
                     dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 2);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "COOLING TEMPERATURE LOG";
                    break;
                case "REFRIGERATION LOG":
                    imgLog.ImageUrl = "~/images/LogsImages/RefrigrationLog.gif";
                    lblLog.InnerText = "REFRIGERATION LOG";
                     dsCorrectiveAction = getCorrectiveActions.GetKitchenCorrectiveActionByStatusId(KitchenId, 5);
                    rptCorrectiveAction.DataSource = dsCorrectiveAction;
                    pgTitle = "REFRIGERATION LOG";
                    break;
                case "FOOD SAFETY CHECK LIST":
                    Response.Redirect("~/ControlPanel/Kitchen/FoodSafetyChecklistPrint.aspx");
                    break;

                case "THERMOMETER CALIBRATION":
                    imgLog.ImageUrl = "~/images/LogsImages/ThermoCalibrationLog.gif";
                    lblLog.InnerText = "THERMOMETER CALIBRATION";
                    pgTitle = "THERMOMETER LOG";
                    break;
                case "VALIDATION CHECKLIST":
                    Response.Redirect("~/ControlPanel/Kitchen/ValidationPrint.aspx");
                    break;

            }
            rptCorrectiveAction.DataBind();
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
    