using System;
using System.ComponentModel;

using SchoolHaccp.DataAccess;
using SchoolHaccp.DataAccess.StateProvinceDSTableAdapters;

namespace SchoolHaccp.BusinessLogic
{
	[DataObject]
	public class ProcessStateProvince
	{
		private int m_ProvinceId;
		private string m_Name;
		private string m_StateProvinceCode;
		private string m_CountryRegionCode;
		private bool m_IsOnlyStateProvinceFlag;

		private StateProvinceTableAdapter m_TableAdapter = null;

		protected StateProvinceTableAdapter TableAdapter
		{
			get
			{
				if (this.m_TableAdapter == null)
					this.m_TableAdapter = new StateProvinceTableAdapter();
				return this.m_TableAdapter;
			}
		}

		[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
		public StateProvinceDS.StateProvinceDataTable GetStateProvinceDropdown()
		{
			return TableAdapter.GetStateProvinceDropdownData();
		}

		/// <summary>
		/// Primary key field
		/// </summary>
		public int ProvinceId
		{
			get { return m_ProvinceId; }
			set { m_ProvinceId = value; }
		}

		/// <summary>
		/// The two to three digit/character state code.
		/// </summary>
		public string StateProvinceCode
		{
			get { return m_StateProvinceCode; }
			set { m_StateProvinceCode = value; }
		}

		/// <summary>
		/// The country character code (foreign key relationship to CountryRegion).
		/// </summary>
		public string CountryRegionCode
		{
			get { return m_CountryRegionCode; }
			set { m_CountryRegionCode = value; }
		}

		/// <summary>
		/// 0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.
		/// </summary>
		public bool IsOnlyStateProvinceFlag
		{
			get { return m_IsOnlyStateProvinceFlag; }
			set { m_IsOnlyStateProvinceFlag = value; }
		}

		/// <summary>
		/// The name of the StateProvince.
		/// </summary>
		public string Name
		{
			get { return m_Name; }
			set { m_Name = value; }
		}
	}
}
