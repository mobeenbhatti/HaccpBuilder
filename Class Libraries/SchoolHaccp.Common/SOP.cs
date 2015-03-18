using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class SOP
    {

        private int m_SOPId;
        private int m_KitchenSOPId;
        private int m_KitchenId;
        private int m_KitchenGroupId;
        private string m_SOPText;
        private string m_SOPTitle;
        private int m_Removed;
        private int m_SortOrder;
        private Int32 custom = (int)0;
        private Int32 childSOPId = (int)0;
        private Int32 additional = (int)0;


       public SOP()
        {
        }

        public string SOPText
        {
            get { return m_SOPText; }
            set { m_SOPText = value; }
        }
        public string SOPTitle
        {
            get { return m_SOPTitle; }
            set { m_SOPTitle = value; }
        }

        public int SOPId
        {
            get { return m_SOPId; }
            set { m_SOPId = value; }
        }
        public int KitchenSOPId
        {
            get { return m_KitchenSOPId; }
            set { m_KitchenSOPId = value; }
        }
        public int KitchenGroupId
        {
            get { return m_KitchenGroupId; }
            set { m_KitchenGroupId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
        public int Removed
        {
            get { return m_Removed; }
            set { m_Removed = value; }
        }
        public int SortOrder
        {
            get { return m_SortOrder; }
            set { m_SortOrder = value; }
        }
        public virtual Int32 Custom
        {
            get
            {
                return this.custom;
            }
            set
            {
                if (this.custom == value)
                    return;
                this.custom = value;
            }
        }
        public virtual Int32 ChildSOPId
        {
            get
            {
                return this.childSOPId;
            }
            set
            {
                if (this.childSOPId == value)
                    return;
                this.childSOPId = value;
            }
        }
        public virtual Int32 Additional
        {
            get
            {
                return this.additional;
            }
            set
            {
                if (this.additional == value)
                    return;
                this.additional = value;
            }
        }
    }
}
