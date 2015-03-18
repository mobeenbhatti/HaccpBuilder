using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetMenuRecipeDetails : DataAccessBase
    {
        private MenuRecipeDetails m_MenuRecipeDetails;
        private int m_TotalRecords;
        public GetMenuRecipeDetails()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMenuRecipeDetails.ToString();
        }

        public DataSet GetMenuRecipeDetailsDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMenuRecipeDetailsDataSet", parameters);
                if (tempData == null)
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
        public DataSet GetMenuRecipeDetailsByMenuId(int nMenuItemId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nMenuItemId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMenuItemRecipeDetailsByMenuId", parameters);
                if (tempData == null)
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
        

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }

    public class GetMenuRecipeDetailsDataParameters
    {
        private MenuRecipeDetails m_MenuRecipeDetails;
        object[] m_Parameters;

        public GetMenuRecipeDetailsDataParameters(MenuRecipeDetails MenuRecipeDetails)
        {
            this.m_MenuRecipeDetails = MenuRecipeDetails;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = MenuRecipeDetails.MenuRecipeID;
            Parameters = parameters;
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }
}
