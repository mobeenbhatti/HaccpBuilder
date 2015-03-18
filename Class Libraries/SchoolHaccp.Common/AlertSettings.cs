using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
   public class AlertSettings
    {
       public enum AlertType
       {           
           Daily = 1,           
           Weekly = 2,         
           Monthly = 3,
           Yearly = 4
       };
    }
}
