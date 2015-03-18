using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCtpatGroup : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetCtpatGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetCtpatGroup CtpatGroup = new GetCtpatGroup();
            this.ResultSet = CtpatGroup.Get(nDistrictId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Get(int nDistrictId)
        {
            this.Invoke(nDistrictId);
            return this.ResultSet;

        }
        public DataSet GetCtpatGroupByName(int nDistrictId, string strGroupName)
        {
            GetCtpatGroup CtpatGroup = new GetCtpatGroup();
            this.ResultSet = CtpatGroup.GetCtpatGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetCtpatGroupByID(int nGroupId)
        {
            GetCtpatGroup CtpatGroup = new GetCtpatGroup();
            this.ResultSet = CtpatGroup.GetCtpatGroupById(nGroupId);
            return this.ResultSet;

        }
    }


}
