using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetSOP: IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetSOP()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nSOPGroupId)
        {
            GetSOP sop = new GetSOP();
            this.ResultSet = sop.GetSOPByGroupId(nSOPGroupId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSOPByGroupId(int nSOPGroupId)
        {
            this.Invoke(nSOPGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedSOPByGroupId(int nSOPGroupId)
        {
            GetSOP sop = new GetSOP();
            this.ResultSet = sop.GetSelectedSOPByGroupId(nSOPGroupId);
            return this.ResultSet;

        }
        public IDataReader GetSOPById(int nSOPId)
        {
            GetSOP sop = new GetSOP();
            return sop.GetSOPById(nSOPId);
            
        }
        //public DataSet GetSOPByKitchenId(int nKitchenId, int nSOPId)
        //{
        //    GetSOP sop = new GetSOP();
        //    this.ResultSet = sop.GetSOPByKitchenId(nKitchenId, nSOPId);
        //    return this.ResultSet;

        //}
        public DataSet GetSOPsByKitchenId(int nKitchenId)
        {
            GetSOP sop = new GetSOP();
            this.ResultSet = sop.GetSOPsByKitchenId(nKitchenId);
            return this.ResultSet;

        }
        public DataSet GetSOPByTitle(string strSOPTitle, int nSOPGroupId)
        {
            GetSOP SOP = new GetSOP();
            this.ResultSet = SOP.GetSOPByTitle(strSOPTitle, nSOPGroupId);
            return this.ResultSet;

        }
        public DataSet GetSOPByTitleAndId(string strSOPName, int nSOPId, int nSOPGroupId)
        {
            GetSOP SOP = new GetSOP();
            this.ResultSet = SOP.GetSOPByTitleAndId(strSOPName, nSOPId, nSOPGroupId);
            return this.ResultSet;

        }
   }


}
