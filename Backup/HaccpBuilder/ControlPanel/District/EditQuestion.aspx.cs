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

public partial class ControlPanel_District_EditQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //Get Question from Database
            if (Request.QueryString["QuestionId"] != null && Request.QueryString["GroupId"] != null)
            {
                GetData();
                
            }
            if (Request.QueryString["Mode"] == "2")
            {
                rdbSection.SelectedValue = Request.QueryString["Section"];
                rdbSection.Enabled = true;
            }
            if (Request.QueryString["Mode"] == "3")
            {
                rdbSection.SelectedValue = Request.QueryString["Section"];
            }
            if (Request.QueryString["GroupId"] != null)
            {
                hlCancel.NavigateUrl = "~/ControlPanel/District/CustomQuestion.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"];
            }

        }
    }
    protected void btnCreateChecklistGroup_Click(object sender, EventArgs e)
    {
        bool result = true;
        switch (Request.QueryString["Mode"])
        {
            case "1":
                result = SaveQuestion(1);
                break;
            case "2":
                result = SaveQuestion(2);
                break;
            case "3":
                result = UpdateQuestion();
                break;
        }
        if (result == true)
        {
            string strGroupId = Request.QueryString["GroupId"];
            Response.Redirect("~/ControlPanel/District/CustomQuestion.aspx?GroupId=" + strGroupId + "&Section=" + Request.QueryString["Section"]);
        }
         
         }
    protected void btnAddKitchens_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomQuestion.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    }
    private void GetData()
    {
        
        ProcessGetFoodSafetyQuestions getQuestion = new ProcessGetFoodSafetyQuestions();
        IDataReader drQuestion = getQuestion.GetFoodSafetyQuestionById(int.Parse(Request.QueryString["QuestionId"]));
        if (drQuestion.Read())
        {
            txtQuestion.Text = drQuestion["Question"].ToString();
            rdbSection.SelectedValue = getSectionId(drQuestion["Section"].ToString()).ToString();
            hfIsAdditional.Value = drQuestion["Additional"].ToString();
            hfIsCustom.Value = drQuestion["Custom"].ToString();
            hfIsSelected.Value = drQuestion["Active"].ToString();
            hfGroupId.Value = drQuestion["CheckListGroupId"].ToString();
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
            ProcessGetFoodSafetyQuestions FoodSafetyQuestion = new ProcessGetFoodSafetyQuestions();
            DataSet dsFoodSafetyQuestion = FoodSafetyQuestion.GetFoodSafetyQuestion(txtQuestion.Text.Trim(), int.Parse(Request.QueryString["GroupId"]));
            if (dsFoodSafetyQuestion.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Food safety check list question already exists.";
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
            ProcessGetFoodSafetyQuestions FoodSafetyQuestion = new ProcessGetFoodSafetyQuestions();
            DataSet dsFoodSafetyQuestion = FoodSafetyQuestion.GetFoodSafetyQuestionByQuestionAndId(txtQuestion.Text, int.Parse(Request.QueryString["QuestionId"]), int.Parse(hfGroupId.Value));
            if (dsFoodSafetyQuestion.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Food safety check list question already exists.";
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
        FoodSafetyQuestion newQuestion = new FoodSafetyQuestion();
        newQuestion.Active = 1;
        if (nType == 2)
        {
            newQuestion.Additional = 1;
        }
        newQuestion.CheckListGroupId = int.Parse(Request.QueryString["GroupId"]);
        newQuestion.Custom = 1;
        newQuestion.Question = txtQuestion.Text;
        if (Request.QueryString["QuestionId"] != null)
        {
            newQuestion.QuestionId = int.Parse(Request.QueryString["QuestionId"]); 
        }
        newQuestion.Section = getSection(int.Parse(rdbSection.SelectedValue));
        newQuestion.SectionId = int.Parse(rdbSection.SelectedValue);
        ProcessCreateFoodSafetyQuestion createQuestion = new ProcessCreateFoodSafetyQuestion();
        createQuestion.FoodSafetyQuestion = newQuestion;
        createQuestion.Invoke();

        }
        return status;
    }

    private bool UpdateQuestion()
    {
           bool status = CheckData(2);
        if (status == true)
        {
        FoodSafetyQuestion newQuestion = new FoodSafetyQuestion();
        newQuestion.Active = int.Parse(hfIsSelected.Value);
        newQuestion.Additional = int.Parse(hfIsAdditional.Value);
        newQuestion.CheckListGroupId = int.Parse(Request.QueryString["GroupId"]);
        newQuestion.Custom = int.Parse(hfIsCustom.Value);
        newQuestion.Question = txtQuestion.Text;
        if (Request.QueryString["QuestionId"] != null)
        {
            newQuestion.QuestionId = int.Parse(Request.QueryString["QuestionId"]);
        }
        newQuestion.Section = getSection(int.Parse(rdbSection.SelectedValue));

        ProcessSetFoodSafetyQuestion setQuestion = new ProcessSetFoodSafetyQuestion();
        setQuestion.FoodSafetyQuestion = newQuestion;
        setQuestion.Invoke();
        }
        return status;
    }

    private int getSectionId(string strSectionId)
    {
        int nSectionId = 0;
        switch (strSectionId)
        {

            case "PA":
                nSectionId = 1;
                break;
            case "FP":
                nSectionId = 2;
                break;
            case "HH":
                nSectionId = 3;
                break;
            case "CH":
                nSectionId = 4;
                break;
            case "RFM":
                nSectionId = 5;
                break;
            case "FSDS":
                nSectionId = 6;
                break;
            case "CS":
                nSectionId = 7;
                break;
            case "UE":
                nSectionId = 8;
                break;
            case "LE":
                nSectionId = 9;
                break;
            case "GSD":
                nSectionId = 10;
                break;
            case "PC":
                nSectionId = 11;
                break;
        }
        return nSectionId;

    }
    private string getSection(int nSectionId)
    {
        string strSectionId = "";
        switch (nSectionId)
        {

            case 1:
                strSectionId = "PA";
                break;
            case 2:
                strSectionId = "FP";
                break;
            case 3:
                strSectionId = "HH";
                break;
            case 4:
                strSectionId = "CH";
                break;
            case 5:
                strSectionId = "RFM";
                break;
            case 6:
                strSectionId = "FSDS";
                break;
            case 7:
                strSectionId = "CS";
                break;
            case 8:
                strSectionId = "UE";
                break;
            case 9:
                strSectionId = "LE";
                break;
            case 10:
                strSectionId = "GSD";
                break;
            case 11:
                strSectionId = "PC";
                break;
        }
        return strSectionId;

    }
}
