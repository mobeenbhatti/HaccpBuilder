using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetKitchenCorrectiveAction: IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private KitchenCorrectiveAction m_KitchenCorrectiveAction;

        public ProcessGetKitchenCorrectiveAction()
        {
        }

        public void Invoke()
        {
            GetKitchenCorrectiveActions getKitchenCorrectiveAction = new GetKitchenCorrectiveActions();
            //getKitchenCorrectiveAction. = this.KitchenCorrectiveAction;
            //this.ResultSet = getKitchenCorrectiveAction.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenCorrectiveActionByKitchenId(int nKitchenId, int nLogTypeId)
        {
            GetKitchenCorrectiveActions getLog = new GetKitchenCorrectiveActions();
            return getLog.GetCorrectiveActionsDataSet(nKitchenId,nLogTypeId);
        }
        public IDataReader GetKitchenCorrectiveActionById(int nCorrectiveActionId)
        {
            GetKitchenCorrectiveActions getLog = new GetKitchenCorrectiveActions();
            return getLog.GetCorrectiveActionById(nCorrectiveActionId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetKitchenCorrectiveActionByStatusId(int nKitchenId, int nLogTypeId)
        {
            GetKitchenCorrectiveActions getLog = new GetKitchenCorrectiveActions();
            return getLog.GetCorrectiveActionByStatusId(nKitchenId, nLogTypeId);
        }

       
        public KitchenCorrectiveAction KitchenCorrectiveAction
        {
            get { return m_KitchenCorrectiveAction; }
            set { m_KitchenCorrectiveAction = value; }
        }
    }
}

