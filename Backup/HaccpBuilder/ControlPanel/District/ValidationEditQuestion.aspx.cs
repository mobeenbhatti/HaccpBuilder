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

public partial class ControlPanel_District_ValidationEditQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //Get Question from Database
            if (Request.QueryString["QuestionId"] != null && Request.QueryString["GroupId"] != null)
            {
                GetData();
                hlCancel.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"];
            }
            //if (Request.QueryString["Mode"] == "2")
            //{
            //    rdbSection.SelectedValue = Request.QueryString["Section"];
            //}
            if (Request.QueryString["GroupId"] != null)
            {
                hlCancel.NavigateUrl = "~/ControlPanel/District/ValidationCustomQuestion.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"];
            }
        }
    }
    protected void btnCreateChecklistGroup_Click(object sender, EventArgs e)
    {
        bool result = true;
        switch (Request.QueryString["Mode"])
        {
            case "1":
               result= SaveQuestion(1);
                break;
            case "2":
               result= SaveQuestion(2);
                break;
            case "3":
                result=UpdateQuestion();
                break;
        }
        if (result == true)
        {
            string strGroupId = Request.QueryString["GroupId"];
            Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx?GroupId=" + strGroupId);
        }
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    }
    private void GetData()
    {
        ProcessGetValidationQuestions getQuestion = new ProcessGetValidationQuestions();        
        //ProcessGetFoodSafetyQuestions getQuestion = new ProcessGetFoodSafetyQuestions();

        IDataReader drQuestion = getQuestion.GetValidationQuestionById(int.Parse(Request.QueryString["QuestionId"]));
        if (drQuestion.Read())
        {
            txtQuestion.Text = drQuestion["Question"].ToString();
            //rdbSection.SelectedValue = getSectionId(drQuestion["Section"].ToString()).ToString();
            hfIsAdditional.Value = drQuestion["Additional"].ToString();
            hfIsCustom.Value = drQuestion["Custom"].ToString();
            hfIsSelected.Value = drQuestion["Active"].ToString();
            hfGroupId.Value = drQuestion["ValidationGroupId"].ToString();
            drQuestion.Close();
        }
        if (drQuestion.IsClosed == false)
        {
            drQuestion.Close();
        }
    }

    private bool CheckData(int nmode)
    {
        bool RecordExist = false;
        if (nmode == 1)
        {
            ProcessGetValidationQuestions ValidationQuestion = new ProcessGetValidationQuestions();
            DataSet dsValidationQuestion = ValidationQuestion.GetQuestion(txtQuestion.Text.Trim(), int.Parse(Request.QueryString["GroupId"]));
            if (dsValidationQuestion.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Validation Question already exists.";
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
            ProcessGetValidationQuestions ValidationQuestion = new ProcessGetValidationQuestions();
            DataSet dsValidationQuestion = ValidationQuestion.GetQuestionByQuestionAndId(txtQuestion.Text, int.Parse(Request.QueryString["QuestionId"]), int.Parse(hfGroupId.Value));
            if (dsValidationQuestion.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Validation Question already exists.";
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
    private bool SaveQuestion(int nType)
    {
         bool status = CheckData(1);
        if (status == true)
        {
        ValidationQuestion newQuestion = new ValidationQuestion();
        //FoodSafetyQuestion newQuestion = new FoodSafetyQuestion();
        newQuestion.Active = 1;
        if (nType == 2)
        {
            newQuestion.Additional = 1;
        }
        newQuestion.ValidationGroupId = int.Parse(Request.QueryString["GroupId"]);
        newQuestion.Custom = 1;
        newQuestion.Question = txtQuestion.Text;
        if (Request.QueryString["QuestionId"] != null)
        {
            newQuestion.QuestionId = int.Parse(Request.QueryString["QuestionId"]);
        }
        ProcessCreateValidationQuestion createQuestion = new ProcessCreateValidationQuestion();
        //ProcessCreateFoodSafetyQuestion createQuestion = new ProcessCreateFoodSafetyQuestion();
        createQuestion.ValidationQuestion = newQuestion;
        createQuestion.Invoke();
        }
        return status;

    }
    private bool UpdateQuestion()
    {
           bool status = CheckData(2);
        if (status == true)
        {
        ValidationQuestion newQuestion = new ValidationQuestion();
        //FoodSafetyQuestion newQuestion = new FoodSafetyQuestion();
        newQuestion.Active = int.Parse(hfIsSelected.Value);
        newQuestion.Additional = int.Parse(hfIsAdditional.Value);
        newQuestion.ValidationGroupId = int.Parse(Request.QueryString["GroupId"]);
        newQuestion.Custom = int.Parse(hfIsCustom.Value);
        newQuestion.Question = txtQuestion.Text;
        if (Request.QueryString["QuestionId"] != null)
        {
            newQuestion.QuestionId = int.Parse(Request.QueryString["QuestionId"]);
        }
        ProcessSetValidationQuestion setQuestion = new ProcessSetValidationQuestion();
       // ProcessSetFoodSafetyQuestion setQuestion = new ProcessSetFoodSafetyQuestion();
        setQuestion.ValidationQuestion = newQuestion;
        setQuestion.Invoke();
        }
        return status;
    }
   
}
