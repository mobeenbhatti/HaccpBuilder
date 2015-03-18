using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
   public class Ctpat
    {
         private int m_CtpatId;
        private int m_KitchenCtpatId;
        private int m_KitchenId;
        private int m_KitchenGroupId;
        private string m_CtpatText;
        private string m_CtpatTitle;
        private int m_Removed;
        private int m_SortOrder;
        private Int32 custom = (int)0;
        private Int32 childCtpatId = (int)0;
        private Int32 additional = (int)0;


       public Ctpat()
        {
        }

        public string CtpatText
        {
            get { return m_CtpatText; }
            set { m_CtpatText = value; }
        }
        public string CtpatTitle
        {
            get { return m_CtpatTitle; }
            set { m_CtpatTitle = value; }
        }

        public int CtpatId
        {
            get { return m_CtpatId; }
            set { m_CtpatId = value; }
        }
        public int KitchenCtpatId
        {
            get { return m_KitchenCtpatId; }
            set { m_KitchenCtpatId = value; }
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
        public virtual Int32 ChildCtpatId
        {
            get
            {
                return this.childCtpatId;
            }
            set
            {
                if (this.childCtpatId == value)
                    return;
                this.childCtpatId = value;
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
