using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
  public  class DeleteDistrict : DataAccessBase
    {
        public DeleteDistrict()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteDistrictRough.ToString();
		}

		public void Delete(int nDistrictId)
		{            
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nDistrictId;
            object returnValue = dataServices.ExecuteScalar(parameters); 
           
		}
    }
}
