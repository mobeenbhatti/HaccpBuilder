using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateFreeTrialRequest : DataAccessBase
    {
        private FreeTrialRequest m_FreeTrialRequest;

        public CreateFreeTrialRequest()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFreeTrialRequest.ToString();
        }

        public void Insert()
        {
            int FreeTrialRequestId = 0;
            CreateFreeTrialRequestDataParameters createParameters = new CreateFreeTrialRequestDataParameters(this.m_FreeTrialRequest);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public FreeTrialRequest FreeTrialRequest
        {
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
        }
    }

    public class CreateFreeTrialRequestDataParameters
    {
        private FreeTrialRequest m_FreeTrialRequest;
        object[] m_Parameters;

        public CreateFreeTrialRequestDataParameters(FreeTrialRequest FreeTrialRequest)
        {
            this.m_FreeTrialRequest = FreeTrialRequest;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[14];
            parameters[0] = this.m_FreeTrialRequest.DistrictName;
            parameters[1] = this.m_FreeTrialRequest.FirstName;
            parameters[2]= this.m_FreeTrialRequest.LastName;
            parameters[3]=this.m_FreeTrialRequest.Title;
            parameters[4]=this.m_FreeTrialRequest.NumberOfKitchens;
            parameters[5]=this.m_FreeTrialRequest.EmailAddress;
            parameters[6]=this.m_FreeTrialRequest.PhoneNumber;
            parameters[7]=this.m_FreeTrialRequest.City;
            parameters[8]=this.m_FreeTrialRequest.State;
            parameters[9]=this.m_FreeTrialRequest.ZipCode;   
            parameters[10]=this.m_FreeTrialRequest.Comments;
            parameters[11] = this.m_FreeTrialRequest.SponsorId;
            parameters[12] = this.m_FreeTrialRequest.Country;
            parameters[13] = this.m_FreeTrialRequest.TypeId;

            Parameters = parameters;
        }

        public FreeTrialRequest FreeTrialRequest
        {
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
