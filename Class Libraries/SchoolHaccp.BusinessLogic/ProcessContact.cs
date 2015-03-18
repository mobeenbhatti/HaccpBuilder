using System;
using System.ComponentModel;

using SchoolHaccp.DataAccess.Dataset;
using SchoolHaccp.DataAccess.Dataset.ContactDSTableAdapters;

namespace SchoolHaccp.BusinessLogic
{
	[DataObject]
	public class ProcessContact
	{
		private Int32 m_ContactId;
		private String m_Name;
		private String m_EmailAddress;
		private Boolean m_EmailAlerts;
		private String m_PrimaryPhone;
		private String m_SecondaryPhone;
		private String m_Fax;
		private DateTime m_CreatedDate;
		private DateTime m_ModifiedDate;

		private ContactTableAdapter m_TableAdapter = null;
		protected ContactTableAdapter TableAdapter
		{
			get
			{
				if (this.m_TableAdapter == null)
					this.m_TableAdapter = new ContactTableAdapter();
				return this.m_TableAdapter;
			}
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public ContactDS.ContactDataTable GetAllContacts()
		{
			return TableAdapter.GetContactData();
		}

		public int ContactId
		{
			get { return m_ContactId; }
			set { m_ContactId = value; }
		}

		public string Name
		{
			get { return m_Name; }
			set { m_Name = value; }
		}

		public string EmailAddress
		{
			get { return m_EmailAddress; }
			set { m_EmailAddress = value; }
		}

		public bool EmailAlerts
		{
			get { return m_EmailAlerts; }
			set { m_EmailAlerts = value; }
		}

		public string PrimaryPhone
		{
			get { return m_PrimaryPhone; }
			set { m_PrimaryPhone = value; }
		}

		public string SecondaryPhone
		{
			get { return m_SecondaryPhone; }
			set { m_SecondaryPhone = value; }
		}

		public string Fax
		{
			get { return m_Fax; }
			set { m_Fax = value; }
		}

		public DateTime CreatedDate
		{
			get { return m_CreatedDate; }
			set { m_CreatedDate = value; }
		}

		public DateTime ModifiedDate
		{
			get { return m_ModifiedDate; }
			set { m_ModifiedDate = value; }
		}
	}
}
