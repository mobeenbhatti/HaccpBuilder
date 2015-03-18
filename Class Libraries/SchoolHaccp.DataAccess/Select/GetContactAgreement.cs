using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
   public class GetContactAgreement
   {

        public GetContactAgreement()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetContactAgreements.ToString();
        }
        
        public DataSet GetContactAgreementByContactId(int nContactId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nContactId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetContactAgreementByContactID", parameters);
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
        public DataSet GetContactAgreementByDate(int nContactId, string strIP)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nContactId;
            parameters[1] = strIP;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetContactAgreementByDate", parameters);
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
        
    }
}
