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


public partial class ControlPanel_Kitchen_ProceduralQuestions : System.Web.UI.Page
{
    public static string mode = "new";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (lblStatus.Text == "")
            {
                Session["Procedure"] = 1;
                lblStatus.Text = "1";
                SetBuyer();
                if (GetResponse(1) == 1)
                {
                    mode = "edit";
                }
                else
                {
                    mode = "new";
                }
            }

        }
    }
    protected void btnContinue_Click(object sender, ImageClickEventArgs e)
    {

        switch (lblStatus.Text)        {
            case "1":

                SetBuyer();
                //if (mode == "new")
                //{
                //    CreateResponse(1);
                //}
                //else
                //{
                //    SetResponse(1);
                //}
                break;
            case "2":
               
               if (mode == "new")
               //if( GetResponse(2) == 1)
                {
                    CreateResponse(1);
                }
                else
                {
                    SetResponse(1);
                }
                SetAllergen();
                if (GetResponse(2) == 1)
                {
                    mode = "edit";
                }
                else
                {
                    mode = "new";
                }
                break;
            case "3":
                
                if (mode == "new")
                {
                    CreateResponse(2);
                }
                else
                {
                    SetResponse(2);
                }
                SetHazard();
                if (GetResponse(4) == 1)
                {
                    mode = "edit";
                }
                else
                {
                    mode = "new";
                }
                break;
            case "4":
                if (mode == "new")
                {
                    CreateResponse(4);
                }
                else
                {
                    SetResponse(4);
                }
                SetSurface();
                if (GetResponse(5) == 1)
                {
                    mode = "edit";
                }
                else
                {
                    mode = "new";
                }
                break;
            case "5":
                
                if (mode == "new")
                {
                    CreateResponse(5);
                }
                else
                {
                    SetResponse(5);
                }
                SetInfo();
                if (GetResponse(6) == 1)
                {
                    mode = "edit";
                }
                else
                {
                    mode = "new";
                }
                break;
            case "6":
                if (CheckResponse() == 1)
                {
                    if (mode == "new")
                    {
                        CreateResponse(6);
                    }
                    else
                    {
                        SetResponse(6);
                    }
                    Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
                }
                break;
        }
    }
    private void SetBuyer()
    {
        Session["Procedure"] = 2;
        lblStatus.Text = "2";
        lblStep.Text = "ONE";
        //lblQuestionType.Text = "Buyer Specifications";
        lblQuestionHeading.Text = "BUYER SPECIFICATIONS";
        lblQuestion.Text = "Describe Establishment Requirements for Vendor Selection";


        rdbYes.Visible = false;
        rdbNo.Visible = false;
        txtAnswer.Visible = true;
        txtAnswer.Text = "";
        rfvAnswer.Enabled = true;       
        dvNo.Visible = false;
        dvYes.Visible = false;
        //txtNo.Visible = false;
        //rfvNo.Enabled = false;
        
        
    }
    private void SetAllergen()
    {
        Session["Procedure"] = 3;
        lblStatus.Text = "3";
        lblStep.Text = "TWO";
        //lblQuestionType.Text = "Allergen Management";
        lblQuestionHeading.Text = "ALLERGEN MANAGEMENT";
        lblQuestion.Text = "Do any menu items contain potential allergen ingredients: ";
        lblYes.Text = "If yes, describe allergen ingredients";
        lblNo.Text = "Please describe procedures for allergen control";

        rdbYes.Visible = true;
        rdbNo.Visible = true;
        txtAnswer.Visible = false;       
        rfvAnswer.Enabled = false;
        rfvYes.Enabled = true;
        rfvNo.Enabled = true;
        dvNo.Visible = true;
        dvYes.Visible = true;
        txtYes.Text = "";
        txtNo.Text = "";

    }
    private void SetHazard()
    {
        Session["Procedure"] = 4;
        lblStatus.Text = "4";
        lblStep.Text = "THREE";
        //lblQuestionType.Text = "Safety Hazard Procedures";
        lblQuestionHeading.Text = "SAFETY HAZARD PROCEDURES";
        lblQuestion.Text = "Describe basic procedures to eliminate menu items from contamination by biological, chemical and physical food safety hazards";

        rdbYes.Visible = false;
        rdbNo.Visible = false;
        txtAnswer.Visible = true;
        txtAnswer.Text = "";
        rfvAnswer.Enabled = true;
        dvNo.Visible = false;
        dvYes.Visible = false;
    }
    private void SetSurface()
    {
        Session["Procedure"] = 5;
        lblStatus.Text = "5";
        lblStep.Text = "FOUR";
        //lblQuestionType.Text = "Soil and Unsanitized Surfaces";
        lblQuestionHeading.Text = "SOIL AND UNSANITIZED SURFACES";
        lblQuestion.Text = "Do soiled and unsanitized surfaces of equipment and utensils contact raw or cooked food";
        lblYes.Text = "If yes, describe how the raw or cooked food comes into contact with unclean or unsanitized surfaces";
        
        rdbYes.Visible = true;
        rdbYes.Checked = false;
        rdbNo.Visible = true;
        rdbNo.Checked = false;
        txtAnswer.Visible = false;
        rfvAnswer.Enabled = false;
        rfvYes.Enabled = true;
        rfvNo.Enabled = true;
        dvNo.Visible = false;
        dvYes.Visible = true;
        txtYes.Text = "";
    }
    private void SetInfo()
    {
        Session["Procedure"] = 6;
        lblStatus.Text = "6";
        lblStep.Text = "FIVE";
        //lblQuestionType.Text = " Daily Requirements (HACCP Builder will fulfill requirements daily";
        lblQuestionHeading.Text = "DAILY REQUIREMENTS";
        lblQuestion.Text = "";
        ProcessGetProceduralQuestion getQuestion = new ProcessGetProceduralQuestion();
        DataSet dsQuestion = getQuestion.GetQuestionsDataSet();
        grdQuestion.DataSource = dsQuestion;
        grdQuestion.DataBind();

        rdbYes.Visible = false;
        rdbNo.Visible = false;
        txtAnswer.Visible = false;
        rfvAnswer.Enabled = false ;
        dvNo.Visible = false;
        dvYes.Visible = false;
        dvQuestion1.Visible = false;
    }
    private int GetResponse(int nQuestionId)
    {
        int nStatus = 0;
        ProceduralResponse response = new ProceduralResponse();
        ProcessGetProceduralResponse getResponse = new ProcessGetProceduralResponse();
        DataSet dsResponse;
        if(nQuestionId < 6)
        {
         dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], nQuestionId);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {
            nStatus = 1;
            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                response.CorrectiveAction = dr["CorrectiveAction"].ToString();
                response.KitchenId = int.Parse(dr["KitchenId"].ToString());
                response.QuestionId = int.Parse(dr["QuestionId"].ToString());
                response.Response = int.Parse(dr["Response"].ToString());
                response.ResponseId = int.Parse(dr["ResponseId"].ToString());

            }
            Session["ResponseId"] = response.ResponseId;
            if (nQuestionId == 1)
            {
                txtAnswer.Text = response.CorrectiveAction;

            }
            if (nQuestionId == 2)
            {
                if (response.Response == 1)
                {
                    rdbYes.Checked = true;
                    txtYes.Text = response.CorrectiveAction;
                    dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 3);
                    if (dsResponse.Tables[0].Rows.Count > 0)
                    {
                        nStatus = 1;
                        foreach (DataRow dr in dsResponse.Tables[0].Rows)
                        {
                            response.CorrectiveAction = dr["CorrectiveAction"].ToString();
                            response.KitchenId = int.Parse(dr["KitchenId"].ToString());
                            response.QuestionId = int.Parse(dr["QuestionId"].ToString());
                            response.Response = int.Parse(dr["Response"].ToString());
                            response.ResponseId = int.Parse(dr["ResponseId"].ToString());

                        }
                        txtNo.Text = response.CorrectiveAction;
                    }
                }
                else
                {
                    rdbNo.Checked = true;
                    rfvYes.Enabled = false;
                    rfvNo.Enabled = false;
                   // txtNo.Text = response.CorrectiveAction;
                }
            }
            if (nQuestionId == 4)
            {
                txtAnswer.Text = response.CorrectiveAction;
            }
            if (nQuestionId == 5)
            {
                if (response.Response == 1)
                {
                    rdbYes.Checked = true;
                    txtYes.Text = response.CorrectiveAction;
                }
                else
                {
                    rdbNo.Checked = true;
                    rfvYes.Enabled = false;
                    rfvNo.Enabled = false;
                }
            }
            
        }
        }
        else
        {            
                int i = 0;
                dsResponse = getResponse.GetResponsesInfo((int)Session["KitchenId"]);
                if (dsResponse.Tables[0].Rows.Count > 0)
                {
                    nStatus = 1;
                foreach (DataRow dr in dsResponse.Tables[0].Rows)
                {

                    RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                    RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                    HiddenField hfResponseId = (HiddenField)grdQuestion.Rows[i].FindControl("hfResponseId");
                    hfResponseId.Value = dr["ResponseId"].ToString();
                   
                    if(int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdbAnswerYes.Checked = true;
                    }
                    else
                    {
                        rdbAnswerNo.Checked=true;
                    }
                    i++;
                }
            }
        }
            return nStatus;

        
    }
    private void CreateResponse(int nQuestionId)
    {
        ProceduralResponse response = new ProceduralResponse();
        ProcessCreateProceduralResponse createResponse = new ProcessCreateProceduralResponse();
        response.QuestionId = nQuestionId ;
        response.KitchenId = (int)Session["KitchenId"];
        if (nQuestionId < 6)
        {
            if (nQuestionId == 1)
            {
                response.CorrectiveAction = txtAnswer.Text;
                response.Response = 1;

            }
            if (nQuestionId == 2)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                    response.CorrectiveAction = txtYes.Text;
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 1;
                    response.CorrectiveAction = txtNo.Text;

                }
                else
                {
                    response.Response = 0;
                    response.CorrectiveAction = null;
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 0;
                    response.CorrectiveAction = null;
                }
            }
            if (nQuestionId == 4)
            {
                response.CorrectiveAction = txtAnswer.Text;
                response.Response = 1;
            }
            if (nQuestionId == 5)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                }
                else
                {
                    response.Response = 0;
                }
                response.CorrectiveAction = txtYes.Text;
            }
            createResponse.ProceduralResponse = response;
            createResponse.Invoke();
        }
        if (nQuestionId == 6)
        {
            int i, totalItems;
            totalItems = grdQuestion.Rows.Count;
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                HiddenField hfQuestionId = (HiddenField)grdQuestion.Rows[i].FindControl("hfQuestionId");
                ProceduralResponse newResponse = new ProceduralResponse();
                newResponse.QuestionId = int.Parse(hfQuestionId.Value);
                newResponse.KitchenId = (int)Session["KitchenId"];
                newResponse.CorrectiveAction = null;
                if (rdbAnswerYes.Checked == true)
                {
                    newResponse.Response = 1;
                }
                else
                {
                    newResponse.Response = 0;
                }
                createResponse.ProceduralResponse = newResponse;
                createResponse.Invoke();
            }
        }

    }
    private void SetResponse(int nQuestionId)
    {
        ProceduralResponse response = new ProceduralResponse();
        ProcessSetProceduralResponse createResponse = new ProcessSetProceduralResponse();
        response.QuestionId = nQuestionId;
        response.KitchenId = (int)Session["KitchenId"];
        response.ResponseId = (int)Session["ResponseId"];
        if (nQuestionId < 6)
        {
            if (nQuestionId == 1)
            {
                response.CorrectiveAction = txtAnswer.Text;
                response.Response = 1;

            }
            if (nQuestionId == 2)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                    response.CorrectiveAction = txtYes.Text;
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    response.ResponseId = (int)Session["ResponseId"] + 1;
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 1;
                    response.CorrectiveAction = txtNo.Text;

                }
                else
                {
                    response.Response = 0;
                    response.CorrectiveAction = null;
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    response.ResponseId = (int)Session["ResponseId"] + 1;
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 0;
                    response.CorrectiveAction = null;
                }
            }
            if (nQuestionId == 4)
            {
                response.CorrectiveAction = txtAnswer.Text;
                response.Response = 1;
            }
            if (nQuestionId == 5)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                }
                else
                {
                    response.Response = 0;
                }
                response.CorrectiveAction = txtYes.Text;
            }
            createResponse.ProceduralResponse = response;
            createResponse.Invoke();
        }
        if (nQuestionId == 6)
        {
            int i, totalItems;
            totalItems = grdQuestion.Rows.Count;
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                HiddenField hfQuestionId = (HiddenField)grdQuestion.Rows[i].FindControl("hfQuestionId");
                HiddenField hfResponseId = (HiddenField)grdQuestion.Rows[i].FindControl("hfResponseId");
                ProceduralResponse newResponse = new ProceduralResponse();
                newResponse.QuestionId = int.Parse(hfQuestionId.Value);
                newResponse.KitchenId = (int)Session["KitchenId"];
                newResponse.ResponseId = int.Parse(hfResponseId.Value);
                newResponse.CorrectiveAction = null;
                if (rdbAnswerYes.Checked == true)
                {
                    newResponse.Response = 1;
                }
                else
                {
                    newResponse.Response = 0;
                }
                createResponse.ProceduralResponse = newResponse;
                createResponse.Invoke();
            }
        }
    }
    private int CheckResponse()
    {
        //ProcessGetProceduralResponse getResponse = new ProcessGetProceduralResponse();
        //DataSet dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], nQuestionId);
        //if(dsResponse.Tables[0].Rows.Count > 0)
        int i, totalItems,nValid = 1;
        totalItems = grdQuestion.Rows.Count;
                for (i = 0; i < totalItems; i++)
                {
                    //CheckBox chkSelect = (CheckBox)grdQuestion.Rows[i].FindControl("chkSelect");
                    RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                    RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                    Label lblValidateProcess = (Label)grdQuestion.Rows[i].FindControl("lblValidateProcess");

                    if (rdbAnswerYes.Checked == false && rdbAnswerNo.Checked == false)
                    {
                        lblValidateProcess.Text = "Answer is Required.";
                        nValid = 0;
                    }
                    else
                    {
                        lblValidateProcess.Text = "";
                    }

                }
                    
        return nValid;
    }

}
