using System;
using System.Collections.Generic;
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
namespace HaccpBuilder.ControlPanel.District
{
    public partial class EditCtpat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                //Get Ctpat from Database
                if (Request.QueryString["CtpatId"] != null && Request.QueryString["GroupId"] != null)
                {
                    GetData();

                }
                if (Request.QueryString["GroupId"] != null)
                {
                    if (Request.QueryString["Review"] != null)
                    {
                        // Response.Redirect();

                        hlCancel1.NavigateUrl = "~/ControlPanel/District/CtpatReview.aspx?GroupId=" + Request.QueryString["GroupId"];
                    }
                    else
                    {
                        //Response.Redirect("?GroupId=" + strGroupId);
                        hlCancel1.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"];
                    }
                }
            }

        }
        protected void btnBack_Click(object sender, EventArgs e)
        {

        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            bool result = true;
            switch (Request.QueryString["Mode"])
            {
                case "1":
                    result = SaveCtpat(1);
                    break;
                case "2":
                    result = SaveCtpat(2);
                    break;
                case "3":
                    result = UpdateCtpat();
                    break;
            }
            string strGroupId = Request.QueryString["GroupId"];
            if (result == true)
            {

                if (Request.QueryString["Review"] != null)
                {
                    Response.Redirect("~/ControlPanel/District/CtpatReview.aspx?GroupId=" + strGroupId);
                }
                else
                {
                    Response.Redirect("~/ControlPanel/District/CustomCtpat.aspx?GroupId=" + strGroupId);
                }
            }
        }
        private void GetData()
        {
            ProcessGetCtpat getCtpat = new ProcessGetCtpat();
            IDataReader drCtpat = getCtpat.GetCtpatById(int.Parse(Request.QueryString["CtpatId"]));
            if (drCtpat.Read())
            {


                txtTitle.Text = drCtpat["Title"].ToString();
                txtCtpat.Value = drCtpat["CtpatText"].ToString();
                lblCustomCtpat.Text = drCtpat["CustomCtpat"].ToString();
                lblIsAdditional.Text = drCtpat["IsAdditional"].ToString();
                lblRemoved.Text = drCtpat["Removed"].ToString();
                hfGroupId.Value = drCtpat["CtpatGroupId"].ToString();
                drCtpat.Close();
            }
            if (drCtpat.IsClosed == false)
            {
                drCtpat.Close();
            }

        }
        private bool CheckData(int nmode)
        {
            bool RecordExist = false;
            if (nmode == 1)
            {
                ProcessGetCtpat Ctpat = new ProcessGetCtpat();
                DataSet dsCtpat = Ctpat.GetCtpatByTitle(txtTitle.Text.Trim(), int.Parse(Request.QueryString["GroupId"]));
                if (dsCtpat.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "Ctpat Title already exists.";
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
                ProcessGetCtpat Ctpat = new ProcessGetCtpat();
                DataSet dsCtpat = Ctpat.GetCtpatByTitleAndId(txtTitle.Text, int.Parse(Request.QueryString["CtpatId"]), int.Parse(hfGroupId.Value));
                if (dsCtpat.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "Ctpat Title already exists.";
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
        private bool SaveCtpat(int nType)
        {
            bool status = CheckData(1);
            if (status == true)
            {
                Ctpat newCtpat = new Ctpat();
                newCtpat.Custom = 1;
                newCtpat.KitchenGroupId = int.Parse(Request.QueryString["GroupId"]);

                if (Request.QueryString["CtpatId"] != null)
                {
                    newCtpat.KitchenCtpatId = int.Parse(Request.QueryString["CtpatId"]);
                }
                newCtpat.CtpatTitle = txtTitle.Text;
                //newCtpat.CtpatText = "<table width='650' cellspacing='4' cellpadding='4' border='0'><tbody>" + txtCtpat.Value + "</tbody></table>";
                newCtpat.CtpatText = txtCtpat.Value;
                if (nType == 2)
                {
                    newCtpat.Additional = 1;
                }
                newCtpat.Removed = 0;


                ProcessCreateCtpat createCtpat = new ProcessCreateCtpat();
                createCtpat.Ctpat = newCtpat;
                createCtpat.Invoke();

            }
            return status;
        }
        private bool UpdateCtpat()
        {
            bool status = CheckData(2);
            if (status == true)
            {
                Ctpat newCtpat = new Ctpat();
                if (lblCustomCtpat.Text != "")
                {
                    newCtpat.Custom = int.Parse(lblCustomCtpat.Text);
                }
                else
                {
                    newCtpat.Custom = 0;
                }
                newCtpat.KitchenGroupId = int.Parse(Request.QueryString["GroupId"]);

                if (Request.QueryString["CtpatId"] != null)
                {
                    newCtpat.KitchenCtpatId = int.Parse(Request.QueryString["CtpatId"]);
                }
                newCtpat.CtpatTitle = txtTitle.Text;
                newCtpat.CtpatText = txtCtpat.Value;
                if (lblIsAdditional.Text != "")
                {
                    newCtpat.Additional = int.Parse(lblIsAdditional.Text);
                }
                else
                {
                    newCtpat.Additional = 0;
                }
                if (lblRemoved.Text != "")
                {
                    newCtpat.Removed = int.Parse(lblRemoved.Text);
                }
                ProcessSetCtpat setCtpat = new ProcessSetCtpat();
                setCtpat.Ctpat = newCtpat;
                setCtpat.Invoke();
            }
            return status;
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            string strGroupId = Request.QueryString["GroupId"];
            if (Request.QueryString["Review"] != null)
            {
                Response.Redirect("~/ControlPanel/District/CtpatReview.aspx?GroupId=" + strGroupId);

            }
            else
            {
                Response.Redirect("~/ControlPanel/District/CustomCtpat.aspx?GroupId=" + strGroupId);
            }
        }
    }
}