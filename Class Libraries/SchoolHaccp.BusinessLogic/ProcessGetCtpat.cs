using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCtpat : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetCtpat()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nCtpatGroupId)
        {
            GetCtpat Ctpat = new GetCtpat();
            this.ResultSet = Ctpat.GetCtpatByGroupId(nCtpatGroupId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCtpatByGroupId(int nCtpatGroupId)
        {
            this.Invoke(nCtpatGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedCtpatByGroupId(int nCtpatGroupId)
        {
            GetCtpat Ctpat = new GetCtpat();
            this.ResultSet = Ctpat.GetSelectedCtpatByGroupId(nCtpatGroupId);
            return this.ResultSet;

        }
        public IDataReader GetCtpatById(int nCtpatId)
        {
            GetCtpat Ctpat = new GetCtpat();
            return Ctpat.GetCtpatById(nCtpatId);

        }
        //public DataSet GetCtpatByKitchenId(int nKitchenId, int nCtpatId)
        //{
        //    GetCtpat Ctpat = new GetCtpat();
        //    this.ResultSet = Ctpat.GetCtpatByKitchenId(nKitchenId, nCtpatId);
        //    return this.ResultSet;

        //}
        public DataSet GetCtpatsByKitchenId(int nKitchenId)
        {
            GetCtpat Ctpat = new GetCtpat();
            this.ResultSet = Ctpat.GetCtpatsByKitchenId(nKitchenId);
            return this.ResultSet;

        }
        public DataSet GetCtpatByTitle(string strCtpatTitle, int nCtpatGroupId)
        {
            GetCtpat Ctpat = new GetCtpat();
            this.ResultSet = Ctpat.GetCtpatByTitle(strCtpatTitle, nCtpatGroupId);
            return this.ResultSet;

        }
        public DataSet GetCtpatByTitleAndId(string strCtpatName, int nCtpatId, int nCtpatGroupId)
        {
            GetCtpat Ctpat = new GetCtpat();
            this.ResultSet = Ctpat.GetCtpatByTitleAndId(strCtpatName, nCtpatId, nCtpatGroupId);
            return this.ResultSet;

        }
    }


}
