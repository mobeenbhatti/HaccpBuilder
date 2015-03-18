using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateBreakFast : DataAccessBase
	{
        private BreakFast m_BreakFast;

		public CreateBreakFast()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertBreakFast.ToString();
		}

		public void Insert()
		{
            int BreakFastId = 0;
            CreateBreakFastDataParameters createParameters = new CreateBreakFastDataParameters(this.m_BreakFast);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public BreakFast BreakFast
		{
            get { return m_BreakFast; }
            set { m_BreakFast = value; }
		}
	}

	public class CreateBreakFastDataParameters
	{
		private BreakFast m_BreakFast;
		object[] m_Parameters;

        public CreateBreakFastDataParameters(BreakFast BreakFast)
		{
            this.m_BreakFast = BreakFast;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.m_BreakFast.MealCalendarId;
            parameters[1] = this.m_BreakFast.MenuItemId;     

            Parameters = parameters;
		}

        public BreakFast BreakFast
		{
            get { return m_BreakFast; }
            set { m_BreakFast = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
