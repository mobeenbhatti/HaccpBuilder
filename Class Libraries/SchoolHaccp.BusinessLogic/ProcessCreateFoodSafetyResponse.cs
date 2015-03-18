using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateFoodSafetyResponse : IBusinessLogic
	{
		private FoodSafetyResponse m_FoodSafetyResponse;

        public ProcessCreateFoodSafetyResponse()
		{
		}

		public void Invoke()
		{
            CreateFoodSafetyResponse createFoodSafetyResponse = new CreateFoodSafetyResponse();
            createFoodSafetyResponse.FoodSafetyResponse = this.m_FoodSafetyResponse;
            createFoodSafetyResponse.Insert();
            this.m_FoodSafetyResponse = createFoodSafetyResponse.FoodSafetyResponse;
		}
        public void Invoke(string strMode)
        {
            CreateFoodSafetyResponse createFoodSafetyResponse = new CreateFoodSafetyResponse();
            createFoodSafetyResponse.FoodSafetyResponse = this.m_FoodSafetyResponse;
            createFoodSafetyResponse.Insert("php");            
        }

        public FoodSafetyResponse FoodSafetyResponse
		{
            get { return m_FoodSafetyResponse; }
            set { m_FoodSafetyResponse = value; }
		}
	}
}


