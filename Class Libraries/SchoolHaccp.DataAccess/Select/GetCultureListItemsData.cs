using System.Data;
using System.Globalization;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetCultureListItemsData : DataAccessBase
	{
		private string m_DataTextField;
		private string m_DataValueField;

		public GetCultureListItemsData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_CultureDropDownListData.ToString();
			this.m_DataTextField = ListParameter.DataTextField.CultureName.ToString();
			this.m_DataValueField = ListParameter.DataValueField.CultureId.ToString();
		}

		public IDataReader Get()
		{
			DataServices ds = new DataServices();
			return ds.ExecuteReader(base.StoredProcedureName);
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

	public class GetCultureListItemsDataParameters
	{
		object[] m_Parameters;

		public GetCultureListItemsDataParameters()
		{
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[2];
			parameters[0] = 1;
			parameters[1] = CultureInfo.CurrentCulture.Name;
			Parameters = parameters;
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}

}
