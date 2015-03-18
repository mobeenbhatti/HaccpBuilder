using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetKitchenPlanCategory
    {
          private IDataReader m_ResultSet;
        private KitchenPlanCategory m_KitchenPlanCategory;

        public ProcessGetKitchenPlanCategory()
        {
        }

        public void Invoke()
        {
            GetKitchenPlanCategory getKitchenPlanCategory = new GetKitchenPlanCategory();
            //getKitchenPlanCategory. = this.KitchenPlanCategory;
            //this.ResultSet = getKitchenPlanCategory.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenPlanCategoryByKitchenId(int nKitchenId)
        {
            GetKitchenPlanCategory getLog = new GetKitchenPlanCategory();
            return getLog.GetPlanCategoryDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenPlanCategoryBySideId(int nKitchenId, int nSideId)
        {
            GetKitchenPlanCategory getCategory = new GetKitchenPlanCategory();
            return getCategory.GetPlanCategorySideDataSet(nKitchenId,nSideId);
        }
       
        public DataSet GetKitchenPlanCategoryById(int nCategoryId)
        {
            GetKitchenPlanCategory getLog = new GetKitchenPlanCategory();
            return getLog.GetPlanCategoryById(nCategoryId);
        }
       

       
        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }
    }
}
