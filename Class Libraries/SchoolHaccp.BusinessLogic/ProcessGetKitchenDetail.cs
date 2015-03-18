using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetKitchenDetail : IBusinessLogic
    {
       private DataSet m_DataSet;
       public ProcessGetKitchenDetail()
        {
        }
       public void Invoke()
       {

       }
       public DataSet ResultSet
       {
           get { return m_DataSet; }
           set { m_DataSet = value; }
       }
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetKitchenDetailsByDistrictId(int nDistrictId)
       {
           GetKitchenDetail kitchen = new GetKitchenDetail();
           return kitchen.GetKitchenDetailsByDistrictId(nDistrictId);

       }
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetKitchenDetailsById(int nKitchenId)
       {
           GetKitchenDetail kitchen = new GetKitchenDetail();
           return kitchen.GetKitchenDetailsById(nKitchenId);

       }
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetKitchenEmployeesByKitchenId(int nKitchenId)
       {
           GetKitchenDetail kitchen = new GetKitchenDetail();
           return kitchen.GetKitchenEmployeesByKitchenId(nKitchenId);

       }
    }
}
