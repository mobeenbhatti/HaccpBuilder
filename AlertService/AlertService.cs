using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;
using System.IO;
using DataModel;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.DataAccess.Update;
using SchoolHaccp.DataAccess.Insert;
using SchoolHaccp.Operational;

namespace AlertService
{
    public partial class AlertService : ServiceBase
    {
        
        private Timer _Dispatcher = null;
        private Timer _Executer = null;       
        private List<AlertDispatch> lstAlerts = new List<AlertDispatch>();
        public AlertService()
        {
            try
            {
                InitializeComponent();
               
               // AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException); 
                
                _Dispatcher = new Timer(86400000); // 24 Hours              
               // _Dispatcher = new Timer(600000); // 10 minutes
                _Dispatcher.Elapsed += new ElapsedEventHandler(_dispatcher_Elapsed);
                _Executer = new Timer(60000); // 1 minute
                _Executer.Elapsed += new ElapsedEventHandler(_executor_Elapsed);

                if (!System.Diagnostics.EventLog.SourceExists("AlertServiceLog"))
                {

                    System.Diagnostics.EventLog.CreateEventSource(
                        "AlertServiceLog", "HaccpAlertLog");
                }
                eventLog1.Source = "AlertServiceLog";
                eventLog1.Log = "HaccpAlertLog";
               
            }
            catch (Exception ex)
            {
                eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace + "\n", EventLogEntryType.Error);
            }
        }

