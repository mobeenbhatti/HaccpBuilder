using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetVendors:DataAccessBase
    {private Vendors  m_Vendors ;

		public SetVendors()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateVendors.ToString();
		}

		public void Update()
		{
			SetVendorsByIdDataParameters setParameters = new SetVendorsByIdDataParameters(this.m_Vendors );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public Vendors  Vendors 
		{
			get { return m_Vendors ; }
			set { m_Vendors  = value; }
		}
	}

	public class SetVendorsByIdDataParameters
	{
		private Vendors  m_Vendors ;
		object[] m_Parameters;

		public SetVendorsByIdDataParameters(Vendors  Vendors )
		{
			this.m_Vendors  = Vendors ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[11];
           
            parameters[0] = this.m_Vendors.VendorID;
            parameters[1] = this.m_Vendors.VendorName;
            parameters[2] = this.m_Vendors.ContactName;
            parameters[3] = this.m_Vendors.Phone;
            parameters[4] = this.m_Vendors.Training;
            parameters[5] = this.m_Vendors.TrainingDetail;
            parameters[6] = this.m_Vendors.CorrectiveAction;
            parameters[7] = this.m_Vendors.VerifiedBy;
            parameters[8] = this.m_Vendors.VarifiedDate;
            parameters[9] = this.m_Vendors.Entrydate;
            parameters[10] = this.m_Vendors.KitchenId;
            Parameters = parameters;
		}

		public Vendors  Vendors 
		{
			get { return m_Vendors ; }
			set { m_Vendors  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}


