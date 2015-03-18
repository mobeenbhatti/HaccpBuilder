using System;

using SchoolHaccp.DataAccess;
using SchoolHaccp.DataAccess.CountryRegionDSTableAdapters;

namespace SchoolHaccp.BusinessLogic
{
	[System.ComponentModel.DataObject]
	public class ProcessCountryRegion
	{
		private string m_CountryRegionCode;
		private string m_Name;
		private CountryRegionTableAdapter m_TableAdapter = null;

		protected CountryRegionTableAdapter TableAdapter
		{
			get
			{
				if (this.m_TableAdapter == null)
					this.m_TableAdapter = new CountryRegionTableAdapter();
				return this.m_TableAdapter;
			}
		}

		[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
		public CountryRegionDS.CountryRegionDataTable GetCountryRegionDropdown()
		{
			return TableAdapter.GetCountryRegion();
		}

		public string CountryRegionCode
		{
			get { return m_CountryRegionCode; }
			set { m_CountryRegionCode = value; }
		}

		public string Name
		{
			get { return m_Name; }
			set { m_Name = value; }
		}
	}
}
