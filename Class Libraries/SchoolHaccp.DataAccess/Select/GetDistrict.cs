using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetDistrict : DataAccessBase
    {
        public GetDistrict()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetDistrictByUserId.ToString();
		}
        public IDataReader  GetDistrictByUser(string strUserName, string strPassword)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strUserName;
            parameters[1] = strPassword;
            return dataServices.ExecuteReader("uspAdm_GetDistrictByUserInfo",parameters);
        }
        public IDataReader GetDistrictByUser(string strUserName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserName;           
            return dataServices.ExecuteReader(base.StoredProcedureName, parameters);
        }
        public DataSet GetDistrictDetail()
        {
            DataServices dataServices = new DataServices();
            
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictDetails");
        }
        public IDataReader GetDistrictByName(string strDistrictName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strDistrictName;
            return dataServices.ExecuteReader("uspAdm_GetDistrictByName",parameters);
        }

        public DataSet GetDistrictDetailByName(string strDistrictName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strDistrictName;
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictDetailByName", parameters);
        }
        public DataSet GetDistrictDetailByID(int nDistrictId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictDetailByID", parameters);
        }
        public DataSet GetDistrictDetailByUserId(string strUserId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = strUserId;            
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictDetailByUserID", parameters);
        }
        public DataSet GetDistrictDetailByType(int nDistrictType)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nDistrictType;
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictDetailByType", parameters);
        }
        public DataSet GetDistrictDetailByKitchenID(int nKitchenId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return dataServices.ExecuteDataSet("uspAdm_GetDistrictByKitchenID", parameters);
        }
    }
}
