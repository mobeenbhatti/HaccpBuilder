using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetCultureListItems : IBusinessLogic
	{
		private IDataReader m_ResultSet;
		GetCultureListItemsData m_GetCultureListItemsData;
		private string m_DataTextField;
		private string m_DataValueField;

		public ProcessGetCultureListItems()
		{
			this.m_GetCultureListItemsData = new GetCultureListItemsData();
			this.m_DataTextField = this.m_GetCultureListItemsData.DataTextField;
			this.m_DataValueField = this.m_GetCultureListItemsData.DataValueField;
		}

		public void Invoke()
		{
			this.m_ResultSet = this.m_GetCultureListItemsData.Get();
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}

		public string DataTextField
		{
			get { return m_DataTextField; }
			set { m_DataTextField = value; }
		}

		public string DataValueField
		{
			get { return m_DataValueField; }
			set { m_DataValueField = value; }
		}
	}
}
