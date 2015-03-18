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

public partial class ControlPanel_District_Redirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //1- Command Central 
        //2- HBFlex With Reporting 
        //3- HBFlex Without Reporting
        //4- Haccp + C-Tpat
        //5- C-Tpat
        ProcessGetKitchen getKitchen = new ProcessGetKitchen();
        IDataReader drKitchen = getKitchen.GetKitchenLimitByDistrictId((int)Session["DistrictId"]);
        drKitchen.Read();
        if (Convert.ToInt32(drKitchen["TotalKitchen"].ToString()) < Convert.ToInt32(drKitchen["AllowedKitchen"].ToString()))
        {
            if (Request.QueryString["Mode"] == "1")
            {
                Response.Redirect("~/ControlPanel/District/CopyKitchen.aspx");
            }
            else
            {
                if (TypeId == 3)
                {
                    Response.Redirect("~/ControlPanel/District/CreateHBFlex.aspx");

                }
                if (TypeId == 2)
                {

                    Response.Redirect("~/ControlPanel/District/CreateHBFlexR.aspx");
                    //  Response.Redirect("~/ControlPanel/District/CreateKitchen.aspx");
                }
                if (TypeId == (int)DistrictTypeEnum.HaccpBuilder || TypeId == (int)DistrictTypeEnum.HaccpCtpat || TypeId == (int)DistrictTypeEnum.Ctpat)
                {
                    // Command Central Corporate
                    Response.Redirect("~/ControlPanel/District/CreateKitchen.aspx");
                }
            }
        }
        else
        {
            Response.Redirect("~/ControlPanel/District/ErrorPage.aspx?limit=1");
        }

        drKitchen.Close();
    }
        
    
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
