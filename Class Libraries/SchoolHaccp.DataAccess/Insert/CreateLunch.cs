using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateLunch : DataAccessBase
    {
        private Lunch m_Lunch;

        public CreateLunch()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertLunch.ToString();
        }

        public void Insert()
        {
            int LunchId = 0;
            CreateLunchDataParameters createParameters = new CreateLunchDataParameters(this.m_Lunch);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public Lunch Lunch
        {
            get { return m_Lunch; }
            set { m_Lunch = value; }
        }
    }

    public class CreateLunchDataParameters
    {
        private Lunch m_Lunch;
        object[] m_Parameters;

        public CreateLunchDataParameters(Lunch Lunch)
        {
            this.m_Lunch = Lunch;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.m_Lunch.MealCalendarId;
            parameters[1] = this.m_Lunch.MenuItemId;

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
