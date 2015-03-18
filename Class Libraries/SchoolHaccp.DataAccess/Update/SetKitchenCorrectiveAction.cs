using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetKitchenCorrectiveAction: DataAccessBase
	{
		private KitchenCorrectiveAction  m_CorrectiveAction ;

        public SetKitchenCorrectiveAction()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenCorrectiveActionById.ToString();
		}

		public void Update()
		{
			SetCorrectiveActionByIdDataParameters setParameters = new SetCorrectiveActionByIdDataParameters(this.m_CorrectiveAction );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

		public KitchenCorrectiveAction  CorrectiveAction 
		{
			get { return m_CorrectiveAction ; }
			set { m_CorrectiveAction  = value; }
		}
	}

	public class SetCorrectiveActionByIdDataParameters
	{
		private KitchenCorrectiveAction  m_CorrectiveAction ;
		object[] m_Parameters;

		public SetCorrectiveActionByIdDataParameters(KitchenCorrectiveAction  CorrectiveAction )
		{
			this.m_CorrectiveAction  = CorrectiveAction ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.m_CorrectiveAction.CorrectiveActionID;
            parameters[1] = this.m_CorrectiveAction.KitchenId;
            parameters[2] = this.m_CorrectiveAction.Name;
            parameters[3] = this.m_CorrectiveAction.LogTypeID;
            parameters[4] = this.m_CorrectiveAction.Status;
            parameters[5] = this.m_CorrectiveAction.IsInclude;
           
            Parameters = parameters;
   
		}

		public KitchenCorrectiveAction  CorrectiveAction 
		{
			get { return m_CorrectiveAction ; }
			set { m_CorrectiveAction  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
