using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
   public class GetKitchenDetail : DataAccessBase
    {
       public GetKitchenDetail()
		{
           
		}
       public DataSet GetKitchenDetailsByDistrictId(int nDistrictId)
       {
           DataServices dataServices = new DataServices();
           object[] parameters = new object[1];
           parameters[0] = nDistrictId;
           return dataServices.ExecuteDataSet("uspAdm_GetKitchenDetailsByDistrictId", parameters);
       }
       public DataSet GetKitchenDetailsById(int nKitchenId)
       {
           DataServices dataServices = new DataServices();
           object[] parameters = new object[1];
           parameters[0] =  nKitchenId;
           return dataServices.ExecuteDataSet("uspAdm_GetKitchenDetailsById", parameters);
       }
       public DataSet GetKitchenEmployeesByKitchenId(int nKitchenId)
       {
           DataServices dataServices = new DataServices();
           object[] parameters = new object[1];
           parameters[0] = nKitchenId;
           return dataServices.ExecuteDataSet("GetKitchenEmployeeByKitchenId", parameters);
       }
    }
}