        void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            Exception ex = (Exception)e.ExceptionObject;
            eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace);         

        }
        [Conditional("DEBUG_SERVICE")]
        private static void DebugMode()
        {
            Debugger.Break();
        }
        protected override void OnStart(string[] args)
        {
            try
            {
                eventLog1.WriteEntry("In OnStart");
                _Dispatcher.Start();
                _Executer.Start();
                DispatchDailyMail();
            }
            catch (Exception ex)
            {
                eventLog1.WriteEntry("In OnStart");
                //eventLog1.WriteEntry("On Start" + ex.Message + "\n" + ex.StackTrace + ex.InnerException.Message,EventLogEntryType.Error);
              
            }

        }

        protected override void OnStop()
        {
            eventLog1.WriteEntry("In onStop.");
            FileStream fs = new FileStream(@"c:\temp\Service.txt",
           FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter m_streamWriter = new StreamWriter(fs);
            m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            m_streamWriter.WriteLine("Service Stopoped at: " + DateTime.Now.ToString() + "\n");
            m_streamWriter.Flush();
            m_streamWriter.Close(); 
        }
        #region Methods
        
        void _dispatcher_Elapsed(object sender, ElapsedEventArgs e)
        {
            // At 12 AM mid night fetch all records from Alert Settings table of the day. FillDispatchTable()
            // Push them in a DailyDispatch table by changing the client time in server time to execute.
            // Execute a routine after 1 minute and fetch all records from Dispatch table within next minute.CheckLogEntry()
            // On executing alert shift record in History table to keep track. ExecuteAlert()

            //DateTime systemDate = DateTime.Now;
            //DateTime compareDate = DateTime.Today.AddHours(3D);
            string strTest = "Test";
            
            //if (compareDate.Hour == systemDate.Hour)
            //{
                //SendUserInfo();
            eventLog1.WriteEntry("Dispatcher Timer Called");
            DispatchDailyMail();
               
               
               
            //}

        }
        void _fetcher_Elapsed(object sender, ElapsedEventArgs e)
        {
            // At 12 AM mid night fetch all records from Alert Settings table of the day. FillDispatchTable()
            // Push them in a DailyDispatch table by changing the client time in server time to execute.
            // Execute a routine after 1 minute and fetch all records from Dispatch table within next minute.CheckLogEntry()
            // On executing alert shift record in History table to keep track. ExecuteAlert()
        
          
            FileStream fs = new FileStream(@"c:\temp\Service.txt",
            FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter m_streamWriter = new StreamWriter(fs);
            m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            m_streamWriter.WriteLine(" Fetcher function called" + DateTime.Now.ToString() + "\n");
            m_streamWriter.Flush();
            m_streamWriter.Close();

            fs = new FileStream(@"c:\temp\Service.txt",
           FileMode.OpenOrCreate, FileAccess.Write);
            m_streamWriter = new StreamWriter(fs);
            m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            m_streamWriter.WriteLine("Filled Alerts List: \n");
            m_streamWriter.Flush();
            m_streamWriter.Close();
            //}

        }
        void _executor_Elapsed(object sender, ElapsedEventArgs e)
        {
            // At 12 AM mid night fetch all records from Alert Settings table of the day. FillDispatchTable()
            // Push them in a DailyDispatch table by changing the client time in server time to execute.
            // Execute a routine after 1 minute and fetch all records from Dispatch table within next minute.CheckLogEntry()
            // On executing alert shift record in History table to keep track. ExecuteAlert()
            

            //FileStream fs = new FileStream(@"c:\temp\Service.txt",
            //FileMode.OpenOrCreate, FileAccess.Write);
            //StreamWriter m_streamWriter = new StreamWriter(fs);
            //m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            //m_streamWriter.WriteLine(" Executor function called" + DateTime.Now.ToString() + "\n");
            //m_streamWriter.Flush();
            //m_streamWriter.Close();
            int emailStatus = 1;
            try
            {
                TimeSpan start = new TimeSpan(00, 00, 0); //11:59 o'clock
                TimeSpan end = new TimeSpan(00, 01, 0); //12 o'clock
                TimeSpan now = DateTime.Now.TimeOfDay;
                if ((now > start) && (now < end))
                {
                    //match found Execute Dispatch on every 12 AM daily
                    DispatchDailyMail();
                }
                eventLog1.WriteEntry("Executor try block: " + "\n" + lstAlerts.Count,EventLogEntryType.Information,1);
                _Executer.Enabled = false;
                DataModel.Entities context = new DataModel.Entities();
                if (lstAlerts.Count > 0)
                {
                    List<AlertDispatch> lstCurrentItems = (from i in lstAlerts
                                                           where TimeSpan.Compare(i.AlertTime.TimeOfDay, DateTime.Now.TimeOfDay) < 0
                                                           select i).ToList();
                    int numberOfMessages = lstCurrentItems.Count;
                    
                    string logName = "";
                    for (int i = 0; i < numberOfMessages;i++ )
                    {
                        eventLog1.WriteEntry("No of alerts expired so far: " + "\n" + lstCurrentItems.Count);
                        bool recordExist = false;
                        AlertDispatch item = lstCurrentItems[0];
                        var mobile = (from mb in context.Mobiles where mb.MobileId == item.AccountID select mb).FirstOrDefault();
                        if (item.IsCheckList == 1)
                        {
                            //Checklist Add On
                            var checklist = (from mck in context.ChecklistSections
                                             where mck.CheckListSectionId == item.LogID
                                             select mck).FirstOrDefault();
                            logName = checklist.Name;
                            var checklistEntry = (from lg in context.ChecklistHistories
                                                  where lg.EntryDate == DateTime.Now
                                                  && lg.MobileID == item.AccountID
                                                  select lg).FirstOrDefault();
                            if (checklistEntry != null)
                            {
                                if (TimeSpan.Compare(checklistEntry.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                    recordExist = true;
                                else
                                    recordExist = false;
                            }                            
                        }
                        else
                        {
                            //Check relevant Log record if data has entered or not
                            switch (item.LogID)
                            {
                                case 1:
                                    //DateTime alertSetTime = DateTime.Now;
                                    //TimeSpan ts = item.AlertTime.TimeOfDay;
                                    //alertSetTime = alertSetTime.Date + ts;
                                    logName = "Cleaning Log";
                                    var cleaningLog = (from lg in context.CleaningLogs
                                                       where lg.EntryDate == DateTime.Now
                                                       && lg.MobileId == item.AccountID
                                                       select lg).FirstOrDefault();
                                    if (cleaningLog != null)
                                    {
                                        if (TimeSpan.Compare(cleaningLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 2:
                                    logName = "Cold Holding Log";
                                    var coldHoldingLog = (from lg in context.ColdHoldingLogs
                                                          where lg.EntryDate == DateTime.Now
                                                          && lg.MobileId == item.AccountID
                                                          select lg).FirstOrDefault();

                                    if (coldHoldingLog != null)
                                    {
                                        if (TimeSpan.Compare(coldHoldingLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 3:
                                    logName = "Cooling Temperature Log";
                                    var freezerLog = (from lg in context.FreezerLogs
                                                      where lg.EntryDate == DateTime.Now
                                                      && lg.MobileId == item.AccountID
                                                      select lg).FirstOrDefault();
                                    if (freezerLog != null)
                                    {
                                        if (TimeSpan.Compare(freezerLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 4:
                                    logName = "Freezer Log";
                                    var freezerNewLog = (from lg in context.FreezerNewLogs
                                                         where lg.EntryDate == DateTime.Now
                                                         && lg.MobileId == item.AccountID
                                                         select lg).FirstOrDefault();
                                    if (freezerNewLog != null)
                                    {
                                        if (TimeSpan.Compare(freezerNewLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 5:
                                    logName = "Temperature Log";
                                    var tempLog = (from lg in context.TemperatureLogs
                                                   where lg.EntryDate == DateTime.Now
                                                   && lg.MobileId == item.AccountID
                                                   select lg).FirstOrDefault();
                                    if (tempLog != null)
                                    {
                                        if (TimeSpan.Compare(tempLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 6:
                                    logName = "Hot Holding Log";
                                    var hotholdingLog = (from lg in context.HotHoldingLogs
                                                         where lg.EntryDate == DateTime.Now
                                                         && lg.MobileId == item.AccountID
                                                         select lg).FirstOrDefault();
                                    if (hotholdingLog != null)
                                    {
                                        if (TimeSpan.Compare(hotholdingLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 7:
                                    logName = "Maintenance Log";
                                    var maintenanceLog = (from lg in context.MaintenanceLogs
                                                          where lg.EntryDate == DateTime.Now
                                                          && lg.MobileId == item.AccountID
                                                          select lg).FirstOrDefault();
                                    if (maintenanceLog != null)
                                    {
                                        if (TimeSpan.Compare(maintenanceLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 8:
                                    logName = "Ph Log";
                                    var phLog = (from lg in context.PhLogs
                                                 where lg.EntryDate == DateTime.Now
                                                 && lg.MobileId == item.AccountID
                                                 select lg).FirstOrDefault();
                                    if (phLog != null)
                                    {
                                        if (TimeSpan.Compare(phLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 9:
                                    logName = "Pest Log";
                                    var pestLog = (from lg in context.PestLogs
                                                   where lg.EntryDate == DateTime.Now
                                                   && lg.MobileId == item.AccountID
                                                   select lg).FirstOrDefault();
                                    if (pestLog != null)
                                    {
                                        if (TimeSpan.Compare(pestLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 10:
                                    logName = "Receiving Log";
                                    var receivingLog = (from lg in context.ReceivingLogs
                                                        where lg.EntryDate == DateTime.Now
                                                        && lg.MobileId == item.AccountID
                                                        select lg).FirstOrDefault();
                                    if (receivingLog != null)
                                    {
                                        if (TimeSpan.Compare(receivingLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 11:
                                    logName = "Refrigration Log";
                                    var refrigrationLog = (from lg in context.RefrigerationLogs
                                                           where lg.EntryDate == DateTime.Now
                                                           && lg.MobileId == item.AccountID
                                                           select lg).FirstOrDefault();
                                    if (refrigrationLog != null)
                                    {
                                        if (TimeSpan.Compare(refrigrationLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 12:
                                    logName = "Shipping Log";
                                    var shippingLog = (from lg in context.ShippingLogs
                                                       where lg.EntryDate == DateTime.Now
                                                       && lg.MobileId == item.AccountID
                                                       select lg).FirstOrDefault();
                                    if (shippingLog != null)
                                    {
                                        if (TimeSpan.Compare(shippingLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 13:
                                    logName = "Thermo Calibration Log";
                                    var thermoLog = (from lg in context.ThermoCalibrationLogs
                                                     where lg.EntryDate == DateTime.Now
                                                     && lg.MobileId == item.AccountID
                                                     select lg).FirstOrDefault();
                                    if (thermoLog != null)
                                    {
                                        if (TimeSpan.Compare(thermoLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 14:
                                    logName = "Food Safety Checklist";
                                    var responseHistory = (from lg in context.ResponseHistories
                                                           where lg.EntryDate == DateTime.Now
                                                           && lg.MobileID == item.AccountID
                                                           select lg).FirstOrDefault();
                                    if (responseHistory != null)
                                    {
                                        if (TimeSpan.Compare(responseHistory.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                                case 15:
                                    logName = "Validation Checklist";
                                    var validationLog = (from lg in context.ValidationHistories
                                                         where lg.EntryDate == DateTime.Now
                                                         && lg.KitchenId == mobile.KitchenId
                                                         select lg).FirstOrDefault();
                                    if (validationLog != null)
                                    {
                                        if (TimeSpan.Compare(validationLog.EntryDate.TimeOfDay, DateTime.Now.TimeOfDay) < 0)
                                            recordExist = true;
                                        else
                                            recordExist = false;
                                    }
                                    break;
                            }
                        }
                        if (recordExist == false)
                        {
                            // Send Email based on Alert Type
                           
                            var alert = (from al in context.AlertSettings
                                         where al.AlertID == item.AlertID
                                         select al).FirstOrDefault();
                            eventLog1.WriteEntry("Alert Send: " + item.AlertTime + "\n" + "Alert Type" + item.AlertType + "\n" + "Log NAme:" + logName + "\n" + "Alert ID:" + item.AlertID + "\n"
                                +"Dispatch ID: " +  item.DispatchID + "\n");
                            AlertContents alertContents = new AlertContents();
                            EmailManager alertManager = new EmailManager();
                            var employeeEmail = (from cnt in context.Contacts
                                                 join mc in context.MobileContacts on cnt.ContactId equals mc.ContactId
                                                 where mc.MobileId == mobile.MobileId
                                                 select cnt).FirstOrDefault();
                            
                            var kitchen = (from kc in context.Kitchens                                               
                                                where kc.KitchenId == mobile.KitchenId
                                                select kc).FirstOrDefault();
                            var managerEmail = kitchen.Contacts.FirstOrDefault();

                            if (item.AlertType == 1)
                            {
                                alertContents.Body = alert.AlertMessage;
                                alertContents.FromEmailAddress = "support@haccpbuilder.com";
                                alertContents.FromName = "HACCP Builder Task Alert";
                                alertContents.Subject = logName + " Alert" + " - "  + employeeEmail.Initials;
                                alertContents.To = employeeEmail.EmailAddress;
                                
                            }
                            if (item.AlertType == 2)
                            {
                                alertContents.Body = alert.ReminderMeesage;
                                alertContents.FromEmailAddress = "support@haccpbuilder.com";
                                alertContents.FromName = "HACCP Builder Task Alert";
                                alertContents.Subject = logName + " Alert Reminder" + " - " + employeeEmail.Initials;
                                alertContents.To = employeeEmail.EmailAddress;
                                
                            }
                            if (item.AlertType == 3)
                            {
                                alertContents.Body = alert.ManagerMessage;
                                alertContents.FromEmailAddress = "support@haccpbuilder.com";
                                alertContents.FromName = "HACCP Builder Task Alert";
                                alertContents.Subject = logName + " Manager Reminder" + " - " + employeeEmail.Initials;
                                alertContents.To = managerEmail.EmailAddress;                               
                            }
                            if (alert.BccEmailAddresses != null)
                            {
                                string[] bccList = alert.BccEmailAddresses.Split(',');
                                alertContents.Bcc = new List<string>();
                                for (int j = 0; j < bccList.Count(); j++)
                                {
                                    alertContents.Bcc.Add(bccList[j]);
                                }
                            }
                            try
                            {
                                alertManager.SendAlert(alertContents);
                            }
                            catch (Exception ex)
                            {
                                emailStatus = 0;
                                eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace + "\n", EventLogEntryType.Error);
                            }
                            finally
                            {
                                AlertHistory history = new AlertHistory();
                                history.AlertID = alert.AlertID;
                                history.CreatedOn = DateTime.Now;
                                history.Status = emailStatus;
                                history.Subject = alertContents.Subject;
                                history.ToEmail = alertContents.To;
                                context.AlertHistories.AddObject(history);

                                lock (item)
                                {
                                    AlertDispatch deleteObj = (from d in context.AlertDispatches
                                                               where d.DispatchID == item.DispatchID
                                                               select d).FirstOrDefault();

                                    if (deleteObj != null)
                                    {
                                        eventLog1.WriteEntry("Delete DispatchId" + deleteObj.DispatchID + "Alert ID" + deleteObj.AlertID + "\n", EventLogEntryType.Information, 3);
                                        context.AlertDispatches.DeleteObject(deleteObj);
                                        lstAlerts.Remove(item);
                                        lstCurrentItems.Remove(item);
                                    }
                                    context.SaveChanges();
                                }
                            }
                            
                            eventLog1.WriteEntry("Alert Sent: " + item.AlertTime + "\n" + "Alert Type" + item.AlertType + "\n" + "Log NAme:" + logName + "\n" + "Alert ID:" + item.AlertID + "\n");
                            
                            eventLog1.WriteEntry("After DB Operations:\n",EventLogEntryType.Information,2);
                            _Executer.Enabled = true;
                        }
                        else
                        {
                            // Record Has been entered in related Log. So no need to send alert
                            // Remove record from Dispatcher and add in History Table                          
                        }
                    } //end for each
                    context.Dispose();
                }// end If for count
            }
            catch (Exception ex)
            {                
                eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace + "\n",EventLogEntryType.Error);
                _Executer.Enabled = true;
                //StreamWriter m_streamWriterCatch = new StreamWriter(fs);
                //m_streamWriterCatch.BaseStream.Seek(0, SeekOrigin.End);
                //m_streamWriterCatch.WriteLine(" Error Occured: " + DateTime.Now.ToString() + ex.Message + "\n");
                //m_streamWriterCatch.Flush();
                //m_streamWriterCatch.Close();
            }
            _Executer.Enabled = true;
          
            //}

        }
        private void DispatchDailyMail()
        {

            try
            {
                 eventLog1.WriteEntry("Dispatcher function called",EventLogEntryType.Information,5);
                SetServices setService = new SetServices();
                setService.FillDispatchTable();
                Entities context = new Entities();
               // List<DataModel.AlertDispatch> lstAlerts = new List<DataModel.AlertDispatch>();
                lstAlerts = (from ds in context.AlertDispatches
                             orderby ds.AlertTime
                             select ds).ToList();

                eventLog1.WriteEntry("Before Filteration" + lstAlerts.Count, EventLogEntryType.Information, 5);
                foreach (var item in lstAlerts.ToList())
                // for (var x = 0; x < lstAlerts.Count; x++)
                {
                    //  var item = lstAlerts[x];
                    var mobileAccount = (from mb in context.Mobiles
                                         where mb.MobileId == item.AccountID
                                         select mb).FirstOrDefault();
                    // To process Checklists seperately
                    if (item.IsChecklist == 1)
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
                eventLog1.WriteEntry("After Filteration" + lstAlerts.Count, EventLogEntryType.Information, 5);
                context.Dispose();
            }
            catch (Exception ex)
            {
                  eventLog1.WriteEntry(ex.Message + "\n" + ex.StackTrace + "\n", EventLogEntryType.Error);
                //lblMessage.Text = ex.Message;

            }
        }
        #endregion
    }
}
