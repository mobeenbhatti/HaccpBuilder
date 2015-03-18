using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Update
{
    public class SetProcess : DataAccessBase
    {
        private Processes m_Process;

        public SetProcess()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateProcess.ToString();
        }

        public void Update()
        {
            SetProcessByIdDataParameters setParameters = new SetProcessByIdDataParameters(this.m_Process);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.Process.ProcessId;
            parameters[1] = this.Process.Active;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateProcessSelection", parameters);
        }
        public void UpdateKitchenProcessFsIs(int nProcessId, int nKitchenId,int nFsIs)
        {
            object[] parameters = new object[3];
            parameters[0] = nProcessId;
            parameters[1] = nKitchenId;
            parameters[2] = nFsIs;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateKitchenProcessFsIs", parameters);
        }
        public void UpdateKitchenProcessHaccp(int nProcessId, int nKitchenId, int nHaccp)
        {
            object[] parameters = new object[3];
            parameters[0] = nProcessId;
            parameters[1] = nKitchenId;
            parameters[2] = nHaccp;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateKitchenProcessHaccp", parameters);
        }

        public Processes Process
        {
            get { return m_Process; }
            set { m_Process = value; }
        }
    }

    public class SetProcessByIdDataParameters
    {
        private Processes m_Process;
        object[] m_Parameters;

        public SetProcessByIdDataParameters(Processes Process)
        {
            this.m_Process = Process;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[9];
            parameters[0] = this.Process.ProcessId;
            parameters[1] = this.Process.ProcessName;
            parameters[2] = this.Process.ProcessShortName;
            parameters[3] = this.Process.SortOrder;
            parameters[4] = this.Process.Active;
            parameters[5] = this.Process.ProcessGroupId;
            parameters[6] = this.Process.Custom;
           // parameters[7] = this.Process.ChildProcessId;
            parameters[7] = this.Process.Additional;
            // 06-04-12
            parameters[8] = this.Process.ProcessText;
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
