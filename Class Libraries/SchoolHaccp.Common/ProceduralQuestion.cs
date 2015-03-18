using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.ComponentModel;

namespace SchoolHaccp.Common
{
  public  class ProceduralQuestion
    {
        private Int32 questionId =(int)0;
			private String question = string.Empty;
			
			
		public ProceduralQuestion(){
		}		
		
		///<summary>
		/// Creates a new <see cref="ProceduralQuestionsBase"/> instance by taking parameters.
		///</summary>
        public ProceduralQuestion(String question)
        {
			this.Question = question;
		}
		
		
		
		[ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
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
		public virtual String Question	{
			get{
				return this.question; 
			}
			set{
					if ( value == null )
						throw new ArgumentNullException("value", "question does not allow null values.");
				if ( this.question == value)
					return;
				this.question = value;
			}
		}
		
		
		
		public override bool Equals(object obj){
			if ((obj == null) || (this.GetType() != obj.GetType())) return false;
			ProceduralQuestion objInfo = (ProceduralQuestion) obj;
			return QuestionId.Equals(objInfo.QuestionId);
			return true;
		}
	
		public override int GetHashCode(){
			return base.GetHashCode ();
		}
    }
}
