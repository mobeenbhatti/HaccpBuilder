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

using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_Kitchen_Hazards : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["FoodId"] != null)
            {
                ProcessGetHazard getHazard = new ProcessGetHazard();
                IDataReader drHazard = getHazard.GetHazardByFoodCategoryId(int.Parse(Request.QueryString["FoodId"]));
                if (drHazard.Read())
                {
                    lblFoodCategory.Text = drHazard["Name"].ToString();
                    lblHazard.Text = drHazard["Hazard"].ToString();
                    drHazard.Close();
                }
                if (drHazard.IsClosed == false)
                {
                    drHazard.Close();
                }
            }
        }
    }
}
