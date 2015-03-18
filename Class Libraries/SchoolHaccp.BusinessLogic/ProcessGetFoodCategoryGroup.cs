using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetFoodCategoryGroup : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetFoodCategoryGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetFoodCategoryGroup FoodCategoryGroup = new GetFoodCategoryGroup();
            this.ResultSet = FoodCategoryGroup.Get(nDistrictId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Get(int nDistrictId)
        {
            this.Invoke(nDistrictId);
            return this.ResultSet;

        }
        public DataSet GetFoodCategoryGroupByName(int nDistrictId, string strGroupName)
        {
            GetFoodCategoryGroup FoodCategoryGroup = new GetFoodCategoryGroup();
            this.ResultSet = FoodCategoryGroup.GetFoodCategoryGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetFoodCategoryGroupByID(int nGroupId)
        {
            GetFoodCategoryGroup FoodCategoryGroup = new GetFoodCategoryGroup();
            this.ResultSet = FoodCategoryGroup.GetFoodCategoryGroupById(nGroupId);
            return this.ResultSet;

        }   
    }


}
