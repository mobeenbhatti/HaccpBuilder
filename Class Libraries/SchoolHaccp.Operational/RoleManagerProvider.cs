using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Data;
using DataModel;

using SchoolHaccp.DataAccess;

namespace SchoolHaccp.Operational
{    
   public class RoleManagerProvider : RoleProvider
    {
        private Entities _context = new Entities();
        private string m_GetRolesStoredProcedure; 
        private string m_ValidateRoleStoredProcedure;
        public RoleManagerProvider()
        {
            m_GetRolesStoredProcedure = "uspAdmin_GetRolesForUser";
            m_ValidateRoleStoredProcedure = "uspAdmin_ValidateRole";
        }
       

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {

            //
            // Initialize values from web.config.
            //
         
        //    m_GetRolesStoredProcedure = config["getRolesStoredProcedure"];
        //m_ValidateRoleStoredProcedure = config["uspAdmin_ValidateRole"];
           
            // Initialize the abstract base class.
            base.Initialize(name, config);

         }

        //
        // System.Web.Security.RoleProvider properties.
        //
        private string m_ApplicationName;
        public override string ApplicationName
        {
            get { return HttpContext.Current.Request.ApplicationPath; }
            set { m_ApplicationName = value; }
        }

        public override void AddUsersToRoles(string[] usernames, string[] rolenames)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override void CreateRole(string rolename)
        {
            throw new Exception("The method or operation is not implemented.");

        }

        public override bool DeleteRole(string rolename, bool throwOnPopulatedRole)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string[] GetAllRoles()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string[] GetRolesForUser(string username)
        {
            string RoleNames="" ;

            if (username.Contains("@"))
            {
                this.m_GetRolesStoredProcedure = "uspAdmin_GetRolesForUserByEmail";
            }
            else
            { 
                this.m_GetRolesStoredProcedure = "uspAdmin_GetRolesForUser"; 
            }
            using (DataHelper dataHelper = new DataHelper(this.m_GetRolesStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(7);
              //  parameters.Add(new DataParameter("@vchTableName", this.m_TableName));
               // parameters.Add(new DataParameter("@vchContactIdField", this.m_ContactIdField));
               // parameters.Add(new DataParameter("@vchUserRoleField", this.m_RoleIdField));
              //  parameters.Add(new DataParameter("@vchUserPasswordField", this.m_UserPasswordField));
              //  parameters.Add(new DataParameter("@vchUserGroupField", this.m_UserGroupField));
                parameters.Add(new DataParameter("@vchUserLoginValue", username.Trim()));
            //    parameters.Add(new DataParameter("@vchUserPasswordValue", password));
                using (IDataReader reader = dataHelper.ExecuteReader(parameters))
                {
                    while (reader.Read())
                    {
                        RoleNames += reader[0].ToString() + ",";                     

                      //  HttpContext.Current.Session[m_UserRoleIdSessionVariable] = reader[m_RoleIdField].ToString();
                    
                    }


                    if (RoleNames == "")
                    {
                        return new string[0];
                    }
                    else
                    {
                        RoleNames = RoleNames.Substring(0, RoleNames.Length - 1);
                        return RoleNames.Split(',');
                    }

                }              

                
            }

        
        }

        public override string[] GetUsersInRole(string rolename)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] rolenames)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool RoleExists(string rolename)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string[] FindUsersInRole(string rolename, string usernameToMatch)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool IsUserInRole(string username, string rolename)
        {


            using (DataHelper dataHelper = new DataHelper(this.m_ValidateRoleStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(2);

                parameters.Add(new DataParameter("@vchUserLoginValue", username.Trim()));
                parameters.Add(new DataParameter("@vchUserRole", rolename.Trim()));

                using (IDataReader reader = dataHelper.ExecuteReader(parameters))
                {
                    if (reader.Read())
                        return true;
                    else
                        return false;
                }
            }
                              
            //throw new Exception("The method or operation is not implemented.");
        }
        public  bool IsUserInRole(string username,string password, string rolename)
        {

            if (username.Contains("@"))
            {
                this.m_ValidateRoleStoredProcedure = "uspAdmin_ValidateRoleByEmail";
            }

            using (DataHelper dataHelper = new DataHelper(this.m_ValidateRoleStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(3);

                parameters.Add(new DataParameter("@vchUserLoginValue", username.Trim()));
                parameters.Add(new DataParameter("@vchPassword", password.Trim()));
                parameters.Add(new DataParameter("@vchUserRole", rolename.Trim()));

                using (DataSet ds = dataHelper.ExecuteDataSet(parameters))
                {
                    if (ds.Tables[0].Rows.Count > 0)
                        return true;
                    else
                        return false;
                }
            }

            //throw new Exception("The method or operation is not implemented.");
        }


    }
}


