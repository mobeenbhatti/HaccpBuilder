using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetCheckListGroup: IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetCheckListGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetCheckListGroup CheckListGroup = new GetCheckListGroup();
            this.ResultSet = CheckListGroup.Get(nDistrictId);
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
        public DataSet GetCheckListGroupByName(int nDistrictId, string strGroupName)
        {
            GetCheckListGroup CheckListGroup = new GetCheckListGroup();
            this.ResultSet = CheckListGroup.GetCheckListGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetChecklistGroupByID(int nGroupId)
        {
            GetCheckListGroup ChecklistGroup = new GetCheckListGroup();
            this.ResultSet = ChecklistGroup.GetChecklistGroupById(nGroupId);
            return this.ResultSet;

        }   
   }


}
