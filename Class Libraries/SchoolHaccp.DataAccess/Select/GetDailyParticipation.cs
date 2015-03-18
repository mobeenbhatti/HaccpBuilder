using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetDailyParticipation : DataAccessBase
	{
        private KitchenDetails m_KitchenDetails;

        public GetDailyParticipation()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenDetails.ToString();
		}

		public DataSet GetKitchenDetailsDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenDetailsByKitchenId", parameters);
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
        public IDataReader GetKitchenDetailsByKitchenId(int  nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetKitchenDetailsByKitchenId", parameters);
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

        //public IDataReader Get()
        //{
        //    GetKitchenDetailsDataParameters getParameters = new GetKitchenDetailsDataParameters(this.m_KitchenDetails);
        //    DataServices dataServices = new DataServices("uspAdm_GetKitchenDetails");
        //    return dataServices.ExecuteReader(getParameters.Parameters);
        //}

        public KitchenDetails KitchenDetails
        {
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
        }
    }

    public class GetKitchenDetailsDataParameters
    {
        private KitchenDetails m_KitchenDetails;
        object[] m_Parameters;

        public GetKitchenDetailsDataParameters(KitchenDetails KitchenDetails)
        {
            this.m_KitchenDetails = KitchenDetails;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = KitchenDetails.KitchenDetailId;
            Parameters = parameters;
        }

        public KitchenDetails KitchenDetails
        {
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
