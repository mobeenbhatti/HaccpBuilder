using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateDailyParticipation : DataAccessBase
	{
        private KitchenDetails m_KitchenDetails;

		public CreateDailyParticipation()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenDetails.ToString();
		}

		public void Insert()
		{
            
            CreateKitchenDetailsDataParameters createParameters = new CreateKitchenDetailsDataParameters(this.m_KitchenDetails);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        //public void Insert(string strMode)
        //{
        //    object[] parameters = new object[10];
        //    parameters[0] = this.m_KitchenDetails.AMServe;
        //    parameters[1] = this.m_KitchenDetails.PMServe;
        //    parameters[2] = this.m_KitchenDetails.Managers;
        //    parameters[3] = this.m_KitchenDetails.Staff;
        //    parameters[4] = this.m_KitchenDetails.CycleMeasuredBy;
        //    parameters[5] = this.m_KitchenDetails.UnitsInCycle;
        //    parameters[6] = this.m_KitchenDetails.IsCycleRepeat;
        //    parameters[7] = this.m_KitchenDetails.StartDate;
        //    parameters[8] = this.m_KitchenDetails.EndDate;
        //    parameters[9] = this.m_KitchenDetails.KitchenId;            

        //    DataServices dataServices = new DataServices(base.StoredProcedureName);
        //    object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        //}

        public KitchenDetails KitchenDetails
		{
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
		}
	}

	public class CreateKitchenDetailsDataParameters
	{
		private KitchenDetails m_KitchenDetails;
		object[] m_Parameters;

        public CreateKitchenDetailsDataParameters(KitchenDetails KitchenDetails)
		{
            this.m_KitchenDetails = KitchenDetails;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[10];
            parameters[0] = this.m_KitchenDetails.AMServe;
            parameters[1] = this.m_KitchenDetails.PMServe;
            parameters[2] = this.m_KitchenDetails.Managers;
            parameters[3] = this.m_KitchenDetails.Staff;
            parameters[4] = this.m_KitchenDetails.CycleMeasuredBy;
            parameters[5] = this.m_KitchenDetails.UnitsInCycle;
            parameters[6] = this.m_KitchenDetails.IsCycleRepeat;
            parameters[7] = this.m_KitchenDetails.StartDate;
            parameters[8] = this.m_KitchenDetails.EndDate;
            parameters[9] = this.m_KitchenDetails.KitchenId;            

            Parameters = parameters;
		}

        public KitchenDetails KitchenDetails
		{
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
