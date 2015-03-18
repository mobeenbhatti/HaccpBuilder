using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetFreeTrialRequest : DataAccessBase
	{
        private FreeTrialRequest m_FreeTrialRequest;

        public GetFreeTrialRequest()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetFreeTrialRequest.ToString();
		}

        public DataSet GetFreeTrialRequestById(string strRequestId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = strRequestId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFreeTrialRequestById", parameters);
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
        //public IDataReader GetFreeTrialRequestByDate(DateTime dtEntryDate)
        //{
        //    IDataReader tempData;
        //    object[] parameters = new object[1];
        //    parameters[0] = dtEntryDate;
        //    DataServices dataServices = new DataServices();

        //    try
        //    {
        //        tempData = dataServices.ExecuteReader("uspAdm_GetFreeTrialRequestByDate", parameters);
        //        if (tempData == null)
        //        {
        //            throw new Exception("Failed to retrieve data.");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return tempData;
        //}

        public DataSet GetFreeTrialRequestDetail()
        {
            //GetFreeTrialRequestDataParameters getParameters = new GetFreeTrialRequestDataParameters(this.m_FreeTrialRequest);
            DataServices dataServices = new DataServices();
            return dataServices.ExecuteDataSet("uspAdm_GetFreeTrialRequestDetail");
        }

        public FreeTrialRequest FreeTrialRequest
        {
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
        }
    }

    //public class GetFreeTrialRequestDataParameters
    //{
    //    private FreeTrialRequest m_FreeTrialRequest;
    //    object[] m_Parameters;

    //    public GetFreeTrialRequestDataParameters(FreeTrialRequest FreeTrialRequest)
    //    {
    //        this.m_FreeTrialRequest = FreeTrialRequest;
    //        Build();
    //    }
    //    private void Build()
    //    {
    //        object[] parameters = new object[1];
    //        parameters[0] = FreeTrialRequest.FreeTrialRequestId;
    //        Parameters = parameters;
    //    }

    //    public FreeTrialRequest FreeTrialRequest
    //    {
    //        get { return m_FreeTrialRequest; }
    //        set { m_FreeTrialRequest = value; }
    //    }

    //    public object[] Parameters
    //    {
    //        get { return m_Parameters; }
    //        set { m_Parameters = value; }
    //    }
		
    //}

	
}
