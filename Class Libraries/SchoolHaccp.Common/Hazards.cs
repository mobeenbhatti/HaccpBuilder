using System;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class Hazards
    {
        private Int32 hazardID =(int)0;
			private String description = string.Empty;
			
			
		protected Hazards(){
		}		
		
		///<summary>
		/// Creates a new <see cref="HazardsBase"/> instance by taking parameters.
		///</summary>
        protected Hazards(String description)
        {
			this.Description = description;
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 HazardID	{
			get{
				return this.hazardID; 
			}
			set{
				if ( this.hazardID == value)
					return;
				this.hazardID = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual String Description	{
			get{
				return this.description; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "description does not allow null values.");
				if ( this.description == value)
					return;
				this.description = value;
			}
		}		
		
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
            Hazards objInfo = (Hazards)obj;
			return HazardID.Equals(objInfo.HazardID);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
