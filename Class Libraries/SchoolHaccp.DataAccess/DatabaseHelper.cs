using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using PrimeCipher.DataAccess;


namespace SchoolHaccp.DataAccess
{
	public class DatabaseHelper : DataAccessBase
	{
		private object[] m_Parameters;

		public DatabaseHelper(string p_StoredProcedureName)
		{
			StoredProcedureName = p_StoredProcedureName;
		}

		public DatabaseHelper(string p_ConnectionString, string p_StoredProcedureName)
		{
			ConnectionString = p_ConnectionString;
			StoredProcedureName = p_StoredProcedureName;
		}

		public void Run(DbTransaction p_Transaction)
		{
			try
			{
				DataServices ds = new DataServices();
				ds.ExecuteNonQuery(p_Transaction, StoredProcedureName, Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public void Run(DbTransaction p_Transaction, object[] p_Parameters)
		{
			try
			{
				DataServices ds = new DataServices();
				ds.ExecuteNonQuery(p_Transaction, StoredProcedureName, p_Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public DataSet Run(string p_ConnectionString, object[] p_Parameters)
		{
			DataSet dsReturnValue;
			try
			{
				DataServices ds = new DataServices();
				dsReturnValue = ds.ExecuteDataSet(StoredProcedureName, p_Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}

			return dsReturnValue;
		}

		public DataSet Run(string p_ConnectionString)
		{
			DataSet dsReturnValue;
			try
			{
				DataServices ds = new DataServices();
				dsReturnValue = ds.ExecuteDataSet(StoredProcedureName, null);
			}
			catch (Exception ex)
			{
				throw ex;
			}

			return dsReturnValue;
		}

		public void Run()
		{
			try
			{
				DataServices ds = new DataServices();
				ds.ExecuteNonQuery(StoredProcedureName, Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		public IDataReader Run(object[] p_Parameters)
		{
			IDataReader drReturnValue;
			try
			{
				DataServices ds = new DataServices();
				drReturnValue = ds.ExecuteReader(StoredProcedureName, p_Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return drReturnValue;
		}

		public object RunScalar(string p_ConnectionString, object[] p_Parameters)
		{
			object obj;
			try
			{
				DataServices ds = new DataServices();
				obj = ds.ExecuteScalar(StoredProcedureName, p_Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return obj;
		}

		public object RunScalar(DbTransaction p_Transaction, object[] p_Parameters)
		{
			object obj;
			try
			{
				DataServices ds = new DataServices();
				obj = ds.ExecuteScalar(p_Transaction, StoredProcedureName, p_Parameters);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return obj;
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
