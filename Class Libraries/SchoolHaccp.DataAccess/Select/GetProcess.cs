using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetProcess : DataAccessBase
    {

        public GetProcess()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllProcess.ToString();
        }

        public GetProcess(string strStoreProcedure)
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


        public DataSet GetProcessByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetProcessByGroupId", parameters);
        }

        public DataSet GetSelectedProcessByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedProcessByGroupId", parameters);
        }
        public IDataReader GetProcessById(int nProcessProcessId)
        {
            object[] parameters = new object[1];
            parameters[0] = nProcessProcessId;

            DataServices ds = new DataServices("uspAdm_GetProcessById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetProcessByID(int nProcessProcessId)
        {
            object[] parameters = new object[1];
            parameters[0] = nProcessProcessId;

            DataServices ds = new DataServices("uspAdm_GetProcessById");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetProcessesByKitchenId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetProcessesByKitchenId");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetProcesseSettingByKitchenId(int nKitchenId, int nProcessId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nProcessId;

            DataServices ds = new DataServices("uspAdm_GetProcessesByKitchenId");
            return ds.ExecuteDataSet(parameters);
        }

        public DataSet GetProcessByKitchenId(int nKitchenId, int nProcessId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nProcessId;

            DataServices ds = new DataServices("uspAdm_GetProcessByKitchenID");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetProcessByNameAndId(string strProcessName, int nProcessId, int nProcessGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strProcessName;
            parameters[1] = nProcessId;
            parameters[2] = nProcessGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetProcessByNameAndId", parameters);
        }
        public DataSet GetProcessByName(string strProcessName,int nProcessGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strProcessName;
            parameters[1] = nProcessGroupId;
 
            return dataServices.ExecuteDataSet("uspAdm_GetProcessByName", parameters);
        }



    }
}