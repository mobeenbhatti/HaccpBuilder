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

public partial class ControlPanel_District_EditSOP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            
                //Get SOP from Database
                if (Request.QueryString["SOPId"] != null && Request.QueryString["GroupId"] != null)
                {
                    GetData();
                }
            
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
       switch (Request.QueryString["Mode"])
       {
           case "1":
               SaveSOP(1);
               break;
           case "2":
               SaveSOP(2);
               break;
           case "3":
               UpdateSOP();
               break;
       }
        string strGroupId = Request.QueryString["GroupId"];
        if (Request.QueryString["Review"] != null)
        {
            Response.Redirect("~/ControlPanel/District/SOPReview.aspx?GroupId=" + strGroupId);
        }
        else
        {
            Response.Redirect("~/ControlPanel/District/CustomSOP.aspx?GroupId=" + strGroupId);
        }
        
    }    
    private void GetData()
    {
        ProcessGetSOP getSOP = new ProcessGetSOP();
        IDataReader drSOP= getSOP.GetSOPById(int.Parse(Request.QueryString["SOPId"]));
        if (drSOP.Read())
        {     
            txtTitle.Text = drSOP["Title"].ToString();
            txtVerification.Text = drSOP["SOText"].ToString();
            lblCustomSOP.Text = drSOP["CustomSOP"].ToString();
            lblIsAdditional.Text = drSOP["IsAdditional"].ToString();
            lblRemoved.Text = drSOP["Removed"].ToString();
            drSOP.Close();
        }
        
        
    }
    private void SaveSOP(int nType)
    {
        SOP newSOP = new SOP();       
        newSOP.Custom = 1;       
        newSOP.KitchenGroupId = int.Parse(Request.QueryString["GroupId"]);
        
        if (Request.QueryString["SOPId"] != null)
        {
            newSOP.KitchenSOPId = int.Parse(Request.QueryString["SOPId"]);
        }       
        newSOP.SOPTitle = txtTitle.Text;
        newSOP.SOPText = txtCorrective1.Text;        
        if (nType == 2)        
        {
            newSOP.Additional = 1;
        }
        newSOP.Removed = 0;
       

        ProcessCreateSOP createSOP = new ProcessCreateSOP();
        createSOP.SOP = newSOP;
        createSOP.Invoke();        

    }    
    private void UpdateSOP()
    {
        SOP newSOP = new SOP();

        
        if (lblCustomSOP.Text != "")
        {
            newSOP.Custom = int.Parse(lblCustomSOP.Text);
        }
        else
        {
            newSOP.Custom = 0;
        }

       
        newSOP.KitchenGroupId = int.Parse(Request.QueryString["GroupId"]);
      
        if (Request.QueryString["SOPId"] != null)
        {
            newSOP.KitchenSOPId = int.Parse(Request.QueryString["SOPId"]);
        }        
        newSOP.SOPTitle = txtTitle.Text;
        newSOP.SOPText = txtTitle.Text;
       
        if (lblIsAdditional.Text != "")
        {
            newSOP.Additional = int.Parse(lblIsAdditional.Text);
        }
        else
        {
            newSOP.Additional = 0;
        }
        if (lblRemoved.Text != "")
        {
            newSOP.Removed = int.Parse(lblRemoved.Text);
        }        
        ProcessSetSOP setSOP = new ProcessSetSOP();
        setSOP.SOP = newSOP;
        setSOP.Invoke();
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        string strGroupId = Request.QueryString["GroupId"];
        if (Request.QueryString["Review"] != null)
        {
            Response.Redirect("~/ControlPanel/District/SOPReview.aspx?GroupId=" + strGroupId);
        }
        else
        {
            Response.Redirect("~/ControlPanel/District/CustomSOP.aspx?GroupId=" + strGroupId);
        }
    }
}
