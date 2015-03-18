using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetKitchenMenuCustomItem : DataAccessBase
	{
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

        public GetKitchenMenuCustomItem()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCustomMenuItems.ToString();
		}

		public DataSet Get(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            
            try
            {
                 tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
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

        public IDataReader GetFoodGroups()
        {
            IDataReader tempData;
            DataServices dataServices = new DataServices();

            try
            {
                 tempData = dataServices.ExecuteReader("uspAdm_GetFoodGroups");
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return  tempData;
        }
        public IDataReader GetProcesses()
        {
            IDataReader tempData;
            DataServices dataServices = new DataServices();
            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetProcesses");
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
            GetKitchenMenuCustomItemDataParameters getParameters = new GetKitchenMenuCustomItemDataParameters(this.m_KitchenMenuCustomItem);
            DataServices dataServices = new DataServices("uspAdm_GetKitchenMenuCustomItem");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }
    }

    public class GetKitchenMenuCustomItemDataParameters
    {
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;
        object[] m_Parameters;

        public GetKitchenMenuCustomItemDataParameters(KitchenMenuCustomItem KitchenMenuCustomItem)
        {
            this.m_KitchenMenuCustomItem = KitchenMenuCustomItem;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = KitchenMenuCustomItem.KitchenMenuCustomId;
            Parameters = parameters;
        }

        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
