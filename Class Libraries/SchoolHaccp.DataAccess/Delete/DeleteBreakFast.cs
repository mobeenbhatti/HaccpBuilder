using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteBreakFast : DataAccessBase
	{
        private BreakFast m_BreakFast;

		public DeleteBreakFast()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteBreakFast.ToString();
		}

		public void Delete()
		{
            DeleteBreakFastDataParameters createParameters = new DeleteBreakFastDataParameters(this.m_BreakFast);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}
        

        public BreakFast BreakFast
		{
            get { return m_BreakFast; }
            set { m_BreakFast = value; }
		}
	}

	public class DeleteBreakFastDataParameters
	{
		private BreakFast m_BreakFast;
		object[] m_Parameters;

        public DeleteBreakFastDataParameters(BreakFast BreakFast)
		{
            this.m_BreakFast = BreakFast;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_BreakFast.BreakFastId;           
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
