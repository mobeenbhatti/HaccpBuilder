using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{

    public class ProcessGetKitchenFoodCategoryGroup : IBusinessLogic
    {
        private IDataReader m_DataSet;

        public ProcessGetKitchenFoodCategoryGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nKitchenId)
        {
            GetKitchenFoodCategoryGroup KitchenFoodCategoryGroup = new GetKitchenFoodCategoryGroup();
            this.ResultSet = KitchenFoodCategoryGroup.Get(nKitchenId);
        }
        public IDataReader Invoke(string sFoodCategory,int nKitchenId)
        {
            GetKitchenFoodCategoryGroup KitchenFoodCategoryGroup = new GetKitchenFoodCategoryGroup();
            return  KitchenFoodCategoryGroup.GetKichenFoodCategoryByName(sFoodCategory, nKitchenId);
        }
        public IDataReader ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }

        public IDataReader Get(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;

        }
    }


}