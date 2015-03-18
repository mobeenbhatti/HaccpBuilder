using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetIngredients : DataAccessBase
    {
        private Ingredients m_Ingredients;
        private int m_TotalRecords;

        public GetIngredients()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetIngredients.ToString();
		}

		public DataSet GetIngredientsDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetIngredientsByKitchenId", parameters);
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
        public DataSet GetIngredientsPagedDataSet(int nKitchenId, int nCurrentPageNumber, int nPageSize)
        {
            DataSet tempData;
            object[] parameters = new object[4];
            parameters[0] = nKitchenId;
            parameters[1] = nCurrentPageNumber;
            parameters[2] = nPageSize;
            parameters[3] = 4;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecutePagedDataSet("uspAdm_GetIngrdientsByKitchenIdPaging", parameters);
                m_TotalRecords = dataServices.nTotalRecords;

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
        public DataSet GetIngredientsPagedDataSet(int nKitchenId, int nCurrentPageNumber, int nPageSize, int nFlag)
        {
            DataSet tempData;
            object[] parameters = new object[5];
            parameters[0] = nKitchenId;
            parameters[1] = nCurrentPageNumber;
            parameters[2] = nPageSize;
            parameters[3] = nFlag;
            parameters[4] = 4;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecutePagedDataSet("uspAdm_GetIngrdientsByKitchenIdPaging", parameters);
                m_TotalRecords = dataServices.nTotalRecords;

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
        
        public IDataReader GetIngredientsByMenuItemId(int nMenuItemId)
        {
            object[] parameters = new object[1];
            parameters[0] = nMenuItemId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientsByMenuItemId");
            return dataServices.ExecuteReader(parameters);
        }
        public DataSet GetIngredientsByKitchenMenuItemId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            //parameters[1] = nMenuItemId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientsByKitchenMenuId");
            return dataServices.ExecuteDataSet(parameters);
        }
        public IDataReader GetIngredientsByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientsByName");
            return dataServices.ExecuteReader(parameters);
        }
        public IDataReader GetIngredientsLimit(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;            
            DataServices dataServices = new DataServices("uspAdm_GetIngredientsLimit");
            return dataServices.ExecuteReader(parameters);
        }
        public DataSet GetIngredientByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientByName");
            return dataServices.ExecuteDataSet(parameters);
        }
        
        public IDataReader GetIngredientNameById(string strName, int nIngredientId, int nKitchenId)
        {
            object[] parameters = new object[3];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            parameters[2] = nIngredientId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientNameById");
            return dataServices.ExecuteReader(parameters);
        }
        public DataSet GetIngredientVendorsById(int nIngredientId)
        {
            object[] parameters = new object[1];           
            parameters[0] = nIngredientId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientVendorByIngredientId");
            return dataServices.ExecuteDataSet(parameters);
        }
        public DataSet GetIngredientsByVendorId(int nVendorId)
        {
            object[] parameters = new object[1];
            parameters[0] = nVendorId;
            DataServices dataServices = new DataServices("uspAdm_GetIngredientsByVendorId");
            return dataServices.ExecuteDataSet(parameters);
        }
        public IDataReader GetIngredientsByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetIngredientsByDate", parameters);
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

        public IDataReader Get()
        {
            GetIngredientsDataParameters getParameters = new GetIngredientsDataParameters(this.m_Ingredients);
            DataServices dataServices = new DataServices("uspAdm_GetIngredients");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public Ingredients Ingredients
        {
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }

    public class GetIngredientsDataParameters
    {
        private Ingredients m_Ingredients;
        object[] m_Parameters;

        public GetIngredientsDataParameters(Ingredients Ingredients)
        {
            this.m_Ingredients = Ingredients;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = Ingredients.IngredientID;
            Parameters = parameters;
        }

        public Ingredients Ingredients
        {
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}
}
