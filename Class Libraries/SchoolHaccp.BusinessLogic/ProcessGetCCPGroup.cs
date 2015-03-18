using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCCPGroup : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetCCPGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetCCPGroup CCPGroup = new GetCCPGroup();
            this.ResultSet = CCPGroup.Get(nDistrictId);
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
        public DataSet GetCCPGroupByName(int nDistrictId, string strGroupName)
        {
            GetCCPGroup CCPGroup = new GetCCPGroup();
            this.ResultSet = CCPGroup.GetCCPGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetCCPGroupByID(int nGroupId)
        {
            GetCCPGroup CCPGroup = new GetCCPGroup();
            this.ResultSet = CCPGroup.GetCCPGroupById(nGroupId);
            return this.ResultSet;

        }   
    }


}