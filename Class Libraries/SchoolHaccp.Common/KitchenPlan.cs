using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenPlan
    {
        
         private int m_KitchenPlanId;        
        private int m_KitchenId;
       private int m_KitchenPlanCategoryId;
        private string m_PlanText;
        private string m_PlanTitle;
        private int m_Active;
       private int m_SortOrder;
       private Int32 custom = (int)0;
       private Int32 childPlanId = (int)0;
       private Int32 additional = (int)0;


       /// <summary>
       /// Temp code
       /// </summary>
       public string SanitizationPlan
       {
           get { return m_PlanText; }
           set { m_PlanText = value; }
       }
       public string PestControlPlan
       {
           get { return m_PlanText; }
           set { m_PlanText = value; }
       }
       public string EquipmentMaintanencePlan
       {
           get { return m_PlanText; }
           set { m_PlanText = value; }
       }     
     /// ////////////////
     

        public KitchenPlan()
        {
        }

        public string PlanText
        {
            get { return m_PlanText; }
            set { m_PlanText = value; }
        }
        public string PlanTitle
        {
            get { return m_PlanTitle; }
            set { m_PlanTitle = value; }
        }
       
        public int KitchenPlanId
        {
            get { return m_KitchenPlanId; }
            set { m_KitchenPlanId = value; }
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
                return this.childPlanId;
            }
            set
            {
                if (this.childPlanId == value)
                    return;
                this.childPlanId = value;
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
