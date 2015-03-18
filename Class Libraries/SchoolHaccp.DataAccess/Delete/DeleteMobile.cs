using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteMobile : DataAccessBase
    {

        public DeleteMobile()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteMobileById.ToString();
        }

        public void Delete(int nMobileId)
        {
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nMobileId;
            object returnValue = dataServices.ExecuteScalar(parameters);
        }

        public void DeleteMobileChecklist(int MobileId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[1];
            parameters[0] = MobileId;
            object returnValue = dataServices.ExecuteScalar("uspAdm_DeleteMobileCheckList", parameters);
        }

    }



}
