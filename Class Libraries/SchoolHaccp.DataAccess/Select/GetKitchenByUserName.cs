using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetKitchenByUserName : DataAccessBase
	{


        public GetKitchenByUserName()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenByUserName.ToString();
		}

        //public IDataReader Get()
        //{			
        //    DataServices dataServices = new DataServices();
        //    return dataServices.ExecuteReader(base.StoredProcedureName);
        //}


        public IDataReader GetKitchenByUser(string strUserName, string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            return dataServices.ExecuteReader("uspAdm_GetKitchenByuserInfo", parameters);
        }
        public DataSet GetKitchensByUserName(string strUserName,string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            if (strUserName.Contains("@"))
            {

                return dataServices.ExecuteDataSet("uspAdm_GetKitchenByuserEmail", parameters);
            }
            else
                return dataServices.ExecuteDataSet("uspAdm_GetKitchenByuserInfo", parameters);
        }
        public DataSet GetKitchensByUserName(string strUserName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserName;            
            return dataServices.ExecuteDataSet("uspAdm_GetKitchensByuserName", parameters);
        }

        public IDataReader GetKitchenByName(string strKitchenName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strKitchenName;
            return dataServices.ExecuteReader("uspAdm_GetKitchenByName", parameters);
        }
        public IDataReader GetKitchenById(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return dataServices.ExecuteReader("uspAdm_GetKitchenByName", parameters);
        }
        public IDataReader GetKitchenContactByRoleId(int nKitchenId, int nRoleId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nRoleId;
            return dataServices.ExecuteReader("uspAdm_GetKitchenContactByRoleID", parameters);
        }
        public DataSet GetKitchenContact(int nKitchenId, int nRoleId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nRoleId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenContactByRoleID", parameters);
        }
        public DataSet GetKitchensByName(string strKitchenName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strKitchenName;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchensByName", parameters);
        }
        public DataSet GetKitchensByDistrictId(int nDistrictId, string strKitchenName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strKitchenName;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchensByDistrictId", parameters);
        }
        public IDataReader GetKitchenLimitByDistrictId(int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;
            return dataServices.ExecuteReader("uspAdm_GetKitchenLimitDistrictId", parameters);
        }
        public DataSet GetKitchenByDistrictId(int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;            
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenByDistrictId", parameters);
        }
        public DataSet GetKitchensBySOPGroup(int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchensBySOPGroupId", parameters);
        }
        public DataSet GetKitchensByCheckListGroup(int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchensByCheckListGroupId", parameters);
        }
        public DataSet GetKitchensByTypeId()
        {
            DataServices dataServices = new DataServices();
            //object[] parameters = new object[1];
            //parameters[0] = nTypeId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenByTypeId");
        }
        public DataSet GetKitchenByKitchenId(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenByKitchenId", parameters);
        }
        public DataSet GetKitchenTemperatureRangeByKitchenId(int nKitchenId, int nLogId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nLogId;
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenTemperatureRangeByKitchenId",parameters);
        }
        public DataSet GetTimeZoneByKitchenID(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;          
            return dataServices.ExecuteDataSet("uspAdm_GetKitchenTimeZoneByKitchenId", parameters);
        }
		
	}

	
}
