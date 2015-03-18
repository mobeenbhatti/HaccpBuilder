using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessGetKitchenPlan
    {
         private IDataReader m_ResultSet;
        private KitchenPlan m_KitchenPlan;

        public ProcessGetKitchenPlan()
        {
        }

        public void Invoke()
        {
            GetKitchenPlan getKitchenPlan = new GetKitchenPlan();
            //getKitchenPlan. = this.KitchenPlan;
            //this.ResultSet = getKitchenPlan.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenPlanById(int nPlanId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanDataSet(nPlanId);
        }
        public DataSet GetKitchenPlanByChildId(int nPlanId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanByChildId(nPlanId);
        }
        public DataSet GetKitchenPlanExampleById(int nPlanId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanExample(nPlanId);
        }

        public DataSet GetKitchenPlanByCategoryId(int nCategoryId, int nKitchenId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanByCategoryId(nCategoryId,nKitchenId);
        }
        public DataSet GetKitchenPlanDetailByCategoryId(int nCategoryId, int nKitchenId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanDetailByCategoryId(nCategoryId,nKitchenId);
        }
      
        public DataSet GetKitchenPlanBySortId(int nCategoryId, int nKitchenId, int nPlanSortId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanBySortId(nCategoryId, nKitchenId,nPlanSortId );
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetPlanByCategorySortId(int nKitchenId, int nSortId, int nSideId)
        {
            GetKitchenPlan getLog = new GetKitchenPlan();
            return getLog.GetPlanByCategorySortId(nKitchenId, nSortId,nSideId );
        }   
      
       
        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }
    }
}
