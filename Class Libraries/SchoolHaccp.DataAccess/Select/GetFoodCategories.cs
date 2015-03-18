using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
  public  class GetFoodCategories:DataAccessBase
    {
       private FoodCategories m_FoodCategories;

        public GetFoodCategories()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllFoodCategories.ToString();
		}

		public DataSet GetFoodCategoriesDataSet()
        {
            DataSet tempData;            
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet(base.StoredProcedureName);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return tempData;
        }        

        public FoodCategories FoodCategories
        {
            get { return m_FoodCategories; }
            set { m_FoodCategories = value; }
        }
    }
    
}
