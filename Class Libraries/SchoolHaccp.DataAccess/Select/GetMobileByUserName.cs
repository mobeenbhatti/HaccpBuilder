using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetMobileByUserName : DataAccessBase
    {


        public GetMobileByUserName()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMobileByUserName.ToString();
        }

        //public IDataReader Get()
        //{			
        //    DataServices dataServices = new DataServices();
        //    return dataServices.ExecuteReader(base.StoredProcedureName);
        //}


        public IDataReader GetMobileByUser(string strUserName, string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            return dataServices.ExecuteReader("uspAdm_GetMobileByuserInfo", parameters);
        }
        public DataSet GetMobilesByUserName(string strUserName, string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileByuserInfo", parameters);
        }
        public DataSet GetMobilesByUserName(string strUserName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserName;
            return dataServices.ExecuteDataSet("uspAdm_GetMobilesByuserName", parameters);
        }

        public IDataReader GetMobileByName(string strMobileName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strMobileName;
            return dataServices.ExecuteReader("uspAdm_GetMobileByName", parameters);
        }
        public DataSet GetMobileById(int nMobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nMobileId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileById", parameters);
        }
        public IDataReader GetMobileContactByRoleId(int nMobileId, int nRoleId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nMobileId;
            parameters[1] = nRoleId;
            return dataServices.ExecuteReader("uspAdm_GetMobileContactByRoleID", parameters);
        }
        public DataSet GetMobileContact(int nMobileId, int nRoleId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nMobileId;
            parameters[1] = nRoleId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileContactByRoleID", parameters);
        }
        public DataSet GetMobilesByName(string strMobileName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strMobileName;
            return dataServices.ExecuteDataSet("uspAdm_GetMobilesByName", parameters);
        }
        public DataSet GetMobilesByDistrictId(int nDistrictId, string strMobileName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strMobileName;
            return dataServices.ExecuteDataSet("uspAdm_GetMobilesByDistrictId", parameters);
        }
        public IDataReader GetMobileLimitByDistrictId(int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;
            return dataServices.ExecuteReader("uspAdm_GetMobileLimitDistrictId", parameters);
        }
        public DataSet GetMobileByKitchenId(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileDetailsByKitchenId", parameters);
        }
        public DataSet GetMobilesBySOPGroup(int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobilesBySOPGroupId", parameters);
        }
        public DataSet GetMobilesByCheckListGroup(int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobilesByCheckListGroupId", parameters);
        }
        public DataSet GetMobilesByTypeId()
        {
            DataServices dataServices = new DataServices();
            //object[] parameters = new object[1];
            //parameters[0] = nTypeId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileByTypeId");
        }
        public DataSet GetMobileTemperatureRangeByMobileId(int nMobileId, int nLogId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nMobileId;
            parameters[1] = nLogId;
            return dataServices.ExecuteDataSet("uspAdm_GetMobileTemperatureRangeByMobileId", parameters);
        }
        public DataSet GetMobileChecklist(int MobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = MobileId;           
            return dataServices.ExecuteDataSet("uspAdm_GetMobileChecklist", parameters);
        }
        public DataSet GetNewMobileAccount()
        {
            DataServices dataServices = new DataServices();           
            return dataServices.ExecuteDataSet("uspAdm_GetMobileByMaxId");
        }


    }


}
