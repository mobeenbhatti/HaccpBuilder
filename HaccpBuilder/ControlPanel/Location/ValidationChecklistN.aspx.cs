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

using System.Globalization;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class ValidationChecklistN : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //MBS-(03-22-10)
                //       BUG ID - 1895
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                IDataReader drValidationHistory;
                ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();
                drValidationHistory = getHistory.GetHistoryByEntrydate((int)Session["KitchenId"], DateTime.Today);
                if (drValidationHistory.Read())
                {
                    drValidationHistory.Close();
                    GetData();
                    lblStatus.Text = "edit";
                }
                else
                {
                    if (drValidationHistory.IsClosed == false)
                    {
                        drValidationHistory.Close();
                    }
                    rptChecklist.DataSource = ObjectDataSource1;
                    rptChecklist.DataBind();
                }

            }
        }
        private void GetData()
        {
            DateTime Enterdate = DateTime.Now;
            IDataReader drValidationHistory;
            ValidationHistory history = new ValidationHistory();
            ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();

            //MBS-(03-22-10)
            //       BUG ID - 1895
            if (Request.QueryString["date"] != null)
            {
                Enterdate = DateTime.Parse(Request.QueryString["date"]);

            }
            else if (Request.QueryString["entrdate"] != null)
            {
                Enterdate = DateTime.Parse(Request.QueryString["entrdate"]);

            }
            drValidationHistory = getHistory.GetHistoryByEntrydate((int)Session["KitchenId"], Enterdate);
            if (drValidationHistory.Read())
            {
                ddlFrequency.SelectedValue = drValidationHistory["Frequency"].ToString();
                //ddlFrequencyMode.SelectedValue = drValidationHistory["FrequencyMode"].ToString();
                txtResponsiblePerson.Text = drValidationHistory["ResponsiblePerson"].ToString();
                ddlTimePeriod.SelectedValue = drValidationHistory["TimePeriod"].ToString();
                // ddlTimePeriodMode.SelectedValue = drValidationHistory["TimePeriodMode"].ToString();
                txtTitle.Text = drValidationHistory["Title"].ToString();
                cldEntryDate.Text = drValidationHistory["ValidationDueDate"].ToString();
                cldVerifiedDate.Text = drValidationHistory["ValidationLastDate"].ToString();
                txtVerifiedBy.Text = drValidationHistory["VerifiedBy"].ToString();
                txtManagerTitle.Text = drValidationHistory["ManagerTitle"].ToString();
                txtReason.Text = drValidationHistory["Reason"].ToString();
                Session["HistoryId"] = int.Parse(drValidationHistory["ValidationHistoryId"].ToString());
                drValidationHistory.Close();
            }

            rptChecklist.DataSource = ObjectDataSource2;
            rptChecklist.DataBind();
            if (drValidationHistory.IsClosed == false)
            {
                drValidationHistory.Close();
            }
            int nHistoryId = (int)Session["HistoryId"];
            int nKitchenId = (int)Session["KitchenId"];

            ProcessGetValidationResponse response = new ProcessGetValidationResponse();
            DataSet ds = response.GetResponsesDataSet(nKitchenId, nHistoryId);
            // Implement null check
            //  DataSet ds = response.GetResponsesDataSet( nHistoryId, int.Parse(lblIteration.Text));
            int i = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerNA = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNA");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)rptChecklist.Items[i].FindControl("vldAnswerValidate");
                //Label lblQuestionId = (Label)grdValidation.Items[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)rptChecklist.Items[i].FindControl("txtCorrectiveAction");

                if (int.Parse(row["Answer"].ToString()) == 1)
                { rdbAnswerYes.Checked = true; }
                else if (int.Parse(row["Answer"].ToString()) == 0)
                {
                    rdbAnswerNo.Checked = true;
                    txtCorrectiveAction.Text = row["Remarks"].ToString();
                    vldAnswerValidate.Enabled = true;
                    txtCorrectiveAction.Enabled = true;
                }
                else
                {
                    rdbAnswerNA.Checked = true;
                }
                // Change on 13-11-08
                if (rdbAnswerYes.Checked == true)
                {
                    vldAnswerValidate.Enabled = false;

                }
                if (rdbAnswerNo.Checked == true && txtCorrectiveAction.Text == "")
                {
                    vldAnswerValidate.Enabled = true;
                    txtCorrectiveAction.Enabled = true;
                }
                i++;
            }
        }
        protected void btnContinue_Click(object sender, ImageClickEventArgs e)
        {

            if (lblStatus.Text == "edit")
            {
                UpdateData();
                //MBS-(03-22-10)
                //       BUG ID - 1895
                //-  Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
                Response.Redirect("~/ControlPanel/Location/ValidationReview.aspx?date=" + DateTime.Today.ToShortDateString());
            }
            if (lblStatus.Text == "new")
            {
                SaveData();
                Response.Redirect("~/ControlPanel/Location/ValidationReview.aspx?date=" + DateTime.Today.ToShortDateString());

            }

        }
        protected void btnBack_Click(object sender, ImageClickEventArgs e)
        {

            Response.Redirect("~/ControlPanel/Location/dashboard.aspx");

        }


        private void SaveData()
        {
            int i, totalItems;

            totalItems = rptChecklist.Items.Count;

            ValidationHistory validationHistory = new ValidationHistory();
            //validationHistory.ValidationHistoryId = (int)Session["HistoryId"];
            validationHistory.KitchenId = (int)Session["KitchenId"];
            validationHistory.EntryDate = DateTime.Today;
            validationHistory.Frequency = int.Parse(ddlFrequency.SelectedValue);
            //validationHistory.FrequencyMode = ddlFrequencyMode.SelectedValue;
            validationHistory.ResponsiblePerson = txtResponsiblePerson.Text;
            validationHistory.TimePeriod = int.Parse(ddlTimePeriod.SelectedValue);
            //validationHistory.TimePeriodMode = ddlTimePeriodMode.SelectedValue;
            validationHistory.Title = txtTitle.Text;
            validationHistory.ValidationDueDate = DateTime.Parse(cldEntryDate.Text);
            validationHistory.ValidationLastdate = DateTime.Parse(cldVerifiedDate.Text);
            validationHistory.VerifiedBy = txtVerifiedBy.Text;
            validationHistory.ManagerTitle = txtManagerTitle.Text;
            validationHistory.Reason = txtReason.Text;


            ProcessCreateValidationHistory createValidationHistory = new ProcessCreateValidationHistory();
            createValidationHistory.ValidationHistory = validationHistory;
            createValidationHistory.Invoke();

            ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();
            Session["HistoryId"] = getHistory.GetHistoryId();


            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerYes");
                HiddenField hfQuestionId = (HiddenField)rptChecklist.Items[i].FindControl("hfQuestionId");
                RadioButton rdbAnswerNA = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNA");
                //Label lblQuestionId = (Label)grdValidation.Rows[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)rptChecklist.Items[i].FindControl("txtCorrectiveAction");

                ValidationResponse userResponse = new ValidationResponse();
                //FoodSafetyResponse userResponse = new FoodSafetyResponse();

                userResponse.KitchenId = (int)Session["KitchenId"];
                userResponse.QuestionId = int.Parse(hfQuestionId.Value);
                userResponse.CorrectiveAction = txtCorrectiveAction.Text;
                userResponse.ValidationHistoryId = (int)Session["HistoryId"];
                //if (rdbAnswerYes.Checked)
                //    userResponse.Answer = 1;
                //else
                //    userResponse.Answer = 0;
                if (rdbAnswerYes.Checked == true)
                {
                    userResponse.Answer = 1;
                }
                else if (rdbAnswerNA.Checked == true)
                {
                    userResponse.Answer = 2;
                }
                else
                {
                    userResponse.Answer = 0;
                }


                ProcessCreateValidationResponse createResponse = new ProcessCreateValidationResponse();
                createResponse.ValidationResponse = userResponse;
                createResponse.Invoke();
            }
            //ProcessSetFoodSafetyResponse updateResponse = new ProcessSetFoodSafetyResponse();
            //updateResponse.FoodSafetyResponse = userResponse;
            //updateResponse.Invoke();
            //}
        }
        private void UpdateData()
        {
            int i, totalItems;

            totalItems = rptChecklist.Items.Count;

            ValidationHistory validationHistory = new ValidationHistory();
            validationHistory.ValidationHistoryId = (int)Session["HistoryId"];
            validationHistory.KitchenId = (int)Session["KitchenId"];
            //validationHistory.EntryDate = DateTime.Today;
            validationHistory.Frequency = int.Parse(ddlFrequency.SelectedValue);
            //validationHistory.FrequencyMode = ddlFrequencyMode.SelectedValue;
            validationHistory.ResponsiblePerson = txtResponsiblePerson.Text;
            validationHistory.TimePeriod = int.Parse(ddlTimePeriod.SelectedValue);
            //validationHistory.TimePeriodMode = ddlTimePeriodMode.SelectedValue;
            validationHistory.Title = txtTitle.Text;
            validationHistory.ValidationDueDate = DateTime.Parse(cldEntryDate.Text);
            validationHistory.ValidationLastdate = DateTime.Parse(cldVerifiedDate.Text);
            validationHistory.VerifiedBy = txtVerifiedBy.Text;
            validationHistory.ManagerTitle = txtManagerTitle.Text;
            validationHistory.Reason = txtReason.Text;

            ProcessSetValidationHistory setValidationHistory = new ProcessSetValidationHistory();
            setValidationHistory.ValidationHistory = validationHistory;
            setValidationHistory.Invoke();

            //ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();
            //Session["HistoryId"] = getHistory.GetHistoryId();


            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNA");
                HiddenField hfQuestionId = (HiddenField)rptChecklist.Items[i].FindControl("hfQuestionId");
                //Label lblQuestionId = (Label)grdValidation.Rows[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)rptChecklist.Items[i].FindControl("txtCorrectiveAction");

                ValidationResponse userResponse = new ValidationResponse();
                //FoodSafetyResponse userResponse = new FoodSafetyResponse();

                userResponse.KitchenId = (int)Session["KitchenId"];
                userResponse.QuestionId = int.Parse(hfQuestionId.Value);
                userResponse.CorrectiveAction = txtCorrectiveAction.Text;
                userResponse.ValidationHistoryId = (int)Session["HistoryId"];
                //if (rdbAnswerYes.Checked)
                //    userResponse.Answer = 1;
                //else
                //    userResponse.Answer = 0;
                if (rdbAnswerYes.Checked == true)
                {
                    userResponse.Answer = 1;
                }
                else if (rdbAnswerNA.Checked == true)
                {
                    userResponse.Answer = 2;
                }
                else
                {
                    userResponse.Answer = 0;
                }

                ProcessSetValidationResponse setResponse = new ProcessSetValidationResponse();
                setResponse.ValidationResponse = userResponse;
                setResponse.Invoke();

            }
        }
        protected void grdValidation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButton rdbAnswerNo = (RadioButton)e.Row.FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)e.Row.FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)e.Row.FindControl("rdbAnswerNA");
                TextBox txt = (TextBox)e.Row.FindControl("txtCorrectiveAction");

                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Row.FindControl("vldAnswerValidate");
                // Change on 12-11-08
                if (vldAnswerValidate != null)
                {
                    // Change on 13-11-08
                    //if (mode == "EDIT")
                    //{
                    //    vldAnswerValidate.Enabled = true;

                    //}
                    //else
                    //{
                    //    vldAnswerValidate.Enabled = false;
                    //}
                }

                if (rdbAnswerNo != null)
                {
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
                if (rdbAnswerNA != null)
                {
                    rdbAnswerNA.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Location/dashboard.aspx");
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (lblStatus.Text == "edit")
            {
                UpdateData();
                //MBS-(03-22-10)
                //       BUG ID - 1895
                //-  Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
                Response.Redirect("~/ControlPanel/Location/ValidationReviewN.aspx?date=" + DateTime.Today.ToShortDateString());
            }
            if (lblStatus.Text == "new")
            {
                SaveData();
                Response.Redirect("~/ControlPanel/Location/ValidationReviewN.aspx?date=" + DateTime.Today.ToShortDateString());

            }
        }
        protected void rptChecklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButton rdbAnswerNo = (RadioButton)e.Item.FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)e.Item.FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)e.Item.FindControl("rdbAnswerNA");
                TextBox txt = (TextBox)e.Item.FindControl("txtCorrectiveAction");

                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Item.FindControl("vldAnswerValidate");
                // Change on 12-11-08
                if (vldAnswerValidate != null)
                {
                    // Change on 13-11-08
                    //if (mode == "EDIT")
                    //{
                    //    vldAnswerValidate.Enabled = true;

                    //}
                    //else
                    //{
                    //    vldAnswerValidate.Enabled = false;
                    //}
                }

                if (rdbAnswerNo != null)
                {
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
                if (rdbAnswerNA != null)
                {
                    rdbAnswerNA.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
            }
        }
    }
}