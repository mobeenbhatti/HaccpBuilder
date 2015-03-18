using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetTemperatureLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private TemperatureLog m_TemperatureLog;

        public ProcessGetTemperatureLog()
        {
        }

        public void Invoke()
        {
            GetTemperatureLog getTemperatureLog = new GetTemperatureLog();
            getTemperatureLog.TemperatureLog = this.TemperatureLog;
            this.ResultSet = getTemperatureLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetTemperatureLogByKitchenId(int nKitchenId)
        {
            GetTemperatureLog getLog = new GetTemperatureLog();
            return getLog.GetTemperatureLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetTemperatureLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetTemperatureLog getLog = new GetTemperatureLog();
            return getLog.GetTemperatureLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetTemperatureLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetTemperatureLog getLog = new GetTemperatureLog();
            return getLog.GetTemperatureLogByDate(dtEntryDate, nKitchenId);
        }

       
        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }
        public IDataReader CheckTempRange(int nItemId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();            
                ResultSet = FoodCategory.GetFoodCategoryByIngredientId(nItemId);
                return ResultSet;
        }
        public IDataReader GetCriticalLimits(int nIngredientId)
        {
            GetTemperatureLog getLog = new GetTemperatureLog();
            return getLog.GetCriticalLimits(nIngredientId);
        }
        public DataSet GetCorrectiveActions(int nIngredientId)
        {
            GetTemperatureLog getLog = new GetTemperatureLog();
            return getLog.GetCorrectiveActions(nIngredientId);
        }

    }
}
