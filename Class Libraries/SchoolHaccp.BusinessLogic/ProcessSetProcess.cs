using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetProcess : IBusinessLogic
    {
        private Processes m_Process;

        public ProcessSetProcess()
        {
        }

        public void Invoke()
        {
            SetProcess setProcess = new SetProcess();
            setProcess.Process = this.m_Process;
            setProcess.Update();
        }
        public void ProcessSelection()
        {
            SetProcess setProcess = new SetProcess();
            setProcess.Process = this.m_Process;
            setProcess.UpdateSelection();
        }
        public void UpdateKitchenProcessFsIs(int nProcessId, int nKitchenId, int nFsIs)
        {
            SetProcess setProcess = new SetProcess();
            setProcess.UpdateKitchenProcessFsIs(nProcessId, nKitchenId, nFsIs);
        }
        public void UpdateKitchenProcessHaccp(int nProcessId, int nKitchenId, int nHaccp)
        {
            SetProcess setProcess = new SetProcess();
            setProcess.UpdateKitchenProcessHaccp(nProcessId, nKitchenId, nHaccp);
        }

        public Processes Process
        {
            get { return m_Process; }
            set { m_Process = value; }
        }
    }
}

