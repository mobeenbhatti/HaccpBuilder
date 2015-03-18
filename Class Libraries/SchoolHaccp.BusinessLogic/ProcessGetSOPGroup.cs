using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetSOPGroup: IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetSOPGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetSOPGroup sopGroup = new GetSOPGroup();
            this.ResultSet = sopGroup.Get(nDistrictId);
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
        public DataSet GetSOPGroupByName(int nDistrictId, string strGroupName)
        {
            GetSOPGroup sopGroup = new GetSOPGroup();
            this.ResultSet = sopGroup.GetSOPGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetSOPGroupByID(int nGroupId)
        {
            GetSOPGroup SOPGroup = new GetSOPGroup();
            this.ResultSet = SOPGroup.GetSOPGroupById(nGroupId);
            return this.ResultSet;

        }   
   }


}
