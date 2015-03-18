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
//using HtmToPdf;
using System.IO;

public partial class ControlPanel_District_DistrictReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void grdKitchenDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Plan")
        {
            txtUserName.Text = e.CommandArgument.ToString();
            //Session["KitchenId"];
        }
        if (e.CommandName == "View Plan")
        {
            Response.Redirect("~/ControlPanel/District/DownloadPDF.aspx?KitchenId=" + e.CommandArgument.ToString());
            //GenerateHaccpPlanPDF("ViewHaccpPlanNew", e.CommandArgument.ToString());
        }


    }
    //private void GenerateHaccpPlanPDF(string HaccpPlan_FileName, string kitchenid)
    //{



    //    TextWriter ViewHaccpPlanData = new StringWriter();

    //    Boolean PDFCreated = false;
    //    Server.Execute("~/ControlPanel/District/" + HaccpPlan_FileName + ".aspx?KitchenId=" + kitchenid, ViewHaccpPlanData);


    //    string PDFFile = @Server.MapPath("~/ControlPanel/District/Data/" + HaccpPlan_FileName + kitchenid + ".pdf");


    //    string PDFUrl = @Server.MapPath("~/ControlPanel/District/Data/" + HaccpPlan_FileName + kitchenid + ".htm");

    //    StreamWriter ViewHaccpPlan;
    //    //string HTMFile = @Server.MapPath("~/ControlPanel/Kitchen/Data/ViewHaccpPlan.htm");

    //    if (System.IO.File.Exists(PDFUrl))
    //    {
    //        System.IO.File.Delete(PDFUrl);
    //        ViewHaccpPlan = System.IO.File.CreateText(PDFUrl);
    //    }
    //    else
    //    {
    //        ViewHaccpPlan = System.IO.File.CreateText(PDFUrl);
    //    }

    //    ViewHaccpPlan.Write(ViewHaccpPlanData);
    //    ViewHaccpPlan.AutoFlush = true;
    //    ViewHaccpPlan.Close();

    //    try
    //    {
    //        HtmToPdf.Convert.CreatePDFFile(PDFUrl, PDFFile);
    //        PDFCreated = true;
    //    }
    //    catch (Exception exx)
    //    {
    //        PDFCreated = false;
    //    }

    //    File.Delete(PDFUrl);

    //    if (PDFCreated)
    //    {
           
    //        Response.Redirect("~/ControlPanel/District/Data/" + HaccpPlan_FileName + kitchenid + ".pdf");


    //    }

    //}
}
