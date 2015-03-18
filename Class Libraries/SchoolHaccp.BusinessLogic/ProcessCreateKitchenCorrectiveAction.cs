using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateKitchenCorrectiveAction: IBusinessLogic
    {
        private KitchenCorrectiveAction m_KitchenCorrectiveAction;

        public ProcessCreateKitchenCorrectiveAction()
        {
        }

        public void Invoke()
        {
            CreateKitchenCorrectiveAction createKitchenCorrectiveAction = new CreateKitchenCorrectiveAction();
            createKitchenCorrectiveAction.CorrectiveAction = this.m_KitchenCorrectiveAction;
            createKitchenCorrectiveAction.Insert();
            this.m_KitchenCorrectiveAction = createKitchenCorrectiveAction.CorrectiveAction;
        }       

        public KitchenCorrectiveAction KitchenCorrectiveAction
        {
            get { return m_KitchenCorrectiveAction; }
            set { m_KitchenCorrectiveAction = value; }
        }
    }
}
