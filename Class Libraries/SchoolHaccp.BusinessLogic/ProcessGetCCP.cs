using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCCP : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetCCP()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nCCPGroupId)
        {
            GetCCP CCP = new GetCCP();
            this.ResultSet = CCP.GetCCPByGroupId(nCCPGroupId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCCPByGroupId(int nCCPGroupId)
        {
            this.Invoke(nCCPGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedCCPByGroupId(int nCCPGroupId)
        {
            GetCCP CCP = new GetCCP();
            this.ResultSet = CCP.GetSelectedCCPByGroupId(nCCPGroupId);
            return this.ResultSet;

        }
        
        public IDataReader GetCCPById(int nCCPId)
        {
            GetCCP CCP = new GetCCP();
            return CCP.GetCCPById(nCCPId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCCPByID(int nCCPId)
        {
            GetCCP CCP = new GetCCP();
            return CCP.GetCCPByID(nCCPId);
        }

        //}
        //public DataSet GetCCPByKitchenId(int nKitchenId, int nCCPId)
        //{
        //    GetCCP CCP = new GetCCP();
        //    this.ResultSet = CCP.GetCCPByKitchenId(nKitchenId, nCCPId);
        //    return this.ResultSet;

        //}
        public DataSet GetCCPsByKitchenId(int nKitchenId)
        {
            GetCCP CCP = new GetCCP();
            this.ResultSet = CCP.GetCCPsByKitchenId(nKitchenId);
            return this.ResultSet;

        }
    }


}
