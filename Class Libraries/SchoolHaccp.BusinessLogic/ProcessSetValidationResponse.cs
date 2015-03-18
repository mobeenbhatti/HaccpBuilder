using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetValidationResponse : IBusinessLogic
	{
        private ValidationResponse m_ValidationResponse;

        public ProcessSetValidationResponse()
		{
		}

		public void Invoke()
		{
            SetValidationResponse setValidationResponse = new SetValidationResponse();
            setValidationResponse.ValidationResponse = this.m_ValidationResponse;
            setValidationResponse.Update();
		}

        public ValidationResponse ValidationResponse
		{
            get { return m_ValidationResponse; }
            set { m_ValidationResponse = value; }
		}
	}
}