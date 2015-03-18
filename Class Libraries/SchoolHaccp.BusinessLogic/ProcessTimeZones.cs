using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

using SchoolHaccp.DataAccess;
using SchoolHaccp.DataAccess.TimeZonesDSTableAdapters;
namespace SchoolHaccp.BusinessLogic
{
    [DataObject]
   public class ProcessTimeZones
    {
        private int m_Id;
        private string m_TimeZone;

        private TimeZonesDropdownTableAdapter m_TableAdapter = null;

        protected TimeZonesDropdownTableAdapter TableAdapter
        {
            get
            {
                if (this.m_TableAdapter == null)
                    this.m_TableAdapter = new TimeZonesDropdownTableAdapter();
                return this.m_TableAdapter;
            }
        }

       
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public TimeZonesDS.uspDS_GetTimeZonesDropdownDataTable GetTimeZoneDropdown()
        {
            return TableAdapter.GetTimeZonesDropdown();
        }
        public string TimeZone
        {
            get { return m_TimeZone; }
            set { m_TimeZone = value; }
        }
        public int Id
        {
            get { return m_Id; }
            set { m_Id = value; }
        }
    }
}
