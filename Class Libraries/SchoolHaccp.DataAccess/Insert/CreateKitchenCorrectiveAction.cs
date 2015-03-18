using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateKitchenCorrectiveAction: DataAccessBase
    {
        private KitchenCorrectiveAction m_CorrectiveAction;

        public CreateKitchenCorrectiveAction()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCorrectiveAction.ToString();
        }

        public void Insert()
        {

            CreateCorrectiveActionDataParameters createParameters = new CreateCorrectiveActionDataParameters(this.m_CorrectiveAction);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public KitchenCorrectiveAction CorrectiveAction
        {
            get { return m_CorrectiveAction; }
            set { m_CorrectiveAction = value; }
        }
    }

    public class CreateCorrectiveActionDataParameters
    {
        private KitchenCorrectiveAction m_CorrectiveAction;
        object[] m_Parameters;

        public CreateCorrectiveActionDataParameters(KitchenCorrectiveAction CorrectiveAction)
        {
            this.m_CorrectiveAction = CorrectiveAction;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
            parameters[0] = this.CorrectiveAction.KitchenId;
            parameters[1] = this.CorrectiveAction.Name;
            parameters[2] = this.CorrectiveAction.LogTypeID;
            parameters[3] = this.CorrectiveAction.Status;
            parameters[4] = this.CorrectiveAction.IsInclude;
            
            Parameters = parameters;
           
        }

        public KitchenCorrectiveAction CorrectiveAction
        {
            get { return m_CorrectiveAction; }
            set { m_CorrectiveAction = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
