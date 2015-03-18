using System.Data;
using System.Globalization;
using System.Collections.Generic;

//RGK - 01/21/2008
// Create a new class for Safety Checklist
namespace SchoolHaccp.DataAccess.Select
{
    
	public class GetValidationQuestions : DataAccessBase
	{
        
		public GetValidationQuestions()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllValidationQuestions.ToString();
		}

        public GetValidationQuestions(string strStoreProcedure)
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

        public DataSet GetValidationQuestionByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            

            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationQuestionByGroupId",parameters);
        }

        public DataSet GetSelectedQuestionByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedValidationQuestionsByGroupId", parameters);
        }
        public IDataReader GetValidationQuestionById(int nValidationQuestionId)
        {
            object[] parameters = new object[1];
            parameters[0] = nValidationQuestionId;

            DataServices ds = new DataServices("uspAdm_GetValidationQuestionById");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetQuestionByQuestionAndId(string strQuestion, int nQuestionId, int nValidationQuestionGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strQuestion;
            parameters[1] = nQuestionId;
            parameters[2] = nValidationQuestionGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetQuestionByQuestionAndId", parameters);
        }
        public DataSet GetQuestion(string strFoodCategoryName, int nFoodCategoryGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strFoodCategoryName;
            parameters[1] = nFoodCategoryGroupId;

            return dataServices.ExecuteDataSet("uspAdm_GetQuestion", parameters);
        }

	}

	
}
