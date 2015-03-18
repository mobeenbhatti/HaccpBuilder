using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateVendors : DataAccessBase
    {private Vendors m_Vendors;

		public CreateVendors()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertVendors.ToString();
		}

		public void Insert()
		{
            int VendorsId = 0;
            CreateVendorsDataParameters createParameters = new CreateVendorsDataParameters(this.m_Vendors);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[10];
            parameters[0] = this.m_Vendors.VendorName;
            parameters[1] = this.m_Vendors.ContactName;
            parameters[2] = this.m_Vendors.Phone;
            parameters[3] = this.m_Vendors.Training;
            parameters[4] = this.m_Vendors.TrainingDetail;
            parameters[5] = this.m_Vendors.CorrectiveAction;
            parameters[6] = this.m_Vendors.VerifiedBy;
            parameters[7] = this.m_Vendors.VarifiedDate;
            parameters[8] = this.m_Vendors.Entrydate;
            parameters[9] = this.m_Vendors.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertVendorsPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strFileName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertVendorList");
            //DataServices dataServices = new DataServices("uspAdm_InsertVendorListTest");
            return dataServices.ExecuteReader(parameters);
            
        }

        public Vendors Vendors
		{
            get { return m_Vendors; }
            set { m_Vendors = value; }
		}
	}

	public class CreateVendorsDataParameters
	{
		private Vendors m_Vendors;
		object[] m_Parameters;

        public CreateVendorsDataParameters(Vendors Vendors)
		{
            this.m_Vendors = Vendors;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[10];           
            parameters[0] = this.m_Vendors.VendorName;
            parameters[1] = this.m_Vendors.ContactName;
            parameters[2] = this.m_Vendors.Phone;
            parameters[3] = this.m_Vendors.Training;
            parameters[4] = this.m_Vendors.TrainingDetail;
            parameters[5] = this.m_Vendors.CorrectiveAction;
            parameters[6] = this.m_Vendors.VerifiedBy;
            parameters[7] = this.m_Vendors.VarifiedDate;
            parameters[8] = this.m_Vendors.Entrydate;
            parameters[9] = this.m_Vendors.KitchenId;
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
