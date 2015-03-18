using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteHazards:DataAccessBase
    { private Hazards m_Hazards;

		public DeleteHazards()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteHazards.ToString();
		}

		public void Delete()
		{
            DeleteHazardsDataParameters createParameters = new DeleteHazardsDataParameters(this.m_Hazards);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public Hazards Hazards
		{
            get { return m_Hazards; }
            set { m_Hazards = value; }
		}
	}

	public class DeleteHazardsDataParameters
	{
		private Hazards m_Hazards;
		object[] m_Parameters;

        public DeleteHazardsDataParameters(Hazards Hazards)
		{
            this.m_Hazards = Hazards;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_Hazards.HazardID;           
            Parameters = parameters;
		}

        public Hazards Hazards
		{
            get { return m_Hazards; }
            set { m_Hazards = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
