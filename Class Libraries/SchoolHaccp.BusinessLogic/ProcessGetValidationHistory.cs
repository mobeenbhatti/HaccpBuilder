using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 01/21/2008
// Create a new class for Safety Checklist
namespace SchoolHaccp.BusinessLogic
{
   
	public class ProcessGetValidationHistory : IBusinessLogic
	{
		
        private IDataReader m_DataSet;

        public ProcessGetValidationHistory()
		{
		}

		public void Invoke()
		{
            GetValidationHistory getHistory = new GetValidationHistory();
            this.ResultSet = getHistory.Get();
		}

        //public void Invoke(int nWeek)
        //{
        //    GetValidationHistory getHistory = new GetValidationHistory();
        //    this.ResultSet = getHistory.GetHistoryByWeek(nWeek);
        //}

        public void Invoke(int nKitchenId, DateTime dtEntryDate)
        {
            GetValidationHistory getHistory = new GetValidationHistory();
            this.ResultSet = getHistory.GetHistoryByDate(nKitchenId, dtEntryDate);
        }
        public void Invoke(int nKitchenId, int nWeek, int nYear)
        {
            GetValidationHistory getHistory = new GetValidationHistory();
            this.ResultSet = getHistory.GetHistoryByWeek(nKitchenId, nWeek, nYear);
        }

        
		public IDataReader  ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        
        public IDataReader  GetHistoryDataReader()
        {
            this.Invoke();
            return this.ResultSet;
        }
        //public IDataReader GetHistoryByWeek(int nWeek)
        //{
        //    this.Invoke(nWeek);
        //    return this.ResultSet;
        //}
        public IDataReader GetHistoryByEntrydate(int nKitchenId, DateTime dtEntryDate)
        {
            this.Invoke(nKitchenId, dtEntryDate);
            return this.ResultSet;
        }
        public IDataReader GetHistoryByWeek(int nKitchenId, int nWeek, int nYear)
        {
            this.Invoke(nKitchenId, nWeek, nYear);
            return this.ResultSet;
        }

        public int GetHistoryId()
        {
            int nHistoryId=0;
            GetValidationHistory getHistory = new GetValidationHistory();
            this.ResultSet = getHistory.GetHistoryId();
            if (this.ResultSet.Read())
            {
                 nHistoryId = int.Parse(this.ResultSet["ValidationHistoryId"].ToString());
            }
            return nHistoryId ;
        }


                
	}
}