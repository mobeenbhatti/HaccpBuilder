using System;
using System.Collections;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text;


namespace SchoolHaccp.Common
{
  public  class Ingredients
    {
        private Int32 ingredientID =(int)0;
			private String name = string.Empty;
			private Int32 vendorID = (int)0;
			private Int32 foodCategoryID = (int)0;
			private DateTime entryDate = DateTime.MinValue;
			private Int32 kitchenId = (int)0;
            private Int32 ccpId = (int)0;
			private ArrayList ingredientVendorList = null;
			
		public Ingredients(){
		}		
		
		///<summary>
		/// Creates a new <see cref="IngredientsBase"/> instance by taking parameters.
		///</summary>
        public Ingredients(String name, Int32 vendorID, Int32 foodCategoryID, 
			DateTime entryDate, Int32 kitchenId)	{
			this.Name = name;
			this.VendorID = vendorID;
			this.FoodCategoryID = foodCategoryID;
			this.EntryDate = entryDate;
			this.KitchenId = kitchenId;
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 IngredientID	{
			get{
				return this.ingredientID; 
			}
			set{
				if ( this.ingredientID == value)
					return;
				this.ingredientID = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String Name	{
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
		public virtual Int32 VendorID	{
			get{
				return this.vendorID; 
			}
			set{
				if ( this.vendorID == value)
					return;
				this.vendorID = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 FoodCategoryID	{
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
        public virtual Int32 CCPId
        {
            get
            {
                return this.ccpId;
            }
            set
            {
                if (this.ccpId == value)
                    return;
                this.ccpId = value;
            }
        }
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual DateTime EntryDate	{
			get{
				return this.entryDate; 
			}
			set{
				if ( this.entryDate == value)
					return;
				this.entryDate = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 KitchenId	{
			get{
				return this.kitchenId; 
			}
			set{
				if ( this.kitchenId == value)
					return;
				this.kitchenId = value;
			}
		}
		
		
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
            Ingredients objInfo = (Ingredients)obj;
			return IngredientID.Equals(objInfo.IngredientID);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
