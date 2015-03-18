using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataModel;
using SchoolHaccp.BusinessLogic;
using System.Web.UI.HtmlControls;

 public partial class ProcessHazardAnalysis : System.Web.UI.Page
{
     private Entities context = new Entities();
     protected static List<ProcessHazardAnalysisHeader> header;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request.QueryString["ProcessId"] != null)
            {
                int nProcessId = int.Parse(Request.QueryString["ProcessId"]);
                BindHeader(nProcessId);
                var hazard = (from p in context.ProcessHazardAnalysis
                                               where p.ProcessID == nProcessId
                                               select p).FirstOrDefault();
                hfProcessId.Value = nProcessId.ToString();                
                if (hazard != null)
                {
                    int nHazardAnalysisId = hazard.HazardAnalysisID;
                    lblHazardTitle.Text = hazard.Title;
                    hfHazardId.Value = nHazardAnalysisId.ToString();                    
                    BindData(nHazardAnalysisId);                 
                    
                }
            }
        }
    }
    protected void lkbAdd_Click(object sender, EventArgs e)
    {
        hfGroupId.Value = "";
        txtBasisBio.Text = "";
        txtCCPBio.Text = "";
        txtHazardBio.Text = "";
        txtMeasureBio.Text = "";
        txtProcessStep.Text = "";
        txtReasonBio.Text = "";
        txtBasisChem.Text = "";
        txtCCPChem.Text = "";
        txtHazardChem.Text = "";
        txtMeasureChem.Text = "";
        txtReasonChem.Text = "";
        txtBasisPhy.Text = "";
        txtCCPPhy.Text = "";
        txtHazardPhy.Text = "";
        txtMeasurePhy.Text = "";
        txtReasonPhy.Text = "";
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
            //context.ProcessHazardAnalysis.AddObject(analysis);
            //context.SaveChanges();
            //hfHazardId.Value = analysis.HazardAnalysisID.ToString();
            InsertItem();
        }
        else
        {

            UpdateItem(int.Parse(hfGroupId.Value));
        }
        BindData(HazardAnalysisId);
        

    }
    private void BindData(int nHazardAnalysisId)
    {
        List<ProcessHazardAnalysisDetail> details = (from dt in context.ProcessHazardAnalysisDetails
                                                     where dt.HazardAnalysisID == nHazardAnalysisId
                                                     orderby dt.SortOrder
                                                     select dt).ToList();
        hfHazardId.Value = nHazardAnalysisId.ToString();
        if (details.Count > 0)
        {
            hfGroupId.Value = details[0].GroupId.ToString();           
        }
        ViewState["title"] = "";
        //grdHazardAnalysis.DataSource = details;
        //grdHazardAnalysis.DataBind();
        rptHazardAnalysis.DataSource = details;
        rptHazardAnalysis.DataBind();
    }
    private void BindHeader(int nProcessId)
    {
        //header = (from hd in context.ProcessHazardAnalysisHeaders
        //          where hd.HazardAnalysisID == nHazardAnalysisId
        //          select hd).ToList();
        header = new List<ProcessHazardAnalysisHeader>();
        ProcessGetHazardAnalysis hazardAnalysisHeader = new ProcessGetHazardAnalysis();
        DataSet dsHeader = hazardAnalysisHeader.GetHazardAnalysisHeaderByProcessId(nProcessId);
        foreach (DataRow row in dsHeader.Tables[0].Rows)
        {
            ProcessHazardAnalysisHeader Hazardheader = new ProcessHazardAnalysisHeader();
            Hazardheader.ColID = int.Parse(row["ColID"].ToString());
            Hazardheader.ColValue = row["ColValue"].ToString();
            Hazardheader.HazardAnalysisID = int.Parse(row["HazardAnalysisID"].ToString());
            Hazardheader.HazardAnalysisHeaderId = int.Parse(row["HazardAnalysisHeaderId"].ToString());
            header.Add(Hazardheader);
        }
    }
    private void InsertItem()
    {
        int maxGroupId, maxSort;
        var GroupId = from ad in context.ProcessHazardAnalysisDetails
                      where ad.HazardAnalysisID == HazardAnalysisId
                       select ad.GroupId;
        if (GroupId.Count() > 0)
        {
            maxGroupId = (int)GroupId.Max();
            maxGroupId += 1;
        }
        else
        {
            maxGroupId = 1;
        }
        var Sort = from ad in context.ProcessHazardAnalysisDetails
                   where ad.HazardAnalysisID == HazardAnalysisId
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
        
        hfGroupId.Value = maxGroupId.ToString();
        ProcessHazardAnalysisDetail analysisDetail1 = new ProcessHazardAnalysisDetail();
        GetFormValues(analysisDetail1, 1);
        analysisDetail1.SortOrder = maxSort;
        context.ProcessHazardAnalysisDetails.AddObject(analysisDetail1);

        ProcessHazardAnalysisDetail analysisDetail2 = new ProcessHazardAnalysisDetail();
        GetFormValues(analysisDetail2, 2);
        analysisDetail2.SortOrder = maxSort;
        context.ProcessHazardAnalysisDetails.AddObject(analysisDetail2);

        ProcessHazardAnalysisDetail analysisDetail3 = new ProcessHazardAnalysisDetail();
        GetFormValues(analysisDetail3, 3);
        analysisDetail3.SortOrder = maxSort;
        context.ProcessHazardAnalysisDetails.AddObject(analysisDetail3);
        context.SaveChanges();
        
    }
    private void GetFormValues(ProcessHazardAnalysisDetail analysisDetail, int Category)
    {
        
        /////////////// Biological Hazard //////////////////////
        if (Category == 1)
        {
            analysisDetail.Basis = txtBasisBio.Text;
            analysisDetail.CategoryID = 1;
            analysisDetail.CCP = txtCCPBio.Text;
            analysisDetail.FoodSafetyHazard = txtHazardBio.Text;
            analysisDetail.Measures = txtMeasureBio.Text;
            analysisDetail.ProcessStep = txtProcessStep.Text;
            analysisDetail.Reason = txtReasonBio.Text;
            analysisDetail.HazardAnalysisID = int.Parse(hfHazardId.Value);
            analysisDetail.GroupId = int.Parse(hfGroupId.Value);
        }
        /////////////// Chemical Hazard ////////////////////////
        if (Category == 2)
        {
            analysisDetail.Basis = txtBasisChem.Text;
            analysisDetail.CategoryID = 2;
            analysisDetail.CCP = txtCCPChem.Text;
            analysisDetail.FoodSafetyHazard = txtHazardChem.Text;
            analysisDetail.Measures = txtMeasureChem.Text;
            //analysisDetail.ProcessStep = txtProcessStep.Text;
            analysisDetail.Reason = txtReasonChem.Text;
            analysisDetail.HazardAnalysisID = int.Parse(hfHazardId.Value);
            analysisDetail.GroupId = int.Parse(hfGroupId.Value);
        }
        /////////////// Physical Hazard ////////////////////////
        if (Category == 3)
        {
            analysisDetail.Basis = txtBasisPhy.Text;
            analysisDetail.CategoryID = 3;
            analysisDetail.CCP = txtCCPPhy.Text;
            analysisDetail.FoodSafetyHazard = txtHazardPhy.Text;
            analysisDetail.Measures = txtMeasurePhy.Text;
            //analysisDetail.ProcessStep = txtProcessStep.Text;
            analysisDetail.Reason = txtReasonPhy.Text;
            analysisDetail.HazardAnalysisID = int.Parse(hfHazardId.Value);
            analysisDetail.GroupId = int.Parse(hfGroupId.Value);
        }
    }
    private void FillForm(ProcessHazardAnalysisDetail analysisDetail, int Category)
    {
        /////////////// Biological Hazard //////////////////////
        if (Category == 1)
        {
            txtBasisBio.Text = analysisDetail.Basis ;            
            txtCCPBio.Text = analysisDetail.CCP ;
            txtHazardBio.Text = analysisDetail.FoodSafetyHazard ;
            txtMeasureBio.Text = analysisDetail.Measures ;
            txtProcessStep.Text = analysisDetail.ProcessStep ;
            txtReasonBio.Text = analysisDetail.Reason ;
            hfHazardId.Value = analysisDetail.HazardAnalysisID.ToString();
            lblTitle.Text = lblHazardTitle.Text;
        }
        /////////////// Chemical Hazard //////////////////////
        if (Category == 2)
        {
            txtBasisChem.Text = analysisDetail.Basis;
            txtCCPChem.Text = analysisDetail.CCP;
            txtHazardChem.Text = analysisDetail.FoodSafetyHazard;
            txtMeasureChem.Text = analysisDetail.Measures;           
            txtReasonChem.Text = analysisDetail.Reason;
        }
        /////////////// Physical Hazard //////////////////////
        if (Category == 3)
        {
            txtBasisPhy.Text = analysisDetail.Basis;
            txtCCPPhy.Text = analysisDetail.CCP;
            txtHazardPhy.Text = analysisDetail.FoodSafetyHazard;
            txtMeasurePhy.Text = analysisDetail.Measures;           
            txtReasonPhy.Text = analysisDetail.Reason;
        }
    }
    private void UpdateItem(int nGroupId)
    {
        ProcessHazardAnalysisDetail analysisDetail1 = (from ad in context.ProcessHazardAnalysisDetails
                                                       where ad.GroupId == nGroupId && ad.CategoryID == 1 && ad.HazardAnalysisID == HazardAnalysisId
                                                       select ad).FirstOrDefault();       
        GetFormValues(analysisDetail1, 1);

        ProcessHazardAnalysisDetail analysisDetail2 = (from ad in context.ProcessHazardAnalysisDetails
                                                       where ad.GroupId == nGroupId && ad.CategoryID == 2 && ad.HazardAnalysisID == HazardAnalysisId
                                                      select ad).FirstOrDefault();
        GetFormValues(analysisDetail2, 2);
        ProcessHazardAnalysisDetail analysisDetail3 = (from ad in context.ProcessHazardAnalysisDetails
                                                       where ad.GroupId == nGroupId && ad.CategoryID == 3 && ad.HazardAnalysisID == HazardAnalysisId
                                                      select ad).FirstOrDefault();
        GetFormValues(analysisDetail3, 3);

        context.SaveChanges();

    }
    private void DeleteItem(int nGroupId)
    {
        List<ProcessHazardAnalysisDetail> details = (from dt in context.ProcessHazardAnalysisDetails
                                                    where dt.GroupId == nGroupId
                                                    select dt).ToList();
        foreach (ProcessHazardAnalysisDetail item in details)
        {
            context.ProcessHazardAnalysisDetails.DeleteObject(item);
            context.SaveChanges();
        }        
    }
    private void UpdateSortOrder(int nGroupId, int nDirection)
    {
        int nHazardAnalysisId = int.Parse(hfHazardId.Value);
        List<ProcessHazardAnalysisDetail> analysisDetail1 = (from ad in context.ProcessHazardAnalysisDetails
                                                       where ad.HazardAnalysisID == nHazardAnalysisId && ad.GroupId == nGroupId 
                                                       select ad).ToList();
        List<ProcessHazardAnalysisDetail> analysisDetail2;
        int nSortOrder = analysisDetail1[0].SortOrder;
        int newSortOrder;
        if (nDirection == 1)
        {
            newSortOrder = nSortOrder - 1;           
            
        }
        else
        {
            newSortOrder = nSortOrder + 1;            
        }
        analysisDetail2 = (from ad in context.ProcessHazardAnalysisDetails
                           where ad.HazardAnalysisID == nHazardAnalysisId && ad.SortOrder == newSortOrder
                           select ad).ToList();
        foreach (ProcessHazardAnalysisDetail item in analysisDetail1)
        {
            item.SortOrder = newSortOrder;
            context.SaveChanges();
        }
        foreach (ProcessHazardAnalysisDetail item in analysisDetail2)
        {
            item.SortOrder = nSortOrder;
            context.SaveChanges();
        }           

        
    }
    //protected void grdHazardAnalysis_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName != "Page")
    //    {
    //        GridViewRow row;           
    //        row =  (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);           
    //        int nTotalRecords = grdHazardAnalysis.Rows.Count;
            
    //        int nGroupId = int.Parse(e.CommandArgument.ToString());
    //        if (e.CommandName == "Edit")
    //        {
    //            hfGroupId.Value = e.CommandArgument.ToString();                
    //            ProcessHazardAnalysisDetail analysisDetail1 = (from ad in context.ProcessHazardAnalysisDetails
    //                                                           where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 1
    //                                                           select ad).FirstOrDefault();
    //            FillForm(analysisDetail1, 1);

    //            ProcessHazardAnalysisDetail analysisDetail2 = (from ad in context.ProcessHazardAnalysisDetails
    //                                                           where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 2
    //                                                           select ad).FirstOrDefault();
    //            FillForm(analysisDetail2, 2);
    //            ProcessHazardAnalysisDetail analysisDetail3 = (from ad in context.ProcessHazardAnalysisDetails
    //                                                           where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 3
    //                                                           select ad).FirstOrDefault();
    //            FillForm(analysisDetail3, 3);
    //            ModalPopupExtender1.PopupControlID = "divPopup";
    //            ModalPopupExtender1.Show();

    //        }
    //        if (e.CommandName == "Remove")
    //        {                
    //            DeleteItem(nGroupId);
    //            BindData(HazardAnalysisId);
    //        }
    //        if (e.CommandName == "Up" && (grdHazardAnalysis.Rows.Count > 1 && row.RowIndex > 0))
    //        {                
    //            UpdateSortOrder(nGroupId, 1);
    //            BindData(HazardAnalysisId);

    //        }
    //        //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
    //        if (e.CommandName == "Down" && (grdHazardAnalysis.Rows.Count > 1 && row.RowIndex < nTotalRecords - 1))
    //        {                
    //            UpdateSortOrder(nGroupId, 2);
    //            BindData(HazardAnalysisId);
    //        }
    //    }
    //}
    protected void grdHazardAnalysis_RowEditing(object sender, GridViewEditEventArgs e)
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
        ProcessHazardAnalysi hazard = (from hz in context.ProcessHazardAnalysis
                                       where hz.HazardAnalysisID == HazardAnalysisId
                                       select hz).FirstOrDefault();
        hazard.Title = txtHazardTitle.Text;
        context.SaveChanges();

        foreach (ProcessHazardAnalysisHeader head in header)
        {
            int HeaderId;           
            HeaderId = head.HazardAnalysisHeaderId;
            ProcessHazardAnalysisHeader headOld = (from hd in context.ProcessHazardAnalysisHeaders
                                                   where hd.HazardAnalysisHeaderId == HeaderId
                                                   select hd).FirstOrDefault();
            headOld.ColValue = head.ColValue;
            //context.Attach(head);
            context.SaveChanges();
        }
        BindHeader(HazardAnalysisId);
        BindData(HazardAnalysisId);
    }
    private int HazardAnalysisId
    { get { return int.Parse(hfHazardId.Value); } }

    //protected void grdHazardAnalysis_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        HiddenField hfGroupId = (HiddenField)e.Row.FindControl("hfGroupItemId");            
    //        ImageButton cmdEdit = (ImageButton)e.Row.FindControl("lkbEdit");
    //        ImageButton cmddelete = (ImageButton)e.Row.FindControl("lkbDelete");
    //        ImageButton cmdUp = (ImageButton)e.Row.FindControl("lkbUp");
    //        ImageButton cmddown = (ImageButton)e.Row.FindControl("lkbDown");
    //        GridViewRow prevRow;            

    //        string strval = hfGroupId.Value;            
    //        string title = (string)ViewState["title"];
    //        e.Row.Cells[0].BorderStyle = BorderStyle.None;           
    //        if (title == strval)
    //        {
    //            cmdEdit.Visible = false;               
    //            cmddelete.Visible = false;
    //            cmddown.Visible = false;
    //            cmdUp.Visible = false;
    //            prevRow = grdHazardAnalysis.Rows[e.Row.RowIndex - 1];
    //            System.Drawing.Color bgColor = prevRow.BackColor;
    //            e.Row.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
               
    //        }
    //        else
    //        {
    //            title = strval;
    //            ViewState["title"] = title;
    //            if (e.Row.RowIndex < 1)
    //            {
    //                ViewState["bgColor"] = hfBackGroundColor.Value;
    //                e.Row.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
    //            }
    //            else
    //            {
    //                if ((string)ViewState["bgColor"] == "White")
    //                {
    //                    ViewState["bgColor"] = "LightGray";
    //                    e.Row.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
    //                }
    //                else
    //                {
    //                    ViewState["bgColor"] = "White";
    //                    e.Row.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
    //                }
    //            }                
    //            cmdEdit.Visible = true;
    //            cmddelete.Visible = true;
    //            cmddown.Visible = true;
    //            cmdUp.Visible = true;
    //        }
    //    }
    //}

    protected void lkbCancel_Click(object sender, EventArgs e)
    {
        string strURL = "~/ControlPanel/District/EditProcess.aspx?Mode=3&ProcessId=" + int.Parse(Request.QueryString["ProcessId"]) + "&GroupId=" + Request.QueryString["GroupId"];
        Response.Redirect(strURL);
    }

    protected void rptHazardAnalysis_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            //GridViewRow row;
            //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            RepeaterItem row = (RepeaterItem)(((ImageButton)e.CommandSource).NamingContainer);
            int nTotalRecords = rptHazardAnalysis.Items.Count;

            int nGroupId = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "Edit")
            {
                hfGroupId.Value = e.CommandArgument.ToString();
                ProcessHazardAnalysisDetail analysisDetail1 = (from ad in context.ProcessHazardAnalysisDetails
                                                               where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 1
                                                               select ad).FirstOrDefault();
                FillForm(analysisDetail1, 1);

                ProcessHazardAnalysisDetail analysisDetail2 = (from ad in context.ProcessHazardAnalysisDetails
                                                               where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 2
                                                               select ad).FirstOrDefault();
                FillForm(analysisDetail2, 2);
                ProcessHazardAnalysisDetail analysisDetail3 = (from ad in context.ProcessHazardAnalysisDetails
                                                               where ad.HazardAnalysisID == HazardAnalysisId && ad.GroupId == nGroupId && ad.CategoryID == 3
                                                               select ad).FirstOrDefault();
                FillForm(analysisDetail3, 3);
                ModalPopupExtender1.PopupControlID = "divPopup";
                ModalPopupExtender1.Show();

            }
            if (e.CommandName == "Remove")
            {
                DeleteItem(nGroupId);
                BindData(HazardAnalysisId);
            }
            if (e.CommandName == "Up" && (rptHazardAnalysis.Items.Count > 1 && row.ItemIndex > 0))
            {
                UpdateSortOrder(nGroupId, 1);
                BindData(HazardAnalysisId);

            }
            //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            if (e.CommandName == "Down" && (rptHazardAnalysis.Items.Count > 1 && row.ItemIndex < nTotalRecords - 1))
            {
                UpdateSortOrder(nGroupId, 2);
                BindData(HazardAnalysisId);
            }
        }
    }

    protected void rptHazardAnalysis_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            HiddenField hfGroupId = (HiddenField)e.Item.FindControl("hfGroupItemId");
            ImageButton cmdEdit = (ImageButton)e.Item.FindControl("lkbEdit");
            ImageButton cmddelete = (ImageButton)e.Item.FindControl("lkbDelete");
            ImageButton cmdUp = (ImageButton)e.Item.FindControl("lkbUp");
            ImageButton cmddown = (ImageButton)e.Item.FindControl("lkbDown");
            RepeaterItem prevItem;
            HtmlTableRow row = (HtmlTableRow)e.Item.FindControl("itemPanel");
            string strval = hfGroupId.Value;
            string title = (string)ViewState["title"];
            //e.Item.Cells[0].BorderStyle = BorderStyle.None;
            if (title == strval)
            {
                cmdEdit.Visible = false;
                cmddelete.Visible = false;
                cmddown.Visible = false;
                cmdUp.Visible = false;
                prevItem = rptHazardAnalysis.Items[e.Item.ItemIndex - 1];
                //System.Drawing.Color bgColor = prevItem.BackColor;
                //e.Item.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
                row.Style[HtmlTextWriterStyle.BackgroundColor] = (string)ViewState["bgColor"];
                
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                if (e.Item.ItemIndex < 1)
                {
                    ViewState["bgColor"] = hfBackGroundColor.Value;
                   // e.Item.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
                    row.Style[HtmlTextWriterStyle.BackgroundColor] = (string)ViewState["bgColor"];
                }
                else
                {
                    if ((string)ViewState["bgColor"] == "White")
                    {
                        ViewState["bgColor"] = "LightGray";
                       // e.Item.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
                        row.Style[HtmlTextWriterStyle.BackgroundColor] = (string)ViewState["bgColor"];
                    }
                    else
                    {
                        ViewState["bgColor"] = "White";
                       // e.Item.BackColor = System.Drawing.Color.FromName((string)ViewState["bgColor"]);
                        row.Style[HtmlTextWriterStyle.BackgroundColor] = (string)ViewState["bgColor"];
                    }
                }
                cmdEdit.Visible = true;
                cmddelete.Visible = true;
                cmddown.Visible = true;
                cmdUp.Visible = true;
            }
        }
    }

   
}
