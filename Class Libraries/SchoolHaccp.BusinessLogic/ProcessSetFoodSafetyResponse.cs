using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetFoodSafetyResponse : IBusinessLogic
	{
        private FoodSafetyResponse m_FoodSafetyResponse;

        public ProcessSetFoodSafetyResponse()
		{
		}

		public void Invoke()
		{
            SetFoodSafetyResponse setFoodSafetyResponse = new SetFoodSafetyResponse();
            setFoodSafetyResponse.FoodSafetyResponse = this.m_FoodSafetyResponse;
            setFoodSafetyResponse.Update();
		}

        public FoodSafetyResponse FoodSafetyResponse
		{
            get { return m_FoodSafetyResponse; }
            set { m_FoodSafetyResponse = value; }
		}
	}
}
