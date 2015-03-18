using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetSOP : DataAccessBase
    {
        private SOP m_SOP;

        public SetSOP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateSOP.ToString();
        }

        public void Update()
        {
            SetSOPByIdDataParameters setParameters = new SetSOPByIdDataParameters(this.m_SOP);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }
        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.SOP.SOPId;
            parameters[1] = this.SOP.Removed;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateSOPSelection", parameters);
        }
        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
    }

    public class SetSOPByIdDataParameters
    {
        private SOP m_SOP;
        object[] m_Parameters;

        public SetSOPByIdDataParameters(SOP mSOP)
        {
            this.m_SOP = mSOP;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];
            parameters[0] = this.m_SOP.KitchenSOPId;
            parameters[1] = this.m_SOP.KitchenId;
            parameters[2] = this.m_SOP.KitchenGroupId;
            parameters[3] = this.m_SOP.SOPText;
            parameters[4] = this.m_SOP.SOPTitle;
            parameters[5] = this.m_SOP.Removed;
            parameters[6] = this.SOP.Additional;
            parameters[7] = this.SOP.Custom;



            // parameters[0] = this.m_SOP.KitchenId;
            // if(this.m_SOP.SOPId == 1)
            // {
            //     parameters[1] = this.m_SOP.SanitizationSOP;
            // }
            //if(this.m_SOP.SOPId == 2)
            // {
            //    parameters[1] = this.m_SOP.PestControlSOP;
            // }
            // if(this.m_SOP.SOPId == 3)
            // {
            //     parameters[1] = this.m_SOP.EquipmentMaintanenceSOP;
            // }            
            // parameters[2] = this.m_SOP.SOPId;


            Parameters = parameters;

        }

        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}

