using System;
using System.Data;
using SchoolHaccp.Common;
using System.Collections.Generic;


namespace SchoolHaccp.DataAccess.Select
{
	public class GetValidationHistory : DataAccessBase
	{
		

        public GetValidationHistory()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetValidationHistory.ToString();
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
            return dataServices.ExecuteReader("uspAdm_GetValidationHistoryId");

        }
        public IDataReader  GetHistoryByDate(int nKitchenId, DateTime dtEntryDate)
        {
            DataServices dataServices = new DataServices("uspAdm_GetValidationHistoryByDate");
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
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
