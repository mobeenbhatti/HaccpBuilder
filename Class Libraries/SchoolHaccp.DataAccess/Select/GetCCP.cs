using System.Data;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetCCP : DataAccessBase
    {

        public GetCCP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllCCP.ToString();
        }

        public GetCCP(string strStoreProcedure)
        {
            base.StoredProcedureName = strStoreProcedure;
        }

        public IDataReader Get(int nKitchenId)
        {
            DataServices ds = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteReader(base.StoredProcedureName, parameters);
        }

        //public DataSet Get()
        //{
        //    DataServices ds = new DataServices(base.StoredProcedureName);
        //    return ds.ExecuteDataSet(base.StoredProcedureName);
        //}
       

        public DataSet GetCCPByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetCCPByGroupId", parameters);
        }

        public DataSet GetSelectedCCPByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedCCPByGroupId", parameters);
        }
        public IDataReader GetCCPById(int nCCPCCPId)
        {
            object[] parameters = new object[1];
            parameters[0] = nCCPCCPId;

            DataServices ds = new DataServices("uspAdm_GetCCPById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetCCPByID(int nCCPCCPId)
        {
            object[] parameters = new object[1];
            parameters[0] = nCCPCCPId;

            DataServices ds = new DataServices("uspAdm_GetCCPById");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetCCPsByKitchenId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetCCPsBykitchenId");
            return ds.ExecuteDataSet(parameters);
        }

    }
}
