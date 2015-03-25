using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetContact : DataAccessBase
	{
		private Contact  m_Contact ;

		public SetContact()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateUserId.ToString();
		}

		public void Update()
		{
			SetContactByIdDataParameters setParameters = new SetContactByIdDataParameters(this.m_Contact );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}
        public void UpdateContactLoginStatus(int nContactId, DateTime dtLoginDate, int nIsAgree)
        {
            object[] parameters = new object[3];
            parameters[0] = nContactId;
            parameters[1] = dtLoginDate;
            parameters[2] = nIsAgree;
            DataServices dataServices = new DataServices("uspAdm_UpdateContactLoginStatus");
            dataServices.ExecuteNonQuery(parameters);
        }

		public Contact  Contact 
		{
			get { return m_Contact ; }
			set { m_Contact  = value; }
		}
	}

	public class SetContactByIdDataParameters
	{
		private Contact  m_Contact ;
		object[] m_Parameters;

		public SetContactByIdDataParameters(Contact  Contact )
		{
			this.m_Contact  = Contact ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[7];
            parameters[0]= this.Contact.ContactId;
            parameters[1] = this.Contact.UserId;
            parameters[2] = this.Contact.Password;
            parameters[3] = this.Contact.Email;
            parameters[4] = this.Contact.RoleName;
            parameters[5] = this.Contact.PasswordSalt;
            parameters[6] = this.Contact.IsUpdated;
            
            Parameters = parameters;
		}

		public Contact  Contact 
		{
			get { return m_Contact ; }
			set { m_Contact  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
