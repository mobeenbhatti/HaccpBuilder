using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetProcess : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetProcess()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nProcessGroupId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetProcessByGroupId(nProcessGroupId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetProcessByGroupId(int nProcessGroupId)
        {
            this.Invoke(nProcessGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedProcessByGroupId(int nProcessGroupId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetSelectedProcessByGroupId(nProcessGroupId);
            return this.ResultSet;

        }

        public IDataReader GetProcessById(int nProcessId)
        {
            GetProcess Process = new GetProcess();
            return Process.GetProcessById(nProcessId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetProcessByID(int nProcessId)
        {
            GetProcess Process = new GetProcess();
            return Process.GetProcessByID(nProcessId);
        }

        //}
        //public DataSet GetProcessByKitchenId(int nKitchenId, int nProcessId)
        //{
        //    GetProcess Process = new GetProcess();
        //    this.ResultSet = Process.GetProcessByKitchenId(nKitchenId, nProcessId);
        //    return this.ResultSet;

        //}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetProcessesByKitchenId(int nKitchenId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetProcessesByKitchenId(nKitchenId);
            return this.ResultSet;

        }
        public DataSet GetProcessByKitchenId(int nKitchenId, int nProcessId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetProcessByKitchenId(nKitchenId,nProcessId);
            return this.ResultSet;

        }
        public DataSet GetProcessByName(string strProcessName, int nProcessGroupId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetProcessByName(strProcessName, nProcessGroupId);
            return this.ResultSet;

        }
        public DataSet GetProcessByNameAndId(string strProcessName, int nProcessId,int nProcessGroupId)
        {
            GetProcess Process = new GetProcess();
            this.ResultSet = Process.GetProcessByNameAndId(strProcessName, nProcessId, nProcessGroupId);
            return this.ResultSet;

        }



    }


}