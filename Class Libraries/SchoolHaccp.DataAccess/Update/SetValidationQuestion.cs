using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetValidationQuestion : DataAccessBase
	{
		private ValidationQuestion  m_ValidationQuestion ;

		public SetValidationQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateValidationQuestion.ToString();
		}

		public void Update()
		{
			SetValidationQuestionByIdDataParameters setParameters = new SetValidationQuestionByIdDataParameters(this.m_ValidationQuestion );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.ValidationQuestion.QuestionId;
            parameters[1] = this.ValidationQuestion.Active;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateValidationQuestionSelection", parameters);
        }

		public ValidationQuestion  ValidationQuestion 
		{
			get { return m_ValidationQuestion ; }
			set { m_ValidationQuestion  = value; }
		}
	}

	public class SetValidationQuestionByIdDataParameters
	{
		private ValidationQuestion  m_ValidationQuestion ;
		object[] m_Parameters;

		public SetValidationQuestionByIdDataParameters(ValidationQuestion  ValidationQuestion )
		{
			this.m_ValidationQuestion  = ValidationQuestion ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.ValidationQuestion.QuestionId;
            parameters[1] = this.ValidationQuestion.Question;
            //parameters[2] = this.ValidationQuestion.Section;
            parameters[2] = this.ValidationQuestion.Active;
            parameters[3] = this.ValidationQuestion.ValidationGroupId;
            parameters[4] = this.ValidationQuestion.Additional;
            parameters[5] = this.ValidationQuestion.Custom;
            //parameters[7] = this.ValidationQuestion.ChildQuestionId;
            Parameters = parameters;
		}

		public ValidationQuestion  ValidationQuestion 
		{
			get { return m_ValidationQuestion ; }
			set { m_ValidationQuestion  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
