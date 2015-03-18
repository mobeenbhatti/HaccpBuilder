using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteSOP : DataAccessBase
    {
        private SOP m_SOP;

		public DeleteSOP()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteSOPById.ToString();
		}

		public void Delete()
		{

            //DeleteSOPDataParameters DeleteParameters = new DeleteSOPDataParameters(this.m_SOP);
            
            object[] parameters = new object[1];
            parameters[0] = this.SOP.SOPId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters); 
           
		}

        public SOP SOP
		{
            get { return m_SOP; }
            set { m_SOP = value; }
		}
	}

	public class DeleteSOPDataParameters
	{
		private SOP m_SOP;
		object[] m_Parameters;

        public DeleteSOPDataParameters(SOP SOP)
		{
            this.m_SOP = SOP;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.SOP.SOPId;          

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
