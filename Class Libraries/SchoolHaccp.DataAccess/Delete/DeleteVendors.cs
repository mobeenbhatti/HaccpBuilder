using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteVendors:DataAccessBase
    { private Vendors m_Vendors;

		public DeleteVendors()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteVendors.ToString();
		}

		public void Delete()
		{
            DeleteVendorsDataParameters createParameters = new DeleteVendorsDataParameters(this.m_Vendors);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public Vendors Vendors
		{
            get { return m_Vendors; }
            set { m_Vendors = value; }
		}
	}

	public class DeleteVendorsDataParameters
	{
		private Vendors m_Vendors;
		object[] m_Parameters;

        public DeleteVendorsDataParameters(Vendors Vendors)
		{
            this.m_Vendors = Vendors;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_Vendors.VendorID;           
            Parameters = parameters;
		}

        public Vendors Vendors
		{
            get { return m_Vendors; }
            set { m_Vendors = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
