
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 01/21/2008
// Create a new class for Safety Checklist
namespace SchoolHaccp.BusinessLogic
{
   
	public class ProcessGetResponseHistory : IBusinessLogic
	{
		
        private IDataReader m_DataSet;

        public ProcessGetResponseHistory()
		{
		}

		public void Invoke()
		{
            GetResponseHistory getHistory = new GetResponseHistory();
            this.ResultSet = getHistory.Get();
		}

        //public void Invoke(int nWeek)
        //{
        //    GetResponseHistory getHistory = new GetResponseHistory();
        //    this.ResultSet = getHistory.GetHistoryByWeek(nWeek);
        //}

        public void Invoke(int nKitchenId, int nWeek)
        {
            GetResponseHistory getHistory = new GetResponseHistory();
            this.ResultSet = getHistory.GetHistoryByWeek(nKitchenId, nWeek);
        }
        public void Invoke(int nKitchenId, int nWeek, int nYear)
        {
            GetResponseHistory getHistory = new GetResponseHistory();
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
        public IDataReader GetHistoryByWeek(int nKitchenId,int nWeek)
        {
            this.Invoke(nKitchenId,nWeek);
            return this.ResultSet;
        }
        public IDataReader GetHistoryByDate(int nKitchenId, DateTime dtEntryDate)
        {
            GetResponseHistory getHistory = new GetResponseHistory();
           return getHistory.GetHistoryByDate(nKitchenId, dtEntryDate);
            //this.Invoke(nKitchenId, nWeek);
            //return this.ResultSet;
        }
        public IDataReader GetHistoryById(int nHistoryId)
        {
            GetResponseHistory getHistory = new GetResponseHistory();
            return getHistory.GetHistoryById(nHistoryId);
            //this.Invoke(nKitchenId, nWeek);
            //return this.ResultSet;
        }
        public IDataReader GetHistoryByWeek(int nKitchenId, int nWeek, int nYear)
        {
            this.Invoke(nKitchenId, nWeek, nYear);
            return this.ResultSet;
        }

        public int GetHistoryId()
        {
            int nHistoryId=0;
            GetResponseHistory getHistory = new GetResponseHistory();
            this.ResultSet = getHistory.GetHistoryId();
            if (this.ResultSet.Read())
            {
                 nHistoryId = int.Parse(this.ResultSet["HistoryId"].ToString());
            }
            return nHistoryId ;
        }


                
	}
}