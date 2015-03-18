using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Globalization;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class ValidationChecklistNew : System.Web.UI.Page
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
                drValidationHistory = getHistory.GetHistoryByEntrydate(KitchenId, DateTime.Today);
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
                    grdValidation.DataSource = ObjectDataSource1;
                    grdValidation.DataBind();
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
            drValidationHistory = getHistory.GetHistoryByEntrydate(KitchenId, Enterdate);
            if (drValidationHistory.Read())
            {
                ddlFrequency.SelectedValue = drValidationHistory["Frequency"].ToString();
                //ddlFrequencyMode.SelectedValue = drValidationHistory["FrequencyMode"].ToString();
                txtResponsiblePerson.Text = drValidationHistory["ResponsiblePerson"].ToString();
                ddlTimePeriod.SelectedValue = drValidationHistory["TimePeriod"].ToString();
                // ddlTimePeriodMode.SelectedValue = drValidationHistory["TimePeriodMode"].ToString();
                txtTitle.Text = drValidationHistory["Title"].ToString();
                cldEntryDate.SelectedDate = DateTime.Parse(drValidationHistory["ValidationDueDate"].ToString());
                cldVerifiedDate.SelectedDate = DateTime.Parse(drValidationHistory["ValidationLastDate"].ToString());
                txtVerifiedBy.Text = drValidationHistory["VerifiedBy"].ToString();
                txtManagerTitle.Text = drValidationHistory["ManagerTitle"].ToString();
                txtReason.Text = drValidationHistory["Reason"].ToString();
                Session["HistoryId"] = int.Parse(drValidationHistory["ValidationHistoryId"].ToString());
                drValidationHistory.Close();
            }

            grdValidation.DataSource = ObjectDataSource2;
            grdValidation.DataBind();
            if (drValidationHistory.IsClosed == false)
            {
                drValidationHistory.Close();
            }
            int nHistoryId = (int)Session["HistoryId"];
            int nKitchenId = KitchenId;

            ProcessGetValidationResponse response = new ProcessGetValidationResponse();
            DataSet ds = response.GetResponsesDataSet(nKitchenId, nHistoryId);
            // Implement null check
            //  DataSet ds = response.GetResponsesDataSet( nHistoryId, int.Parse(lblIteration.Text));
            int i = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                RadioButton rdbAnswerYes = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNo = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerNA = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerNA");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)grdValidation.Rows[i].FindControl("vldAnswerValidate");
                //Label lblQuestionId = (Label)grdValidation.Items[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)grdValidation.Rows[i].FindControl("txtCorrectiveAction");

                if (int.Parse(row["Answer"].ToString()) == 1)
                {
                    rdbAnswerYes.Checked = true;
                    vldAnswerValidate.Enabled = false;
                }

                if (int.Parse(row["Answer"].ToString()) == 2)
                {
                    rdbAnswerNA.Checked = true;
                    vldAnswerValidate.Enabled = false;
                }
                if (int.Parse(row["Answer"].ToString()) == 0)
                {
                    rdbAnswerNo.Checked = true;
                    txtCorrectiveAction.Text = row["Remarks"].ToString();
                    vldAnswerValidate.Enabled = true;
                    txtCorrectiveAction.Enabled = true;
                }
                // Change on 13-11-08
                //if (rdbAnswerYes.Checked == true)
                //{
                //    vldAnswerValidate.Enabled = false;

                //}
                //if (rdbAnswerNo.Checked == true && txtCorrectiveAction.Text == "")
                //{
                //    vldAnswerValidate.Enabled = true;
                //    txtCorrectiveAction.Enabled = true;
                //}
                i++;
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {

            if (lblStatus.Text == "edit")
            {
                UpdateData();
                //MBS-(03-22-10)
                //       BUG ID - 1895
                //-  Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
                Response.Redirect("~/ControlPanel/Kitchen/ValidationReview.aspx?date=" + DateTime.Today.ToShortDateString());
            }
            if (lblStatus.Text == "new")
            {
                SaveData();
                Response.Redirect("~/ControlPanel/Kitchen/ValidationReview.aspx?date=" + DateTime.Today.ToShortDateString());

            }

        }
        protected void btnBack_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");

        }


        private void SaveData()
        {
            int i, totalItems;

            totalItems = grdValidation.Rows.Count;

            ValidationHistory validationHistory = new ValidationHistory();
            //validationHistory.ValidationHistoryId = (int)Session["HistoryId"];
            validationHistory.KitchenId = KitchenId;
            validationHistory.EntryDate = DateTime.Today;
            validationHistory.Frequency = int.Parse(ddlFrequency.SelectedValue);
            //validationHistory.FrequencyMode = ddlFrequencyMode.SelectedValue;
            validationHistory.ResponsiblePerson = txtResponsiblePerson.Text;
            validationHistory.TimePeriod = int.Parse(ddlTimePeriod.SelectedValue);
            //validationHistory.TimePeriodMode = ddlTimePeriodMode.SelectedValue;
            validationHistory.Title = txtTitle.Text;
            validationHistory.ValidationDueDate = cldEntryDate.SelectedDate;
            validationHistory.ValidationLastdate = cldVerifiedDate.SelectedDate;
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
                RadioButton rdbAnswerYes = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerNA");
                HiddenField hfQuestionId = (HiddenField)grdValidation.Rows[i].FindControl("hfQuestionId");
                //Label lblQuestionId = (Label)grdValidation.Rows[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)grdValidation.Rows[i].FindControl("txtCorrectiveAction");

                ValidationResponse userResponse = new ValidationResponse();
                //FoodSafetyResponse userResponse = new FoodSafetyResponse();

                userResponse.KitchenId = KitchenId;
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

            totalItems = grdValidation.Rows.Count;

            ValidationHistory validationHistory = new ValidationHistory();
            validationHistory.ValidationHistoryId = (int)Session["HistoryId"];
            validationHistory.KitchenId = KitchenId;
            //validationHistory.EntryDate = DateTime.Today;
            validationHistory.Frequency = int.Parse(ddlFrequency.SelectedValue);
            //validationHistory.FrequencyMode = ddlFrequencyMode.SelectedValue;
            validationHistory.ResponsiblePerson = txtResponsiblePerson.Text;
            validationHistory.TimePeriod = int.Parse(ddlTimePeriod.SelectedValue);
            //validationHistory.TimePeriodMode = ddlTimePeriodMode.SelectedValue;
            validationHistory.Title = txtTitle.Text;
            validationHistory.ValidationDueDate = cldEntryDate.SelectedDate;
            validationHistory.ValidationLastdate = cldVerifiedDate.SelectedDate;
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
                RadioButton rdbAnswerYes = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)grdValidation.Rows[i].FindControl("rdbAnswerNA");
                HiddenField hfQuestionId = (HiddenField)grdValidation.Rows[i].FindControl("hfQuestionId");
                //Label lblQuestionId = (Label)grdValidation.Rows[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)grdValidation.Rows[i].FindControl("txtCorrectiveAction");

                ValidationResponse userResponse = new ValidationResponse();
                //FoodSafetyResponse userResponse = new FoodSafetyResponse();

                userResponse.KitchenId = KitchenId;
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
        public int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
    }
}