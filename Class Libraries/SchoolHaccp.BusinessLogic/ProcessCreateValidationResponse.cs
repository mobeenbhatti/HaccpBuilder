using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateValidationResponse : IBusinessLogic
	{
		private ValidationResponse m_ValidationResponse;

        public ProcessCreateValidationResponse()
		{
		}

		public void Invoke()
		{
            CreateValidationResponse createValidationResponse = new CreateValidationResponse();
            createValidationResponse.ValidationResponse = this.m_ValidationResponse;
            createValidationResponse.Insert();
            this.m_ValidationResponse = createValidationResponse.ValidationResponse;
		}
        public void Invoke(string strMode)
        {
            CreateValidationResponse createValidationResponse = new CreateValidationResponse();
            createValidationResponse.ValidationResponse = this.m_ValidationResponse;
            createValidationResponse.Insert("php");            
        }

        public ValidationResponse ValidationResponse
		{
            get { return m_ValidationResponse; }
            set { m_ValidationResponse = value; }
		}
	}
}


