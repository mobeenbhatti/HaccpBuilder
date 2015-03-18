using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetValidationGroup: IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetValidationGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetValidationGroup ValidationGroup = new GetValidationGroup();
            this.ResultSet = ValidationGroup.Get(nDistrictId);
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
        public DataSet GetValidationGroupByName(int nDistrictId, string strGroupName)
        {
            GetValidationGroup ValidationGroup = new GetValidationGroup();
            this.ResultSet = ValidationGroup.GetValidationGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
        public DataSet GetValidationGroupByID(int nGroupId)
        {
            GetValidationGroup ValidationGroup = new GetValidationGroup();
            this.ResultSet = ValidationGroup.GetValidationGroupById(nGroupId);
            return this.ResultSet;

        }   
   }


}
