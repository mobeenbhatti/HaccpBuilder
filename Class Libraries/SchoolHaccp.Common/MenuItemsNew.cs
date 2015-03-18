using System;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class MenuItemsNew
    {
        private Int32 menuItemId =(int)0;
			private String name = string.Empty;
			private Int32 preparationTypeId = (int)0;
			private Int32 processId = (int)0;
			private Int32 kitchenId = (int)0;
			private String recipeNumber = string.Empty;
            private String recipe = string.Empty;
			private Int32 ready = (int)0;
			private String instructions = string.Empty;
			private Int32 selected = (int)0;
            private DateTime entryDate = DateTime.MinValue;
			
			
		public MenuItemsNew(){
		}		
		
		///<summary>
		/// Creates a new <see cref="MenuItemsNewBase"/> instance by taking parameters.
		///</summary>
		public MenuItemsNew(String name, Int32 preparationTypeId, Int32 processId, 
			Int32 kitchenId, String recipeNumber, Int32 ready, String instructions, 
			Int32 selected, DateTime entryDate)	{
			this.Name = name;
			this.PreparationTypeId = preparationTypeId;
			this.ProcessId = processId;
			this.KitchenId = kitchenId;
			this.RecipeNumber = recipeNumber;
			this.Ready = ready;
			this.Instructions = instructions;
			this.Selected = selected;
            this.entryDate = entryDate;

		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 MenuItemId	{
			get{
				return this.menuItemId; 
			}
			set{
				if ( this.menuItemId == value)
					return;
				this.menuItemId = value;
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
        public virtual DateTime EntryDate
        {
            get
            {
                return this.entryDate;
            }
            set
            {
                if (this.entryDate == value)
                    return;
                this.entryDate = value;
            }
        }
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 PreparationTypeId	{
			get{
				return this.preparationTypeId; 
			}
			set{
				if ( this.preparationTypeId == value)
					return;
				this.preparationTypeId = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 ProcessId	{
			get{
				return this.processId; 
			}
			set{
				if ( this.processId == value)
					return;
				this.processId = value;
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
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String RecipeNumber	{
			get{
				return this.recipeNumber; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "recipeNumber does not allow null values.");
				if ( this.recipeNumber == value)
					return;
				this.recipeNumber = value;
			}
		}
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String Recipe
        {
            get
            {
                return this.recipe;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "recipeNumber does not allow null values.");
                if (this.recipe == value)
                    return;
                this.recipe = value;
            }
        }
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 Ready	{
			get{
				return this.ready; 
			}
			set{
				if ( this.ready == value)
					return;
				this.ready = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String Instructions	{
			get{
				return this.instructions; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "instructions does not allow null values.");
				if ( this.instructions == value)
					return;
				this.instructions = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 Selected	{
			get{
				return this.selected; 
			}
			set{
				if ( this.selected == value)
					return;
				this.selected = value;
			}
		}
		
        //public virtual ArrayList MenuIngredientList	{
        //    get{
        //        if (this.menuIngredientList == null){
        //            this.menuIngredientList = (ArrayList) new MenuIngredientController().GetByMenuItemId(this.MenuItemId);
        //        }
        //        return this.menuIngredientList; 
        //    }
        //    set{
        //        if ( this.menuIngredientList == value)
        //            return;
        //        this.menuIngredientList = value;
        //    }
        //}
        //public virtual ArrayList KitchenmenuitemsoldList	{
        //    get{
        //        if (this.kitchenmenuitemsoldList == null){
        //            this.kitchenmenuitemsoldList = (ArrayList) new Kitchenmenuitems(old)Controller().GetByMenuItemId(this.MenuItemId);
        //        }
        //        return this.kitchenmenuitemsoldList; 
        //    }
        //    set{
        //        if ( this.kitchenmenuitemsoldList == value)
        //            return;
        //        this.kitchenmenuitemsoldList = value;
        //    }
        //}
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
			MenuItemsNew objInfo = (MenuItemsNew) obj;
			return MenuItemId.Equals(objInfo.MenuItemId);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
