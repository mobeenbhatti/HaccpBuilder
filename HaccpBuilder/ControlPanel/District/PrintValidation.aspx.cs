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

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_PrintValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["date"] != null)
            {
                IDataReader drValidationHistory;
                ValidationHistory history = new ValidationHistory();
                ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();
                drValidationHistory = getHistory.GetHistoryByEntrydate((int)Session["KitchenId"], DateTime.Parse(Request.QueryString["date"]));
                if (drValidationHistory.Read())
                {

                    lblFrequency.Text = drValidationHistory["Frequency"].ToString();                    
                    lblResponsiblePerson.Text = drValidationHistory["ResponsiblePerson"].ToString();                     
                    lblTimePeriod.Text = drValidationHistory["TimePeriod"].ToString();
                    lblTitle.Text = drValidationHistory["Title"].ToString();
                    lblManagerValidationDate.Text = DateTime.Parse(drValidationHistory["ValidationDueDate"].ToString()).ToShortDateString();
                    lblLastDate.Text = DateTime.Parse(drValidationHistory["ValidationLastDate"].ToString()).ToShortDateString();
                    lblVerifiedBy.Text = drValidationHistory["VerifiedBy"].ToString();
                    lblManagerTitle.Text = drValidationHistory["ManagerTitle"].ToString();
                    lblReason.Text = drValidationHistory["Reason"].ToString();
                    Session["HistoryId"] = int.Parse(drValidationHistory["ValidationHistoryId"].ToString());
                    drValidationHistory.Close();
                }
                if (drValidationHistory.IsClosed == false)
                {
                    drValidationHistory.Close();
                }
            }
        }
    }
}
