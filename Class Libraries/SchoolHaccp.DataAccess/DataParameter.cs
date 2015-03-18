using System;
using System.Data;
using System.Data.Common;

namespace SchoolHaccp.DataAccess
{
	public class DataParameter : DbParameter, ICloneable
	{
		private DbType m_DbType;
		private ParameterDirection m_Direction;
		private bool m_IsNullable;
		private string m_ParameterName;
		private int m_Size;
		private string m_SourceColumn;
		private bool m_SourceColumnNullMapping;
		private DataRowVersion m_SourceVersion;
		private object m_Value;

		/// <summary>
		/// Initialize a new DataParameter
		/// </summary>
		/// <param name="name">The name of the parameter</param>
		/// <param name="value">The value of the parameter</param>
		public DataParameter(string name, object value)
		{
			this.InitializeParameterToDefaults();
			this.m_ParameterName = name;
			this.m_Value = value;
		}

		/// <summary>
		/// Initialize a new DataParameter
		/// </summary>
		/// <param name="name"></param>
		/// <param name="value"></param>
		/// <param name="dbType"></param>
		public DataParameter(string name, object value, DbType dbType)
		{
			this.InitializeParameterToDefaults();
			this.m_ParameterName = name;
			this.m_Value = value;
			this.m_DbType = dbType;
		}

		/// <summary>
		/// Initialize a new DataParameter
		/// </summary>
		/// <param name="name"></param>
		/// <param name="value"></param>
		/// <param name="dbType"></param>
		/// <param name="direction"></param>
		public DataParameter(string name, DbType dbType, ParameterDirection direction, int size)
		{
			this.InitializeParameterToDefaults();
			this.m_ParameterName = name;
			this.m_DbType = dbType;
			this.m_Direction = direction;
			this.m_Size = size;
		}

		/// <summary>
		/// Initialize a new DataParameter
		/// </summary>
		/// <param name="name"></param>
		/// <param name="value"></param>
		/// <param name="dbType"></param>
		/// <param name="direction"></param>
		public DataParameter(string name, object value, DbType dbType, ParameterDirection direction)
		{
			this.InitializeParameterToDefaults();
			this.m_Value = value;
			this.m_ParameterName = name;
			this.m_DbType = dbType;
			this.m_Direction = direction;
		}

		public override DbType DbType
		{
			get { return m_DbType; }
			set { m_DbType = value; }
		}

		public override ParameterDirection Direction
		{
			get { return m_Direction; }
			set { m_Direction = value; }
		}

		public override bool IsNullable
		{
			get { return m_IsNullable; }
			set { m_IsNullable = value; }
		}

		public override string ParameterName
		{
			get { return m_ParameterName; }
			set { m_ParameterName = value; }
		}

		public override void ResetDbType()
		{
			m_DbType = DbType.String;
		}

		public override int Size
		{
			get { return m_Size; }
			set { m_Size = value; }
		}

		public override string SourceColumn
		{
			get { return m_SourceColumn; }
			set { m_SourceColumn = value; }
		}

		public override bool SourceColumnNullMapping
		{
			get { return m_SourceColumnNullMapping; }
			set { m_SourceColumnNullMapping = value; }
		}

		public override DataRowVersion SourceVersion
		{
			get { return m_SourceVersion; }
			set { m_SourceVersion = value; }
		}

		public override object Value
		{
			get { return m_Value; }
			set { m_Value = value; }
		}

		public override string ToString()
		{
			return this.m_ParameterName.ToString();
		}

		#region ICloneable Members

		public object Clone()
		{
			return this.MemberwiseClone();
		}

		#endregion

		#region Private Methods

		private void InitializeParameterToDefaults()
		{
			m_DbType = DbType.String;
			m_Value = null;
			m_Direction = ParameterDirection.Input;
			m_IsNullable = false;
			m_ParameterName = String.Empty;
			m_Size = 0;
			m_SourceColumn = String.Empty;
			m_SourceVersion = DataRowVersion.Current;
		}

		#endregion
	}
}
