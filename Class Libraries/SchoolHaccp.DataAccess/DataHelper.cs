using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace SchoolHaccp.DataAccess
{
	public class DataHelper : DataAccessBase, IDisposable
	{
		#region Private Members

		private bool m_Disposed = false;

		#endregion

		#region Constructors

		public DataHelper()
		{
			base.Database = DatabaseFactory.CreateDatabase();
		}

		public DataHelper(string storedProcedureName)
		{
			base.Database = DatabaseFactory.CreateDatabase();
			base.StoredProcedureName = storedProcedureName;
		}

		public DataHelper(string connectionString, string storedProcedureName)
		{
			base.Database = DatabaseFactory.CreateDatabase(connectionString);
			base.StoredProcedureName = storedProcedureName;
		}

		#endregion

		#region Public Methods

		public DataSet ExecuteDataSet()
		{
			try
			{
				return base.Database.ExecuteDataSet(CommandType.StoredProcedure, base.StoredProcedureName);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute dataset error: " + ex.Message, ex.InnerException);
			}
		}

		public DataSet ExecuteDataSet(List<DataParameter> parameters)
		{
			DataSet result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(base.StoredProcedureName, parameters))
				{
					result = ExecuteDataSet(StoredProcedureName, parameters);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute dataset error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public DataSet ExecuteDataSet(string storedProcedureName)
		{
			try
			{
				return base.Database.ExecuteDataSet(CommandType.StoredProcedure, storedProcedureName);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute dataset error: " + ex.Message, ex.InnerException);
			}
		}

		public DataSet ExecuteDataSet(string storedProcedureName, List<DataParameter> parameters)
		{
			DataSet result;
			try
			{
				DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters);
				result = base.Database.ExecuteDataSet(command);
				this.FillOutputParameters(command, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute dataset error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public int ExecuteNonQuery(List<DataParameter> parameters)
		{
			int result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(base.StoredProcedureName, parameters))
				{
					result = base.Database.ExecuteNonQuery(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public int ExecuteNonQuery(string storedProcedureName, List<DataParameter> parameters)
		{
			int result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters))
				{
					result = base.Database.ExecuteNonQuery(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public int ExecuteNonQuery(DbTransaction transaction, string storedProcedureName, List<DataParameter> parameters)
		{
			int result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters))
				{
					result = base.Database.ExecuteNonQuery(command, transaction);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public IDataReader ExecuteReader(string storedProcedureName)
		{
			return base.Database.ExecuteReader(CommandType.StoredProcedure, storedProcedureName);
		}

		/// <summary>
		/// Note that FillOutputParameters does not work in this case.  The DataReader must
		/// be closed before access to output parameters is allowed.
		/// </summary>
		/// <param name="parameters"></param>
		/// <returns></returns>
		public IDataReader ExecuteReader(List<DataParameter> parameters)
		{
			IDataReader result;
			try
			{
				DbCommand command = this.GetStoredProcCommand(StoredProcedureName, parameters);
				result = base.Database.ExecuteReader(command);
				this.FillOutputParameters(command, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute reader error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		/// <summary>
		/// Note that FillOutputParameters does not work in this case.  The DataReader must
		/// be closed before access to output parameters is allowed.
		/// </summary>
		/// <param name="storedProcedureName"></param>
		/// <param name="parameters"></param>
		/// <returns></returns>
		public IDataReader ExecuteReader(string storedProcedureName, List<DataParameter> parameters)
		{
			IDataReader result;
			try
			{
				DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters);
				result = base.Database.ExecuteReader(command);
				this.FillOutputParameters(command, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute reader error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		/// <summary>
		/// Note that FillOutputParameters does not work in this case.  The DataReader must
		/// be closed before access to output parameters is allowed.
		/// </summary>
		/// <param name="storedProcedureName"></param>
		/// <param name="parameters"></param>
		/// <param name="commandTimeout"></param>
		/// <returns></returns>
		public IDataReader ExecuteReader(string storedProcedureName, List<DataParameter> parameters, int commandTimeout)
		{
			IDataReader result;
			try
			{
				DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters);
				command.CommandTimeout = commandTimeout;
				result = base.Database.ExecuteReader(command);
				this.FillOutputParameters(command, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute reader error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public object ExecuteScalar(List<DataParameter> parameters)
		{
			object result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(base.StoredProcedureName, parameters))
				{
					result = base.Database.ExecuteScalar(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute scalar error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public object ExecuteScalar(string storedProcedureName, List<DataParameter> parameters)
		{
			object result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters))
				{
					result = base.Database.ExecuteScalar(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute scalar error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public object ExecuteScalar(string storedProcedureName, List<DataParameter> parameters, int commandTimeout)
		{
			object result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters))
				{
					command.CommandTimeout = commandTimeout;
					result = base.Database.ExecuteScalar(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute scalar error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public object ExecuteScalar(DbTransaction transaction, string storedProcedureName, List<DataParameter> parameters)
		{
			object result;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters))
				{
					result = base.Database.ExecuteScalar(command, transaction);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute scalar error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		#endregion

		#region Private Methods

		private DbCommand GetStoredProcCommand(string storedProcedureName, List<DataParameter> parameters)
		{
			DbCommand command = this.Database.GetStoredProcCommand(storedProcedureName);
			foreach (DataParameter parameter in parameters)
			{
				try
				{
					if (parameter.Direction == ParameterDirection.Input)
					{
						base.Database.AddInParameter(command, parameter.ParameterName, parameter.DbType, parameter.Value);
					}
					else if (parameter.Direction == ParameterDirection.Output)
					{
						base.Database.AddOutParameter(command, parameter.ParameterName, parameter.DbType, parameter.Size);
					}
				}
				catch (Exception ex)
				{
					throw new Exception("Error adding parameter " + parameter.ParameterName + " [" + ex.ToString() + "]");
				}
			}
			return command;
		}

		private void FillOutputParameters(DbCommand commandWithParameters, List<DataParameter> parametersToFill)
		{
			foreach (DbParameter parameter in commandWithParameters.Parameters)
			{
				if (parameter.Direction == ParameterDirection.Output ||
					parameter.Direction == ParameterDirection.InputOutput)
				{
					int parameterIndex = commandWithParameters.Parameters.IndexOf(parameter);
					parametersToFill[parameterIndex].Value = parameter.Value;
				}
			}
		}

		#endregion

		#region IDisposable Members
		public void Dispose()
		{
			Dispose(true);
			GC.SuppressFinalize(this);
		}

		private void Dispose(bool disposing)
		{
			if (!this.m_Disposed)
			{
				if (disposing)
				{
					//clean up any managed code
					base.Database = null;
					base.StoredProcedureName = null;
				}
				// clean up any unmanaged code
			}
			this.m_Disposed = true;
		}
		#endregion
	}
}