using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataModel;
using SchoolHaccp.BusinessLogic;


namespace HaccpBuilder.ControlPanel.District
{
    public partial class ProcessHaccpPlan : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected static List<ProcessHaccpCategoryHeader> header;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["ProcessId"] != null)
                {
                    int nProcessId = int.Parse(Request.QueryString["ProcessId"]);
                    BindHeader(nProcessId);
                    var hazard = (from p in context.ProcessHaccpCategories
                                  where p.ProcessID == nProcessId
                                  select p).FirstOrDefault();
                    hfProcessId.Value = nProcessId.ToString();
                    if (hazard != null)
                    {
                        int nHaccpCategoryId = hazard.HaccpCategoryID;
                        lblHazardTitle.Text = hazard.Title;
                        hfHaccpCategoryId.Value = nHaccpCategoryId.ToString();
                        BindData(nHaccpCategoryId);

                    }
                }
            }
        }
        protected void lkbAdd_Click(object sender, EventArgs e)
        {
            hfGroupId.Value = "";
            txtHaccpRecords.Text = "";
            txtCorrectiveActions.Text = "";
            txtCriticalLimits.Text = "";
            txtMonitoring.Text = "";
            txtCCP.Text = "";
            txtVerification.Text = "";
            ModalPopupExtender1.PopupControlID = "divPopup";
            ModalPopupExtender1.Show();
        }
        protected void cmdGo_Click(object sender, EventArgs e)
        {
            if (hfGroupId.Value == "")
            {
                //ProcessHazardAnalysi analysis = new ProcessHazardAnalysi();
                //analysis.ProcessID = int.Parse(hfProcessId.Value);
                //analysis.Title = txtTitle.Text;
                //context.ProcessHaccpCategory.AddObject(analysis);
                //context.SaveChanges();
                //hfHaccpCategoryId.Value = analysis.HaccpCategoryID.ToString();
                InsertItem();
            }
            else
            {

                UpdateItem(int.Parse(hfGroupId.Value));
            }
            BindData(HaccpCategoryId);


        }
        private void BindData(int nHaccpCategoryId)
        {
            List<ProcessHaccpCategoryDetail> details = (from dt in context.ProcessHaccpCategoryDetails
                                                         where dt.HaccpCategoryID == nHaccpCategoryId
                                                         orderby dt.SortOrder
                                                         select dt).ToList();
            hfHaccpCategoryId.Value = nHaccpCategoryId.ToString();                           
            ViewState["title"] = "";
            grdHaccpCategory.DataSource = details;
            grdHaccpCategory.DataBind();
           
        }
        private void BindHeader(int nProcessId)
        {
            //header = (from hd in context.ProcessHaccpCategoryHeaders
            //          where hd.HaccpCategoryID == nHaccpCategoryId
            //          select hd).ToList();
            header = new List<ProcessHaccpCategoryHeader>();
            ProcessGetProcessHaccpCategory HaccpCategoryHeader = new ProcessGetProcessHaccpCategory();
            DataSet dsHeader = HaccpCategoryHeader.GetHaccpCategoryHeaderByProcessId(nProcessId);
            foreach (DataRow row in dsHeader.Tables[0].Rows)
            {
                ProcessHaccpCategoryHeader Hazardheader = new ProcessHaccpCategoryHeader();
                Hazardheader.ColID = int.Parse(row["ColID"].ToString());
                Hazardheader.ColValue = row["ColValue"].ToString();
                Hazardheader.HaccpCategoryID = int.Parse(row["HaccpCategoryID"].ToString());
                Hazardheader.HaccpCategoryHeaderId = int.Parse(row["HaccpCategoryHeaderId"].ToString());
                header.Add(Hazardheader);
            }
        }
        private void InsertItem()
        {
            int maxSort;           
            var Sort = from ad in context.ProcessHaccpCategoryDetails
                       where ad.HaccpCategoryID == HaccpCategoryId
                       select ad.SortOrder;
            if (Sort.Count() > 0)
            {
                maxSort = (int)Sort.Max();
                maxSort += 1;
            }
            else
            {
                maxSort = 1;
            }            
            ProcessHaccpCategoryDetail analysisDetail = new ProcessHaccpCategoryDetail();
            GetFormValues(analysisDetail, 1);
            analysisDetail.SortOrder = maxSort;
            context.ProcessHaccpCategoryDetails.AddObject(analysisDetail);           
            context.SaveChanges();

        }
        private void GetFormValues(ProcessHaccpCategoryDetail analysisDetail, int Category)
        {

            analysisDetail.HaccpRecords = txtHaccpRecords.Text;
            analysisDetail.CorrectiveActions = txtCorrectiveActions.Text;
            analysisDetail.CCP = txtCCP.Text;
            analysisDetail.CriticalLimits = txtCriticalLimits.Text;
            analysisDetail.Monitoring = txtMonitoring.Text;
            analysisDetail.CCP = txtCCP.Text;
            analysisDetail.Verification = txtVerification.Text;
            analysisDetail.HaccpCategoryID = int.Parse(hfHaccpCategoryId.Value);
        }  
            
           
        
        private void FillForm(ProcessHaccpCategoryDetail analysisDetail, int Category)
        {            
                txtHaccpRecords.Text = analysisDetail.HaccpRecords;
                txtCorrectiveActions.Text = analysisDetail.CorrectiveActions;
                txtCriticalLimits.Text = analysisDetail.CriticalLimits;
                txtMonitoring.Text = analysisDetail.Monitoring;
                txtCCP.Text= analysisDetail.CCP;
                txtVerification.Text = analysisDetail.Verification;
                analysisDetail.Verification = txtVerification.Text;                             
                hfHaccpCategoryId.Value = analysisDetail.HaccpCategoryID.ToString();
                lblTitle.Text = lblHazardTitle.Text;
            
        }
        private void UpdateItem(int nGroupId)
        {
            ProcessHaccpCategoryDetail analysisDetail = (from ad in context.ProcessHaccpCategoryDetails
                                                         where ad.ID == nGroupId
                                                           select ad).FirstOrDefault();
            GetFormValues(analysisDetail, 1);           
            context.SaveChanges();
        }
        private void DeleteItem(int nGroupId)
        {
            ProcessHaccpCategoryDetail details = (from dt in context.ProcessHaccpCategoryDetails
                                                  where dt.ID == nGroupId
                                                         select dt).FirstOrDefault();            
                context.ProcessHaccpCategoryDetails.DeleteObject(details);
                context.SaveChanges();
            
        }
        private void UpdateSortOrder(int nHaccpCategoryId, int nDirection)
        {            
            ProcessHaccpCategoryDetail analysisDetail1 = (from ad in context.ProcessHaccpCategoryDetails
                                                          where ad.ID == nHaccpCategoryId
                                                          select ad).FirstOrDefault();
            ProcessHaccpCategoryDetail analysisDetail2;
            int nSortOrder = analysisDetail1.SortOrder;
            int newSortOrder;
            if (nDirection == 1)
            {
                newSortOrder = nSortOrder - 1;

            }
            else
            {
                newSortOrder = nSortOrder + 1;
            }
            analysisDetail2 = (from ad in context.ProcessHaccpCategoryDetails
                               where ad.SortOrder == newSortOrder && ad.HaccpCategoryID == HaccpCategoryId
                               select ad).FirstOrDefault();           
                analysisDetail1.SortOrder = newSortOrder;               
                analysisDetail2.SortOrder = nSortOrder;
                context.SaveChanges();            
        }
        protected void grdHaccpCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                GridViewRow row;
                row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                int nTotalRecords = grdHaccpCategory.Rows.Count;

                int nGroupId = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "Edit")
                {
                    hfGroupId.Value = e.CommandArgument.ToString();
                    ProcessHaccpCategoryDetail analysisDetail = (from ad in context.ProcessHaccpCategoryDetails
                                                                   where ad.ID  == nGroupId 
                                                                   select ad).FirstOrDefault();
                    FillForm(analysisDetail, 1);
                    ModalPopupExtender1.PopupControlID = "divPopup";
                    ModalPopupExtender1.Show();

                }
                if (e.CommandName == "Remove")
                {
                    DeleteItem(nGroupId);
                    BindData(HaccpCategoryId);
                }
                if (e.CommandName == "Up" && (grdHaccpCategory.Rows.Count > 1 && row.RowIndex > 0))
                {
                    UpdateSortOrder(nGroupId, 1);
                    BindData(HaccpCategoryId);

                }
                //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                if (e.CommandName == "Down" && (grdHaccpCategory.Rows.Count > 1 && row.RowIndex < nTotalRecords - 1))
                {
                    UpdateSortOrder(nGroupId, 2);
                    BindData(HaccpCategoryId);
                }
            }
        }
        protected void grdHaccpCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void lkbEditHeader_Click(object sender, EventArgs e)
        {
            txtHazardTitle.Text = lblHazardTitle.Text;

            ModalPopupExtender1.PopupControlID = "divPopupHeader";
            txtCol1.Text = header[0].ColValue;
            txtCol2.Text = header[1].ColValue;
            txtCol3.Text = header[2].ColValue;
            txtCol4.Text = header[3].ColValue;
            txtCol5.Text = header[4].ColValue;
            txtCol6.Text = header[5].ColValue;
            ModalPopupExtender1.Show();
        }
        protected void cmdSubmitHeader_Click(object sender, EventArgs e)
        {
            header[0].ColValue = txtCol1.Text;
            header[1].ColValue = txtCol2.Text;
            header[2].ColValue = txtCol3.Text;
            header[3].ColValue = txtCol4.Text;
            header[4].ColValue = txtCol5.Text;
            header[5].ColValue = txtCol6.Text;
            ProcessHaccpCategory hazard = (from hz in context.ProcessHaccpCategories
                                           where hz.HaccpCategoryID == HaccpCategoryId
                                           select hz).FirstOrDefault();
            hazard.Title = txtHazardTitle.Text;
            context.SaveChanges();

            foreach (ProcessHaccpCategoryHeader head in header)
            {
                int HeaderId;
                HeaderId = head.HaccpCategoryHeaderId;
                ProcessHaccpCategoryHeader headOld = (from hd in context.ProcessHaccpCategoryHeaders
                                                       where hd.HaccpCategoryHeaderId == HeaderId
                                                       select hd).FirstOrDefault();
                headOld.ColValue = head.ColValue;
                //context.Attach(head);
                context.SaveChanges();
            }
            BindHeader(HaccpCategoryId);

        }
        private int HaccpCategoryId
        { get { return int.Parse(hfHaccpCategoryId.Value); } }

        protected void lkbCancel_Click(object sender, EventArgs e)
        {            
            string strURL = "~/ControlPanel/District/EditProcess.aspx?Mode=3&ProcessId=" + int.Parse(Request.QueryString["ProcessId"]) + "&GroupId=" + Request.QueryString["GroupId"];
            Response.Redirect(strURL);
        }
        
    }
}