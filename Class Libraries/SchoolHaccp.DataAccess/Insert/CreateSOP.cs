using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateSOP : DataAccessBase
    {
        private SOP m_SOP;

        public CreateSOP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertSOP.ToString();
        }

        public void Insert()
        {

            CreateSOPDataParameters createParameters = new CreateSOPDataParameters(this.m_SOP);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
    }

    public class CreateSOPDataParameters
    {
        private SOP m_SOP;
        object[] m_Parameters;

        public CreateSOPDataParameters(SOP SOP)
        {
            this.m_SOP = SOP;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[7];
            parameters[0] = this.SOP.KitchenId;
            parameters[1] = this.SOP.KitchenGroupId;
            parameters[2] = this.SOP.SOPText;
            parameters[3] = this.SOP.SOPTitle;
            parameters[4] = this.SOP.Additional;
            parameters[5] = this.SOP.Custom;
            parameters[6] = this.SOP.KitchenSOPId;

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
