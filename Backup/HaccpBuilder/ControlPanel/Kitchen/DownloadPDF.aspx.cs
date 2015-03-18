using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
//using HtmToPdf;
using System.IO;

public partial class ControlPanel_Kitchen_DowloadPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    protected void PDFFiles_SelectedIndexChanged(object sender, EventArgs e)
    {

        bool result;
        if (ddlPDFFiles.SelectedValue == "1")
        {

            result = GenerateHaccpPlanPDF("ProceduralSteps");
            if (result == true)
            {
            //string strURL = "~/../../Kitchen/Data/ProceduralSteps" + (int)Session["KitchenId"] + ".pdf";// +;
            //
           /// RGK - 08-18-10
           /// TO OPEN FILE IN SAVE DILOG BOX
           /// ScriptManager.RegisterStartupScript(Page, GetType(), "openWindow", "openWindow('" + strURL + "')", true);
                string strURL = "~/ControlPanel/Kitchen/Data/ProceduralSteps" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=ProceduralSteps" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                
             // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
              //  Response.Write("<script type=text/javascript language=javascript>window.open('" + url + "','','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600');</script>");
            }
        }
        else if(ddlPDFFiles.SelectedValue == "2") 
        {
            result = GenerateHaccpPlanPDF("ProceduralQuestion");
              if (result == true)
              {
                 // string strURL = "~/../../Kitchen/Data/ProceduralQuestion" + (int)Session["KitchenId"] + ".pdf";
                  string strURL = "~/ControlPanel/Kitchen/Data/ProceduralQuestion" + (int)Session["KitchenId"] + ".pdf";
                  Response.ContentType = "Application/pdf";
                  Response.AppendHeader("Content-Disposition", "attachment; filename=ProceduralQuestion" + (int)Session["KitchenId"] + ".pdf");
                  Response.TransmitFile(Server.MapPath(strURL));
                  Response.End();
                  //Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
              }
        }
        else if (ddlPDFFiles.SelectedValue == "3")
        {
            result = GenerateHaccpPlanPDF("Vendors");
              if (result == true)
              {
                  //string strURL = "~/../../Kitchen/Data/Vendors" + (int)Session["KitchenId"] + ".pdf";
                  string strURL = "~/ControlPanel/Kitchen/Data/Vendors" + (int)Session["KitchenId"] + ".pdf";
                  Response.ContentType = "Application/pdf";
                  Response.AppendHeader("Content-Disposition", "attachment; filename=Vendors" + (int)Session["KitchenId"] + ".pdf");
                  Response.TransmitFile(Server.MapPath(strURL));
                  Response.End();
                  // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
              }
        }
        else if (ddlPDFFiles.SelectedValue == "4")
        {
            result = GenerateHaccpPlanPDF("Customers");
            if (result == true)
            {
                //string strURL = "~/../../Kitchen/Data/Customers" + (int)Session["KitchenId"] + ".pdf";
                string strURL = "~/ControlPanel/Kitchen/Data/Customers" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=Customers" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "5")
        {
            result = GenerateHaccpPlanPDF("InventoryItems");
            if (result == true)
            {
                //string strURL = "~/../../Kitchen/Data/InventoryItems" + (int)Session["KitchenId"] + ".pdf";
                string strURL = "~/ControlPanel/Kitchen/Data/InventoryItems" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=InventoryItems" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "6")
        {
            result = GenerateHaccpPlanPDF("I_BY_HAZARDS");
            if (result == true)
            {
                //string strURL = "~/../../Kitchen/Data/I_BY_HAZARDS" + (int)Session["KitchenId"] + ".pdf";
                string strURL = "~/ControlPanel/Kitchen/Data/I_BY_HAZARDS" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=I_BY_HAZARDS" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "7")
        {
            result = GenerateHaccpPlanPDF("I_BY_CCP_AND_CP");
            if (result == true)
            {
                //string strURL = "~/../../Kitchen/Data/I_BY_CCP_AND_CP" + (int)Session["KitchenId"] + ".pdf";
                string strURL = "~/ControlPanel/Kitchen/Data/I_BY_CCP_AND_CP" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=I_BY_CCP_AND_CP" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                // Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "8")
        {
            result = GenerateHaccpPlanPDF("ProductMenuItemsDetail_AllRecipes");
            if (result == true)
            {
                //string strURL = "~/../../Kitchen/Data/ProductMenuItemsDetail_AllRecipes" + (int)Session["KitchenId"] + ".pdf";
                string strURL = "~/ControlPanel/Kitchen/Data/ProductMenuItemsDetail_AllRecipes" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=ProductMenuItemsDetail_AllRecipes" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                //Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "9")
        {
            result = GenerateHaccpPlanPDF("Process");
            if (result == true)
            {

                string strURL = "~/ControlPanel/Kitchen/Data/Process" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=Process" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                //Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
        else if (ddlPDFFiles.SelectedValue == "10")
        {
            result = GenerateHaccpPlanPDF("SOPs");
            if (result == true)
            {

                string strURL = "~/ControlPanel/Kitchen/Data/SOPs" + (int)Session["KitchenId"] + ".pdf";
                Response.ContentType = "Application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=SOPs" + (int)Session["KitchenId"] + ".pdf");
                Response.TransmitFile(Server.MapPath(strURL));
                Response.End();
                //Response.Write("<script> window.open('" + url + "' ,'','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')</script>");
            }
        }
    }
    private bool GenerateHaccpPlanPDF(string HaccpPlan_FileName)
    {


        TextWriter ViewHaccpPlanData = new StringWriter();

        Boolean PDFCreated = false;
        Server.Execute("~/ControlPanel/Kitchen/ViewHaccpPlan/" + HaccpPlan_FileName + ".aspx", ViewHaccpPlanData);


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
        return PDFCreated;
     
    }
    protected void btnIngredient_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Ingredients.aspx");
    }
    protected void btnVendors_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Vendors.aspx");
    }
    protected void btnEditPlan_Click(object sender, EventArgs e)
    {
        // Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
        //Response.Redirect("~/ControlPanel/Kitchen/DailyParticipationHaccp.aspx");
        Response.Redirect("~/ControlPanel/Kitchen/ProceduralQuestion.aspx");
    }
    protected void btnMenuManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
    }
    protected void btnInventoryManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/InventoryItemManager.aspx");
    }
    protected void btnAlerts_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/LogAlerts.aspx");
    }
    protected void btnViewSop_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SOPList.aspx");
    }
    protected void btnInventoryManager_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    }
}
