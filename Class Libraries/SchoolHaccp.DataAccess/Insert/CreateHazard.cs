using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Insert
{
  public  class CreateHazards : DataAccessBase
    {private Hazards m_Hazards;

		public CreateHazards()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertHazards.ToString();
		}

		public void Insert()
		{
            int HazardsId = 0;
            CreateHazardsDataParameters createParameters = new CreateHazardsDataParameters(this.m_Hazards);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_Hazards.Description;            
            DataServices dataServices = new DataServices("uspAdm_InsertHazardsPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public Hazards Hazards
		{
            get { return m_Hazards; }
            set { m_Hazards = value; }
		}
	}

	public class CreateHazardsDataParameters
	{
		private Hazards m_Hazards;
		object[] m_Parameters;

        public CreateHazardsDataParameters(Hazards Hazards)
		{
            this.m_Hazards = Hazards;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_Hazards.Description;   

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
