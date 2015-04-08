using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
using System.Net.Mail;
using System.Data;
using DataModel;
using System.Web.Services;
//using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class LocationOperatorNew : System.Web.UI.Page
    {
        #region Data Members
        private static string mode = "NEW";
        private static DataSet dsSections;
        public Entities context = new Entities();
        private static Entities staticContext = new Entities();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                if (TypeId < 6)
                {
                    Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
                }
                if (TypeId == 7)
                {
                    pnlCleaningLog.Visible = false;
                    pnlCloolingLog.Visible = false;
                    pnlColdHoldingLog.Visible = false;
                    pnlFreezerLog.Visible = false;
                    pnlFscl.Visible = false;
                    pnlHotHoldingLog.Visible = false;
                    pnlMaintenanceLog.Visible = false;
                    pnlPestLog.Visible = false;
                    pnlPhLog.Visible = false;
                    pnlReceivingLog.Visible = false;
                    pnlRefrigrationLog.Visible = false;
                    pnlShippingLog.Visible = false;
                    pnlTemperatureLog.Visible = false;
                    pnlThermometerLog.Visible = false;
                    pnlValidation.Visible = false;

                }
                ProcessGetWeeklyReport weeklyReport = new ProcessGetWeeklyReport();
                DataSet dsChecklistSections = weeklyReport.GetchecklistSectionsByKitchenId((int)Session["KitchenId"]);
                rptChecklist.DataSource = dsChecklistSections;
                rptChecklist.DataBind();
                if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
                {
                    // ItemId = int.Parse(Request.QueryString["Id"]);                
                    mode = "edit";
                    ProcessGetWeeklyReport gethecklistSections = new ProcessGetWeeklyReport();
                    dsSections = gethecklistSections.GetchecklistSectionsByMobileId(int.Parse(Request.QueryString["Id"]));
                    GetData();
                }
                else
                {
                    mode = "NEW";
                }
                SetPage();
            }
        }
        private void SendMail()
        {
            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress("rehman.gull@nxb.com.pk");
            mMailMessage.To.Add(new MailAddress("rehman.gull@hotmail.com"));

            mMailMessage.Subject = "User Login Information: ";
            string strBody = " <b>TEST MESSAGE</b>";
            mMailMessage.Body = strBody;
            mMailMessage.IsBodyHtml = true;
            mMailMessage.Priority = System.Net.Mail.MailPriority.Normal;
            string mSMTPServer = "61.5.139.5";
            //int mSMTPPort = 25;
            SmtpClient SmtpMail = new SmtpClient(mSMTPServer);
            SmtpMail.Credentials = new System.Net.NetworkCredential("rehman.gull@nxb.com.pk", "password");
            SmtpMail.Send(mMailMessage);

        }
        private int SendMessage(string strUserName, string strPassword, string strEmail)
        {
            string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder because your company has set up HACCP  <br/> Builder to manage your site’s/location’s food safety program.  HACCP Builder makes it easy to <br/> build and manage your HACCP Plan plus keep your site/location in compliance with the <br/>USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
            strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";

            EmailContents contents = new EmailContents();
            contents.Body = strBody;
            contents.Subject = "HACCP Builder is now set-up for your location. Please use this information to sign in.";
            EmailManager emailManager = new EmailManager();
            try
            {
                emailManager.ToAddress = strEmail;
                emailManager.SendUserInfo(contents);
            }
            catch (Exception)
            {
                return 0;
            }
            if (emailManager.IsSent)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }
        private void SetPage()
        {
            if (mode == "NEW")
            {

                this.txtUserId.Text = "";
                this.txtFax.Text = "";
                this.txtEmployeeName.Text = "";
                this.txtUserId.Text = "";
                this.txtPassword.Text = "";
                this.txtInitials.Text = "";
                this.txtPhone1.Text = "";
                this.txtPhone2.Text = "";
                this.txtFax.Text = "";
                //this.ddlTimeZone.SelectedIndex = 0;
                chkActive.Checked = true;
                this.rdbColdHoldingLogAlertOff.Checked = true;
                //this.rdbColdHoldingLogAlertOn.Enabled = false;
                this.rdbColdHoldingLogOff.Checked = true;
                this.rdbFoodSafetyAlertOff.Checked = true;
                //this.rdbFoodSafetyAlertOn.Enabled = false;
                this.rdbFoodSafetyOff.Checked = true;
                this.rdbFreezerLogAlertOff.Checked = true;
                this.rdbFreezerNewLogAlertOff.Checked = true;
                //this.rdbFreezerLogAlertOn.Enabled = false;
                this.rdbFreezerLogOff.Checked = true;
                this.rdbFreezerNewLogOff.Checked = true;
                this.rdbHotHoldingLogAlertOff.Checked = true;
                //this.rdbHotHoldingLogAlertOn.Enabled = false;
                this.rdbHotHoldingLogOff.Checked = true;
                this.rdbReceivingLogAlertOff.Checked = true;
                //this.rdbReceivingLogAlertOn.Enabled = false;
                this.rdbReceivingLogOff.Checked = true;
                this.rdbRefrigerationLogAlertOff.Checked = true;
                //this.rdbRefrigerationLogAlertOn.Enabled = false;
                this.rdbRefrigerationLogOff.Checked = true;
                this.rdbShippingLogAlertOff.Checked = true;
                this.rdbShippingLogOff.Checked = true;
                this.rdbTemperatureLogAlertOff.Checked = true;
                //this.rdbTemperatureLogAlertOn.Enabled = false;
                this.rdbTemperatureLogOff.Checked = true;
                this.rdbThermometerAlertOff.Checked = true;
                //this.rdbThermometerAlertOn.Enabled = false;
                this.rdbThermometerOff.Checked = true;
                this.rdbValidationAlertOff.Checked = true;
                //this.rdbValidationAlertOn.Enabled = false;
                this.rdbValidationOff.Checked = true;
                this.rdbPhLogAlertOff.Checked = true;
                this.rdbPhLogOff.Checked = true;
                this.rdbPestLogAlertOff.Checked = true;
                this.rdbPestLogOff.Checked = true;
                this.rdbMaintenanceLogAlertOff.Checked = true;
                this.rdbMaintenanceLogOff.Checked = true;
                //this.rdbChecklistAlertOff.Checked = true;
                //this.rdbChecklistOff.Checked = true;
                this.rdbCleaningLogAlertOff.Checked = true;
                this.rdbCleaningLogOff.Checked = true;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdSubmit.Visible = false;
                cmdDelete.Visible = false;
                // Alert Settings wouble enable only in edit mode
                //cmdAddAlert.Visible = false;
                hfEdit.Value = "N";
                // grdAlerts.DataBind();

            }
            else
            {

                cmdCancel.Visible = true;
                cmdAdd.Visible = false;
                cmdSubmit.Visible = true;
                cmdDelete.Visible = true;
                //cmdAddAlert.Visible = true;
                // Reset Alert Settings form
                hfAlertID.Value = String.Empty;
                txtAlertMessage.Text = String.Empty;
                SetTime(Utilities.GetTimeByZone(this.nKitchenId));
                chkFri.Checked = false;
                chkSat.Checked = false;
                chkSun.Checked = false;
                chkMon.Checked = false;
                chkTue.Checked = false;
                chkWed.Checked = false;
                chkThu.Checked = false;
                ddlLogs.SelectedIndex = 0;
                txtManagerTime.Text = String.Empty;
                txtManagerMessage.Text = String.Empty;
                txtReminderTime.Text = String.Empty;
                txtReminderMessage.Text = String.Empty;
                txtAlertEmail.Text = string.Empty;
                hfEdit.Value = "Y";
                BindAlertsData();
            }
            if (TypeId == 7)
            {
                // CT-PAT Location
                pnlFscl.Visible = false;
                pnlValidation.Visible = false;
            }


            string Info1 = "<b>The password length must be greater than or equal to 8.</b>";
            Info1 += "<b>The password must contain one or more uppercase characters.</b><br /> ";
            Info1 += "<b>The password must contain one or more lowercase characters.</b><br /> ";
            Info1 += "<b>The password must contain one or more numeric values.</b><br /> ";
            Info1 += "<b>The password must contain one or more special characters.</b><br /> ";


            Img_passwordhelp.Attributes.Add("onmouseover", "return overlib('" + Info1 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
            Img_passwordhelp.Attributes.Add("onmouseout", "return nd();");
            GetIntialData();
            grdHotHolding.DataBind();
        }
        private void BindAlertsData()
        {
            var questions = (from p in context.AlertSettings
                             join lg in context.Logs on p.LogID equals lg.LogID
                             where p.AccountID == this.nMobileId
                             orderby p.LogID
                             select new
                             {
                                 p.LogID,
                                 p.AccountID,
                                 p.AlertID,
                                 p.AlertMessage,
                                 p.AlertTime,
                                 p.Fri,
                                 lgID = p.LogID,
                                 p.ManagerAlert,
                                 p.ManagerMessage,
                                 p.Mon,
                                 p.Reminder,
                                 p.ReminderMeesage,
                                 p.Sat,
                                 p.Sun,
                                 p.Thu,
                                 p.Tue,
                                 p.TypeId,
                                 p.Wed,
                                 lg.Name,
                                 p.IsCheckList
                             }).ToList();


            var query = (from p in context.GetMobileAlertSettings(this.nMobileId)
                         select p).ToList();
            //  grdAlerts.DataSource = query;
            //  grdAlerts.DataBind();


        }
        private void GetIntialData()
        {

            ProcessGetKitchen kitchen = new ProcessGetKitchen();
            IDataReader drKitchen = kitchen.GetKitchenContactByRoleId((int)Session["KitchenId"], 2);

            if (drKitchen.Read())
            {
                txtCity.Text = drKitchen["City"].ToString();
                txtAddress1.Text = drKitchen["AddressLine1"].ToString();
                txtAddress2.Text = drKitchen["AddressLine2"].ToString();
                //txtAltPhone.Text = drKitchen["SecondaryPhone"].ToString();
                txtState.Text = drKitchen["StateProvince"].ToString();
                //txtFax.Text = drKitchen["Fax"].ToString();
                hfStateId.Value = drKitchen["StateProvinceId"].ToString();
                // txtPhone1.Text = drKitchen["PrimaryPhone"].ToString();
                txtZipCode.Text = drKitchen["PostalCode"].ToString();
                txtTimeZone.Text = drKitchen["DisplayName"].ToString();
                hfTimeZone.Value = drKitchen["TimeZone"].ToString();
                hfCountry.Value = drKitchen["CountryRegionCode"].ToString();
                //Session["KitchenId"] = Convert.ToInt32(hfKitchenId.Value);
                //Session["KitchenName"] = drKitchen["KitchenName"].ToString();
                drKitchen.Close();
            }



            ProcessGetDailyReports getLogSettings = new ProcessGetDailyReports();
            DataSet dsLogSetting = getLogSettings.GetReportsStatus((int)Session["KitchenId"]);
            if (dsLogSetting.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow drLog in dsLogSetting.Tables[0].Rows)
                {
                    if (drLog["ColdHoldingLog"].ToString() == "0")
                    {
                        rdbColdHoldingLogAlertOff.Enabled = false;
                        rdbColdHoldingLogAlertOn.Enabled = false;
                        rdbColdHoldingLogOff.Enabled = false;
                        rdbColdHoldingLogOn.Enabled = false;
                        rdbColdHoldingLogOff.Checked = true;
                        rdbColdHoldingLogAlertOff.Checked = true;

                    }
                    if (drLog["FoodSafetyCheckList"].ToString() == "0")
                    {
                        rdbFoodSafetyAlertOff.Enabled = false;
                        rdbFoodSafetyAlertOn.Enabled = false;
                        rdbFoodSafetyOff.Enabled = false;
                        rdbFoodSafetyOn.Enabled = false;
                        rdbFoodSafetyOff.Checked = true;
                        rdbFoodSafetyAlertOff.Checked = true;


                    }
                    if (drLog["FreezerLog"].ToString() == "0")
                    {
                        rdbFreezerLogAlertOff.Enabled = false;
                        rdbFreezerLogAlertOn.Enabled = false;
                        rdbFreezerLogOff.Enabled = false;
                        rdbFreezerLogOn.Enabled = false;
                        rdbFreezerLogOff.Checked = true;
                        rdbFreezerLogAlertOff.Checked = true;

                    }
                    if (drLog["FreezerNewLog"].ToString() == "0")
                    {
                        rdbFreezerNewLogAlertOff.Enabled = false;
                        rdbFreezerNewLogAlertOn.Enabled = false;
                        rdbFreezerNewLogOff.Enabled = false;
                        rdbFreezerNewLogOn.Enabled = false;
                        rdbFreezerNewLogOff.Checked = true;
                        rdbFreezerNewLogAlertOff.Checked = true;

                    }
                    if (drLog["HotHoldingLog"].ToString() == "0")
                    {
                        rdbHotHoldingLogAlertOff.Enabled = false;
                        rdbHotHoldingLogAlertOn.Enabled = false;
                        rdbHotHoldingLogOff.Enabled = false;
                        rdbHotHoldingLogOn.Enabled = false;
                        rdbHotHoldingLogOff.Checked = true;
                        rdbHotHoldingLogAlertOff.Checked = true;

                    }
                    if (drLog["ReceivingLog"].ToString() == "0")
                    {
                        rdbReceivingLogAlertOff.Enabled = false;
                        rdbReceivingLogAlertOn.Enabled = false;
                        rdbReceivingLogOff.Enabled = false;
                        rdbReceivingLogOn.Enabled = false;
                        rdbReceivingLogOff.Checked = true;
                        rdbReceivingLogAlertOff.Checked = true;

                    }
                    if (drLog["RefrigerationLog"].ToString() == "0")
                    {
                        rdbRefrigerationLogAlertOff.Enabled = false;
                        rdbRefrigerationLogAlertOn.Enabled = false;
                        rdbRefrigerationLogOff.Enabled = false;
                        rdbRefrigerationLogOn.Enabled = false;
                        rdbRefrigerationLogOff.Checked = true;
                        rdbRefrigerationLogAlertOff.Checked = true;

                    }
                    if (drLog["ShippingLog"].ToString() == "0")
                    {
                        rdbShippingLogAlertOff.Enabled = false;
                        rdbShippingLogAlertOn.Enabled = false;
                        rdbShippingLogOff.Enabled = false;
                        rdbShippingLogOn.Enabled = false;
                        rdbShippingLogOff.Checked = true;
                        rdbShippingLogAlertOff.Checked = true;

                    }
                    if (drLog["TemperatureLog"].ToString() == "0")
                    {
                        rdbTemperatureLogAlertOff.Enabled = false;
                        rdbTemperatureLogAlertOn.Enabled = false;
                        rdbTemperatureLogOff.Enabled = false;
                        rdbTemperatureLogOn.Enabled = false;
                        rdbTemperatureLogOff.Checked = true;
                        rdbTemperatureLogAlertOff.Checked = true;

                    }
                    if (drLog["Thermometer"].ToString() == "0")
                    {
                        rdbThermometerAlertOff.Enabled = false;
                        rdbThermometerAlertOn.Enabled = false;
                        rdbThermometerOff.Enabled = false;
                        rdbThermometerOn.Enabled = false;
                        rdbThermometerOff.Checked = true;
                        rdbThermometerAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "Thermometer");
                        //logsList.Remove(item);
                    }
                    if (drLog["Validation"].ToString() == "0")
                    {
                        rdbValidationAlertOff.Enabled = false;
                        rdbValidationAlertOn.Enabled = false;
                        rdbValidationOff.Enabled = false;
                        rdbValidationOn.Enabled = false;
                        rdbValidationOff.Checked = true;
                        rdbValidationAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "Validation");
                        //logsList.Remove(item);
                    }
                    if (drLog["PhLog"].ToString() == "0")
                    {
                        rdbPhLogAlertOff.Enabled = false;
                        rdbPhLogAlertOn.Enabled = false;
                        rdbPhLogOff.Enabled = false;
                        rdbPhLogOn.Enabled = false;
                        rdbPhLogOff.Checked = true;
                        rdbPhLogAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "PhLog");
                        //logsList.Remove(item);
                    }
                    if (drLog["PestLog"].ToString() == "0")
                    {
                        rdbPestLogAlertOff.Enabled = false;
                        rdbPestLogAlertOn.Enabled = false;
                        rdbPestLogOff.Enabled = false;
                        rdbPestLogOn.Enabled = false;
                        rdbPestLogOff.Checked = true;
                        rdbPestLogAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "PestLog");
                        //logsList.Remove(item);
                    }
                    if (drLog["MaintenanceLog"].ToString() == "0")
                    {
                        rdbMaintenanceLogAlertOff.Enabled = false;
                        rdbMaintenanceLogAlertOn.Enabled = false;
                        rdbMaintenanceLogOff.Enabled = false;
                        rdbMaintenanceLogOn.Enabled = false;
                        rdbMaintenanceLogOff.Checked = true;
                        rdbMaintenanceLogAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                        //logsList.Remove(item);
                    }
                    if (drLog["CleaningLog"].ToString() == "0")
                    {
                        rdbCleaningLogAlertOff.Enabled = false;
                        rdbCleaningLogAlertOn.Enabled = false;
                        rdbCleaningLogOff.Enabled = false;
                        rdbCleaningLogOn.Enabled = false;
                        rdbCleaningLogOff.Checked = true;
                        rdbCleaningLogAlertOff.Checked = true;
                        //item = logsList.Find(x => x.ShortName == "CleaningLog");
                        //logsList.Remove(item);
                    }
                    if (drLog["CheckList"].ToString() == "0")
                    {

                    }


                }
            }

        }
        private void BindLogs(SchoolHaccp.Common.Mobile mobile)
        {
            var logsList = (from lg in context.Logs
                            select lg).ToList();
            Log item = new Log();
            if (mobile.ColdHoldingLog == 1)
            {
                rdbColdHoldingLogOn.Checked = true;
            }
            else
            {
                rdbColdHoldingLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckList == 1)
            {
                rdbFoodSafetyOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.FreezerLog == 1)
            {
                rdbFreezerLogOn.Checked = true;
            }
            else
            {
                rdbFreezerLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLog == 1)
            {
                rdbFreezerNewLogOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLog == 1)
            {
                rdbHotHoldingLogOn.Checked = true;
            }
            else
            {
                rdbHotHoldingLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLog == 1)
            {
                rdbReceivingLogOn.Checked = true;
            }
            else
            {
                rdbReceivingLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLog == 1)
            {
                rdbRefrigerationLogOn.Checked = true;
            }
            else
            {
                rdbRefrigerationLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLog == 1)
            {
                rdbShippingLogOn.Checked = true;
            }
            else
            {
                rdbShippingLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLog == 1)
            {
                rdbTemperatureLogOn.Checked = true;
            }
            else
            {
                rdbTemperatureLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.Thermometer == 1)
            {
                rdbThermometerOn.Checked = true;
            }
            else
            {
                rdbThermometerOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }

            if (mobile.Validation == 1)
            {
                rdbValidationOn.Checked = true;
            }
            else
            {
                rdbValidationOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLogAlert == 1)
            {
                rdbTemperatureLogAlertOn.Checked = true;
            }
            else
            {
                rdbTemperatureLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLogAlert == 1)
            {
                rdbHotHoldingLogAlertOn.Checked = true;
            }
            else
            {
                rdbHotHoldingLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ColdHoldingLogAlert == 1)
            {
                rdbColdHoldingLogAlertOn.Checked = true;
            }
            else
            {
                rdbColdHoldingLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLogAlert == 1)
            {
                rdbReceivingLogAlertOn.Checked = true;
            }
            else
            {
                rdbReceivingLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLogAlert == 1)
            {
                rdbShippingLogAlertOn.Checked = true;
            }
            else
            {
                rdbShippingLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerLogAlert == 1)
            {
                rdbFreezerLogAlertOn.Checked = true;
            }
            else
            {
                rdbFreezerLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLogAlert == 1)
            {
                rdbFreezerNewLogAlertOn.Checked = true;
            }
            else
            {
                rdbFreezerNewLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLogAlert == 1)
            {
                rdbRefrigerationLogAlertOn.Checked = true;
            }
            else
            {
                rdbRefrigerationLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckListAlert == 1)
            {
                rdbFoodSafetyAlertOn.Checked = true;
            }
            else
            {
                rdbFoodSafetyAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.ThermometerAlert == 1)
            {
                rdbThermometerAlertOn.Checked = true;
            }
            else
            {
                rdbThermometerAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }
            if (mobile.ValidationAlert == 1)
            {
                rdbValidationAlertOn.Checked = true;
            }
            else
            {
                rdbValidationAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.PhLog == 1)
                rdbPhLogOn.Checked = true;
            else
            {
                rdbPhLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }
            if (mobile.PhLogAlert == 1)
                rdbPhLogAlertOn.Checked = true;
            else
            {
                rdbPhLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }

            if (mobile.PestLog == 1)
                rdbPestLogOn.Checked = true;
            else
            {
                rdbPestLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.PestLogAlert == 1)
                rdbPestLogAlertOn.Checked = true;
            else
            {
                rdbPestLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLog == 1)
                rdbMaintenanceLogOn.Checked = true;
            else
            {
                rdbMaintenanceLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLogAlert == 1)
                rdbMaintenanceLogAlertOn.Checked = true;
            else
            {
                rdbMaintenanceLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }
            //if (mobile.CheckList == 1)
            //    rdbChecklistOn.Checked = true;
            //else
            //    rdbChecklistOff.Checked = true;
            if (mobile.CleaningLog == 1)
                rdbCleaningLogOn.Checked = true;
            else
            {
                rdbCleaningLogOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }
            if (mobile.CleaningLogAlert == 1)
                rdbCleaningLogAlertOn.Checked = true;
            else
            {
                rdbCleaningLogAlertOff.Checked = true;
                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }
            ddlLogs.DataSource = logsList;
            ddlLogs.DataBind();
            var checklist = (from mc in context.MobileChecklists
                             join cs in context.ChecklistSections on mc.ChecklistSectionId equals cs.CheckListSectionId
                             where mc.MobileId == this.nMobileId
                             select new { MobileChecklistId = mc.ChecklistSectionId, Checklist = cs.Name, ChecklistAlert = mc.ChecklistAlert }).ToList();
            foreach (var logItem in checklist)
            {
                if ((int)logItem.ChecklistAlert == 1)
                {
                    ListItem lstItem = new ListItem();
                    lstItem.Text = "Checklist - " + logItem.Checklist;
                    lstItem.Value = logItem.MobileChecklistId.ToString();
                    ddlLogs.Items.Add(lstItem);
                }
            }
        }
        private void GetData(int MobileId)
        {
            ProcessGetMobile getMobile = new ProcessGetMobile();
            getMobile.Invoke(MobileId);
            SchoolHaccp.Common.Mobile mobile = getMobile.Mobile;
            SchoolHaccp.Common.Contact contact = getMobile.Contact;
            SchoolHaccp.Common.Address address = getMobile.Address;
            txtUserId.Text = contact.Email;
            txtEmployeeName.Text = contact.Name;
            txtInitials.Text = contact.Initials;
            //txtPassword.Text = "Leave Blank"; //contact.Password;

            txtPhone1.Text = contact.Phone;
            txtPhone2.Text = contact.AltPhone;
            txtFax.Text = contact.Fax;
            txtUserId.Text = contact.UserId;
            hfContactId.Value = contact.ContactId.ToString();
            hfAddressId.Value = address.AddressId.ToString();
            hfMobileId.Value = mobile.MobileId.ToString();
            // ddlTimeZone.SelectedValue = address.TimeZone;
            chkActive.Checked = mobile.Active == 1 ? true : false;
            GetIntialData();
            BindLogs(mobile);
            BindChecklistSections();

        }
        private void GetData()
        {
            if (Request.QueryString["Id"] != null)
            {
                GetData(int.Parse(Request.QueryString["Id"]));
                //ProcessGetContact contact = new ProcessGetContact();
                //DataSet dsContact = contact.GetContactDetailByContactId(int.Parse(Request.QueryString["Id"]));

            }
            else
            {
                lblInfo.Text = "Employee Not Found";
                lblInfo.Visible = true;
            }
        }
        private void SetAlertLogs()
        {

        }
        #region Mums Test
        // returns the number of digits in n.
        static int length(int n)
        {
            int numDigits = 0;
            while (n > 0)
            {   // Assumes n is >= 0
                numDigits++;
                n = n / 10;
            }
            if (numDigits == 0)
            {
                numDigits = 1;
            }
            return numDigits;
        }

        // returns the nth digit of number. Rightmost digit is digit 0. 
        static int nthDigit(int number, int n)
        {
            int digit = 0;
            for (int i = 0; i <= n; i++)
            {  // Assumes n is >= 0
                digit = number % 10;
                number /= 10;
            }

            return digit;
        }
        int foo(int n1, int n2)
        {
            int result1, result2;
            int len1, len2;
            int diff = 0;
            len1 = length(n1);
            len2 = length(n2);
            if (len1 == len2)
            {
                for (int j = 0; j < len1; j++)
                {
                    result1 = nthDigit(n1, j);
                    result2 = nthDigit(n2, j);
                    if (result1 != result2)
                        diff++;
                }
                if (diff == 1)
                    return 1;
                else
                    return 0;
            }
            else
            {
                return 0;
            }
        }
        int isDaphne(int[] a)
        {
            int isDeph = 0;
            int tempResult = 0;
            for (int i = 0; i < a.Length; i++)
            {
                if (a[i] == 0)
                {
                    for (int j = 1; j <= 3; j++)
                    {
                        if (a[i + j] == 0)
                        {
                            tempResult++;
                        }
                        else
                        {
                            tempResult--;
                        }
                    }// end inner loop
                    if (tempResult == 3)
                    {
                        isDeph = 1;
                        break;
                    }

                }// end if condition

            } // end outer loop
            if (isDeph == 1)
                return 1;
            else
                return 0;
        }
        int largestDaphneSum(int[] a)
        {
            int max = 0, sum = 0;
            for (int i = 0; i <= a.Length; i++)
            {
                sum = 0;
                for (int j = 0; j < a.Length; j++)
                {
                    if (i != j)
                        sum += a[j];
                }
                if (sum > max)
                    max = sum;
            } // end outer loop
            return max;
        }
        #endregion
        #region Crude operations
        private int UpdateData(int nMode)
        {
            string password = txtPassword.Text;
            string passwordSalt = Guid.NewGuid().ToString();
            if (txtUserId.Text.Contains("@"))
                password = Utilities.CreatePasswordHash(password, passwordSalt);

            SchoolHaccp.Common.Address newAddress = new SchoolHaccp.Common.Address();
            newAddress.AddressId = int.Parse(hfAddressId.Value);
            newAddress.AddressOne = txtAddress1.Text;
            newAddress.AddressTwo = txtAddress2.Text;
            newAddress.City = txtCity.Text;
            newAddress.State = txtState.Text;
            newAddress.ZipCode = txtZipCode.Text;
            newAddress.TimeZone = txtTimeZone.Text;
            newAddress.AddressId = int.Parse(hfAddressId.Value);
            newAddress.Country = hfCountry.Value;

            SchoolHaccp.Common.Contact newContact = new SchoolHaccp.Common.Contact();
            newContact.ContactId = int.Parse(hfContactId.Value);
            newContact.AltPhone = txtPhone2.Text;
            newContact.Fax = txtFax.Text;
            newContact.Email = txtUserId.Text;
            newContact.Name = txtEmployeeName.Text;
            newContact.Phone = txtPhone1.Text;
            newContact.EmailAlerts = 0;
            newContact.ContactId = int.Parse(hfContactId.Value);
            newContact.UserId = txtUserId.Text;
            newContact.Password = password;
            newContact.PasswordSalt = passwordSalt;

            newContact.IsUpdated = true;

            newContact.Initials = txtInitials.Text;
            if (nMode == 1)
            {
                // Updation Mode
                newContact.Active = 1;
            }
            if (nMode == 2)
            {
                // Deletion Mode
                newContact.Active = 0;
            }

            SchoolHaccp.Common.Mobile mobile = new SchoolHaccp.Common.Mobile();
            mobile.Active = chkActive.Checked == true ? 1 : 0;
            //mobile.MobileId = (int)Session["MobileId"];
            mobile.MobileId = int.Parse(hfMobileId.Value);
            mobile.KitchenId = (int)Session["KitchenId"];
            GetLogSettings(mobile);

            //Kitchen kitchen = new Kitchen();
            //kitchen.KitchenId = (int)Session["KitchenId"];

            //ProcessSetKitchen setKitchen = new ProcessSetKitchen();
            //setKitchen.Kitchen = kitchen;
            ProcessSetMobile setMobile = new ProcessSetMobile();
            setMobile.Contact = newContact;
            setMobile.Address = newAddress;
            setMobile.Mobile = mobile;
            setMobile.Invoke();
            SetMobileChecklistSettings(int.Parse(hfMobileId.Value));

            return 1;
        }
        private int DeleteData()
        {
            ProcessDeleteMobile deleteMobile = new ProcessDeleteMobile();
            deleteMobile.Invoke(int.Parse(hfMobileId.Value));
            return 1;
        }
        private void CreateData()
        {
            string password = txtPassword.Text;
            string passwordSalt = Guid.NewGuid().ToString();
            if (txtUserId.Text.Contains("@") && !string.IsNullOrEmpty(password))
            {

                password = Utilities.CreatePasswordHash(password, passwordSalt);
            }
            ViewState["Password"] = password;
            SchoolHaccp.Common.Address newAddress = new SchoolHaccp.Common.Address();
            newAddress.AddressOne = txtAddress1.Text;
            newAddress.AddressTwo = txtAddress2.Text;
            newAddress.City = txtCity.Text;
            newAddress.State = txtState.Text;
            newAddress.ZipCode = txtZipCode.Text;
            newAddress.TimeZone = txtTimeZone.Text;
            newAddress.Country = hfCountry.Value;
            //newAddress.AddressId = int.Parse(hfAddressId.Value);

            SchoolHaccp.Common.Contact newContact = new SchoolHaccp.Common.Contact();
            newContact.AltPhone = txtPhone2.Text;
            newContact.Fax = txtFax.Text;
            newContact.Email = txtUserId.Text;
            newContact.Name = txtEmployeeName.Text;
            newContact.Phone = txtPhone1.Text;
            newContact.EmailAlerts = 0;
            //newContact.ContactId = int.Parse(hfContactId.Value);
            newContact.UserId = txtUserId.Text;
            newContact.Password = password;
            newContact.PasswordSalt = passwordSalt;
            newContact.Initials = txtInitials.Text;
            newContact.IsUpdated = true;

            SchoolHaccp.Common.Mobile mobile = new SchoolHaccp.Common.Mobile();
            mobile.Active = chkActive.Checked == true ? 1 : 0;
            // mobile.MobileId = (int)Session["MobileId"];
            mobile.KitchenId = (int)Session["KitchenId"];
            mobile.Name = "Log Settings";
            GetLogSettings(mobile);
            //Kitchen kitchen = new Kitchen();
            //kitchen.KitchenId = (int)Session["KitchenId"];

            //ProcessCreateKitchen createKitchen = new ProcessCreateKitchen();
            //createKitchen.Kitchen = kitchen;
            ProcessCreateMobile createMobile = new ProcessCreateMobile();
            createMobile.Contact = newContact;
            createMobile.Address = newAddress;
            createMobile.Mobile = mobile;
            createMobile.Invoke();

            //int nUpdated = SendMessage(txtUserId.Text, txtPassword.Text, txtEmail.Text);
            int nUpdated = 1;
            if (nUpdated == 1)
            {
                lblInfo.Text = "Employee Account Created Succesfully";
                lblInfo.Visible = true;

            }
            else
            {
                lblInfo.Text = "Employee Account Created Succesfully, but there is problem occured in email sending";
                lblInfo.Visible = true;
            }
            ProcessGetMobile getMobile = new ProcessGetMobile();
            DataSet dsNewMobile = getMobile.GetNewMobileAccount();
            foreach (DataRow dr in dsNewMobile.Tables[0].Rows)
            {
                hfMobileId.Value = dr["MobileId"].ToString();
                SetMobileChecklistSettings(int.Parse(hfMobileId.Value));
            }
            SetPage();

        }
        private bool CheckData(int nMode)
        {

            if (nMode == 1)
            {
                ProcessGetContact contact = new ProcessGetContact();
                DataSet dsContact = contact.GetContactByUserName(txtUserId.Text.Trim());
                if (dsContact.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "User ID Already Exists";
                    lblInfo.Visible = true;
                    return false;
                }
                else
                {
                    return true;
                }
            }
            if (nMode == 2)
            {
                ProcessGetContact contact = new ProcessGetContact();
                DataSet dsContact = contact.GetContactByUserName(txtUserId.Text, int.Parse(hfContactId.Value));
                if (dsContact.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = "User ID Already Exists";
                    lblInfo.Visible = true;
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return false;
            }

        }
        #endregion

        #region Alert Operations
        protected void cmdSaveAlerts_Click(object sender, EventArgs e)
        {
            AlertSetting newSetting;
            if (hfAlertID.Value == "")
            {
                newSetting = new AlertSetting();
            }
            else
            {
                int AlertID = int.Parse(hfAlertID.Value);
                newSetting = (from t in context.AlertSettings
                              where t.AlertID == AlertID
                              select t).FirstOrDefault();
            }

            newSetting.AccountID = this.nMobileId;
            newSetting.AlertMessage = txtAlertMessage.Text;
            DateTime alertTime = DateTime.Parse(GetTime());
            string logName = ddlLogs.SelectedItem.Text;
            if (logName.Contains("Checklist -"))
                newSetting.IsCheckList = 1;
            else
                newSetting.IsCheckList = 0;
            newSetting.LogID = int.Parse(ddlLogs.SelectedValue);
            newSetting.ManagerAlert = txtManagerTime.Text == string.Empty ? 0 : int.Parse(txtManagerTime.Text);
            newSetting.ManagerMessage = txtManagerMessage.Text;
            newSetting.Reminder = txtReminderTime.Text == string.Empty ? 0 : int.Parse(txtReminderTime.Text);
            newSetting.ReminderMeesage = txtReminderMessage.Text;
            string alertType = rdlAlertType.SelectedValue;
            if (alertType == "Daily")
                newSetting.TypeId = 1;
            if (alertType == "Weekly")
                newSetting.TypeId = 2;
            if (alertType == "Monthly")
                newSetting.TypeId = 3;
            if (alertType == "Yearly")
                newSetting.TypeId = 4;
            if (alertType == "Daily" || alertType == "Monthly")
            {
                newSetting.Fri = chkFri.Checked == true ? 1 : 0;
                newSetting.Sat = chkSat.Checked == true ? 1 : 0;
                newSetting.Sun = chkSun.Checked == true ? 1 : 0;
                newSetting.Mon = chkMon.Checked == true ? 1 : 0;
                newSetting.Tue = chkTue.Checked == true ? 1 : 0;
                newSetting.Wed = chkWed.Checked == true ? 1 : 0;
                newSetting.Thu = chkThu.Checked == true ? 1 : 0;
            }
            if (alertType == "Weekly" || alertType == "Yearly")
            {
                string date = txtAlertDate.Text;
                string time = GetTime();
                alertTime = Convert.ToDateTime(date + " " + time);
            }

            //if (rdbDaily.Checked)
            //    newSetting.TypeId = 1;
            //if (rdbWeekly.Checked)
            //    newSetting.TypeId = 2;
            //if (rdbMonthly.Checked)
            //    newSetting.TypeId = 3;
            //if (rdbYearly.Checked)
            //    newSetting.TypeId = 4;

            //if (rdbDaily.Checked || rdbWeekly.Checked)
            //{
            //    newSetting.Fri = chkFri.Checked == true ? 1 : 0;
            //    newSetting.Sat = chkSat.Checked == true ? 1 : 0;
            //    newSetting.Sun = chkSun.Checked == true ? 1 : 0;
            //    newSetting.Mon = chkMon.Checked == true ? 1 : 0;
            //    newSetting.Tue = chkTue.Checked == true ? 1 : 0;
            //    newSetting.Wed = chkWed.Checked == true ? 1 : 0;
            //    newSetting.Thu = chkThu.Checked == true ? 1 : 0;
            //}
            //if (rdbMonthly.Checked || rdbYearly.Checked)
            //{
            //    string date = txtAlertDate.Text;
            //    string time = GetTime();
            //    alertTime = Convert.ToDateTime(date + " " + time);
            //}
            newSetting.AlertTime = alertTime;
            if (txtAlertEmail.Text != string.Empty)
            {
                newSetting.BccEmailAddresses = txtAlertEmail.Text;
            }
            if (hfAlertID.Value == "")
            {
                context.AlertSettings.AddObject(newSetting);
            }
            context.SaveChanges();
            SetPage();

        }
        [WebMethod]
        public static string GetAlertDataByID(int alertID)
        {
            var pageClass = new LocationOperatorNew();
            //int ID = alertID != string.Empty ? int.Parse(alertID): 1;
            AlertSetting newSetting = (from t in pageClass.context.AlertSettings
                                       where t.AlertID == alertID
                                       select t).FirstOrDefault();
            var logsList = (from lg in pageClass.context.Logs
                            select lg).ToList();
            ProcessGetMobile getMobile = new ProcessGetMobile();
            getMobile.Invoke(newSetting.AccountID);
            SchoolHaccp.Common.Mobile mobile = getMobile.Mobile;
            Log item = new Log();

            if (mobile.ColdHoldingLog != 1)
            {
                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckList != 1)
            {
                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.FreezerLog != 1)
            {
                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.Thermometer != 1)
            {

                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }

            if (mobile.Validation != 1)
            {

                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ColdHoldingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckListAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.ThermometerAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }
            if (mobile.ValidationAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.PhLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }
            if (mobile.PhLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }

            if (mobile.PestLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.PestLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }
            //if (mobile.CheckList != 1)
            //    rdbChecklistOn.Checked = true;
            //else
            //    rdbChecklistOff.Checked = true;
            if (mobile.CleaningLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }
            if (mobile.CleaningLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }

            var checklist = (from mc in pageClass.context.MobileChecklists
                             join cs in pageClass.context.ChecklistSections on mc.ChecklistSectionId equals cs.CheckListSectionId
                             where mc.MobileId == newSetting.AccountID
                             select new { MobileChecklistId = mc.ChecklistSectionId, Checklist = cs.Name, ChecklistAlert = mc.ChecklistAlert }).ToList();
            foreach (var logItem in checklist)
            {
                if ((int)logItem.ChecklistAlert == 1)
                {
                    Log checklistItem = new Log();
                    checklistItem.LogID = logItem.MobileChecklistId;
                    checklistItem.Name = "Checklist - " + logItem.Checklist;
                    logsList.Add(checklistItem);
                }
            }

            //return new JavaScriptSerializer().Serialize(new { AlertTime = newSetting.AlertTime.ToString(), newSetting.AccountID });
            return new JavaScriptSerializer().Serialize(new { hours = newSetting.AlertTime.Hour.ToString(), minutes = newSetting.AlertTime.Minute.ToString(), obj = newSetting, logList = logsList });


        }
        public class AlertJSonObj
        {
            public string AlertID { get; set; }
            public string AccountID { get; set; }
            public string AlertMessage { get; set; }
            public string ManagerMessage { get; set; }
            public string ReminderMeesage { get; set; }
            public string Reminder { get; set; }
            public string ManagerAlert { get; set; }
            public string hours { get; set; }
            public string minutes { get; set; }
            public string ampm { get; set; }
            public string Time { get; set; }
            public string Mon { get; set; }
            public string Tue { get; set; }
            public string Thu { get; set; }
            public string Fri { get; set; }
            public string Sat { get; set; }
            public string Sun { get; set; }
            public string Wed { get; set; }
            public string LogID { get; set; }
            public string LogName { get; set; }
            public string BccEmailAddresses { get; set; }
            public string TypeId { get; set; }
            public string AlertDate { get; set; }
        }
        [WebMethod]
        public static string SaveAlertSettings(AlertJSonObj settingObj)
        {
            AlertSetting newSetting;
            var pageClass = new LocationOperatorNew();
            if (settingObj.AlertID != "")
            {
                int AlertID = int.Parse(settingObj.AlertID);
                newSetting = (from t in pageClass.context.AlertSettings
                              where t.AlertID == AlertID
                              select t).FirstOrDefault();
            }
            else
            {
                newSetting = new AlertSetting();
            }
            newSetting.AccountID = int.Parse(settingObj.AccountID);
            newSetting.AlertMessage = settingObj.AlertMessage;
            DateTime alertTime = DateTime.Parse(settingObj.hours + ":" + settingObj.minutes + settingObj.ampm);
            string logName = settingObj.LogName;
            if (logName.Contains("Checklist -"))
                newSetting.IsCheckList = 1;
            else
                newSetting.IsCheckList = 0;
            newSetting.LogID = int.Parse(settingObj.LogID);
            newSetting.ManagerAlert = settingObj.ManagerAlert != "" ? int.Parse(settingObj.ManagerAlert) : 0;
            newSetting.ManagerMessage = settingObj.ManagerMessage;
            newSetting.Reminder = settingObj.Reminder != "" ? int.Parse(settingObj.Reminder) : 0;
            newSetting.ReminderMeesage = settingObj.ReminderMeesage;
            newSetting.TypeId = int.Parse(settingObj.TypeId);

            if (newSetting.TypeId == 1 || newSetting.TypeId == 2)
            {
                newSetting.Fri = int.Parse(settingObj.Fri);
                newSetting.Sat = int.Parse(settingObj.Sat);
                newSetting.Sun = int.Parse(settingObj.Sun);
                newSetting.Mon = int.Parse(settingObj.Mon);
                newSetting.Tue = int.Parse(settingObj.Tue);
                newSetting.Wed = int.Parse(settingObj.Wed);
                newSetting.Thu = int.Parse(settingObj.Thu);
            }
            if (newSetting.TypeId == 3 || newSetting.TypeId == 4)
            {
                string date = settingObj.AlertDate;
                string time = settingObj.hours + ":" + settingObj.minutes + settingObj.ampm;
                alertTime = Convert.ToDateTime(date + " " + time);
            }
            newSetting.AlertTime = alertTime;
            if (settingObj.BccEmailAddresses != string.Empty)
            {
                newSetting.BccEmailAddresses = settingObj.BccEmailAddresses;
            }
            if (settingObj.AlertID == "")
            {
                pageClass.context.AlertSettings.AddObject(newSetting);
            }
            pageClass.context.SaveChanges();
            return "Success";
        }
        [WebMethod]
        public static string GetLogsList(int MobileID)
        {
            var pageClass = new LocationOperatorNew();
            //int ID = alertID != string.Empty ? int.Parse(alertID): 1;

            var logsList = (from lg in pageClass.context.Logs
                            select lg).ToList();
            ProcessGetMobile getMobile = new ProcessGetMobile();
            getMobile.Invoke(MobileID);
            SchoolHaccp.Common.Mobile mobile = getMobile.Mobile;
            Log item = new Log();

            if (mobile.ColdHoldingLog != 1)
            {
                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckList != 1)
            {
                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.FreezerLog != 1)
            {
                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.Thermometer != 1)
            {

                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }

            if (mobile.Validation != 1)
            {

                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.TemperatureLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "TemperatureLog");
                logsList.Remove(item);
            }
            if (mobile.HotHoldingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "HotHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ColdHoldingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ColdHoldingLog");
                logsList.Remove(item);
            }
            if (mobile.ReceivingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ReceivingLog");
                logsList.Remove(item);
            }
            if (mobile.ShippingLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "ShippingLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerLog");
                logsList.Remove(item);
            }
            if (mobile.FreezerNewLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FreezerNewLog");
                logsList.Remove(item);
            }
            if (mobile.RefrigerationLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "RefrigerationLog");
                logsList.Remove(item);
            }
            if (mobile.FoodSafetyCheckListAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "FoodSafetyCheckList");
                logsList.Remove(item);
            }
            if (mobile.ThermometerAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "Thermometer");
                logsList.Remove(item);
            }
            if (mobile.ValidationAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "Validation");
                logsList.Remove(item);
            }
            if (mobile.PhLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }
            if (mobile.PhLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "PhLog");
                logsList.Remove(item);
            }

            if (mobile.PestLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.PestLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "PestLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }
            if (mobile.MaintenanceLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "MaintenanceLog");
                logsList.Remove(item);
            }

            if (mobile.CleaningLog != 1)
            {

                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }
            if (mobile.CleaningLogAlert != 1)
            {

                item = logsList.Find(x => x.ShortName == "CleaningLog");
                logsList.Remove(item);
            }

            var checklist = (from mc in pageClass.context.MobileChecklists
                             join cs in pageClass.context.ChecklistSections on mc.ChecklistSectionId equals cs.CheckListSectionId
                             where mc.MobileId == MobileID
                             select new { MobileChecklistId = mc.ChecklistSectionId, Checklist = cs.Name, ChecklistAlert = mc.ChecklistAlert }).ToList();
            foreach (var logItem in checklist)
            {
                if ((int)logItem.ChecklistAlert == 1)
                {
                    Log checklistItem = new Log();
                    checklistItem.LogID = logItem.MobileChecklistId;
                    checklistItem.Name = "Checklist - " + logItem.Checklist;
                    logsList.Add(checklistItem);
                }
            }
            return new JavaScriptSerializer().Serialize(new { logList = logsList });
        }
        protected void grdAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int nAlertId = int.Parse(e.CommandArgument.ToString());
                AlertSetting newSetting = (from t in context.AlertSettings
                                           where t.AlertID == nAlertId
                                           select t).FirstOrDefault();
                context.AlertSettings.DeleteObject(newSetting);
                context.SaveChanges();
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                row.Visible = false;
                // var query = (from p in context.GetMobileAlertSettings(this.nMobileId)
                //              select p).ToList();
                //GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                //GridView gv = (GridView)row.Parent;
                //gv.DataSource = query;
                //gv.DataBind();
            }
        }
        protected void grdAlerts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                HtmlAnchor lnkEdit = (HtmlAnchor)e.Row.FindControl("edit");
                HiddenField hfAlert = (HiddenField)e.Row.FindControl("hfAlertItemID");
                LinkButton lkbDelete = (LinkButton)e.Row.FindControl("lkbDelete");
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lkbDelete);
                lnkEdit.Attributes.Add("onclick", "EditAlertSettings(" + hfAlert.Value + ");");
            }
        }
        #endregion
        #region Helper Methods
        private void GetLogSettings(SchoolHaccp.Common.Mobile mobile)
        {
            mobile.ColdHoldingLog = rdbColdHoldingLogOn.Checked == true ? 1 : 0;
            mobile.ColdHoldingLogAlert = rdbColdHoldingLogAlertOn.Checked == true ? 1 : 0;
            mobile.FoodSafetyCheckList = rdbFoodSafetyOn.Checked == true ? 1 : 0;
            mobile.FoodSafetyCheckListAlert = rdbFoodSafetyAlertOn.Checked == true ? 1 : 0;
            mobile.FreezerLog = rdbFreezerLogOn.Checked == true ? 1 : 0;
            mobile.FreezerLogAlert = rdbFreezerLogAlertOn.Checked == true ? 1 : 0;
            mobile.FreezerNewLog = rdbFreezerNewLogOn.Checked == true ? 1 : 0;
            mobile.FreezerNewLogAlert = rdbFreezerNewLogAlertOn.Checked == true ? 1 : 0;
            mobile.HotHoldingLog = rdbHotHoldingLogOn.Checked == true ? 1 : 0;
            mobile.HotHoldingLogAlert = rdbHotHoldingLogAlertOn.Checked == true ? 1 : 0;
            mobile.ReceivingLog = rdbReceivingLogOn.Checked == true ? 1 : 0;
            mobile.ReceivingLogAlert = rdbReceivingLogAlertOn.Checked == true ? 1 : 0;
            mobile.RefrigerationLog = rdbRefrigerationLogOn.Checked ? 1 : 0;
            mobile.RefrigerationLogAlert = rdbRefrigerationLogAlertOn.Checked ? 1 : 0;
            mobile.ShippingLog = rdbShippingLogOn.Checked ? 1 : 0;
            mobile.ShippingLogAlert = rdbShippingLogAlertOn.Checked ? 1 : 0;
            mobile.TemperatureLog = rdbTemperatureLogOn.Checked ? 1 : 0;
            mobile.TemperatureLogAlert = rdbTemperatureLogAlertOn.Checked ? 1 : 0;
            mobile.Thermometer = rdbThermometerOn.Checked ? 1 : 0;
            mobile.ThermometerAlert = rdbThermometerAlertOn.Checked ? 1 : 0;
            mobile.Validation = rdbValidationOn.Checked ? 1 : 0;
            mobile.ValidationAlert = rdbValidationAlertOn.Checked ? 1 : 0;
            mobile.PhLogAlert = rdbPhLogAlertOn.Checked ? 1 : 0;
            mobile.PhLog = rdbPhLogOn.Checked ? 1 : 0;
            mobile.PestLogAlert = rdbPestLogAlertOn.Checked ? 1 : 0;
            mobile.PestLog = rdbPestLogOn.Checked ? 1 : 0;
            mobile.MaintenanceLogAlert = rdbMaintenanceLogAlertOn.Checked ? 1 : 0;
            mobile.MaintenanceLog = rdbMaintenanceLogOn.Checked ? 1 : 0;
            mobile.CleaningLogAlert = rdbCleaningLogAlertOn.Checked ? 1 : 0;
            mobile.CleaningLog = rdbCleaningLogOn.Checked ? 1 : 0;
            mobile.CheckListAlert = 1;
            mobile.CheckList = 1;

        }
        private void SetMobileChecklistSettings(int nMobileId)
        {
            // First delete entries from Mobilechecklist table and then Insert new records.
            ProcessDeleteMobile deleteMobileChecklist = new ProcessDeleteMobile();
            deleteMobileChecklist.DeleteMobileChecklist(nMobileId);
            int i, totalItems;
            totalItems = rptChecklist.Items.Count;
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOn");
                RadioButton rdbAlertYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistAlertOn");
                HiddenField hfChecklistId = (HiddenField)rptChecklist.Items[i].FindControl("hfKitchenChecklist");
                if (rdbAnswerYes.Checked == true)
                {
                    int alert = rdbAlertYes.Checked == true ? 1 : 0;
                    ProcessCreateMobile createMobile = new ProcessCreateMobile();
                    createMobile.CreateMobileChecklist(nMobileId, int.Parse(hfChecklistId.Value), alert);
                }
            }
        }
        private void BindChecklistSections()
        {
            int totalItems = rptChecklist.Items.Count;
            int i;
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOn");
                RadioButton rdbChecklistNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOff");
                RadioButton rdbAlertYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistAlertOn");
                RadioButton rdbAlertNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistAlertOff");
                HiddenField hfChecklistId = (HiddenField)rptChecklist.Items[i].FindControl("hfKitchenChecklist");
                bool found = false;
                bool alertStatus = false;
                if (dsSections != null)
                {
                    foreach (DataRow dr in dsSections.Tables[0].Rows)
                    {
                        rdbChecklistNo.Checked = false;
                        rdbAlertNo.Checked = false;
                        if (hfChecklistId != null)
                        {
                            if (hfChecklistId.Value == dr["CheckListSectionId"].ToString())
                            {
                                rdbAnswerYes.Checked = true;
                                found = true;
                                alertStatus = dr["ChecklistAlert"].ToString() == "1" ? true : false;
                                break;
                            }
                        }
                        else
                        {
                            rdbChecklistNo.Checked = true;
                            rdbAlertNo.Checked = true;
                        }
                    }
                }
                if (found)
                {
                    if (alertStatus == true)
                        rdbAlertYes.Checked = true;
                    else
                        rdbAlertNo.Checked = true;
                }
            }
        }
        private void SetChecklistDefaults()
        {
            int totalItems = rptChecklist.Items.Count;
            int i;
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbChecklistNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistOff");
                RadioButton rdbChecklistAlertNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbChecklistAlertOff");
                rdbChecklistNo.Checked = true;
            }
        }
        private string GetTime()
        {

            return tpHour1.Text + ":" + tpMinute1.Text + tpTime1.SelectedValue;

        }
        private void SetTime(DateTime dtTime)
        {

            //tpHour1.Text = (((dtTime.Hour + 11) % 12) + 1).ToString();
            tpHour1.Text = dtTime.ToString("hh");
            tpMinute1.Text = dtTime.ToString("mm");
            tpTime1.Text = dtTime.ToString("tt");
        }
        #endregion
        #region Events
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (Page.IsValid)
            {
                if (CheckData(2) == true)
                {
                    mode = "NEW";
                    // 1 - Update the Data
                    // 2 - Delete Data 
                    UpdateData(1);
                    SetPage();
                }

            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            mode = "NEW";
            int result = DeleteData();
            SetPage();

        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (Page.IsValid)
            {
                if (CheckData(1) == true)
                {
                    mode = "NEW";
                    CreateData();
                    SetPage();
                }
            }
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "NEW";
            SetPage();


        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "NEW";
            SetPage();
        }
        protected void chkActive_CheckedChanged(object sender, EventArgs e)
        {
            HiddenField hfMobileId;
            CheckBox chkActive;
            chkActive = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkActive.NamingContainer;

            hfMobileId = (HiddenField)row.FindControl("hfMobileId");
            if (hfMobileId != null)
            {
                int mobileId = int.Parse(hfMobileId.Value);
                int active = chkActive.Checked == true ? 1 : 0;
                var mobile = (from mb in context.Mobiles
                              where mb.MobileId == mobileId
                              select mb).FirstOrDefault();
                mobile.Active = active;
                context.SaveChanges();
                grdHotHolding.DataBind();
                row.CssClass = "inActive";
            }
        }
        protected void grdHotHolding_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int MobileId = int.Parse(DataBinder.Eval(e.Row.DataItem, "MobileId").ToString());
                int Status = int.Parse(DataBinder.Eval(e.Row.DataItem, "Active").ToString());
                HyperLink hlName = (HyperLink)e.Row.FindControl("hlEntryDate");
                HtmlAnchor hlAlert = (HtmlAnchor)e.Row.FindControl("addAlert");
                if (Status == 0)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.ForeColor = System.Drawing.Color.Red;
                    hlName.ForeColor = System.Drawing.Color.Red;
                    hlAlert.Style["Color"] = "#FF0000";
                }
                Panel pnlAlerts = e.Row.FindControl("pnlAlerts") as Panel;
                if (pnlAlerts != null)
                {
                    //product variants

                    var query = (from p in context.GetMobileAlertSettings(MobileId)
                                 select p).ToList();

                    if (query.Count == 0)
                    {
                        pnlAlerts.Visible = false;
                    }
                    else
                    {
                        GridView grdAlerts = e.Row.FindControl("grdAlerts") as GridView;
                        if (grdAlerts != null)
                        {
                            grdAlerts.DataSource = query;
                            grdAlerts.DataBind();
                        }
                    }
                }
                HtmlAnchor lnkEdit = (HtmlAnchor)e.Row.FindControl("addAlert");
                HiddenField hfAlert = (HiddenField)e.Row.FindControl("hfAlertItemID");
                lnkEdit.Attributes.Add("onclick", "AddAlertSettings(" + MobileId.ToString() + ");");
            }
        }
        #endregion


        protected void rptChecklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        #region Properties
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
        int nKitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                    return 1;
            }
        }
        int nMobileId
        {
            get
            {
                if (hfMobileId.Value != "")
                    return int.Parse(hfMobileId.Value);
                else
                    return 1;
            }
        }
        #endregion






    }
}