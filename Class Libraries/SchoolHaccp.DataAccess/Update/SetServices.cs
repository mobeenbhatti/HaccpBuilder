using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.DataAccess.Update
{
  public class SetServices : DataAccessBase
    {
        public SetServices()
		{
			
		}

        public void FillDispatchTable()
		{			
             object[] parameters = new object[0];
             DataServices dataServices = new DataServices("uspAdm_UpdateAlertDispatch");
            dataServices.ExecuteScalar(parameters);
		}
    }
}
