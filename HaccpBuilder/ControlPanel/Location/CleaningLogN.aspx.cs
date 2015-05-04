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
    public partial class CleaningLogN : System.Web.UI.Page
    {
        public string Cleaningmode = "new";
        public DateTime CleaningcurrentTime = DateTime.Now;
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                CleaningcurrentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]);
                //cmdBack.Attributes.Add("onclick", "MoveBack( )");
                GetInitialData();
                if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
                {
                    // ItemId = int.Parse(Request.QueryString["Id"]);
                    //Cleaningmode = "edit";
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
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            cldVerifiedDate.Text = CleaningcurrentTime.Date.ToShortDateString();
            txtEntryDate.Text = CleaningcurrentTime.ToString();

        }
        private void GetData()
        {
            //string strCustom;        
            if (Request.QueryString["Id"] != null)
            {

                int nLogId = int.Parse(Request.QueryString["Id"]);
                var log = (from p in context.CleaningLogs
                           join kca in context.KitchenCorrectiveActions on p.CorrectiveActionID equals kca.CorrectiveActionID into kp
                           from kpa in kp.DefaultIfEmpty()
                           where p.CleaningLogId == nLogId
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

                cldEntryDate.Text = log.p.ServiceDate.ToShortDateString();
                if (log.p.IsClean == true)
                    rdbCorrectYes.Checked = true;
                else
                    rdbCorrectNo.Checked = true;
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
                txtComments.Text = log.p.Comments;
                txtEntryDate.Text = log.p.EntryDate.ToString();
                cldVerifiedDate.Text = DateTime.Parse(log.p.VerifiedDate.ToString()).ToShortDateString();
                ddlSenitizer.SelectedValue = log.p.SolventID.ToString();
                txtSanitizer.Text = log.p.SanitizerStrength;
                Session["CleaningLogId"] = log.p.CleaningLogId;

            }
            else
            {
                if (Request.QueryString["date"] != null)
                {
                    DateTime entryDate = DateTime.Parse(Request.QueryString["date"]);
                    var log = (from p in context.CleaningLogs
                               join kca in context.KitchenCorrectiveActions on p.CorrectiveActionID equals kca.CorrectiveActionID into kp
                               from kpa in kp.DefaultIfEmpty()
                               where p.ServiceDate == entryDate
                               select new { p, kpa.Name }).FirstOrDefault();
                    if (log != null)
                    {
                        cldEntryDate.Text = DateTime.Parse(log.p.ServiceDate.ToString()).ToShortDateString();
                        if (log.p.IsClean == true)
                            rdbCorrectYes.Checked = true;
                        else
                            rdbCorrectNo.Checked = true;
                        ddlInventory.SelectedValue = log.p.ItemID.ToString();
                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Value == log.p.CorrectiveActionID.ToString())
                            {
                                rdlCorrectiveAction1.Items[i].Selected = true;
                                break;
                            }
                        }
                        txtVerifiedBy.Text = log.p.VarifiedBy;
                        txtComments.Text = log.p.Comments;
                        txtEntryDate.Text = log.p.EntryDate.ToString();
                        ddlSenitizer.SelectedValue = log.p.SolventID.ToString();
                        txtSanitizer.Text = log.p.SanitizerStrength;
                        cldVerifiedDate.Text = DateTime.Parse(log.p.VerifiedDate.ToString()).ToShortDateString();
                        Session["CleaningLogId"] = log.p.CleaningLogId;
                    }
                }
            }


        }
        private void SetPage()
        {
            if (Cleaningmode == "new")
            {
                SetPageInEditmode("new");
                //txtVerifiedBy.Text = Session["Initials"].ToString();
                txtVerifiedBy.Text = "";
                cldVerifiedDate.Text = CleaningcurrentTime.Date.ToShortDateString();
                cldEntryDate.Text = CleaningcurrentTime.Date.ToShortDateString();
                rdbCorrectYes.Checked = true;
                rdbCorrectNo.Checked = false;
                trClearCorrectiveActions.Style.Add("display", "''");
                ddlInventory.Enabled = true;
                rfvInventory.Enabled = true;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                LogError.Text = "";
                txtComments.Text = "";
                txtComments.Enabled = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;
                rdlCorrectiveAction1.SelectedIndex = -1;
                rdlCorrectiveAction1.DataBind();
                rdlCorrectiveAction1.Visible = true;
                Lbl_CorrectiveAction1.Visible = false;
                rdlCorrectiveAction1.Enabled = true;
                ddlSenitizer.Enabled = true;
                txtSanitizer.Text = "";
                GetInitialData();

            }
            if (Cleaningmode == "edit")
            {
                SetPageInEditmode("edit");

            }
            grdCleaning.DataBind();
            ddlInventory.DataBind();
            ddlSenitizer.DataBind();
            ddlSenitizer.Items.Insert(0, "Select Cleaning Solutions/Sanitizers");
            ddlSenitizer.SelectedIndex = 0;
            ddlInventory.Items.Insert(0, "Select Equipment/Inventory");
            ddlInventory.SelectedIndex = 0;

        }
        private void SetPageInEditmode(string type)
        {
            if (type == "new")
            {

                txtVerifiedBy.Enabled = true;
                cldVerifiedDate.Enabled = true;
                cldEntryDate.Enabled = true;
                rdbCorrectYes.Enabled = true;
                rdbCorrectNo.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                ddlSenitizer.Enabled = true;
                txtSanitizer.Enabled = true;
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
                rdbCorrectYes.Enabled = false;
                rdbCorrectNo.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                ddlInventory.Enabled = false;
                rdlCorrectiveAction1.Enabled = false;
                LogError.Text = "";
                txtComments.Enabled = false;
                ddlSenitizer.Enabled = false;
                txtSanitizer.Enabled = false;
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
                    Cleaningmode = "new";
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
                    Cleaningmode = "new";
                    SubmitData();
                    SetPage();
                }

            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            Cleaningmode = "new";
            RemoveData();
            SetPage();
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Cleaningmode = "new";
            SetPage();

        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            Cleaningmode = "new";
            SetPage();
        }
        private void InsertData()
        {
            CleaningLog CleaningLog = new CleaningLog();
            CleaningLog.ServiceDate = DateTime.Parse(cldEntryDate.Text);
            CleaningLog.ItemID = int.Parse(ddlInventory.SelectedValue);
            CleaningLog.IsClean = rdbCorrectYes.Checked;
            CleaningLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            CleaningLog.KitchenId = (int)Session["KitchenId"];
            CleaningLog.VarifiedBy = txtVerifiedBy.Text;
            CleaningLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            CleaningLog.Comments = txtComments.Text;
            CleaningLog.SolventID = int.Parse(ddlSenitizer.SelectedValue);
            CleaningLog.SanitizerStrength = txtSanitizer.Text;

            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                CleaningLog.CorrectiveActionID = 0;
            }
            else
            {

                CleaningLog.CorrectiveActionID = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            CleaningLog.MobileId = (int)Session["MobileId"];
            context.CleaningLogs.AddObject(CleaningLog);
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
                if (Session["CleaningLogId"] != null)
                {
                    LogId = (int)Session["CleaningLogId"];
                }
            }
            CleaningLog CleaningLog = (from p in context.CleaningLogs
                                       where p.CleaningLogId == LogId
                                       select p).FirstOrDefault();

            CleaningLog.ServiceDate = DateTime.Parse(cldEntryDate.Text);
            CleaningLog.ItemID = int.Parse(ddlInventory.SelectedValue);
            CleaningLog.IsClean = rdbCorrectYes.Checked;
            CleaningLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            CleaningLog.KitchenId = (int)Session["KitchenId"];
            CleaningLog.VarifiedBy = txtVerifiedBy.Text;
            CleaningLog.VerifiedDate = DateTime.Parse(cldVerifiedDate.Text);
            CleaningLog.Comments = txtComments.Text;
            CleaningLog.SolventID = int.Parse(ddlSenitizer.SelectedValue);
            CleaningLog.SanitizerStrength = txtSanitizer.Text;
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                CleaningLog.CorrectiveActionID = 0;
            }
            else
            {

                CleaningLog.CorrectiveActionID = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            CleaningLog.MobileId = (int)Session["MobileId"];
            context.SaveChanges();


        }
        private void RemoveData()
        {

            int logId = int.Parse(Request.QueryString["Id"].ToString());
            CleaningLog CleaningLog = (from p in context.CleaningLogs
                                       where p.CleaningLogId == logId
                                       select p).FirstOrDefault();
            context.CleaningLogs.DeleteObject(CleaningLog);
            context.SaveChanges();

        }
        private bool CheckPage()
        {

            bool result = false;
            if (rdbCorrectNo.Checked == true)
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
        protected void ValidateCorrect(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            if (rdbCorrectNo.Checked == true)
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