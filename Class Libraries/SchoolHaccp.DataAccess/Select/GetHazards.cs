using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetHazards : DataAccessBase
    {
        private Hazards m_Hazards;

        public GetHazards()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetHazards.ToString();
		}

		public DataSet GetHazardsDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetHazardsByKitchenId", parameters);
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
        public IDataReader GetHazardsByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetHazardsByDate", parameters);
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
            GetHazardsDataParameters getParameters = new GetHazardsDataParameters(this.m_Hazards);
            DataServices dataServices = new DataServices("uspAdm_GetHazards");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public DataSet GetAllHazards()
        {           
            DataServices dataServices = new DataServices();
            return dataServices.ExecuteDataSet("uspAdm_GetAllHazards");
        }

        public IDataReader GetHazardByFoodCategoryId(int nFoodCategoryId)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodCategoryId;
            DataServices dataServices = new DataServices("uspAdm_GetHazardByFoodCategoryId");
            return dataServices.ExecuteReader(parameters);
        }

        public Hazards Hazards
        {
            get { return m_Hazards; }
            set { m_Hazards = value; }
        }
    }

    public class GetHazardsDataParameters
    {
        private Hazards m_Hazards;
        object[] m_Parameters;

        public GetHazardsDataParameters(Hazards Hazards)
        {
            this.m_Hazards = Hazards;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = Hazards.HazardID;
            Parameters = parameters;
        }

        public Hazards Hazards
        {
            get { return m_Hazards; }
            set { m_Hazards = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}
    
}
