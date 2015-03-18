using System;
using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetResponseHistory : DataAccessBase
	{
		

        public GetResponseHistory()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetResponseHistory.ToString();
		}

		public IDataReader Get()
		{			
			DataServices dataServices = new DataServices();
            return dataServices.ExecuteReader(base.StoredProcedureName);
		}

        public IDataReader GetHistoryId()
        {
            DataServices dataServices = new DataServices();
          //  return dataServices.ExecuteReader(base.StoredProcedureName);
            return dataServices.ExecuteReader("uspAdm_GetHistoryId");

        }
        public IDataReader  GetHistoryByWeek(int nKitchenId, int nWeeks)
        {
            DataServices dataServices = new DataServices("uspAdm_GetHistoryByWeek");
            object[] parameters = new object[2];
            parameters[0] = nWeeks;
            parameters[1] = nKitchenId;
            return dataServices.ExecuteReader(parameters);
        }
        public IDataReader GetHistoryByDate(int nKitchenId, DateTime dtEntryDate)
        {
            DataServices dataServices = new DataServices("uspAdm_GetHistoryByDate");
            object[] parameters = new object[2];
            parameters[0] = nKitchenId ;
            parameters[1] = dtEntryDate ;
            return dataServices.ExecuteReader(parameters);
        }
        public IDataReader GetHistoryById(int nHistoryId)
        {
            DataServices dataServices = new DataServices("uspAdm_GetHistoryById");
            object[] parameters = new object[1];
            parameters[0] = nHistoryId;           
            return dataServices.ExecuteReader(parameters);
        }
        public IDataReader GetHistoryByWeek(int nKitchenId, int nWeeks,int nYear)
        {
            DataServices dataServices = new DataServices("uspAdm_GetHistoryByWeek");
            object[] parameters = new object[3];
            parameters[0] = nWeeks;
            parameters[1] = nKitchenId;
            parameters[2] = nYear;
            return dataServices.ExecuteReader(parameters);
        }

		
	}

	
}
