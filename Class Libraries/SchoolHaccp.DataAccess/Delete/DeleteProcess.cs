using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteProcess : DataAccessBase
    {
        private Processes m_Process;

        public DeleteProcess()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteProcessByChildId.ToString();
        }

        public void Delete()
        {

            //DeleteProcessDataParameters DeleteParameters = new DeleteProcessDataParameters(this.m_Process);

            object[] parameters = new object[1];
            parameters[0] = this.Process.ProcessId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public Processes Process
        {
            get { return m_Process; }
            set { m_Process = value; }
        }
    }

    public class DeleteProcessDataParameters
    {
        private Processes m_Process;
        object[] m_Parameters;

        public DeleteProcessDataParameters(Processes Process)
        {
            this.m_Process = Process;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.Process.ProcessId;

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
