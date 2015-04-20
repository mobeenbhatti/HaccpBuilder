
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetKitchen : IBusinessLogic
    {
        private IDataReader m_DataSet;

        public ProcessGetKitchen()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(string strUserName,string strPassword)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            this.ResultSet = kitchen.GetKitchenByUser(strUserName,strPassword);
        }
        public IDataReader ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        public IDataReader Get(string strUserName, string strPassword)
        {
            this.Invoke(strUserName,strPassword);
            return this.ResultSet;

        }
        public IDataReader GetKitchenByName(string strKitchenName)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            this.ResultSet = kitchen.GetKitchenByName(strKitchenName);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public IDataReader GetKitchenContactByRoleId(int nKitchenId, int nRoleId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            this.ResultSet = kitchen.GetKitchenContactByRoleId(nKitchenId, nRoleId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenContact(int nKitchenId, int nRoleId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchenContact(nKitchenId, nRoleId);
            
        }
        public DataSet GetKitchensByName(string strKitchenName)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByName(strKitchenName);
        }
        public DataSet GetKitchensByUserName(string strUserName, string strPassword)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByUserName(strUserName,strPassword);
        }
        public DataSet GetKitchensByUserName(string strUserName)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByUserName(strUserName);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchensByDistrictId(int nDistrictId, string strKitchenName)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByDistrictId(nDistrictId,strKitchenName);
           
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenByDistrictId(int nDistrictId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchenByDistrictId(nDistrictId);

        }
        public IDataReader GetKitchenLimitByDistrictId(int nDistrictId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            this.ResultSet = kitchen.GetKitchenLimitByDistrictId(nDistrictId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchensBySOPGroup(int nGroupId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensBySOPGroup(nGroupId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchensByChecklistGroup(int nGroupId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByCheckListGroup(nGroupId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchensByTypeId()
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchensByTypeId();

        }

         [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenByKitchenId(int nKitchenId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchenByKitchenId(nKitchenId);

        }

        
        public DataSet GetKitchenTemperatureRangeByKitchenId(int nKitchenId, int nLogId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetKitchenTemperatureRangeByKitchenId(nKitchenId, nLogId);

        }
        public DataSet GetTimeZoneByKitchenId(int nKitchenId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            return kitchen.GetTimeZoneByKitchenID(nKitchenId);
        }




    }
}
