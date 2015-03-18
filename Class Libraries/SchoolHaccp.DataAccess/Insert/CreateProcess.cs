using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateProcess : DataAccessBase
    {
        private Processes m_Process;

        public CreateProcess()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertProcessByGroupId.ToString();
        }

        public int Insert()
        {

            CreateProcessDataParameters createParameters = new CreateProcessDataParameters(this.m_Process);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteNonQuery(base.StoredProcedureName,createParameters.Parameters,"nNewProcessId");
            return (int)returnValue;
        }


        public Processes Process
        {
            get { return m_Process; }
            set { m_Process = value; }
        }
    }

    public class CreateProcessDataParameters
    {
        private Processes m_Process;
        object[] m_Parameters;

        public CreateProcessDataParameters(Processes Process)
        {
            this.m_Process = Process;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[10];
            parameters[0] = this.Process.ProcessId;
            parameters[1] = this.Process.ProcessName;
            parameters[2] = this.Process.ProcessShortName;
            parameters[3] = this.Process.SortOrder;
            parameters[4] = this.Process.Active;
            parameters[5] = this.Process.ProcessGroupId;
            parameters[6] = this.Process.Custom;
            //parameters[7] = this.Process.ChildProcessId;
            parameters[7] = this.Process.Additional;
            // 06-04-12
            parameters[8] = this.Process.ProcessText;
            parameters[9] = 1;
            //parameters[8] = this.Process.Field1;
            //parameters[9] = this.Process.Field2;
            //parameters[10] = this.Process.Field3;
            //parameters[11] = this.Process.Field4;
            //parameters[12] = this.Process.Field5;
            //parameters[13] = this.Process.Field6;
            //parameters[14] = this.Process.Field7;
            //parameters[15] = this.Process.Field8;
            //parameters[16] = this.Process.Field9;
            //parameters[17] = this.Process.Field10;

            Parameters = parameters;
        }
       
        public Processes Process
        {
            get { return m_Process; }
            set { m_Process = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
