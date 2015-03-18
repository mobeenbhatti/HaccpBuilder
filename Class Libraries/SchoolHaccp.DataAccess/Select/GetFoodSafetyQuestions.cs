using System.Data;
using System.Globalization;
using System.Collections.Generic;

//RGK - 01/21/2008
// Create a new class for Safety Checklist
namespace SchoolHaccp.DataAccess.Select
{
    
	public class GetFoodSafetyQuestions : DataAccessBase
	{
        
		public GetFoodSafetyQuestions()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllQuestions.ToString();
		}

        public GetFoodSafetyQuestions(string strStoreProcedure)
        {
            base.StoredProcedureName = strStoreProcedure;
        }

		public IDataReader Get(int nKitchenId)
		{
			DataServices ds = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteReader(base.StoredProcedureName,parameters);
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

        public DataSet GetFoodSafetyQuestionByGroupId(int nGroupId,int nPageIndex)
        {
            object[] parameters = new object[2];
            parameters[0] = nGroupId;
            parameters[1] = nPageIndex;

            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetQuestionByGroupId",parameters);
        }

        public DataSet GetSelectedQuestionByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedQuestionsByGroupId", parameters);
        }
        public IDataReader GetFoodSafetyQuestionById(int nFoodSafetyQuestionId)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodSafetyQuestionId;

            DataServices ds = new DataServices("uspAdm_GetQuestionById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetFoodSafetyQuestionByQuestionAndId(string strQuestion, int nQuestionId, int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strQuestion;
            parameters[1] = nQuestionId;
            parameters[2] = nGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetFoodSaftyQuestionByQuestionAndId", parameters);
        }
        public DataSet GetFoodSafetyQuestion(string strFoodCategoryName, int nGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strFoodCategoryName;
            parameters[1] = nGroupId;

            return dataServices.ExecuteDataSet("uspAdm_GetFoodSaftyQuestion", parameters);
        }

	}

	
}
