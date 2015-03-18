using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetDistrict : IBusinessLogic
    {
        private IDataReader m_DataSet;
        private DataSet m_ResultSet;

        public ProcessGetDistrict()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(string strUserName,string strPassword)
        {
            GetDistrict district = new GetDistrict();
            this.ResultSet = district.GetDistrictByUser(strUserName,strPassword);
        }
        public void Invoke(string strUserName)
        {
            GetDistrict district = new GetDistrict();
            this.ResultSet = district.GetDistrictByUser(strUserName);
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
        public IDataReader Get(string strUserName)
        {
            this.Invoke(strUserName);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetDistrictDetail()
        {
            GetDistrict district = new GetDistrict();
           return district.GetDistrictDetail();
        }
        // Call at Create District Page to check availability of name
        public IDataReader GetDistrictByName(string strDistrictName)
        {
            GetDistrict district = new GetDistrict();
            return district.GetDistrictByName(strDistrictName);
        }

        // These methods call at Admin Control Panel
        public DataSet GetDistrictDetailByName(string strDistrictName)
        {
            GetDistrict district = new GetDistrict();
            return district.GetDistrictDetailByName(strDistrictName);
        }
        public DataSet GetDistrictDetailByID(int nDistrictId)
        {
            GetDistrict district = new GetDistrict();
            return district.GetDistrictDetailByID(nDistrictId);
        }
        public DataSet GetDistrictDetailByUserId(string strUserId)
        {
            GetDistrict district = new GetDistrict();
            return district.GetDistrictDetailByUserId(strUserId);
        }
        public DataSet GetDistrictDetailByType(int nDistrictType)
        {
            GetDistrict district = new GetDistrict();
            return district.GetDistrictDetailByType(nDistrictType);
        }
        public bool IsPrintingAllowed(int nKitchenId)
        {
            GetDistrict district = new GetDistrict();
            DataSet dsDistrict;
            dsDistrict = district.GetDistrictDetailByKitchenID(nKitchenId);
            if (dsDistrict.Tables[0].Rows.Count > 0)
            {
                if (Convert.ToInt32(dsDistrict.Tables[0].Rows[0]["DistrictPrinting"]) == 1)
                    return true;
                else
                    return false;
            }
            else
            { return false; }
        }
    }
}
