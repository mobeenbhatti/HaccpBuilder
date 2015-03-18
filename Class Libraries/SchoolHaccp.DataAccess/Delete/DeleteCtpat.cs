using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteCtpat : DataAccessBase
    {
        private Ctpat m_Ctpat;

        public DeleteCtpat()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteCtpatById.ToString();
        }

        public void Delete()
        {

            //DeleteCtpatDataParameters DeleteParameters = new DeleteCtpatDataParameters(this.m_Ctpat);

            object[] parameters = new object[1];
            parameters[0] = this.Ctpat.CtpatId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }

    public class DeleteCtpatDataParameters
    {
        private Ctpat m_Ctpat;
        object[] m_Parameters;

        public DeleteCtpatDataParameters(Ctpat Ctpat)
        {
            this.m_Ctpat = Ctpat;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.Ctpat.CtpatId;

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
