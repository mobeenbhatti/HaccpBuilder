using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetHazard
    {
        private IDataReader m_ResultSet;
        private Hazards m_Hazard;

        public ProcessGetHazard()
        {
        }

        public void Invoke()
        {
            GetHazards getHazard = new GetHazards();
            getHazard.Hazards = this.Hazard;
            this.ResultSet = getHazard.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetHazardByKitchenId(int nKitchenId)
        {
            GetHazards getLog = new GetHazards();
            return getLog.GetHazardsDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetAllHazards()
        {
            GetHazards getLog = new GetHazards();
            return getLog.GetAllHazards();
        }
        public IDataReader GetHazardByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetHazards getLog = new GetHazards();
            return getLog.GetHazardsByDate(dtEntryDate, nKitchenId);
        }
        public IDataReader GetHazardByFoodCategoryId(int nFoodCategoryId)
        {
            GetHazards getLog = new GetHazards();
            return getLog.GetHazardByFoodCategoryId(nFoodCategoryId);
        }

       
        public Hazards Hazard
        {
            get { return m_Hazard; }
            set { m_Hazard = value; }
        }
    }
}
