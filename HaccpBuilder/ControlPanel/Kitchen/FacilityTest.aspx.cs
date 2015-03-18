using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eWorld.UI;
using SchoolHaccp.BusinessLogic;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;
using SchoolHaccp.DataAccess.Update;
//using Excel = Microsoft.Office.Interop.Excel;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class FacilityTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToShortDateString();
            //If C-TPAT Hide these items
            if (TypeId == 7)
            {
                pnlCutomers.Visible = false;
                pnlInputs.Visible = false;
                pnlInventory.Visible = false;
                pnlOutputs.Visible = false;
                pnlVendors.Visible = false;
            }
            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            DataSet dsKitchen = kitchen.GetKitchensByUserName(Session["Username"].ToString(), Session["Password"].ToString());
            string fileName = dsKitchen.Tables[0].Rows[0]["LogoFileName"].ToString();
            if(fileName == "")
                imgLogo.ImageUrl = "~/images/Logos/KitchenLogo.png";
            else
                imgLogo.ImageUrl = "~/images/Logos/" + fileName;
        }

        protected void rptReports_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Calendar")
            {               
                if (e.CommandArgument.ToString() != "")
                {
                    CalendarPopup cal = e.CommandSource as CalendarPopup;
                    string url;
                    url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
                    Response.Redirect(url);
                }

            }
        }
        protected void rptWeekly_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Calendar")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    CalendarPopup cal = e.CommandSource as CalendarPopup;
                    string url;
                    url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
                    Response.Redirect(url);
                }

            }
        }
        protected void rptOther_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Calendar")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    CalendarPopup cal = e.CommandSource as CalendarPopup;
                    string url;
                    url = "~/ControlPanel/Kitchen/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
                    Response.Redirect(url);
                }

            }
        }
        protected void rptChecklist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Calendar")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    CalendarPopup cal = e.CommandSource as CalendarPopup;
                    string url;
                    url = "~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?SectionId=" + cal.CommandArgument.ToString() + "&Date=" + cal.SelectedDate.ToShortDateString();
                    Response.Redirect(url);
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

        protected void rptReports_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlAnchor hlReport = (HtmlAnchor)e.Item.FindControl("hlReport");
                CalendarPopup cal = (CalendarPopup)e.Item.FindControl("cldReport");
                if (TypeId == 2 || TypeId == 3)
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
                if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
            }
        }       
        protected void rptOther_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlAnchor hlReport = (HtmlAnchor)e.Item.FindControl("hlReport");
                CalendarPopup cal = (CalendarPopup)e.Item.FindControl("cldReport");
                if (TypeId == 2 || TypeId == 3)
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
                if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
            }
        }
        protected void rptChecklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlAnchor hlReport = (HtmlAnchor)e.Item.FindControl("hlReport");
                CalendarPopup cal = (CalendarPopup)e.Item.FindControl("cldReport");               
                if (cal != null)
                {
                    string SectionId = DataBinder.Eval(e.Item.DataItem, "CheckListSectionId").ToString();
                    cal.CommandArgument = SectionId + "";
                }
            }
        }
        protected void rptWeekly_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlAnchor hlReport = (HtmlAnchor)e.Item.FindControl("hlReport");
                CalendarPopup cal = (CalendarPopup)e.Item.FindControl("cldReport");
                if (TypeId == 2 || TypeId == 3)
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
                if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
                {
                    hlReport.Disabled = true;
                    cal.Enabled = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
              //  UpdateExcelData();
                //UploadData();
                DispatchDailyMail();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        private void UploadData()
        {
            //string category = txtCategory.Text;
            ////string category = "";
            ////List<string> fileNames = new List<string>();
            ////DirectoryInfo d = new DirectoryInfo(@"D:\TanningLotion\" + category);//Assuming Test is your Folder
            ////FileInfo[] Files = d.GetFiles("*.png"); //Getting Text files
            ////foreach (FileInfo file in Files)
            ////{
            ////    fileNames.Add(file.Name.Remove(file.Name.Length - 4));
            ////}
            ////Excel.Application myExcelApp = new Excel.Application();
            ////string myPath = "D:\\TanningLotion\\" + category + "\\" + category + ".xlsx";
            ////myExcelApp.Workbooks.Open(myPath);

            ////for (int i = 0; i < fileNames.Count; i++)
            ////{
            ////    myExcelApp.Cells[i + 2, "A"] = "D:\\TanningLotion\\" + category + "\\" + fileNames[i] + ".png";
            ////    myExcelApp.Cells[i + 2, "B"] = fileNames[i];
            ////    myExcelApp.Cells[i + 2, "C"] = 1;                
            ////}
            ////myExcelApp.Visible = true;
            //myExcelApp.Cells[i+1, "A"] = "one";
            //myExcelApp.Cells[1, "B"] = "two";
            //myExcelApp.Visible = true;
        }
        private void UpdateExcelData()
        {
           // string category = txtCategory.Text;
            ////string category = "";
            ////Excel.Application myExcelApp = new Excel.Application();
            ////string myPath = "D:\\TanningLotion\\Updated Data(01-28-14)\\" + category + ".xlsx";
            ////myExcelApp.Workbooks.Open(myPath);
            ////Excel.Workbook xlWorkbook = myExcelApp.Workbooks.Open(myPath);
            ////Excel._Worksheet xlWorksheet = xlWorkbook.Sheets[1];
            ////Excel.Range xlRange = xlWorksheet.UsedRange;

            ////int rowCount = xlRange.Rows.Count;
            //////lblMessage.Text = xlRange.Cells[0, "F"] + ":";
            //////lblMessage.Text += xlRange.Cells[0, "D"] + " - " + xlRange.Cells[0, "E"];
            //////xlRange.Cells[0, "F"] = xlRange.Cells[0, "D"] + " - " + xlRange.Cells[0, "E"];
            ////for (int i = 1; i <= rowCount; i++)
            ////{

            ////    xlRange.Cells[i, "F"] = xlRange.Cells[i, "E"].value() + " - " + xlRange.Cells[i, "D"].value();                
            ////}
            ////myExcelApp.Visible = true;
        }
        private void DispatchDailyMail()
        {

            try
            {
               // eventLog1.WriteEntry("Dispatcher function called");
                SetServices setService = new SetServices();
                setService.FillDispatchTable();
                DataModel.Entities context = new DataModel.Entities();
                List<DataModel.AlertDispatch> lstAlerts = new List<DataModel.AlertDispatch>();
                lstAlerts = (from ds in context.AlertDispatches
                             orderby ds.AlertTime
                             select ds).ToList();


                foreach (var item in lstAlerts.ToList())
               // for (var x = 0; x < lstAlerts.Count; x++)
                {
                  //  var item = lstAlerts[x];
                    var mobileAccount = (from mb in context.Mobiles
                                         where mb.MobileId == item.AccountID
                                        select mb).FirstOrDefault();
                    // To process Checklists seperately
                    if (item.IsCheckList == 1)
                    {
                        //Checklist Add On
                        var checklist = (from mck in context.MobileChecklists
                                         where mck.MobileId == item.AccountID
                                         select mck).ToList();
                        bool checklistActive = false;
                        foreach (var checklistItem in checklist)
                        {
                            if (checklistItem.ChecklistSectionId == item.LogID)
                            {
                                checklistActive = true;
                                break;
                            }

                        }
                        if (!checklistActive)
                        {
                            lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                        }
                        break;
                    }
                    else
                    {
                        switch (item.LogID)
                        {
                            case 1:
                                // check whetehr specific Log is active for Alerts or not   
                                if (mobileAccount.CleaningLog == 0 || mobileAccount.CleaningLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 2:
                                // logName = "Cold Holding Log";
                                if (mobileAccount.ColdHoldingLog == 0 || mobileAccount.ColdHoldingLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 3:
                                // logName = "Cooling Temperature Log";
                                if (mobileAccount.FreezerLog == 0 || mobileAccount.FreezerLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 4:
                                // logName = "Freezer Log";
                                if (mobileAccount.FreezerNewLog == 0 || mobileAccount.FreezerNewLogAlert == 0)
                                {
                                    lstAlerts.Remove(item);
                                }
                                break;
                            case 5:
                                // logName = "Temperature Log";
                                if (mobileAccount.TemperatureLog == 0 || mobileAccount.TemperatureLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 6:
                                //logName = "Hot Holding Log";
                                if (mobileAccount.HotHoldingLog == 0 || mobileAccount.HotHoldingLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 7:
                                // logName = "Maintenance Log";
                                if (mobileAccount.MaintenanceLog == 0 || mobileAccount.MaintenanceLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 8:
                                // logName = "Ph Log";
                                if (mobileAccount.PhLog == 0 || mobileAccount.PhLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 9:
                                // logName = "Pest Log";
                                if (mobileAccount.PestLog == 0 || mobileAccount.PestLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 10:
                                //  logName = "Receiving Log";
                                if (mobileAccount.ReceivingLog == 0 || mobileAccount.ReceivingLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 11:
                                // logName = "Refrigration Log";
                                if (mobileAccount.RefrigerationLog == 0 || mobileAccount.RefrigerationLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 12:
                                //  logName = "Shipping Log";
                                if (mobileAccount.ShippingLog == 0 || mobileAccount.ShippingLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 13:
                                //  logName = "Thermo Calibration Log";
                                if (mobileAccount.Thermometer == 0 || mobileAccount.ThermometerAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 14:
                                // logName = "Food Safety Checklist";
                                if (mobileAccount.CleaningLog == 0 || mobileAccount.CleaningLogAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            case 15:
                                // logName = "Validation Checklist";
                                if (mobileAccount.Validation == 0 || mobileAccount.ValidationAlert == 0)
                                {
                                    lstAlerts.RemoveAll(x => x.LogID == item.LogID & x.AccountID == item.AccountID);
                                }
                                break;
                            default:
                                break;
                        }
                    } // End If
                }// End Foreach
                context.Dispose();
            }
            catch (Exception ex)
            {
              //  eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace + "\n", EventLogEntryType.Error);
                lblMessage.Text = ex.Message;

            }
        }
    }
}