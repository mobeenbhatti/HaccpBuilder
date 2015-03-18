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

public partial class ControlPanel_District_EditSOPIE1 : System.Web.UI.Page
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
            if (Request.QueryString["GroupId"] != null)
            {
                if (Request.QueryString["Review"] != null)
                {
                    // Response.Redirect();

                    hlCancel1.NavigateUrl = "~/ControlPanel/District/SOPReview.aspx?GroupId=" + Request.QueryString["GroupId"];
                }
                else
                {
                    //Response.Redirect("?GroupId=" + strGroupId);
                    hlCancel1.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"];
                }
            }
        }
        
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
    bool result = true;
       switch (Request.QueryString["Mode"])
       {
           case "1":
            result = SaveSOP(1);
               break;
           case "2":
               result = SaveSOP(2);
               break;
           case "3":
              result =  UpdateSOP();
               break;
       }
         string strGroupId = Request.QueryString["GroupId"];
         if (result == true)
         {

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
    private void GetData()
    {
        ProcessGetSOP getSOP = new ProcessGetSOP();
        IDataReader drSOP= getSOP.GetSOPById(int.Parse(Request.QueryString["SOPId"]));
        if (drSOP.Read())
        {
           
           
            txtTitle.Text = drSOP["Title"].ToString();
            txtSOP.Value = drSOP["SopText"].ToString();
            lblCustomSOP.Text = drSOP["CustomSOP"].ToString();
            lblIsAdditional.Text = drSOP["IsAdditional"].ToString();
            lblRemoved.Text = drSOP["Removed"].ToString();
            hfGroupId.Value = drSOP["KitchenGroupId"].ToString();
            drSOP.Close();
        }
        if (drSOP.IsClosed == false)
        {
            drSOP.Close();
        }
        
    }
    private bool CheckData(int nmode)
    {
        bool RecordExist = false;
        if (nmode == 1)
        {
            ProcessGetSOP SOP = new ProcessGetSOP();
            DataSet dsSOP = SOP.GetSOPByTitle(txtTitle.Text.Trim(), int.Parse(Request.QueryString["GroupId"]));
            if (dsSOP.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "SOP Title already exists.";
                lblInfo.Visible = true;
                RecordExist = false;
            }
            else
            {
                RecordExist = true;
            }
        }

        if (nmode == 2)
        {
            ProcessGetSOP SOP = new ProcessGetSOP();
            DataSet dsSOP = SOP.GetSOPByTitleAndId(txtTitle.Text, int.Parse(Request.QueryString["SOPId"]), int.Parse(hfGroupId.Value));
            if (dsSOP.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "SOP Title already exists.";
                lblInfo.Visible = true;
                RecordExist = false;
            }
            else
            {
                RecordExist = true;
            }

        }
        return RecordExist;



    }
    private bool SaveSOP(int nType)
    {
         bool status = CheckData(1);
        if (status == true)
        {
            SOP newSOP = new SOP();
            newSOP.Custom = 1;
            newSOP.KitchenGroupId = int.Parse(Request.QueryString["GroupId"]);

            if (Request.QueryString["SOPId"] != null)
            {
                newSOP.KitchenSOPId = int.Parse(Request.QueryString["SOPId"]);
            }
            newSOP.SOPTitle = txtTitle.Text;
            //newSOP.SOPText = "<table width='650' cellspacing='4' cellpadding='4' border='0'><tbody>" + txtSOP.Value + "</tbody></table>";
            newSOP.SOPText = txtSOP.Value;
            if (nType == 2)
            {
                newSOP.Additional = 1;
            }
            newSOP.Removed = 0;


            ProcessCreateSOP createSOP = new ProcessCreateSOP();
            createSOP.SOP = newSOP;
            createSOP.Invoke();        

        }
        return status;
    }    
    private bool UpdateSOP()
    {
         bool status = CheckData(2);
        if (status == true)
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
            newSOP.SOPText = txtSOP.Value;
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
        return status;
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
