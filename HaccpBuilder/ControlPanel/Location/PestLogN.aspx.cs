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
//using SchoolHaccp.BusinessLogic;
//using SchoolHaccp.Common;
using DataModel;
using SchoolHaccp.Operational;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class PestLogN : System.Web.UI.Page
    {
        public string Pestmode = "new";
        public DateTime PestcurrentTime = DateTime.Now;
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                PestcurrentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]);
                //cmdBack.Attributes.Add("onclick", "MoveBack( )");
                GetInitialData();
                if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
                {
                    // ItemId = int.Parse(Request.QueryString["Id"]);
                    //Pestmode = "edit";
                    //SetPage();
                    GetData();
                }
                else
                {
                    SetPage();
                }
            }
        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Location/Default.aspx");
        }
        private void GetInitialData()
        {
            cldVerifiedDate.Text = PestcurrentTime.Date.ToShortDateString();
            txtEntryDate.Text = PestcurrentTime.ToString();

        }
        private void GetData()
        {
            //string strCustom;        
            if (Request.QueryString["Id"] != null)
            {

                int nLogId = int.Parse(Request.QueryString["Id"]);
                var log = (from p in context.PestLogs
                           join kca in context.KitchenCorrectiveActions on p.CorrectiveActionID equals kca.CorrectiveActionID into kp
                           from kpa in kp.DefaultIfEmpty()
                           where p.PestLogId == nLogId
                           select new { p, kpa.Name }).FirstOrDefault();


                //    SELECT f.value
                //FROM period as p 
                //LEFT OUTER JOIN facts AS f ON p.id = f.periodid 
                //WHERE p.companyid = 100 AND f.otherid = 17


                //    from p in context.Periods
                //join f in context.Facts on p.id equals f.periodid into fg
                //from fgi in fg.DefaultIfEmpty()
                //where p.companyid == 100 && fgi.otherid == 17
                //select f.value

                cldEntryDate.Text = DateTime.Parse(log.p.EntryDate.ToString()).ToShortDateString();
                if (log.p.IsClean == true)
                    rdbCleanYes.Checked = true;
                else
                    rdbCleanNo.Checked = true;
                ddlInventory.SelectedValue = log.p.ItemID.ToString();
                if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(log.p.EntryDate)) == false)
                {
                    SetPageInEditmode("edit");
                    Lbl_CorrectiveAction1.Text = log.Name;

                    rdlCorrectiveAction1.Visible = false;

                    Lbl_CorrectiveAction1.Visible = true;

                }
                else
                {
                    SetPageInEditmode("new");
                    rdlCorrectiveAction1.Visible = true;

                    Lbl_CorrectiveAction1.Visible = false;

                    rdlCorrectiveAction1.DataBind();

                    for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                    {
                        if (rdlCorrectiveAction1.Items[i].Value == log.p.CorrectiveActionID.ToString())
                        {
                            rdlCorrectiveAction1.Items[i].Selected = true;
                            break;
                        }
                    }

                }

                txtVerifiedBy.Text = log.p.VarifiedBy;
                cldVerifiedDate.Text = DateTime.Parse(log.p.VerifiedDate.ToString()).ToShortDateString();
                Session["PestLogId"] = log.p.PestLogId;

            }
            else
            {
                if (Request.QueryString["date"] != null)
                {
                    DateTime entryDate = DateTime.Parse(Request.QueryString["date"]);
                    PestLog log = (from p in context.PestLogs
                                   where p.EntryDate == entryDate
                                   select p).FirstOrDefault();
                    if (log != null)
                    {
                        cldEntryDate.Text = DateTime.Parse(log.EntryDate.ToString()).ToShortDateString();
                        if (log.IsClean == true)
                            rdbCleanYes.Checked = true;
                        else
                            rdbCleanNo.Checked = true;
                        ddlInventory.SelectedValue = log.ItemID.ToString();
                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Value == log.CorrectiveActionID.ToString())
                            {
                                rdlCorrectiveAction1.Items[i].Selected = true;
                                break;
                            }
                        }
                        txtVerifiedBy.Text = log.VarifiedBy;
                        cldVerifiedDate.Text = DateTime.Parse(log.VerifiedDate.ToString()).ToShortDateString();
                        Session["PestLogId"] = log.PestLogId;
                    }
                }
            }


        }
        private void SetPage()
        {
            if (Pestmode == "new")
            {
                SetPageInEditmode("new");
                //txtVerifiedBy.Text = "";
                //txtVerifiedBy.Text = Session["Initials"].ToString();
                txtVerifiedBy.Text = "";
                cldVerifiedDate.Text = PestcurrentTime.Date.ToString();
                cldEntryDate.Text = PestcurrentTime.Date.ToString();
                rdbCleanYes.Checked = false;
                rdbCleanNo.Checked = false;
                trClearCorrectiveActions.Style.Add("display", "''");
                ddlInventory.Enabled = true;
                rfvInventory.Enabled = true;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                LogError.Text = "";
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                rdlCorrectiveAction1.SelectedIndex = -1;
                rdlCorrectiveAction1.DataBind();
                rdlCorrectiveAction1.Visible = true;
                Lbl_CorrectiveAction1.Visible = false;
                GetInitialData();

            }
            if (Pestmode == "edit")
            {
                SetPageInEditmode("edit");

            }
            grdPest.DataBind();
            ddlInventory.DataBind();
            ddlInventory.Items.Insert(0, "Select Equipment/Inventory");
            ddlInventory.SelectedIndex = 0;

        }
        private void SetPageInEditmode(string type)
        {
            if (type == "new")
            {

                //txtVerifiedBy.Enabled = true;           
                cldVerifiedDate.Enabled = true;
                cldEntryDate.Enabled = true;
                rdbCleanYes.Enabled = true;
                rdbCleanNo.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                // rdbNoItem.Enabled = true;
                LogError.Text = "";
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
            }
            else if (type == "edit")
            {

                txtVerifiedBy.Enabled = false;
                cldVerifiedDate.Enabled = false;
                cldEntryDate.Enabled = false;
                rdbCleanYes.Enabled = false;
                rdbCleanNo.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                ddlInventory.Enabled = false;
                rdlCorrectiveAction1.Enabled = false;
                LogError.Text = "";
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = false;
            }
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (Page.IsValid)
            {
                if (CheckPage())
                {
                    Pestmode = "new";
                    InsertData();
                    SetPage();
                }

            }
        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (Page.IsValid)
            {

                if (CheckPage())
                {
                    Pestmode = "new";
                    SubmitData();
                    SetPage();
                }

            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            Pestmode = "new";
            RemoveData();
            SetPage();
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Pestmode = "new";
            SetPage();

        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            Pestmode = "new";
            SetPage();
        }
        private void InsertData()
        {
            PestLog PestLog = new PestLog();
            PestLog.ServiceDate = DateTime.Parse(cldEntryDate.Text);
            PestLog.ItemID = int.Parse(ddlInventory.SelectedValue);
            PestLog.IsClean = rdbCleanYes.Checked;
            PestLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            PestLog.KitchenId = (int)Session["KitchenId"];
            PestLog.VarifiedBy = txtVerifiedBy.Text;
            PestLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                PestLog.CorrectiveActionID = 0;
            }
            else
            {

                PestLog.CorrectiveActionID = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            PestLog.MobileId = (int)Session["MobileId"];
            context.PestLogs.AddObject(PestLog);
            context.SaveChanges();

        }
        private void SubmitData()
        {
            int LogId = 1;
            if (Request.QueryString["Id"] != null)
            {
                LogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["PestLogId"] != null)
                {
                    LogId = (int)Session["PestLogId"];
                }
            }
            PestLog PestLog = (from p in context.PestLogs
                               where p.PestLogId == LogId
                               select p).FirstOrDefault();

            PestLog.ServiceDate = DateTime.Parse(cldEntryDate.Text);
            PestLog.ItemID = int.Parse(ddlInventory.SelectedValue);
            PestLog.IsClean = rdbCleanYes.Checked;
            PestLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            PestLog.KitchenId = (int)Session["KitchenId"];
            PestLog.VarifiedBy = txtVerifiedBy.Text;
            PestLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                PestLog.CorrectiveActionID = 0;
            }
            else
            {

                PestLog.CorrectiveActionID = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            PestLog.MobileId = (int)Session["MobileId"];
            context.SaveChanges();


        }
        private void RemoveData()
        {

            int logId = int.Parse(Request.QueryString["Id"].ToString());
            PestLog PestLog = (from p in context.PestLogs
                               where p.PestLogId == logId
                               select p).FirstOrDefault();
            context.PestLogs.DeleteObject(PestLog);
            context.SaveChanges();

        }
        private bool CheckPage()
        {

            bool result = false;
            if (rdbCleanNo.Checked == true)
            {
                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                {
                    if (rdlCorrectiveAction1.Items[i].Selected == true)
                    {
                        result = true;
                        break;
                    }
                }
            }
            else
            {
                result = true;
            }
            return result;
        }
        protected void ValidateClean(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            if (rdbCleanNo.Checked == true)
            {
                for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                {
                    if (rdlCorrectiveAction1.Items[i].Selected == true)
                    {
                        nResult = 1;
                        break;
                    }
                }
                if (nResult == 0)
                {
                    args.IsValid = false;
                }
            }


        }
    }
}