using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenPlanCategory
    {
        
       private int m_KitchenId;
       private int m_KitchenPlanCategoryId;
       private string m_Category;        
       private int m_Active;
       private int m_SortOrder;
       private Int32 custom = (int)0;
       private Int32 childPlanCategoryId = (int)0;
       private Int32 additional = (int)0;


       public KitchenPlanCategory()
        {
        }

       public string Category
        {
            get { return m_Category; }
            set { m_Category = value; }
        }   
       
        public int KitchenPlanCategoryId
        {
            get { return m_KitchenPlanCategoryId; }
            set { m_KitchenPlanCategoryId = value; }
        }
        
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
        public int Active
        {
            get { return m_Active; }
            set { m_Active = value; }
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
        public virtual Int32 ChildPlanId
        {
            get
            {
                return this.childPlanCategoryId;
            }
            set
            {
                if (this.childPlanCategoryId == value)
                    return;
                this.childPlanCategoryId = value;
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
