using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateCtpat : DataAccessBase
    {
        private Ctpat m_Ctpat;

        public CreateCtpat()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCtpat.ToString();
        }

        public void Insert()
        {

            CreateCtpatDataParameters createParameters = new CreateCtpatDataParameters(this.m_Ctpat);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }

    public class CreateCtpatDataParameters
    {
        private Ctpat m_Ctpat;
        object[] m_Parameters;

        public CreateCtpatDataParameters(Ctpat Ctpat)
        {
            this.m_Ctpat = Ctpat;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[7];
            parameters[0] = this.Ctpat.KitchenId;
            parameters[1] = this.Ctpat.KitchenGroupId;
            parameters[2] = this.Ctpat.CtpatText;
            parameters[3] = this.Ctpat.CtpatTitle;
            parameters[4] = this.Ctpat.Additional;
            parameters[5] = this.Ctpat.Custom;
            parameters[6] = this.Ctpat.KitchenCtpatId;

            Parameters = parameters;

        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
