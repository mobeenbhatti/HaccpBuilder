using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetSOP : DataAccessBase
    {

        public GetSOP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetSOPByGroupId.ToString();
        }

        public DataSet GetSOPByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;

            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetSelectedSOPByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;

            DataServices ds = new DataServices("uspAdm_GetSelectedSOPByGroupId");
            return ds.ExecuteDataSet(parameters);
        }

        public IDataReader GetSOPById(int nSOPId)
        {
            object[] parameters = new object[1];
            parameters[0] = nSOPId;

            DataServices ds = new DataServices("uspAdm_GetSOPById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetSOPsByKitchenId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetSOPsBykitchenId");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetSOPByTitleAndId(string strSOPTitle, int nSOPId, int nSOPGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strSOPTitle;
            parameters[1] = nSOPId;
            parameters[2] = nSOPGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetSOPByTitleAndId", parameters);
        }
        public DataSet GetSOPByTitle(string strSOPTitle, int nSOPGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strSOPTitle;
            parameters[1] = nSOPGroupId;

            return dataServices.ExecuteDataSet("uspAdm_GetSOPByTitle", parameters);
        }

    }
}
