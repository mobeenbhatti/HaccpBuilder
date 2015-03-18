using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteLunch : DataAccessBase
    {
        private Lunch m_Lunch;

        public DeleteLunch()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteLunch.ToString();
        }

        public void Delete()
        {
            DeleteLunchDataParameters createParameters = new DeleteLunchDataParameters(this.m_Lunch);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }


        public Lunch Lunch
        {
            get { return m_Lunch; }
            set { m_Lunch = value; }
        }
    }

    public class DeleteLunchDataParameters
    {
        private Lunch m_Lunch;
        object[] m_Parameters;

        public DeleteLunchDataParameters(Lunch Lunch)
        {
            this.m_Lunch = Lunch;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_Lunch.LunchId;
            Parameters = parameters;
        }

        public Lunch Lunch
        {
            get { return m_Lunch; }
            set { m_Lunch = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
