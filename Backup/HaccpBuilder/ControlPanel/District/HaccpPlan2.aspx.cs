using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using System.Web.UI;
using DataModel;

public partial class ControlPanel_District_HaccpPlan2 : System.Web.UI.Page
{
    private int NumberOfIngredients = 0;
    private int NumberOfHazardLines = 0;
    protected string pgTitle = "";
    protected string ProcessName = "";
    protected string ProcessText = "";
    protected string HazardTitle = "";
    protected string HaccpCategoryTitle = "";
    protected List<ProcessHazardAnalysisHeader> header;
    protected List<ProcessHaccpCategoryHeader> HaccpCategoryHeader;
    private Entities context = new Entities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            int ProcessId = 0;
            if (int.TryParse(Request.QueryString["ProcessId"], out ProcessId))
            {
                DataSet dsProcess;
                ProcessGetProcess getProcess = new ProcessGetProcess();
                dsProcess = getProcess.GetProcessByID(ProcessId);
                pgTitle = dsProcess.Tables[0].Rows[0]["ProcessName"].ToString();
                ProcessName = pgTitle;
                ProcessText = dsProcess.Tables[0].Rows[0]["ProcessText"].ToString();
                //dtvProcess.DataSource = dsProcess;
                //dtvProcess.DataBind();
                var hazard = (from p in context.ProcessHazardAnalysis
                              where p.ProcessID == ProcessId && p.Active == 1
                              select p).FirstOrDefault();
                if (hazard != null)
                {
                    HazardTitle = hazard.Title;
                    BindHazardAnalysis(hazard.HazardAnalysisID);
                }
                else
                {
                    tblHazardHeader.Visible = false;
                }

                var haccpCategory = (from p in context.ProcessHaccpCategories
                              where p.ProcessID == ProcessId && p.Active == 1
                              select p).FirstOrDefault();
                if (haccpCategory != null)
                {
                    HaccpCategoryTitle = haccpCategory.Title;
                    BindProcessHaccpCategory(haccpCategory.HaccpCategoryID);
                }
                else
                {
                    tblHaccpCategoryHeader.Visible = false;
                }

                ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
                DataSet dsProcessMenu;
                dsProcessMenu = getMenuItem.GetMenuItemsNewByProcess((int)Session["KitchenId"], ProcessId);

                grdMenuProcess1.DataSource = dsProcessMenu;
                grdMenuProcess1.DataBind();
                if (dsProcessMenu.Tables[0].Rows.Count < 1)
                {
                    lblProcessMenu.Text = "No Data Found";
                }
            }
        }
    }
    private void BindHazardAnalysis(int nHazardAnalysisID)
    {
        header = (from hd in context.ProcessHazardAnalysisHeaders
                  where hd.HazardAnalysisID == nHazardAnalysisID
                  select hd).ToList();
        List<ProcessHazardAnalysisDetail> details = (from dt in context.ProcessHazardAnalysisDetails
                                                     where dt.HazardAnalysisID == nHazardAnalysisID
                                                     orderby dt.SortOrder
                                                     select dt).ToList();        
        if (details.Count > 0)
        {
            grdHazardAnalysis.DataSource = details;
            grdHazardAnalysis.DataBind();
        }
        else
        {
            tblHazardHeader.Visible = false;
        }
    }
    private void BindProcessHaccpCategory(int nHaccpCategoryID)
    {
        HaccpCategoryHeader = (from hd in context.ProcessHaccpCategoryHeaders
                  where hd.HaccpCategoryID == nHaccpCategoryID
                  select hd).ToList();
        List<ProcessHaccpCategoryDetail> details = (from dt in context.ProcessHaccpCategoryDetails
                                                     where dt.HaccpCategoryID == nHaccpCategoryID
                                                     orderby dt.SortOrder
                                                     select dt).ToList();
        if (details.Count > 0)
        {
            grdHaccpCategory.DataSource = details;
            grdHaccpCategory.DataBind();
        }
        else
        {
            tblHaccpCategoryHeader.Visible = false;
        }
    }
    protected void grdMenuAll_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblPreparation = (Label)e.Row.FindControl("lblPreperation");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;
                lblPreparation.Visible = false;
                lblPreparation.Text = string.Empty;           
                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                lblPreparation.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }

           
        }
    }
    //protected void rptProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        DetailsView dtvProcess;
    //        HiddenField hfProcessId;
    //        GridView grdMenu;
          
    //        Label lblProcessMenu;

    //        dtvProcess = (DetailsView)e.Item.FindControl("dtvProcess");
    //        hfProcessId = (HiddenField)e.Item.FindControl("hfProcessId");
    //        grdMenu = (GridView)e.Item.FindControl("grdMenuProcess1");
    //        lblProcessMenu = (Label)e.Item.FindControl("lblProcessMenu");
            

    //    }
    //}
    protected void grdMenuProcess1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            Label lblPreparation = (Label)e.Row.FindControl("lblPreperation");
     


            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title0"];
            string processTitle = lblProcess.Text;
            string strProcess = (string)ViewState["process0"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;
                lblPreparation.Visible = false;
                lblPreparation.Text = string.Empty;

                NumberOfIngredients++;
                if (NumberOfIngredients % 5 == 0)
                {
                    GridViewRow row = getGridViewRow(e);
                    Table tbl = (e.Row.Parent as Table);
                    tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
                }
                
            }
            else
            {
                title = strval;
                ViewState["title0"] = title;
                
                if (strProcess == processTitle)
                {
                    //e.Row.FindControl("dvPageBreak").Visible = true;
                    //e.Row.Style.Add("page-break-before", "always");  
                    GridViewRow row = getGridViewRow(e);
                    Table tbl = (e.Row.Parent as Table);
                    tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
                    NumberOfIngredients = 1;
                    //lblMenuItem.Style.Add("page-break-before", "always");
                }
                strProcess = processTitle;
                ViewState["process0"] = strProcess;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                lblPreparation.Visible = true;

            }           
        }
    }
    protected void grdHazardAnalysis_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == 0)
            {
                GridViewRow row = getHazardTitleRow(e,1);
                Table tbl = (e.Row.Parent as Table);
                tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
            }
            HiddenField hfGroupId = (HiddenField)e.Row.FindControl("hfGroupId");
            GridViewRow prevRow;
            string strval = hfGroupId.Value;
            //string strval = hlMenuItem.;
            string title = (string)ViewState["title"];                
            if (title == strval)
            {
                e.Row.Cells[0].BorderStyle = BorderStyle.None;
               
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                NumberOfHazardLines++;
                if (NumberOfHazardLines % 3 == 0)
                {
                    GridViewRow row1 = getEmptyRow(e, 0);
                    Table tbl1 = (e.Row.Parent as Table);
                    tbl1.Controls.AddAt(tbl1.Rows.Count - 1, row1);

                    GridViewRow row = getHazardTitleRow(e, 0);
                    Table tbl = (e.Row.Parent as Table);
                    tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
                    NumberOfHazardLines = 1;
                }
            }
        }
    }
    protected void grdHaccpCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == 0)
            {
                GridViewRow row = getHaccpCategoryTitleRow(e, 1);
                Table tbl = (e.Row.Parent as Table);
                tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
            }
            else
            {
                GridViewRow row1 = getEmptyRow(e, 0);
                Table tbl1 = (e.Row.Parent as Table);
                tbl1.Controls.AddAt(tbl1.Rows.Count - 1, row1);

                GridViewRow row = getHaccpCategoryTitleRow(e, 0);
                Table tbl = (e.Row.Parent as Table);
                tbl.Controls.AddAt(tbl.Rows.Count - 1, row);
            }
        }
    }
    private GridViewRow getHazardTitleRow(GridViewRowEventArgs e, int nFirstHeader)
    {
        GridViewRow row = new GridViewRow(e.Row.RowIndex, 0, DataControlRowType.Header, DataControlRowState.Normal);

        TableCell cell1 = new TableCell();
        cell1.Controls.Add(new Label { Text = header[0].ColValue }); //as needed
        //cell1.Width = 30;
        cell1.Font.Bold = true;
        row.Cells.Add(cell1);

        //TableCell cell2 = new TableCell();
        //cell2.Controls.Add(new Label { Text = "Process Type" }); //as needed
        ////cell2.Width = 30;
        //row.Cells.Add(cell2);

        TableCell cell3 = new TableCell();
        cell3.Controls.Add(new Label { Text = header[1].ColValue }); //as needed
        cell3.Font.Bold = true;
        row.Cells.Add(cell3);

        TableCell cell4 = new TableCell();
        cell4.Controls.Add(new Label { Text = header[2].ColValue }); //as needed
        cell4.Font.Bold = true;
        row.Cells.Add(cell4);

        TableCell cell5 = new TableCell();
        cell5.Controls.Add(new Label { Text = header[3].ColValue }); //as needed
        cell5.Font.Bold = true;
        row.Cells.Add(cell5);

        TableCell cell6 = new TableCell();
        cell6.Controls.Add(new Label { Text = header[4].ColValue }); //as needed
        cell6.Font.Bold = true;
        row.Cells.Add(cell6);

        TableCell cell7 = new TableCell();
        cell7.Controls.Add(new Label { Text = header[5].ColValue }); //as needed
        cell7.Font.Bold = true;
        row.Cells.Add(cell7);
        if (nFirstHeader == 0)
            row.Attributes["style"] = "border: solid 1px #000000;";

        row.CssClass = "gridheaderline2";
        return row;
    }
    private GridViewRow getHaccpCategoryTitleRow(GridViewRowEventArgs e, int nFirstHeader)
    {
        GridViewRow row = new GridViewRow(e.Row.RowIndex, 0, DataControlRowType.Header, DataControlRowState.Normal);

        TableCell cell1 = new TableCell();
        cell1.Controls.Add(new Label { Text = HaccpCategoryHeader[0].ColValue }); //as needed
        //cell1.Width = 30;
        cell1.Font.Bold = true;       
        row.Cells.Add(cell1);

        //TableCell cell2 = new TableCell();
        //cell2.Controls.Add(new Label { Text = "Process Type" }); //as needed
        ////cell2.Width = 30;
        //row.Cells.Add(cell2);

        TableCell cell3 = new TableCell();
        cell3.Controls.Add(new Label { Text = HaccpCategoryHeader[1].ColValue }); //as needed
        cell3.Font.Bold = true;
        row.Cells.Add(cell3);

        TableCell cell4 = new TableCell();
        cell4.Controls.Add(new Label { Text = HaccpCategoryHeader[2].ColValue }); //as needed
        cell4.Font.Bold = true;
        row.Cells.Add(cell4);

        TableCell cell5 = new TableCell();
        cell5.Controls.Add(new Label { Text = HaccpCategoryHeader[3].ColValue }); //as needed
        cell5.Font.Bold = true;
        row.Cells.Add(cell5);

        TableCell cell6 = new TableCell();
        cell6.Controls.Add(new Label { Text = HaccpCategoryHeader[4].ColValue }); //as needed
        cell6.Font.Bold = true;
        row.Cells.Add(cell6);

        TableCell cell7 = new TableCell();
        cell7.Controls.Add(new Label { Text = HaccpCategoryHeader[5].ColValue }); //as needed
        cell7.Font.Bold = true;
        row.Cells.Add(cell7);

        if (nFirstHeader == 0)
            row.Attributes["style"] = "border: solid 1px #000000 !important; border-collapse: collapse;";

        row.CssClass = "gridheaderline2";        
        return row;
    }
    private GridViewRow getGridViewRow(GridViewRowEventArgs e)
    {
        GridViewRow row = new GridViewRow(e.Row.RowIndex, 0, DataControlRowType.Header, DataControlRowState.Normal);

        TableCell cell1 = new TableCell();
        cell1.Controls.Add(new Label { Text = "Output/ Menu Item" }); //as needed
        //cell1.Width = 30;
        row.Cells.Add(cell1);

        //TableCell cell2 = new TableCell();
        //cell2.Controls.Add(new Label { Text = "Process Type" }); //as needed
        ////cell2.Width = 30;
        //row.Cells.Add(cell2);

        TableCell cell3 = new TableCell();
        cell3.Controls.Add(new Label { Text = "Prep Type" }); //as needed
        //cell3.Width = 30;
        row.Cells.Add(cell3);

        TableCell cell4 = new TableCell();
        cell4.Controls.Add(new Label { Text = "RTE" }); //as needed
        //cell4.Width = 30;
        row.Cells.Add(cell4);

        TableCell cell5 = new TableCell();
        cell5.Controls.Add(new Label { Text = "Input" }); //as needed
        //cell5.Width = 30;
        row.Cells.Add(cell5);

        TableCell cell6 = new TableCell();
        cell6.Controls.Add(new Label { Text = "Vendor" }); //as needed
        // cell6.Width = 30;
        row.Cells.Add(cell6);

        TableCell cell7 = new TableCell();
        cell7.Controls.Add(new Label { Text = "Food Category" }); //as needed
        //cell7.Width = 30;
        row.Cells.Add(cell7);

        TableCell cell8 = new TableCell();
        cell8.Controls.Add(new Label { Text = "CCL Low Temp" }); //as needed
        //cell8.Width = 30;
        row.Cells.Add(cell8);

        TableCell cell9 = new TableCell();
        cell9.Controls.Add(new Label { Text = "CCL High Temp" }); //as needed
        //cell9.Width = 30;
        row.Cells.Add(cell9);

        TableCell cell10 = new TableCell();
        cell10.Controls.Add(new Label { Text = "Control Point" }); //as needed
        //cell10.Width = 30;
        row.Cells.Add(cell10);

        TableCell cell11 = new TableCell();
        cell11.Controls.Add(new Label { Text = "Biological Hazards" }); //as needed
        //cell11.Width = 30;
        row.Cells.Add(cell11);

        TableCell cell12 = new TableCell();
        cell12.Controls.Add(new Label { Text = "Chemical Hazards" }); //as needed
        //cell12.Width = 30;
        row.Cells.Add(cell12);

        TableCell cell13 = new TableCell();
        cell13.Controls.Add(new Label { Text = "Physical Hazards" }); //as needed
        //cell13.Width = 30;
        row.Cells.Add(cell13);
        row.Attributes["style"] = "page-break-before: always;border-bottom: solid 1px #000000;";

        row.CssClass = "gridheaderline";
        return row;
    }
    private GridViewRow getEmptyRow(GridViewRowEventArgs e, int nFirstHeader)
    {
        GridViewRow row = new GridViewRow(e.Row.RowIndex, 0, DataControlRowType.Header, DataControlRowState.Normal);

        TableCell cell = new TableCell();
        cell.Text = "&nbsp;";
        cell.ColumnSpan = 6;
        cell.Font.Bold = true;
        row.Cells.Add(cell);

        if (nFirstHeader == 0)
            //row.Attributes["style"] = "page-break-before: always;border-bottom: solid 1px #000000 !important; border-top: solid 1px #000000 !important; border-left: solid 1px #ffffff; border-collapse: collapse;";
            row.CssClass = "gridheaderBreakline";


        return row;
    }
    

    
}
