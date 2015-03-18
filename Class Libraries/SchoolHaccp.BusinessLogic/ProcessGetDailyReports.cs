using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetDailyReports : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetDailyReports()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(DateTime dtStartDate, int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            this.ResultSet = dailyReport.Get(dtStartDate, nKitchenId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Get(DateTime dtStartDate, int nKitchenId)
        {
            this.Invoke(dtStartDate,nKitchenId);
            foreach (DataRow row in this.ResultSet.Tables[0].Rows)
            {
                if (row["TypeId"].ToString() != "1")
                {
                    if (row["Report"].ToString() == "0")
                        row.Delete();
                }
            }
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetDailyReportsByMobileId(DateTime dtStartDate, int nMobileId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            this.ResultSet = dailyReport.GetDailyReportsByMobileId(nMobileId, dtStartDate);
            foreach (DataRow row in this.ResultSet.Tables[0].Rows)
            {
                if (row["Report"].ToString() == "0")
                    row.Delete();
            }
            return this.ResultSet;
        }
        
        //public IDataReader GetMissingDates(string strTableName, int nKitchenId)
        //{
        //    GetDailyReports dailyReport = new GetDailyReports();
        //    return dailyReport.GetMissingDates(strTableName,nKitchenId);
        //}
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetAlertDates(string strTableName, int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetAlertDates(strTableName, nKitchenId);
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetLogAlerts(int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetLogAlerts(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCorrectiveActions(string strTableName, int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetCorrectiveActions(strTableName, nKitchenId);
        }  
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetDailyReportsByDate(int nTableIndex, DateTime dtStartDate, DateTime dtEndDate,int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetDailyReportsByDate(nTableIndex, dtStartDate, dtEndDate,nKitchenId);
        }
        public DataSet GetReportsStatus(int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetKitchenReportsStatus(nKitchenId);
        }

        public DataSet GetKitchenReports(int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            this.ResultSet = dailyReport.GetKitchenReports(nKitchenId);
            foreach (DataRow row in this.ResultSet.Tables[0].Rows)
            {
                if (row["Report"].ToString() == "0")
                    row.Delete();
            }
            return this.ResultSet;
        }
        public DataSet GetChecklistReportsByDate(int SectionId, DateTime dtStartDate, DateTime dtEndDate,int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetChecklistReportsByDate(SectionId, dtStartDate, dtEndDate, nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCorrectiveActionReportsByDate(int nTableIndex, DateTime dtStartDate, DateTime dtEndDate, int nKitchenId)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetCorrectiveActionReportsByDate(nTableIndex, dtStartDate, dtEndDate, nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCorrectiveActionReportsByDistrictId(int nDistrictId, DateTime dtStartDate, DateTime dtEndDate)
        {
            GetDailyReports dailyReport = new GetDailyReports();
            return dailyReport.GetCorrectiveActionReportsByDistrictId(nDistrictId, dtStartDate, dtEndDate);
        }
    }
}
