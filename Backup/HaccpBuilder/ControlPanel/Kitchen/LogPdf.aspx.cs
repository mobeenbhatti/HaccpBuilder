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

public partial class ControlPanel_Kitchen_LogPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["task"] != null)
        {
            string strTask = Request.QueryString["task"].ToString();
            switch (strTask.ToUpper().Trim())
            {
                case "TEMPERATURE LOG":
                    Response.Redirect("~/StaticContent/Files/Cook_&_heat_Temp_log.pdf");
                    break;
                case "HOT HOLDING LOG":
                    Response.Redirect("~/StaticContent/Files/Hot Holding Log.pdf");
                    break;
                case "COLD HOLDING LOG":
                    Response.Redirect("~/StaticContent/Files/Cold Holding Log.pdf");
                    break;
                case "RECEIVING LOG":
                    Response.Redirect("~/StaticContent/Files/Receiving_log.pdf");
                    break;
                case "COOLING TEMPERATURE LOG":
                    Response.Redirect("~/StaticContent/Files/Cooling_temp_log.pdf");
                    break;
                case "REFRIGERATION LOG":
                    Response.Redirect("~/StaticContent/Files/Refrigeration_log.pdf");
                    break;
                case "SHIPPING LOG":
                    Response.Redirect("~/StaticContent/Files/Shipping Log.pdf");
                    break;
                case "FREEZER LOG":
                    Response.Redirect("~/StaticContent/Files/Freezer Log.pdf");
                    break;

                //case "FOOD SAFETY CHECK LIST":
                    
                //    break;

                case "THERMOMETER CALIBRATION":
                    Response.Redirect("~/StaticContent/Files/Thermometer Calibration Log PDF.pdf");
                    break;

            }

        }
        else
        {
        }

    }
}
