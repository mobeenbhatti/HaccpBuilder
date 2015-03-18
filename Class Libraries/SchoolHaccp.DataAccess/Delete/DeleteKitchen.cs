using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteKitchen : DataAccessBase
    {       

		public DeleteKitchen()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenById.ToString();
		}

		public void Delete(int nKitchenId)
		{            
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            object returnValue = dataServices.ExecuteScalar(parameters); 
           
		}
       
	}

	
    
}
