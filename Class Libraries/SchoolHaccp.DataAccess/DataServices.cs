using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace SchoolHaccp.DataAccess
{
	public class DataServices : DataAccessBase, IDisposable
	{
		private bool m_Disposed = false;
        public int nTotalRecords = 1;

		public DataServices()
		{
			base.Database = DatabaseFactory.CreateDatabase();
		}

		public DataServices(string storedProcedureName)
		{
			base.Database = DatabaseFactory.CreateDatabase();
			base.StoredProcedureName = storedProcedureName;
		}

		public DataServices(string connectionString, string storedProcedureName)
		{
			base.Database = DatabaseFactory.CreateDatabase(connectionString);
			base.StoredProcedureName = storedProcedureName;
		}

		public int ExecuteNonQuery(object[] parameters)
		{
			int result;
			try
			{
                //parameters[1] = 1;
				result = base.Database.ExecuteNonQuery(base.StoredProcedureName, parameters);                
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return result;
		}

		public int ExecuteNonQuery(List<DataParameter> parameters)
		{
			int returnValue;
			try
			{
				using (DbCommand command = this.GetStoredProcCommand(base.StoredProcedureName, parameters))
				{
					returnValue = base.Database.ExecuteNonQuery(command);
					this.FillOutputParameters(command, parameters);
				}
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return returnValue;
		}

		public int ExecuteNonQuery(string storeProcedureName, object[] parameters)
		{
			int intReturnValue;
			try
			{
				intReturnValue = base.Database.ExecuteNonQuery(storeProcedureName, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return intReturnValue;
		}

        public int ExecuteNonQuery(string storeProcedureName, object[] parameters, string OutPut)
        {
            int intReturnValue;
            string OutPutName = "@" + OutPut;
            try
            {
                DbCommand _cmd = base.Database.GetStoredProcCommand(storeProcedureName,parameters);
                //base.Database.AddOutParameter(_cmd, OutPutName, DbType.Int32, 4);
                intReturnValue = base.Database.ExecuteNonQuery(_cmd);
                intReturnValue = (int)base.Database.GetParameterValue(_cmd, OutPutName);
            }
            catch (DbException ex)
            {
                throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
            }
            return intReturnValue;
        }

		public int ExecuteNonQuery(DbTransaction transaction, string storeProcedureName, object[] parameters)
		{
			int intReturnValue;
			try
			{
				intReturnValue = base.Database.ExecuteNonQuery(transaction, storeProcedureName, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute nonquery error: " + ex.Message, ex.InnerException);
			}
			return intReturnValue;
		}

		public object ExecuteScalar(DbTransaction transaction, string storedProcedureName, object[] parameters)
		{
			object objReturnValue;
			try
			{
				objReturnValue = base.Database.ExecuteScalar(transaction, storedProcedureName, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute query error: " + ex.Message, ex.InnerException);
			}
			return objReturnValue;
		}

		public object ExecuteScalar(string storedProcedureName, object[] parameters)
		{
			object objReturnValue;
			try
			{
				objReturnValue = base.Database.ExecuteScalar(storedProcedureName, parameters);
			}
			catch (DbException ex)
			{
				throw new Exception("Execute query error: " + ex.Message, ex.InnerException);
			}
			return objReturnValue;
		}

		public object ExecuteScalar(object[] parameters)
		{
			return ExecuteScalar(StoredProcedureName, parameters);
		}

		public IDataReader ExecuteReader(string storedProcedureName)
		{
			DbCommand command = base.Database.GetStoredProcCommand(storedProcedureName);
			return base.Database.ExecuteReader(command);
		}

		public IDataReader ExecuteReader(string storedProcedureName, List<DataParameter> parameters)
		{
			DbCommand command = this.GetStoredProcCommand(storedProcedureName, parameters);
			return base.Database.ExecuteReader(command);
		}
       

		public IDataReader ExecuteReader(string storedProcedureName, object[] parameters)
		{
			DbCommand command = base.Database.GetStoredProcCommand(storedProcedureName, parameters);
            command.CommandTimeout = 200;
			return base.Database.ExecuteReader(command);
		}

		public IDataReader ExecuteReader(object[] parameters)
		{
			DbCommand command = base.Database.GetStoredProcCommand(base.StoredProcedureName, parameters);
            command.CommandTimeout = 200;
			return base.Database.ExecuteReader(command);
		}

		public DataSet ExecuteDataSet(string storedProcedureName, object[] parameters)
		{
			DbCommand command = base.Database.GetStoredProcCommand(storedProcedureName, parameters);
			return base.Database.ExecuteDataSet(command);
		}

        public DataSet ExecutePagedDataSet(string storedProcedureName, object[] parameters)
        {
            DbCommand command = base.Database.GetStoredProcCommand(storedProcedureName, parameters);            
               
                int i = 0;
                DataSet ds = base.Database.ExecuteDataSet(command);
                foreach (DbParameter parameter in command.Parameters)
                {
                    if (parameter.Direction == ParameterDirection.Output ||
                        parameter.Direction == ParameterDirection.InputOutput)
                    {
                        string parameterName = parameter.ParameterName;
                        nTotalRecords = (int)parameter.Value;
                    }
                    i++;
                }

                return ds;
        }


        public DataSet ExecuteDataSet(string storedProcedureName, List<DataParameter> parameters)
        {
            DbCommand command = base.Database.GetStoredProcCommand(storedProcedureName, parameters);
            return base.Database.ExecuteDataSet(command);
        }

		public DataSet ExecuteDataSet(object[] parameters)
		{
			return ExecuteDataSet(base.StoredProcedureName, parameters);
		}

		public DataSet ExecuteDataSet(string storeProcedureName)
		{
			return base.Database.ExecuteDataSet(CommandType.StoredProcedure, storeProcedureName);
		}

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
			int i = 0;
			foreach (DbParameter parameter in commandWithParameters.Parameters)
			{
				if (parameter.Direction == ParameterDirection.Output ||
					parameter.Direction == ParameterDirection.InputOutput)
				{
					string parameterName = parameter.ParameterName;
					parametersToFill[i].Value = parameter.Value;
				}
				i++;
			}
		}

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
