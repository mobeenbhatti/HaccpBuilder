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
using System.IO;

using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_Kitchen_ViewHaccpPlan_ProceduralQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetProceduralQuestions();
    }
    private void SetProceduralQuestions()
    {

        ProcessGetProceduralResponse getResponse = new ProcessGetProceduralResponse();
        DataSet dsResponse;
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 1);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion1.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 2);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion2.Text = dr["CorrectiveAction"].ToString();
                if (dr["Response"].ToString() != "")
                {
                    if (int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdlAllergenYes.Checked = true;
                    }
                    else if (int.Parse(dr["Response"].ToString()) == 0)
                    {
                        rdlAllergenNo.Checked = true;
                    }
                    else
                    {
                        rdlAllergenNA.Checked = true;
                    }
                }

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 3);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion2b.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 4);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion3.Text = dr["CorrectiveAction"].ToString();

            }
        }
        dsResponse = getResponse.GetResponsesDataSet((int)Session["KitchenId"], 5);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {
                lblQuestion4.Text = dr["CorrectiveAction"].ToString();
                if (dr["Response"].ToString() != "")
                {
                    if (int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdbSoilYes.Checked = true;
                    }
                    else if (int.Parse(dr["Response"].ToString()) == 0)
                    {
                        rdbSoilNo.Checked = true;
                    }
                    else
                    {
                        rdbSoilNA.Checked = true;
                    }
                }

            }
        }
        int i = 0;
        dsResponse = getResponse.GetResponsesInfo((int)Session["KitchenId"]);
        if (dsResponse.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in dsResponse.Tables[0].Rows)
            {

                RadioButton rdbAnswerYes = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNo = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerNA = (RadioButton)grdQuestion.Rows[i].FindControl("rdbAnswerNA");
                if (dr["Response"].ToString() != "")
                {
                    if (int.Parse(dr["Response"].ToString()) == 1)
                    {
                        rdbAnswerYes.Checked = true;
                    }
                    else if (int.Parse(dr["Response"].ToString()) == 0)
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
}
