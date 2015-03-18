using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetWeeklyReports : DataAccessBase
    {
        public GetWeeklyReports()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetWeeklyReports.ToString();
        }


        public DataSet Get(DateTime dtStartDate , int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = dtStartDate;
            parameters[1] = nKitchenId;
            return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
        }
        public DataSet GetOtherReport(DateTime dtStartDate, int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = dtStartDate;
            parameters[1] = nKitchenId;
            return dataServices.ExecuteDataSet("uspAdm_GetOtherReports", parameters);
        }
        public DataSet GetWeeklyReportsByMobileId(DateTime dtStartDate, int nMobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = dtStartDate;
            parameters[1] = nMobileId;
            return dataServices.ExecuteDataSet("uspAdm_GetWeeklyReportsByMobileId", parameters);
        }
        public DataSet GetChecklistSectionsByKitchenId(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;           
            return dataServices.ExecuteDataSet("uspAdm_GetChecklistSectionsByKitchenId", parameters);
        }
        public DataSet GetChecklistSectionsByMobileId(int nMobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nMobileId;
            return dataServices.ExecuteDataSet("uspAdm_GetChecklistSectionsByMobileId", parameters);
        }
        public DataSet GetOtherReportsByMobileId(DateTime dtStartDate, int nMobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = dtStartDate;
            parameters[1] = nMobileId;
            return dataServices.ExecuteDataSet("uspAdm_GetOtherReportsByMobileId", parameters);
        }
        public DataSet GetAlertDates(string strTableName, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strTableName;
            parameters[1] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetMissingDates", parameters);
        }
        public DataSet GetCorrectiveActions(string strTableName, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strTableName;
            parameters[1] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetCorrectiveActions", parameters);
        }
        public DataSet GetFoodSafetyDates(int nStartWeek, int nEndWeek, int nKitchenId)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = nStartWeek;
            parameters[1] = nEndWeek;
            parameters[2] = nKitchenId;
            return ds.ExecuteDataSet("uspAdm_GetFoodSafetyDates", parameters);
        }
        public DataSet GetFoodSafetyDates(int nStartWeek, int nEndWeek, int nKitchenId, int nStartYear, int nEndYear)
        {
            DataServices ds = new DataServices();
            object[] parameters = new object[5];
            parameters[0] = nStartWeek;
            parameters[1] = nEndWeek;
            parameters[2] = nKitchenId;
            parameters[3] = nStartYear;
            parameters[4] = nEndYear;
            return ds.ExecuteDataSet("uspAdm_GetFoodSafetyDates", parameters);
        }
    }
}
