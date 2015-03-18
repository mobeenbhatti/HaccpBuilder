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
using eWorld.UI;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();        
    //    BindSectionsData();
        if (this.IsPostBack != true)
        {
            //if (TypeId == 2 || TypeId == 3)
            //{
            //    grdDailyReports.Columns.RemoveAt(1);
            //    grdDailyReports.Columns.RemoveAt(2);
            //    grdDailyReports.Columns.RemoveAt(3);
            //    grdDailyReports.Columns.RemoveAt(4);
            //    grdDailyReports.Columns.RemoveAt(5);
            //    grdDailyReports.Columns.RemoveAt(6);
            //    grdDailyReports.Columns.RemoveAt(6);
            //    grdDailyReports.Columns.RemoveAt(6);
            //    grdDailyReports.Columns.RemoveAt(6);
            //    //grdDailyReports.Columns.RemoveAt(7); 
            //}
            
            if (TypeId == 1)
            {
                hlUserGuide.NavigateUrl = "~/StaticContent/Files/Free Trial Instruction Guide.pdf";
            }
            else
            {
                hlUserGuide.NavigateUrl = "~/StaticContent/Files/HACCP Builder Instruction Guide.pdf";
            }
            //RGK - 08-18-10
            // Login MAnager Feature for Mobile Operators
            if (TypeId > 5)
            {
                hlLocationStaff.Visible = true;
            }
            else
            {
                hlLocationStaff.Visible = false;
            }

            //If C-TPAT Hide SOP button
            //if (TypeId == 7)
            //{
            //    btnViewSop.Visible = false;
            //}
        }
    }
    protected void grdDailyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /////////////////////////////////
            CalendarPopup cal = e.Row.FindControl("CalendarPopup1") as CalendarPopup;
            if (cal != null)
            {
                string tableName = (e.Row.DataItem as DataRowView).Row.ItemArray[0].ToString();
                cal.CommandArgument = tableName + "";
            }
            //////////////////////////////////

            HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");
            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
            HyperLink hlCorrectiveAction = (HyperLink)e.Row.FindControl("hlActions");

            Label lblcheckDate1 = (Label)e.Row.FindControl("lblDateFlag1");
            Label lblcheckDate2 = (Label)e.Row.FindControl("lblDateFlag2");
            Label lblcheckDate3 = (Label)e.Row.FindControl("lblDateFlag3");
            Label lblcheckDate4 = (Label)e.Row.FindControl("lblDateFlag4");
            Label lblcheckDate5 = (Label)e.Row.FindControl("lblDateFlag5");

            /////////////////////////////////////////
            /// TO CHECK ALERTS FOR LOG TABLES
            /// 09-10-12  - As Meal Calendar is deparcatd. So remove Missing Dates functionality
            /// ////////////////////////////////////
            //if (hlAlert != null)
            //{
            //    ProcessGetDailyReports getDailyReport = new ProcessGetDailyReports();
            //    DataSet dsAlerts = getDailyReport.GetAlertDates(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
            //    if (dsAlerts.Tables[0].Rows.Count > 0)
            //    {
            //        hlAlert.Text = "Yes";
            //        hlAlert.ForeColor = System.Drawing.Color.Red;
            //        hlAlert.NavigateUrl = "~/ControlPanel/Kitchen/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
            //    }
            //}

            //IDataReader drMissingDates = getDailyReport.GetMissingDates(hlTask.Text.ToUpper().Trim(),(int)Session["KitchenId"]);
            //while (drMissingDates.Read())
            //{
            //    if (drMissingDates["Missing"].ToString() == "YES")
            //    {
            //        hlAlert.Text = "Yes";
            //        hlAlert.ForeColor = System.Drawing.Color.Red;
            //        break;
            //    }
            //}
            ////////////////////////////////////////

            ///////////////////////////////////////
            /// TO CHECK CORRECTIVE ACTIONS
            /// //////////////////////////////////
            if (hlCorrectiveAction != null)
            {
                ProcessGetDailyReports getCorrectiveActions = new ProcessGetDailyReports();
                DataSet dsCorrectiveAction = getCorrectiveActions.GetCorrectiveActions(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
                if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
                {
                    hlCorrectiveAction.Text = "Yes";
                    hlCorrectiveAction.NavigateUrl = "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
                }
                else
                {
                    hlCorrectiveAction.Text = "No";
                }
            }
            ///////////////////////////////////////////
            // HIDE INFORMATION ON BASIS OF KITCHEN TYPE
            ///////////////////////////////////////////
            // Command Central Location - 6
            // HBFlex With Reporting - 5
            // HBFlex without Reporting - 3
            // Free Trial - 1
            //C-Tpat - 7
            //Command Cnetral + C-Tpat - 8
            if (TypeId == 2 || TypeId == 3)
            {
                // Disable Reporting
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[4].Enabled = false;
                e.Row.Cells[5].Enabled = false;
                e.Row.Cells[6].Enabled = false;
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[8].Enabled = false;
                e.Row.Cells[9].Enabled = false;
                //e.Row.Cells[10].Enabled = true;               
                e.Row.Cells[11].Enabled = false;
                cal.CommandArgument = "";
                e.Row.Cells[12].Enabled = false;
                e.Row.Cells[13].Enabled = false;
                e.Row.Cells[14].Enabled = false;

            }
            if (TypeId == 4 ) 
            {
                
                e.Row.Cells[12].Enabled = false;               

            }
            if (TypeId == 5)
            {
                
            }
            // DISABLE REPORTING
            if (DataBinder.Eval(e.Row.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[4].Enabled = false;
                e.Row.Cells[5].Enabled = false;
                e.Row.Cells[6].Enabled = false;
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[8].Enabled = false;
                e.Row.Cells[9].Enabled = false;
                //e.Row.Cells[10].Enabled = true;               
                e.Row.Cells[11].Enabled = false;
                cal.CommandArgument = "";
                e.Row.Cells[12].Enabled = false;
                e.Row.Cells[13].Enabled = false;
                e.Row.Cells[14].Enabled = false;
            }
        }

    }
    protected void grdDailyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Calendar")
        {
            // RGK-(03-19-10)
            // BUG ID - 1090
            if (e.CommandArgument.ToString() != "")
            {
                eWorld.UI.CalendarPopup cal = e.CommandSource as CalendarPopup;
                string url;
                url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
                Response.Redirect(url);
            }

        }
    }
    protected void grdWeeklyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Calendar")
        {
            eWorld.UI.CalendarPopup cal = e.CommandSource as CalendarPopup;
            string url;
            url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
            Response.Redirect(url);

        }
    }

    //protected void grdDailyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");
    //        //HyperLink hlkDate1 = (HyperLink)e.Row.FindControl("hlDate1");
    //        //HyperLink hlkDate2 = (HyperLink)e.Row.FindControl("hlDate2");
    //        //HyperLink hlkDate3 = (HyperLink)e.Row.FindControl("hlDate3");
    //        //HyperLink hlkDate4 = (HyperLink)e.Row.FindControl("hlDate4");
    //        //   HyperLink hlkDate5 = (HyperLink)e.Row.FindControl("hlDate5");
    //        HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");

    //        Label lblcheckDate1 = (Label)e.Row.FindControl("lblDateFlag1");
    //        Label lblcheckDate2 = (Label)e.Row.FindControl("lblDateFlag2");
    //        Label lblcheckDate3 = (Label)e.Row.FindControl("lblDateFlag3");
    //        Label lblcheckDate4 = (Label)e.Row.FindControl("lblDateFlag4");
    //        Label lblcheckDate5 = (Label)e.Row.FindControl("lblDateFlag5");
    //        //Calendar cldSelectedDate = (Calendar)e.Row.FindControl("cldDate");

    //        //if (cldSelectedDate != null)
    //        //{
    //        //    string url = "~/ControlPanel/Default2.aspx?task=" + hlTask.Text + "&date=";
    //        //    cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url + ")");

    //        //}

    //        //if (hlTask != null || hlkDate1 != null || hlkDate2 != null || hlkDate3 != null || hlkDate4 != null  )
    //        // {|| hlkDate5 != null
    //        //hlkDate1.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate1.Text + "&task=" + hlTask.Text;
    //        //hlkDate2.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate2.Text + "&task=" + hlTask.Text;
    //        //hlkDate3.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate3.Text + "&task=" + hlTask.Text;
    //        //hlkDate4.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate4.Text + "&task=" + hlTask.Text;
    //        //     hlkDate5.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate5.Text + "&task=" + hlTask.Text;

    //        if (lblcheckDate1 != null || lblcheckDate2 != null || lblcheckDate3 != null || lblcheckDate4 != null || lblcheckDate5 != null)
    //        {
    //            if (int.Parse(lblcheckDate1.Text) > 0 || int.Parse(lblcheckDate2.Text) > 0 || int.Parse(lblcheckDate3.Text) > 0 || int.Parse(lblcheckDate4.Text) > 0 || int.Parse(lblcheckDate5.Text) > 0)
    //            {
    //                hlAlert.Text = "Yes";
    //                hlAlert.ForeColor = System.Drawing.Color.Red;
    //            }
    //            else
    //            {
    //                hlAlert.Text = "No";
    //                hlAlert.ForeColor = System.Drawing.Color.Blue;
    //            }
    //        }
    //        // }

    //    }

    //}
    protected void grdWeeklyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /////////////////////////////////
            CalendarPopup cal = e.Row.FindControl("CalendarPopup1") as CalendarPopup;
            if (cal != null)
            {
                string tableName = (e.Row.DataItem as DataRowView).Row.ItemArray[0].ToString();
                cal.CommandArgument = tableName + "";
            }
            //////////////////////////////////

            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
            HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");
            HyperLink hlCorrectiveAction = (HyperLink)e.Row.FindControl("hlActions");

            Label lblcheckDate1 = (Label)e.Row.FindControl("lblDateFlag1");
            Label lblcheckDate2 = (Label)e.Row.FindControl("lblDateFlag2");
            Label lblcheckDate3 = (Label)e.Row.FindControl("lblDateFlag3");
            Label lblcheckDate4 = (Label)e.Row.FindControl("lblDateFlag4");
            Label lblcheckDate5 = (Label)e.Row.FindControl("lblDateFlag5");
            Calendar cldSelectedDate = (Calendar)e.Row.FindControl("cldDate");
            //if (cldSelectedDate != null)
            //{
            //    string url = "~/ControlPanel/Default2.aspx?task=" + hlTask.Text + "&date=";
            //    //   cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url +")");
            //    cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url + ")");

            //}
            ///////////////////////////////////////
            /// TO CHECK CORRECTIVE ACTIONS
            /// //////////////////////////////////
            if (hlCorrectiveAction != null)
            {
                ProcessGetWeeklyReport getCorrectiveActions = new ProcessGetWeeklyReport();
                DataSet dsCorrectiveAction = getCorrectiveActions.GetCorrectiveActions(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
                if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
                {
                    hlCorrectiveAction.Text = "Yes";
                    hlCorrectiveAction.NavigateUrl = "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
                }
                else
                {
                    hlCorrectiveAction.Text = "No";
                }
            }
            /////////////////////////////////////

            /////////////////////////////////////////
            /// TO CHECK ALERTS FOR LOG TABLES
            /// ////////////////////////////////////
            if (hlAlert != null)
            {
                ProcessGetWeeklyReport getWeeklyReport = new ProcessGetWeeklyReport();
                DataSet dsAlerts = getWeeklyReport.GetAlertDates(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
                if (dsAlerts.Tables[0].Rows.Count > 0)
                {
                    hlAlert.Text = "Yes";
                    hlAlert.ForeColor = System.Drawing.Color.Red;
                    hlAlert.NavigateUrl = "~/ControlPanel/Kitchen/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
                }
            }
            ///////////////////////////////////////////
            // HIDE INFORMATION ON BASIS OF KITCHEN TYPE
            ///////////////////////////////////////////
            if (TypeId == 2 || TypeId == 3)
            {
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[4].Enabled = false;
                e.Row.Cells[5].Enabled = false;
                e.Row.Cells[6].Enabled = false;
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[8].Enabled = false;
                e.Row.Cells[9].Enabled = false;
                //e.Row.Cells[10].Enabled = true;               
                e.Row.Cells[11].Enabled = false;
                cal.CommandArgument = "";
                e.Row.Cells[12].Enabled = false;
                e.Row.Cells[13].Enabled = false;
                e.Row.Cells[14].Enabled = false;

            }
            if (TypeId == 4)
            {

                e.Row.Cells[12].Enabled = false;

            }
            if (TypeId == 5)
            {
               
            }
            if (DataBinder.Eval(e.Row.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
                e.Row.Cells[4].Enabled = false;
                e.Row.Cells[5].Enabled = false;
                e.Row.Cells[6].Enabled = false;
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[8].Enabled = false;
                e.Row.Cells[9].Enabled = false;
                //e.Row.Cells[10].Enabled = true;               
                e.Row.Cells[11].Enabled = false;
                cal.CommandArgument = "";
                e.Row.Cells[12].Enabled = false;
                e.Row.Cells[13].Enabled = false;
                e.Row.Cells[14].Enabled = false;
            }
            ///////////////////////////////////////
            //IDataReader drMissingDates = getDailyReport.GetMissingDates(hlTask.Text.ToUpper().Trim(),(int)Session["KitchenId"]);
            //while (drMissingDates.Read())
            //{
            //    if (drMissingDates["Missing"].ToString() == "YES")
            //    {
            //        hlAlert.Text = "Yes";
            //        hlAlert.ForeColor = System.Drawing.Color.Red;
            //        break;
            //    }
            //}
            //if (lblcheckDate1 != null || lblcheckDate2 != null || lblcheckDate3 != null || lblcheckDate4 != null || lblcheckDate5 != null)
            //{
            //    if (int.Parse(lblcheckDate1.Text) > 0 || int.Parse(lblcheckDate2.Text) > 0 || int.Parse(lblcheckDate3.Text) > 0 || int.Parse(lblcheckDate4.Text) > 0 || int.Parse(lblcheckDate5.Text) > 0)
            //    {
            //        hlAlert.Text = "Yes";
            //        hlAlert.ForeColor = System.Drawing.Color.Red;
            //    }
            //    else
            //    {
            //        hlAlert.Text = "No";
            //        hlAlert.ForeColor = System.Drawing.Color.Blue;
            //    }
            //}
        }

    }
    private void BindSectionsData()
    {
        //DataTable sectionsDataTable = new DataTable();
        //sectionsDataTable.Columns.Add("CorrectiveAction");
        //DataRow new1DataRow = sectionsDataTable.NewRow();
        //new1DataRow["CorrectiveAction"] = "Corrective Actions Policy";
        //DataRow new2DataRow = sectionsDataTable.NewRow();
        //new2DataRow["CorrectiveAction"] = "Corrective Actions Library";
        //DataRow new3DataRow = sectionsDataTable.NewRow();
        //new2DataRow["CorrectiveAction"] = "Corrective Actions Overview";
        //grdCorrectiveAction.DataSource = sectionsDataTable;
        //grdCorrectiveAction.DataBind();


        //DataTable sectionsDataTable = new DataTable();
        //sectionsDataTable.Columns.Add("Corrective Action");
        //sectionsDataTable.Columns.Add("SectionName");
        //sectionsDataTable.Columns.Add("RunName");
        //sectionsDataTable.Columns.Add("Paging");
        //sectionsDataTable.Columns.Add("ColorPositions");
        //sectionsDataTable.Columns.Add("TotalPages");

        //DataRow new1DataRow = sectionsDataTable.NewRow();
        //new1DataRow["SectionLetter"] = "A";
        //new1DataRow["SectionName"] = "Main News";
        //new1DataRow["RunName"] = "First Edition";
        //new1DataRow["Paging"] = "32";
        //new1DataRow["ColorPositions"] = "1, 7, 8, 15, 17 ";
        //new1DataRow["TotalPages"] = "5";
        //sectionsDataTable.Rows.Add(new1DataRow);

        //DataRow new2DataRow = sectionsDataTable.NewRow();
        //new2DataRow["SectionLetter"] = "B";
        //new2DataRow["SectionName"] = "Weekend";
        //new2DataRow["RunName"] = "Early";
        //new2DataRow["Paging"] = "10";
        //new2DataRow["ColorPositions"] = "1, 5,10 ";
        //new2DataRow["TotalPages"] = "3";
        //sectionsDataTable.Rows.Add(new2DataRow);

        //DataRow new3DataRow = sectionsDataTable.NewRow();
        //new3DataRow["SectionLetter"] = "C";
        //new3DataRow["SectionName"] = "Bussiness";
        //new3DataRow["RunName"] = "First Edition";
        //new3DataRow["Paging"] = "14";
        //new3DataRow["ColorPositions"] = "1, 8, 9 ";
        //new3DataRow["TotalPages"] = "3";
        //sectionsDataTable.Rows.Add(new3DataRow);

        //DataRow new4DataRow = sectionsDataTable.NewRow();
        //new4DataRow["SectionLetter"] = "D";
        //new4DataRow["SectionName"] = "Escapes";
        //new4DataRow["RunName"] = "Early";
        //new4DataRow["Paging"] = "8";
        //new4DataRow["ColorPositions"] = "1, 2, 4, 5, 6 ";
        //new4DataRow["TotalPages"] = "5";
        //sectionsDataTable.Rows.Add(new4DataRow);

        //gvEditSections.DataSource = sectionsDataTable;
        //gvEditSections.DataBind();

    }
    protected void btnEditPlan_Click(object sender, EventArgs e)
    {
       // Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
        //Response.Redirect("~/ControlPanel/Kitchen/DailyParticipationHaccp.aspx");
        Response.Redirect("~/ControlPanel/Kitchen/ProceduralQuestion.aspx");
    }
    protected void btnMenuManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
    }
    protected void btnInventoryManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/InventoryItemManager.aspx");
    }    
    protected void btnAlerts_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/LogAlerts.aspx");
    }
    protected void btnViewSop_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SOPList.aspx");
    }
    protected void btnInventoryManager_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    }
    protected void grdOtherReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink hlEdit = (HyperLink)e.Row.FindControl("hlEdit");
            HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");
            HyperLink hlCorrectiveAction = (HyperLink)e.Row.FindControl("hlActions");
           // hlEdit.Attributes.Add("onclick", "ShowMyModalPopup()");
            //rdbAnswerNo.Attributes.Add("onclick", "ShowMyModalPopup()");
            ///////////////////////////////////////
            /// TO CHECK CORRECTIVE ACTIONS
            /// //////////////////////////////////
            ProcessGetDailyReports getCorrectiveActions = new ProcessGetDailyReports();
            DataSet dsCorrectiveAction = getCorrectiveActions.GetCorrectiveActions(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
            if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
            {
                hlCorrectiveAction.Text = "Yes";
                hlCorrectiveAction.NavigateUrl = "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
            }
            else
            {
                hlCorrectiveAction.Text = "No";
            }
            /////////////////////////////////////
            if (TypeId == 2 || TypeId == 3)
            {
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false;
               

            }
            if (DataBinder.Eval(e.Row.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;
                e.Row.Cells[1].Enabled = false;
                e.Row.Cells[2].Enabled = false;
                e.Row.Cells[3].Enabled = false; 
            }
        }
        
    }

    protected void btnIngredient_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Ingredients.aspx");
    }
    protected void btnVendors_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Vendors.aspx");
    }

    protected void cmdTimeZone_Click(object sender, ImageClickEventArgs e)
    {
        ModalPopupTimeZone.Show();       
    }
    protected void ddlTimeZone_DataBound(object sender, EventArgs e)
    {
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        DataSet dsKitchen = kitchen.GetTimeZoneByKitchenId((int)Session["KitchenId"]);

        if (dsKitchen.Tables[0].Rows.Count > 0)
        {
            ddlTimeZone.SelectedValue = dsKitchen.Tables[0].Rows[0]["TimeZone"].ToString();
            
        }
    }

    protected void cmdUpdateTimeZone_Click(object sender, EventArgs e)
    {
        ProcessSetKitchen setTimeZone = new ProcessSetKitchen();
        setTimeZone.UpdateKitchenTimeZone((int)Session["KitchenId"], ddlTimeZone.SelectedValue);
    }

    protected void grdCheckList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Calendar")
        {
            // RGK-(03-19-10)
            // BUG ID - 1090
            if (e.CommandArgument.ToString() != "")
            {
                eWorld.UI.CalendarPopup cal = e.CommandSource as CalendarPopup;
                string url;
                url = "~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?SectionId=" + cal.CommandArgument.ToString() + "&Date=" + cal.SelectedDate.ToShortDateString();
                Response.Redirect(url);
            }

        }

    }

    protected void grdCheckList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /////////////////////////////////
            CalendarPopup cal = e.Row.FindControl("CalendarPopup1") as CalendarPopup;
            if (cal != null)
            {
                string SectionId = DataBinder.Eval(e.Row.DataItem, "CheckListSectionId").ToString();
                cal.CommandArgument = SectionId + "";
            }
        }
    }
    public int TypeId
    {
        get
        {
            if (Session["TypeId"] != null)
                return (int)Session["TypeId"];
            else
            {
                Response.Redirect("~/ControlPanel/LogOut.aspx");
                return 0;
            }

        }
    }
}
