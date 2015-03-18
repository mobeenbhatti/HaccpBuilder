using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetContact : DataAccessBase
	{


        public GetContact()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetContactDetailByUserName.ToString();
		}
        public DataSet GetContactByUser(string strUserName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserName;           
            return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
        }
        public DataSet GetContactByUser(string strUserName, string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            return dataServices.ExecuteDataSet("uspAdm_GetContactByUser", parameters);
        }
        public DataSet GetContactByUserName(string strUserName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserName;
            return dataServices.ExecuteDataSet("uspAdm_GetContactByUserName", parameters);
        }

        public DataSet GetContactByUserName(string strUserName, int nContactId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = nContactId;
            return dataServices.ExecuteDataSet("uspAdm_GetContactByUserInfo", parameters);
        }


        public DataSet GetContactByKitchen(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;            
            return dataServices.ExecuteDataSet("uspAdm_GetContactByKitchen", parameters);
        }
        public DataSet GetContactsByEmail(string strEmail, int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];            
            parameters[0] = strEmail;
            parameters[1] = nDistrictId;
            return dataServices.ExecuteDataSet("uspAdm_GetContactsByEmail", parameters);
        }
        public DataSet GetContactsByContactId(int nContactId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nContactId;
            return dataServices.ExecuteDataSet("uspAdm_GetContactsByContactId", parameters);
        }
        public DataSet GetContactDetailByContactId(int nContactId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nContactId;
            return dataServices.ExecuteDataSet("uspAdm_GetContactDetailsById", parameters);
        }
        
		public DataSet GetContactsByDistrictId(int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;
            return dataServices.ExecuteDataSet("uspAdm_GetContactsByDistrictId", parameters);
        }
        public DataSet GetRoles()
        {
            DataServices dataServices = new DataServices();
            return dataServices.ExecuteDataSet("uspAdm_GetAllRoles");
        }
        //public IDataReader GetAgreementInfo(string strUserName, string strPassword)
        //{
        //    DataServices dataServices = new DataServices();
        //    object[] parameters = new object[1];
        //    parameters[0] = strUserName;
        //    parameters[1] = strPassword;
        //    return dataServices.ExecuteReader("uspAdm_GetContactsByDistrictId", parameters);
        //}

	}

	
}