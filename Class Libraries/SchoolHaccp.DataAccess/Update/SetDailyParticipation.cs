
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetDailyParticipation : DataAccessBase
	{
		private KitchenDetails  m_KitchenDetails ;

        public SetDailyParticipation()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenDetails.ToString();
		}

		public void Update()
		{
			SetKitchenDetailsByIdDataParameters setParameters = new SetKitchenDetailsByIdDataParameters(this.m_KitchenDetails );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public KitchenDetails  KitchenDetails 
		{
			get { return m_KitchenDetails ; }
			set { m_KitchenDetails  = value; }
		}
	}

	public class SetKitchenDetailsByIdDataParameters
	{
		private KitchenDetails  m_KitchenDetails ;
		object[] m_Parameters;

		public SetKitchenDetailsByIdDataParameters(KitchenDetails  KitchenDetails )
		{
			this.m_KitchenDetails  = KitchenDetails ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[11];
            parameters[0] = this.KitchenDetails.KitchenDetailId;
            parameters[1] = this.m_KitchenDetails.AMServe;
            parameters[2] = this.m_KitchenDetails.PMServe;
            parameters[3] = this.m_KitchenDetails.Managers;
            parameters[4] = this.m_KitchenDetails.Staff;
            parameters[5] = this.m_KitchenDetails.CycleMeasuredBy;
            parameters[6] = this.m_KitchenDetails.UnitsInCycle;
            parameters[7] = this.m_KitchenDetails.IsCycleRepeat;
            parameters[8] = this.m_KitchenDetails.StartDate;
            parameters[9] = this.m_KitchenDetails.EndDate;
            parameters[10] = this.m_KitchenDetails.KitchenId;          
            Parameters = parameters;
		}

		public KitchenDetails  KitchenDetails 
		{
			get { return m_KitchenDetails ; }
			set { m_KitchenDetails  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
