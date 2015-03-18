using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetHazards:DataAccessBase
    {private Hazards  m_Hazards ;

		public SetHazards()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateHazards.ToString();
		}

		public void Update()
		{
			SetHazardsByIdDataParameters setParameters = new SetHazardsByIdDataParameters(this.m_Hazards );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public Hazards  Hazards 
		{
			get { return m_Hazards ; }
			set { m_Hazards  = value; }
		}
	}

	public class SetHazardsByIdDataParameters
	{
		private Hazards  m_Hazards ;
		object[] m_Parameters;

		public SetHazardsByIdDataParameters(Hazards  Hazards )
		{
			this.m_Hazards  = Hazards ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.m_Hazards.HazardID;
            parameters[1] = this.m_Hazards.Description;            
            Parameters = parameters;
		}

		public Hazards  Hazards 
		{
			get { return m_Hazards ; }
			set { m_Hazards  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}


