using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetMenuItemNew
    {
        private IDataReader m_ResultSet;
        private MenuItemsNew m_MenuItemNew;
        private int m_TotalRecords;
        public ProcessGetMenuItemNew()
        {
        }

        public void Invoke()
        {
            GetMenuItemsNew getMenuItemNew = new GetMenuItemsNew();
            getMenuItemNew.MenuItemsNew = this.MenuItemNew;
            this.ResultSet = getMenuItemNew.Get();
        }
        public int GetMaxMenuItemId()
        {
            GetMenuItemsNew getMenItem = new GetMenuItemsNew();
            return getMenItem.GetMaxMenuItemId();
        }
        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemNewByKitchenId(int nKitchenId)
        {
            GetMenuItemsNew getLog = new GetMenuItemsNew();
            return getLog.GetMenuItemsNewByKitchenId(nKitchenId);
            
        }
        public DataSet GetMenuItemNewByKitchenIdPaging(int nKitchenId, int nCurrentPage, int nPageSize)
        {
            GetMenuItemsNew getLog = new GetMenuItemsNew();
            DataSet ds =  getLog.GetMenuItemsNewByKitchenIdPaging(nKitchenId,nCurrentPage,nPageSize);
            this.m_TotalRecords = getLog.TotalRecords;
            return ds;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemNewDataSet(int nKitchenId)
        {
            GetMenuItemsNew getLog = new GetMenuItemsNew();           
            return getLog.GetMenuItemsNewDataSet(nKitchenId);
        }
        //public string[] GetMenuItemNewByName(string strName, int nKitchenId)
        //{
            
        //    GetMenuItemsNew getLog = new GetMenuItemsNew();
        //   DataSet dsMenu  =  getLog.GetMenuItemsByName(strName,nKitchenId);
        //    string[] strMenu = new string[dsMenu.Tables[0].Rows.Count];
        //    int i = 0;
        //    foreach (DataRow dr in dsMenu.Tables[0].Rows)
        //    {
        //        strMenu.SetValue(dr["Name"],i);
        //        i++;
        //    }
        //    return strMenu;

        //}
        public DataSet GetMenuItemNewByName(string strName, int nKitchenId)
        {

            GetMenuItemsNew getLog = new GetMenuItemsNew();
            return getLog.GetMenuItemsByName(strName, nKitchenId);
            //DataSet dsMenu = getLog.GetMenuItemsByName(strName, nKitchenId);
            //string[] strMenu = new string[dsMenu.Tables[0].Rows.Count];
            //int i = 0;
            //foreach (DataRow dr in dsMenu.Tables[0].Rows)
            //{
            //    strMenu.SetValue(dr["Name"], i);
            //    i++;
            //}
            //return strMenu;

        }
        public DataSet GetDistinctMenuItemNewByName(string strName, int nKitchenId)
        {

            GetMenuItemsNew getLog = new GetMenuItemsNew();
            return getLog.GetDistinctMenuItemsByName(strName, nKitchenId);           

        }
        public IDataReader GetMenuItemNewByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetMenuItemsNew getLog = new GetMenuItemsNew();
            return getLog.GetMenuItemsNewByDate(dtEntryDate, nKitchenId);
        }
        public IDataReader GetMenuItemNewLimit(int nKitchenId)
        {
            GetMenuItemsNew getLog = new GetMenuItemsNew();
            return getLog.GetMenuItemsLimit(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemsNewByProcess(int nKitchenId, int nProcessId)
        {
            GetMenuItemsNew menuItem = new GetMenuItemsNew();
           return menuItem.GetMenuItemsByProcess(nKitchenId, nProcessId);
            
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemsNewDataSetByProcess(int nKitchenId, int nProcessId)
        {
            GetMenuItemsNew menuItem = new GetMenuItemsNew();
            return menuItem.GetMenuItemsNewDataSetByProcess(nKitchenId, nProcessId);

        }

       
        public MenuItemsNew MenuItemNew
        {
            get { return m_MenuItemNew; }
            set { m_MenuItemNew = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }
}
