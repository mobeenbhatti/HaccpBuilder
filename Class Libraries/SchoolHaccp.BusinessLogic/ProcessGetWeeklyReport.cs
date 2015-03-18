using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetWeeklyReport : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetWeeklyReport()
        {
        }

        public void Invoke()
        {
        }

        public void Invoke(DateTime dtStartDate,int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet = weeklyReport.Get(dtStartDate,nKitchenId);
        }

        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Get(DateTime dtStartDate,int nKitchenId)
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
        public DataSet GetWeeklyReportsByMobileId(DateTime dtStartDate, int nMobileId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet =  weeklyReport.GetWeeklyReportsByMobileId(dtStartDate, nMobileId);
             foreach (DataRow row in this.ResultSet.Tables[0].Rows)
            {
                if (row["Report"].ToString() == "0")
                    row.Delete();
            }
             return this.ResultSet;
           

        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetchecklistSectionsByKitchenId(int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet = weeklyReport.GetChecklistSectionsByKitchenId(nKitchenId);           
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetchecklistSectionsByMobileId(int nMobileId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet = weeklyReport.GetChecklistSectionsByMobileId(nMobileId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetOtherReportsByMobileId(DateTime dtStartDate, int nMobileId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet = weeklyReport.GetOtherReportsByMobileId(dtStartDate, nMobileId);
            foreach (DataRow row in this.ResultSet.Tables[0].Rows)
            {
                if (row["Report"].ToString() == "0")
                    row.Delete();
            }
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetOtherReport(DateTime dtStartDate, int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            this.ResultSet = weeklyReport.GetOtherReport(dtStartDate, nKitchenId);
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
        public DataSet GetAlertDates(string strTableName, int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            return weeklyReport.GetAlertDates(strTableName, nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCorrectiveActions(string strTableName, int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            return weeklyReport.GetCorrectiveActions(strTableName, nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodSafetyDates(int nStartWeek,int nEndWeek, int nKitchenId)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            return weeklyReport.GetFoodSafetyDates(nStartWeek,nEndWeek,nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodSafetyDates(int nStartWeek, int nEndWeek, int nKitchenId, int nStartYear, int nEndYear)
        {
            GetWeeklyReports weeklyReport = new GetWeeklyReports();
            return weeklyReport.GetFoodSafetyDates(nStartWeek, nEndWeek, nKitchenId, nStartYear, nEndYear);
        }  



    }
}
