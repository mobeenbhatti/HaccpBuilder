using System;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class FoodCategories
    {
        private Int32 foodCategoryID =(int)0;
			private String name = string.Empty;
            private String biologicalHazard = string.Empty;
            private String chemicalHazard = string.Empty;
            private String physicalHazard = string.Empty;
            private String correctiveAction = string.Empty;
            private String ccp = string.Empty;
            private String cp = string.Empty;
            private Int32 foodCategoryGroupId = (int)0;
            private Int32 active = (int)0;
            private Int32 additional = (int)0;
            private Int32 custom = (int)0;
            private Int32 ccpLimit = (int)0;
            private int m_CriticalLimitID;
            private float m_SCLTempHigh;
            private float m_SCLTempLow;
            private float m_CCLTempHigh;
            private float m_CCLTempLow;
            private float m_QCLTempHigh;
            private float m_QCLTempLow;
            private int m_SCLTime1;
            private int m_SCLTime2;
            private int m_CCLTime1;
            private int m_CCLTime2;
            private int m_QCLTime1;
            private int m_QCLTime2;
            private int m_SortOrder;

			//private ArrayList ingredientsList = null;
			
		public FoodCategories(){
		}		
		
		///<summary>
		/// Creates a new <see cref="FoodCategoriesBase"/> instance by taking parameters.
		///</summary>
		protected FoodCategories(String name)	{
			this.FoodCategory = name;
			
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 FoodCategoryId	{
			get{
				return this.foodCategoryID; 
			}
			set{
				if ( this.foodCategoryID == value)
					return;
				this.foodCategoryID = value;
			}
		}
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 FoodCategoryGroupId
        {
            get
            {
                return this.foodCategoryGroupId;
            }
            set
            {
                if (this.foodCategoryGroupId == value)
                    return;
                this.foodCategoryGroupId = value;
            }
        }
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 Active
        {
            get
            {
                return this.active;
            }
            set
            {
                if (this.active == value)
                    return;
                this.active = value;
            }
        }
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 CCPLimit
        {
            get
            {
                return this.ccpLimit;
            }
            set
            {
                if (this.ccpLimit == value)
                    return;
                this.ccpLimit = value;
            }
        }
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
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
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
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
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String FoodCategory	{
			get{
				return this.name; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "name does not allow null values.");
				if ( this.name == value)
					return;
				this.name = value;
			}
		}
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String CorrectiveAction
        {
            get
            {
                return this.correctiveAction;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.correctiveAction == value)
                    return;
                this.correctiveAction = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String BiologicalHazard
        {
            get
            {
                return this.biologicalHazard;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.biologicalHazard == value)
                    return;
                this.biologicalHazard = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String ChemicalHazard
        {
            get
            {
                return this.chemicalHazard;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.chemicalHazard == value)
                    return;
                this.chemicalHazard = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String PhysicalHazard
        {
            get
            {
                return this.physicalHazard;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.physicalHazard == value)
                    return;
                this.physicalHazard = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String CCP
        {
            get
            {
                return this.ccp;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.ccp == value)
                    return;
                this.ccp = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String CP
        {
            get
            {
                return this.cp;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "name does not allow null values.");
                if (this.cp == value)
                    return;
                this.cp = value;
            }
        }
        public int CriticalLimitID
        {
            get { return m_CriticalLimitID; }
            set { m_CriticalLimitID = value; }
        }

        public float SCLTempHigh
        {
            get { return m_SCLTempHigh; }
            set { m_SCLTempHigh = value; }
        }
        public float SCLTempLow
        {
            get { return m_SCLTempLow; }
            set { m_SCLTempLow = value; }
        }
        public float CCLTempHigh
        {
            get { return m_CCLTempHigh; }
            set { m_CCLTempHigh = value; }
        }
        public float CCLTempLow
        {
            get { return m_CCLTempLow; }
            set { m_CCLTempLow = value; }
        }
        public float QCLTempHigh
        {
            get { return m_QCLTempHigh; }
            set { m_QCLTempHigh = value; }
        }
        public float QCLTempLow
        {
            get { return m_QCLTempLow; }
            set { m_QCLTempLow = value; }
        }
        public int SCLTime1
        {
            get { return m_SCLTime1; }
            set { m_SCLTime1 = value; }
        }
        public int SCLTime2
        {
            get { return m_SCLTime2; }
            set { m_SCLTime2 = value; }
        }
        public int CCLTime1
        {
            get { return m_CCLTime1; }
            set { m_CCLTime1 = value; }
        }
        public int CCLTime2
        {
            get { return m_CCLTime2; }
            set { m_CCLTime2 = value; }
        }
        public int QCLTime1
        {
            get { return m_QCLTime1; }
            set { m_QCLTime1 = value; }
        }
        public int QCLTime2
        {
            get { return m_QCLTime2; }
            set { m_QCLTime2 = value; }
        }
        public int SortOrder
        {
            get { return m_SortOrder; }
            set { m_SortOrder = value; }
        }
        //[DescriptionAttribute(""), BindableAttribute(true)]
        //public virtual Int32 HazardID	{
        //    get{
        //        return this.hazardID; 
        //    }
        //    set{
        //        if ( this.hazardID == value)
        //            return;
        //        this.hazardID = value;
        //    }
        //}
		
		
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
			FoodCategories objInfo = (FoodCategories) obj;
			return FoodCategoryId.Equals(objInfo.FoodCategoryId);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
        public enum DataValue
        {
            NOVALUE = 999

        }
    }
}
