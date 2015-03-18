using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetCtpat : DataAccessBase
    {
        private Ctpat m_Ctpat;

        public SetCtpat()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateCtpat.ToString();
        }

        public void Update()
        {
            SetCtpatByIdDataParameters setParameters = new SetCtpatByIdDataParameters(this.m_Ctpat);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }
        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.Ctpat.CtpatId;
            parameters[1] = this.Ctpat.Removed;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateCtpatSelection", parameters);
        }
        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }

    public class SetCtpatByIdDataParameters
    {
        private Ctpat m_Ctpat;
        object[] m_Parameters;

        public SetCtpatByIdDataParameters(Ctpat mCtpat)
        {
            this.m_Ctpat = mCtpat;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];
            parameters[0] = this.m_Ctpat.KitchenCtpatId;
            parameters[1] = this.m_Ctpat.KitchenId;
            parameters[2] = this.m_Ctpat.KitchenGroupId;
            parameters[3] = this.m_Ctpat.CtpatText;
            parameters[4] = this.m_Ctpat.CtpatTitle;
            parameters[5] = this.m_Ctpat.Removed;
            parameters[6] = this.Ctpat.Additional;
            parameters[7] = this.Ctpat.Custom;            
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
