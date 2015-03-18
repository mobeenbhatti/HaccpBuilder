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
using System.Net.Mail;
using System.Net;

using SchoolHaccp.Operational;
using SchoolHaccp.BusinessLogic;


public partial class ControlPanel_District_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //if (!this.IsPostBack)
        //{
        //    if (Session["TypeId"] != null)
        //    {
        //        if ((int)Session["TypeId"] == 3)
        //        {
        //            btnCopyKitchen.Enabled = false;
        //            btnReports.Enabled = false;
        //        }
        //    }
        //}

    }
    protected void btnCreateCustomSOP_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomSOP.aspx");
    }
    protected void btnCreateKitchen_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/Redirect.aspx");
    }
    protected void btnCreateSOPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/SOPGroup.aspx");
    }
    private void SendMessage()
    {
        string strBody = "<br/> Hello,<br/> You are receiving this email from the SchoolHaccp.com. Your District Food <br/> Services Director has registered your kitchen in the School HACCP HACCP <br/> Builder System.<br/> <br/> HACCP Builder makes it easy to build your HACCP Plan and keep your kitchen <br/> in compliance with the USDA. Please enter the site with your sign in <br/> information below. You will be asked to change your sign in information to <br/> something you can easily remember. If you have any questions please email <br/> webmaster@schoolhaccp.com for assistance. Again, this should be a quick and <br/> easy process and you will be able to build your plan in as little as 30  <br/> minutes.<br/> <br/> Please have your complete kitchen inventory and your meal plan on hand <br/> before you start to construct your HACCP Plan.<br/> <br/> Login at : http://www.schoolhaccp.com/controlpanel/Login.php <br/>Your username is: UID9556354Z3d <br/>Your password is: 1342244";
        EmailContents contents = new EmailContents();
        contents.Body = strBody;
        contents.Subject = "HACCP Builder is now set-up for your kitchen. Please use this information to sign in.";
        EmailManager emailManager = new EmailManager();
        try
        {
            emailManager.SendUserInfo(contents);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        if (emailManager.IsSent)
        {
            Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
        }

    }    
     protected void cmdSearch_Click(object sender, EventArgs e)
     {
         //ProcessGetKitchen kitchen = new ProcessGetKitchen();
         //DataSet dsKitchenDetails = kitchen.GetKitchensByDistrictId((int)Session["DistrictId"], txtKitchen.Text);
         //grdKitchenDetails.Visible = false;
         //grdSearchKitchen.Visible = true;
         //grdSearchKitchen.DataSource = dsKitchenDetails;
         //grdSearchKitchen.DataBind();
     }
     protected void btnAddKitchenSOP_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
         //Response.Redirect("~/ControlPanel/District/MYSQLConnect.aspx");
     }
     protected void btnCreateChecklistGroup_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CheckListGroup.aspx");
     }
     protected void btnAddKitchenChecklist_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/KitchenChecklist.aspx");
     }
     protected void btnCreateQuestion_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CustomQuestion.aspx");
     }
     protected void btnCopyKitchen_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CopyKitchen.aspx");
     }
     protected void btnReports_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/DistrictReports.aspx");
     }
     protected void btnSOPReview_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/SOPReview.aspx");
     }
     protected void btnChecklistReview_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/QuestionsReview.aspx");
     }
     protected void btnCreateValidationGroup_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/ValidationGroup.aspx");
     }
     protected void btnaddKitchenValidation_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/KitchenValidation.aspx");
     }
     protected void btnCreateValidationQuestion_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx");
     }
     protected void btnValidationReview_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/ValidationQuestionReview.aspx");
     }
     protected void btnCreateCCPGroup_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CCPGroup.aspx");
     }
     protected void btnAddKitchenCCP_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/KitchenCCP.aspx");
     }
     protected void btnCreateCustomCCP_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CustomCCP.aspx");
     }
     protected void btnCCPReview_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CCPReview.aspx");
     }
     protected void btnCreateFoodCategoryGroup_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/FoodCategoryGroup.aspx");
     }
     protected void btnCreateFoodCategory_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx");
     }
     protected void btnFoodCategoreyReview_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/FoodCategoryReview.aspx");
     }
     protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
     {
         Response.Redirect("~/ControlPanel/District/ViewKitchen.aspx");
     }
}
