using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.Security;

namespace SchoolHaccp.Operational
{
  public class WebRoles : System.Web.UI.Page
    {
        private string[]  roleNames;
        
        // This mthod checks the Roles of user for the Page requested 
        // and then return true/false on the basis of that role.
        public bool IsAuthorised(string strPath)
        {
           int i;
           this.roleNames = Roles.GetRolesForUser(User.Identity.Name);
           if (this.roleNames.Length == 0)
           { return false; }
          if (strPath.Contains("Kitchen"))
            {

                for (i = 0; i < roleNames.Length; i++)
                {
                    if (int.Parse(roleNames[i]) == 1 || int.Parse(roleNames[i]) == 2)
                    {
                        return true;
                    }
                }
                return false;
               
            }
          else
             if (strPath.Contains("District"))
              {
                  for (i = 0; i < roleNames.Length; i++)
                  {
                      if (int.Parse(roleNames[i]) == 1 || int.Parse(roleNames[i]) == 3)
                      {
                          return true;
                      }
                  }
                  return false;
                  
              }
             else            
          {
             return true;
           }
         
        }


    }
}
