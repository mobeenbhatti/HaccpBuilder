using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_Kitchen_ProceduralQuestion : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Session["Procedure"] = 1;
            lblStatus.Text = "0";
            MultiView1.ActiveViewIndex = 0;
            if (GetResponse(1) == 1)
            {
              
            }
            else
            {
               
            }
        }
        
    }
    protected void btnContinue_Click(object sender, ImageClickEventArgs e)
    {
       
       

        switch (MultiView1.ActiveViewIndex)
        {
            case 0:
               
               
               
                    SetResponse(1);

                    GetResponse(2);               
                break;
            case 1:
               
               
                    SetResponse(2);
                    GetResponse(4);
                break;
            case 2:
                
               
                    SetResponse(4);
                    GetResponse(5);
                break;
            case 3:
               
               
                    SetResponse(5);
                    SetInfo();
                    GetResponse(6);
                break;
            case 4:
               
                if (CheckResponse() == 1)
                {
                                   
                        SetResponse(6);                   
                    Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
                }
                break;
        }
        if (MultiView1.ActiveViewIndex < 4)
        {
            MultiView1.ActiveViewIndex += 1;
        }

    }
    private int GetResponse(int nQuestionId)
    {
        int nStatus = 0;
        ProceduralResponse response = new ProceduralResponse();
        ProcessGetProceduralResponse getResponse = new ProcessGetProceduralResponse();
        DataSet dsResponse;
        if (nQuestionId < 6)
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
                    if (dr["Response"].ToString() != "")
                    {
                        response.Response = int.Parse(dr["Response"].ToString());
                    }
                    else
                    {
                        response.Response = 9;
                    }
                    response.ResponseId = int.Parse(dr["ResponseId"].ToString());

                }
                //Session["ResponseId"] = response.ResponseId;
                if (nQuestionId == 1)
                {
                    txtQuestion1.Text = response.CorrectiveAction;
                    hfResponse1.Value = response.ResponseId.ToString();
                    // txtAnswer.Text = response.CorrectiveAction;

                }
                if (nQuestionId == 2)
                {
                    hfResponse2.Value = response.ResponseId.ToString();
                    hfResponse3.Value = (int.Parse(hfResponse2.Value) + 1).ToString();
                    if (response.Response == 1)
                    {
                        rdbYes.Checked = true;
                        txtQuestion2A.Enabled = true;
                        txtQuestion2A.Text = response.CorrectiveAction;
                        //txtYes.Text = response.CorrectiveAction;
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
                            txtQuestion2B.Enabled = true;

                            txtQuestion2B.Text = response.CorrectiveAction;

                            //txtNo.Text = response.CorrectiveAction;
                        }
                    }
                    if(response.Response == 0)
                    {
                        rdbNo.Checked = true;
                     
                        rfvQuestion2A.Enabled = false;
                        rfvQuestion2B.Enabled = false;
                        txtQuestion2B.Enabled = false;
                        txtQuestion2A.Enabled = false;

                        // txtNo.Text = response.CorrectiveAction;
                    }
                    if (response.Response == 2)
                    {
                        rdbNA.Checked = true;

                        rfvQuestion2A.Enabled = false;
                        rfvQuestion2B.Enabled = false;
                        txtQuestion2B.Enabled = false;
                        txtQuestion2A.Enabled = false;

                        // txtNo.Text = response.CorrectiveAction;
                    }

                }
                if (nQuestionId == 4)
                {
                    txtQuestion3.Text = response.CorrectiveAction;
                    hfResponse4.Value = response.ResponseId.ToString();
                    //txtAnswer.Text = response.CorrectiveAction;
                }
                if (nQuestionId == 5)
                {
                    if (response.Response == 1)
                    {
                        rdbYes4.Checked = true;
                        txtQuestion4.Text = response.CorrectiveAction;
                        txtQuestion4.Enabled = true;
                    }
                    if (response.Response == 0)
                    {
                        rdbNo4.Checked = true;
                  
                        txtQuestion4.Enabled = false;
                        rfvQuestion4.Enabled = false;
                    }
                    if (response.Response == 2)
                    {
                 
                        rdbNA4.Checked = true;
                        txtQuestion4.Enabled = false;
                        rfvQuestion4.Enabled = false;
                    }
                    hfResponse5.Value = response.ResponseId.ToString();
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
                    if (i == 17)
                    {
                        int j = 0;
                    }
                    RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                    RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                    RadioButton rdbAnswerNA = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNA");
                    HiddenField hfResponseId = (HiddenField)grdQuestion.Rows[i].FindControl("hfResponseId");
                    hfResponseId.Value = dr["ResponseId"].ToString();
                    if (dr["Response"].ToString() != "")
                    {
                        if (int.Parse(dr["Response"].ToString()) == 1)
                        {
                            rdbAnswerYes.Checked = true;
                        }
                        else if(int.Parse(dr["Response"].ToString()) == 0)
                        {
                            rdbAnswerNo.Checked = true;
                        }
                        else
                        {
                            rdbAnswerNA.Checked = true;
                        }
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
        response.QuestionId = nQuestionId;
        response.KitchenId = (int)Session["KitchenId"];
        if (nQuestionId < 6)
        {
            if (nQuestionId == 1)
            {
                response.CorrectiveAction = txtQuestion1.Text;
                response.Response = 1;

            }
            if (nQuestionId == 2)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                    response.CorrectiveAction = txtQuestion2A.Text;
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 1;
                    response.CorrectiveAction = txtQuestion2B.Text;

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
                response.CorrectiveAction = txtQuestion3.Text;
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
                response.CorrectiveAction = txtQuestion4.Text;
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
                RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                HiddenField hfQuestionId = (HiddenField)grdQuestion.Rows[i].FindControl("hfQuestionId");
                ProceduralResponse newResponse = new ProceduralResponse();
                newResponse.QuestionId = int.Parse(hfQuestionId.Value);
                newResponse.KitchenId = (int)Session["KitchenId"];
                newResponse.CorrectiveAction = null;
                if (rdbAnswerYes.Checked == true)
                {
                    newResponse.Response = 1;
                }
                else if (rdbAnswerNo.Checked == true)
                {
                    newResponse.Response = 0;
                }
                else
                {
                    newResponse.Response = 2;
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
        //response.ResponseId = (int)Session["ResponseId"];

        if (nQuestionId < 6)
        {
            if (nQuestionId == 1)
            {
                response.CorrectiveAction = txtQuestion1.Text;
                response.ResponseId = int.Parse(hfResponse1.Value);
                response.Response = 1;

            }
            if (nQuestionId == 2)
            {
                if (rdbYes.Checked == true)
                {
                    response.Response = 1;
                    response.CorrectiveAction = txtQuestion2A.Text;
                    response.ResponseId = int.Parse(hfResponse2.Value);
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    //response.ResponseId = (int)Session["ResponseId"] + 1;
                    response.ResponseId = int.Parse(hfResponse3.Value);
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 1;
                    response.CorrectiveAction = txtQuestion2B.Text;

                }
                else if (rdbNo.Checked == true)
                {
                    response.Response = 0;
                    response.CorrectiveAction = null;
                    response.ResponseId = int.Parse(hfResponse2.Value);
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    //response.ResponseId = (int)Session["ResponseId"] + 1;
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 0;
                    response.CorrectiveAction = null;
                    response.ResponseId = int.Parse(hfResponse3.Value);
                }
                else
                {
                    response.Response = 0;
                    response.CorrectiveAction = null;
                    response.ResponseId = int.Parse(hfResponse2.Value);
                    createResponse.ProceduralResponse = response;
                    createResponse.Invoke();
                    //response.ResponseId = (int)Session["ResponseId"] + 1;
                    response.QuestionId = 3;
                    response.KitchenId = (int)Session["KitchenId"];
                    response.Response = 2;
                    response.CorrectiveAction = null;
                    response.ResponseId = int.Parse(hfResponse3.Value);
                }
            }
            if (nQuestionId == 4)
            {
                response.CorrectiveAction = txtQuestion3.Text;
                response.ResponseId = int.Parse(hfResponse4.Value);
                response.Response = 1;
            }
            if (nQuestionId == 5)
            {
                if (rdbYes4.Checked == true)
                {
                    response.Response = 1;
                }
                else if (rdbNo4.Checked == true)
                {
                    response.Response = 0;
                }
                else
                {
                    response.Response = 2;
                }
                response.CorrectiveAction = txtQuestion4.Text;
                response.ResponseId = int.Parse(hfResponse5.Value);
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
                RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
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
                else if (rdbAnswerNo.Checked == true)
                {
                    newResponse.Response = 0;
                }
                else
                {
                    newResponse.Response = 2;
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
        int i, totalItems, nValid = 1;
        totalItems = grdQuestion.Rows.Count;
        for (i = 0; i < totalItems; i++)
        {
            //CheckBox chkSelect = (CheckBox)grdQuestion.Rows[i].FindControl("chkSelect");
            RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
            RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
             RadioButton rdbAnswerNA = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNA");
            Label lblValidateProcess = (Label)grdQuestion.Rows[i].FindControl("lblValidateProcess");

            if (rdbAnswerYes.Checked == false && rdbAnswerNo.Checked == false && rdbAnswerNA.Checked == false)
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
    private void SetInfo()
    {
        ProcessGetProceduralQuestion getQuestion = new ProcessGetProceduralQuestion();
        DataSet dsQuestion = getQuestion.GetQuestionsDataSet();
        grdQuestion.DataSource = dsQuestion;
        grdQuestion.DataBind();
    }
}
