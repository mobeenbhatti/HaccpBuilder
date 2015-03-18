using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessSetKitchenCorrectiveAction: IBusinessLogic
    {
        private KitchenCorrectiveAction m_KitchenCorrectiveAction;

        public ProcessSetKitchenCorrectiveAction()
        {
        }

        public void Invoke()
        {
            SetKitchenCorrectiveAction setKitchenCorrectiveAction = new SetKitchenCorrectiveAction();
            setKitchenCorrectiveAction.CorrectiveAction = this.m_KitchenCorrectiveAction;
            setKitchenCorrectiveAction.Update();
        }

        public KitchenCorrectiveAction KitchenCorrectiveAction
        {
            get { return m_KitchenCorrectiveAction; }
            set { m_KitchenCorrectiveAction = value; }
        }
    }
}
