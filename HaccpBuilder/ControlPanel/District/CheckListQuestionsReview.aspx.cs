using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataModel;
namespace HaccpBuilder.ControlPanel.District
{
    public partial class CheckListQuestionsReview : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["SectionId"] != null)
            {
                ddlChecklistSection.DataBind();
                ddlChecklistSection.SelectedValue = Request.QueryString["SectionId"];               
               
                GetData();
            }
            if (Request.QueryString["Review"] != null)
            {
                cmdBack.Visible = true;
            }
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {            
            Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");            
        }
        protected void ddlChecklistSection_SelectedIndexChanged(object sender, EventArgs e)
        {
           // lblSectionName.Text = ddlChecklistSection.SelectedItem.Text;           
        }
        protected void cmdBack_Click1(object sender, EventArgs e)
        {
            string strSectionId;           
            if (Request.QueryString["SectionId"] != null)
            {
                strSectionId = Request.QueryString["SectionId"];
            }
            else
            {
                strSectionId = ddlChecklistSection.SelectedValue;
            }
            Response.Redirect("~/ControlPanel/District/CustomQuestion.aspx?SectionId=" + strSectionId);
        }
        private void GetData()
        {
            int nSectionId = int.Parse(ddlChecklistSection.SelectedValue);
            List<CheckListQuestion> details = (from dt in context.CheckListQuestions
                                               where dt.CheckListSectionId == nSectionId && dt.Deleted == 0
                                               orderby dt.SortOrder
                                               select dt).ToList();

            grdQuestion.DataSource = details;
            grdQuestion.DataBind();

        }
    }
}