using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    
    public class GetProceduralQuestions : DataAccessBase
    {

        public GetProceduralQuestions()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllProceduralQuestions.ToString();
        }

        public GetProceduralQuestions(string strStoreProcedure)
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
        public IDataReader GetProceduralQuestion(int nQuestionId)
        {
            DataServices ds = new DataServices("uspAdm_GetProceduralQuestions");
            object[] parameters = new object[1];
            parameters[0] = nQuestionId;
            return ds.ExecuteReader(base.StoredProcedureName, parameters);
        }
        public DataSet GetProceduralQuestionInfo()
        {
            DataServices ds = new DataServices();

            return ds.ExecuteDataSet("uspAdm_GetProceduralQuestionInfo");
        }


        //public DataSet Get()
        //{
        //    DataServices ds = new DataServices(base.StoredProcedureName);
        //    return ds.ExecuteDataSet(base.StoredProcedureName);
        //}
        public DataSet GetPagedDataSet(int nPageIndex)
        {
            DataServices ds = new DataServices(base.StoredProcedureName);
            //  int[] parameters;
            object[] parameters = new object[1];
            parameters[0] = nPageIndex;



            return ds.ExecuteDataSet(base.StoredProcedureName, parameters);

        }

        public DataSet GetProceduralQuestionByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetProceduralQuestionByGroupId", parameters);
        }

        public DataSet GetSelectedQuestionByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedProceduralQuestionsByGroupId", parameters);
        }
        public IDataReader GetProceduralQuestionById(int nProceduralQuestionId)
        {
            object[] parameters = new object[1];
            parameters[0] = nProceduralQuestionId;

            DataServices ds = new DataServices("uspAdm_GetProceduralQuestionById");
            return ds.ExecuteReader(parameters);
        }

    }
}
