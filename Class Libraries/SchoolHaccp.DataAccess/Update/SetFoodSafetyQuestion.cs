
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetFoodSafetyQuestion : DataAccessBase
	{
		private FoodSafetyQuestion  m_FoodSafetyQuestion ;

		public SetFoodSafetyQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateQuestion.ToString();
		}

		public void Update()
		{
			SetFoodSafetyQuestionByIdDataParameters setParameters = new SetFoodSafetyQuestionByIdDataParameters(this.m_FoodSafetyQuestion );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.FoodSafetyQuestion.QuestionId;
            parameters[1] = this.FoodSafetyQuestion.Active;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateQuestionSelection", parameters);
        }

		public FoodSafetyQuestion  FoodSafetyQuestion 
		{
			get { return m_FoodSafetyQuestion ; }
			set { m_FoodSafetyQuestion  = value; }
		}
	}

	public class SetFoodSafetyQuestionByIdDataParameters
	{
		private FoodSafetyQuestion  m_FoodSafetyQuestion ;
		object[] m_Parameters;

		public SetFoodSafetyQuestionByIdDataParameters(FoodSafetyQuestion  FoodSafetyQuestion )
		{
			this.m_FoodSafetyQuestion  = FoodSafetyQuestion ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[7];
            parameters[0] = this.FoodSafetyQuestion.QuestionId;
            parameters[1] = this.FoodSafetyQuestion.Question;
            parameters[2] = this.FoodSafetyQuestion.Section;
            parameters[3] = this.FoodSafetyQuestion.Active;
            parameters[4] = this.FoodSafetyQuestion.CheckListGroupId;
            parameters[5] = this.FoodSafetyQuestion.Additional;
            parameters[6] = this.FoodSafetyQuestion.Custom;
            //parameters[7] = this.FoodSafetyQuestion.ChildQuestionId;
            Parameters = parameters;
		}

		public FoodSafetyQuestion  FoodSafetyQuestion 
		{
			get { return m_FoodSafetyQuestion ; }
			set { m_FoodSafetyQuestion  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
