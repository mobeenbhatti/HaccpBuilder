using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateValidationGroup
    {
         private ValidationGroup m_ValidationGroup;

        public ProcessCreateValidationGroup()
        {
        }

        public void Invoke()
        {
            CreateValidationGroup createValidationGroup = new CreateValidationGroup();
            createValidationGroup.ValidationGroup = this.m_ValidationGroup;
            createValidationGroup.Insert();
            this.m_ValidationGroup = createValidationGroup.ValidationGroup;
        }

        public ValidationGroup ValidationGroup
        {
            get { return m_ValidationGroup; }
            set { m_ValidationGroup = value; }
        }
    }
}
