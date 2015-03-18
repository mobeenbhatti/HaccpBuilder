using Microsoft.Practices.EnterpriseLibrary.Data;

namespace SchoolHaccp.DataAccess
{
	public class DataAccessBase
	{
		private Database m_Database;
		private string m_StoredProcedureName;

		protected Database Database
		{
			get { return m_Database; }
			set { m_Database = value; }
		}

		protected string StoredProcedureName
		{
			get { return m_StoredProcedureName; }
			set { m_StoredProcedureName = value; }
		}
	}
}
