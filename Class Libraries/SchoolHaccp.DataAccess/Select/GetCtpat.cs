using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetCtpat : DataAccessBase
    {

        public GetCtpat()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCtpatByGroupId.ToString();
        }

        public DataSet GetCtpatByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;

            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetSelectedCtpatByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;

            DataServices ds = new DataServices("uspAdm_GetSelectedCtpatByGroupId");
            return ds.ExecuteDataSet(parameters);
        }

        public IDataReader GetCtpatById(int nCtpatId)
        {
            object[] parameters = new object[1];
            parameters[0] = nCtpatId;

            DataServices ds = new DataServices("uspAdm_GetCtpatById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetCtpatsByKitchenId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetCtpatsBykitchenId");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetCtpatByTitleAndId(string strCtpatTitle, int nCtpatId, int nCtpatGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strCtpatTitle;
            parameters[1] = nCtpatId;
            parameters[2] = nCtpatGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetCtpatByTitleAndId", parameters);
        }
        public DataSet GetCtpatByTitle(string strCtpatTitle, int nCtpatGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strCtpatTitle;
            parameters[1] = nCtpatGroupId;

            return dataServices.ExecuteDataSet("uspAdm_GetCtpatByTitle", parameters);
        }

    }
}
