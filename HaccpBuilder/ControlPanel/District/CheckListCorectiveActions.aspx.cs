using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataModel;
namespace HaccpBuilder.ControlPanel.District
{
    public partial class CheckListQuestionCorrectiveActions : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {                
                if (Request.QueryString["CheckListId"] != null)
                {                    
                    GetData();
                }
            }
        }
        protected void grdCorrectiveAction_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int nCorrectiveActionId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditQuestion")
            {               
                CheckListCorrectiveAction ca = (from ad in context.CheckListCorrectiveActions
                                                where ad.CorrectiveActionId == nCorrectiveActionId
                                             select ad).FirstOrDefault();
                hfCorrectiveActionId.Value = e.CommandArgument.ToString();
                FillForm(ca);
                ModalPopupExtender1.PopupControlID = "divPopup";
                ModalPopupExtender1.Show();

            }

        }

        #region Methods

        private void GetData()
        {

            List<CheckListCorrectiveAction> details = (from dt in context.CheckListCorrectiveActions
                                                       where dt.CheckListQuestionId == CheckListId
                                                       select dt).ToList();

            grdCorrectiveAction.DataSource = details;
            grdCorrectiveAction.DataBind();

        }
        private void InsertItem()
        {

            CheckListCorrectiveAction ca = new CheckListCorrectiveAction();
            GetFormValues(ca);           
            context.CheckListCorrectiveActions.AddObject(ca);
            context.SaveChanges();

        }
        private void GetFormValues(CheckListCorrectiveAction ca)
        {
            ca.CorrectiveAction = txtCorrectiveAction.Text;            
            ca.Active = chkActive.Checked == true ? 1 : 0;           
            // question.ChecklistQuestionId = int.Parse(hfQuestionId.Value);
        }



        private void FillForm(CheckListCorrectiveAction ca)
        {
            txtCorrectiveAction.Text = ca.CorrectiveAction;           
            chkActive.Checked = ca.Active == 1 ? true : false;
            hfCorrectiveActionId.Value = ca.CorrectiveActionId.ToString();

        }
        private void UpdateItem(int nCorrectiveActionId)
        {
            CheckListCorrectiveAction ca = (from ad in context.CheckListCorrectiveActions
                                            where ad.CorrectiveActionId == nCorrectiveActionId
                                          select ad).FirstOrDefault();
            GetFormValues(ca);
            context.SaveChanges();
        }
        private void DeleteItem(int nCorrectiveActionId)
        {
            CheckListCorrectiveAction ca = (from ad in context.CheckListCorrectiveActions
                                          where ad.CorrectiveActionId == nCorrectiveActionId
                                          select ad).FirstOrDefault();
            context.CheckListCorrectiveActions.DeleteObject(ca);
            context.SaveChanges();

        }

        private int CheckListId
        {
            get 
            {
                if (Request.QueryString["CheckListId"] != null)
                    return int.Parse(Request.QueryString["CheckListId"]);
                else
                    return 1;
            }
        }
        #endregion

    }
}