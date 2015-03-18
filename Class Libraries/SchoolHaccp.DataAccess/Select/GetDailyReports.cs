using System;
using System.Collections.Generic;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetDailyReports : DataAccessBase
    {
        public GetDailyReports()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetDailyReports.ToString();
        }
        public DataSet Get(DateTime dtStartDate, int nKitchenId)
        {
            DataServices ds = new DataServices(base.StoredProcedureName);

            object[] parameters = new object[2];
            parameters[0] = dtStartDate;
            parameters[1] = nKitchenId;
            return ds.ExecuteDataSet(base.StoredProcedureName, parameters);

        }
        //public IDataReader GetMissingDates(string strTableName, int nKitchenId )
        //{
        //    DataServices ds = new DataServices();
        //    object[] parameters = new object[2];
        //    parameters[0] = strTableName;
        //    parameters[1] = nKitchenId;
        //    return ds.ExecuteReader("uspAdm_GetMissingDates", parameters);
        //}
        
        public DataSet GetAlertDates(string strTableName, int nKitchenId )
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strTableName;
            parameters[1] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetMissingDates", parameters);
        }
        public DataSet GetLogAlerts(int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetLogAlerts", parameters);
        }
        public DataSet GetCorrectiveActions(string strTableName, int nKitchenId)
        {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            DataServices ds = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strTableName;
            parameters[1] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetCorrectiveActions", parameters);
        }

        public DataSet GetDailyReportsByDate(int nTableIndex, DateTime dtStartDate, DateTime dtEndDate, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[4];
            parameters[0] = nTableIndex;
            parameters[1] = dtStartDate;
            parameters[2] = dtEndDate;
            parameters[3] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetDailyReportsByDate", parameters);
        }
        public DataSet GetChecklistReportsByDate(int SectionId, DateTime dtStartDate, DateTime dtEndDate, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[4];
            parameters[0] = SectionId;
            parameters[1] = dtStartDate;
            parameters[2] = dtEndDate;
            parameters[3] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetChecklistReportsByDate", parameters);
        }
        public DataSet GetDailyReportsByMobileId(int nMobileId, DateTime dtStartDate)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nMobileId;
            parameters[1] = dtStartDate;           
            return ds.ExecuteDataSet("uspAdm_GetDailyReportsByMobileId", parameters);
        }
        public DataSet GetKitchenReportsStatus(int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetKitchenReportsStatus", parameters);
        }
        public DataSet GetKitchenReports(int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetKitchenReports", parameters);
        }
        public DataSet GetCorrectiveActionReportsByDate(int nTableIndex, DateTime dtStartDate, DateTime dtEndDate, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[4];
            parameters[0] = nTableIndex;
            parameters[1] = dtStartDate;
            parameters[2] = dtEndDate;
            parameters[3] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetCorrectiveActionReportsByDate", parameters);
        }
        public DataSet GetCorrectiveActionReportsByDistrictId(int nDistrictId, DateTime dtStartDate, DateTime dtEndDate)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = nDistrictId;
            parameters[1] = dtStartDate;
            parameters[2] = dtEndDate;

            return ds.ExecuteDataSet("uspAdm_GetCorrectiveActionReportsByDistrictId", parameters);
        }
    }
}
