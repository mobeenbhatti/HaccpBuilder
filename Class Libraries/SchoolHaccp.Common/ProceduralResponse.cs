using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.ComponentModel;

namespace SchoolHaccp.Common
{
  public  class ProceduralResponse
    {
        private Int32 responseId =(int)0;
			private Int32 response = (int)0;
			private Int32 questionId = (int)0;
			private String correctiveAction = string.Empty;
			private Int32 kitchenId = (int)0;
			
		public ProceduralResponse(){
		}		
		
		///<summary>
		/// Creates a new <see cref="ProceduralResponsesBase"/> instance by taking parameters.
		///</summary>
        public ProceduralResponse(Int32 response, Int32 questionId, String correctiveAction, 
			Int32 kitchenId)	{
			this.Response = response;
			this.QuestionId = questionId;
			this.CorrectiveAction = correctiveAction;
			this.KitchenId = kitchenId;
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 ResponseId	{
			get{
				return this.responseId; 
			}
			set{
				if ( this.responseId == value)
					return;
				this.responseId = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 Response	{
			get{
				return this.response; 
			}
			set{
				if ( this.response == value)
					return;
				this.response = value;
			}
		}
		[DescriptionAttribute(""), BindableAttribute(true)]
		public virtual Int32 QuestionId	{
			get{
				return this.questionId; 
			}
			set{
				if ( this.questionId == value)
					return;
				this.questionId = value;
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
			ProceduralResponse objInfo = (ProceduralResponse) obj;
			return ResponseId.Equals(objInfo.ResponseId);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
