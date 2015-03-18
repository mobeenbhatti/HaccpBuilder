using System;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class Vendors
    {
        private Int32 vendorID =(int)0;
			private String vendorName = string.Empty;
			private String contactName = string.Empty;
			private String phone = string.Empty;
			private Int32 training = (int)0;
			private String trainingDetail = string.Empty;
			private String correctiveAction = string.Empty;
			private String verifiedBy = string.Empty;
			private DateTime varifiedDate = DateTime.MinValue;
			private DateTime entrydate = DateTime.MinValue;
            private Int32 kitchenId = (int)0;
			
			
		public Vendors(){
		}		
		
		///<summary>
		/// Creates a new <see cref="VendorsBase"/> instance by taking parameters.
		///</summary>
        public Vendors(String vendorName, String contactName, String phone, Int32 training, 
			String trainingDetail, String correctiveAction, String verifiedBy, DateTime varifiedDate, 
			DateTime entrydate)	{
			this.VendorName = vendorName;
			this.ContactName = contactName;
			this.Phone = phone;
			this.Training = training;
			this.TrainingDetail = trainingDetail;
			this.CorrectiveAction = correctiveAction;
			this.VerifiedBy = verifiedBy;
			this.VarifiedDate = varifiedDate;
			this.Entrydate = entrydate;
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
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
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 KitchenId
        {
            get
            {
                return this.kitchenId;
            }
            set
            {
                if (this.kitchenId == value)
                    return;
                this.kitchenId = value;
            }
        }
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String VendorName	{
			get{
				return this.vendorName; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "vendorName does not allow null values.");
				if ( this.vendorName == value)
					return;
				this.vendorName = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String ContactName	{
			get{
				return this.contactName; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "contactName does not allow null values.");
				if ( this.contactName == value)
					return;
				this.contactName = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String Phone	{
			get{
				return this.phone; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "phone does not allow null values.");
				if ( this.phone == value)
					return;
				this.phone = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 Training	{
			get{
				return this.training; 
			}
			set{
				if ( this.training == value)
					return;
				this.training = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String TrainingDetail	{
			get{
				return this.trainingDetail; 
			}
			set{
				if ( this.trainingDetail == value)
					return;
				this.trainingDetail = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String CorrectiveAction	{
			get{
				return this.correctiveAction; 
			}
			set{
				if ( this.correctiveAction == value)
					return;
				this.correctiveAction = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String VerifiedBy	{
			get{
				return this.verifiedBy; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "verifiedBy does not allow null values.");
				if ( this.verifiedBy == value)
					return;
				this.verifiedBy = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual DateTime VarifiedDate	{
			get{
				return this.varifiedDate; 
			}
			set{
				if ( this.varifiedDate == value)
					return;
				this.varifiedDate = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual DateTime Entrydate	{
			get{
				return this.entrydate; 
			}
			set{
				if ( this.entrydate == value)
					return;
				this.entrydate = value;
			}
		}
		
        //public virtual ArrayList IngredientVendorList	{
        //    get{
        //        if (this.ingredientVendorList == null){
        //            this.ingredientVendorList = (ArrayList) new IngredientVendorController().GetByVendorID(this.VendorID);
        //        }
        //        return this.ingredientVendorList; 
        //    }
        //    set{
        //        if ( this.ingredientVendorList == value)
        //            return;
        //        this.ingredientVendorList = value;
        //    }
        //}
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
			Vendors objInfo = (Vendors) obj;
			return VendorID.Equals(objInfo.VendorID);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
