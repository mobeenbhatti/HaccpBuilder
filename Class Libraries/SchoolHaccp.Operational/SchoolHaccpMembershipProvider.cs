using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using DataModel;
using SchoolHaccp.DataAccess;
using SchoolHaccp.Common;
using System.Linq;

namespace SchoolHaccp.Operational
{
    public class SchoolHaccpMembershipProvider : MembershipProvider
    {
        private string m_Connection;
        private string m_ValidateUserStoredProcedure;
        private string m_GetUserStoredProcedure;
        private string m_ChangeUserPasswordStoredProcedure;
        private string m_TableName;
        //private string m_UserIdField;
        private string m_ContactIdField;
        private string m_UserLoginField;
        private string m_UserPasswordField;
        private string m_UserGroupField;
        private string m_UserIdSessionVariable;
        private string m_UserGroupSessionVariable;
        private string m_UserLoginSessionVariable;
        private Entities _context = new Entities();
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            m_Connection = config["connectionString"];
            m_ValidateUserStoredProcedure = config["validateUserStoredProcedure"];
            m_GetUserStoredProcedure = config["getUserStoredProcedure"];
            m_ChangeUserPasswordStoredProcedure = config["changeUserPasswordStoredProcedure"];
            m_TableName = config["tableName"];
            m_ContactIdField = config["userIdField"];
            m_UserLoginField = config["userLoginField"];
            m_UserPasswordField = config["userPasswordField"];
            m_UserGroupField = config["userGroupField"];
            m_UserIdSessionVariable = config["userIdSessionVariable"];
            m_UserGroupSessionVariable = config["userGroupSessionVariable"];
            m_UserLoginSessionVariable = config["userLoginSessionVariable"];

            base.Initialize(name, config);
        }

        private string m_ApplicationName;
        public override string ApplicationName
        {
            get { return HttpContext.Current.Request.ApplicationPath; }
            set { m_ApplicationName = value; }
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            bool result = false;
            using (DataHelper dataHelper = new DataHelper(this.m_ChangeUserPasswordStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(7);
                parameters.Add(new DataParameter("@vchTableName", this.m_TableName));
                parameters.Add(new DataParameter("@vchUserIdField", this.m_ContactIdField));
                parameters.Add(new DataParameter("@vchUserLoginField", this.m_UserLoginField));
                parameters.Add(new DataParameter("@vchUserPasswordField", this.m_UserPasswordField));
                parameters.Add(new DataParameter("@vchUserLoginValue", username));
                parameters.Add(new DataParameter("@vchOldPasswordValue", oldPassword));
                parameters.Add(new DataParameter("@vchNewPasswordValue", newPassword));
                try
                {
                    int count = Convert.ToInt32(dataHelper.ExecuteScalar(parameters));
                    if (count > 0)
                    {
                        if (this.ValidateUser(username, newPassword))
                        {
                            result = true;
                        }
                    }
                }
                catch (Exception)
                {
                    result = false;
                }
            }
            return result;
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool EnablePasswordReset
        {
            get { return true; }
        }

        public override bool EnablePasswordRetrieval
        {
            get { return false; }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string GetPassword(string username, string answer)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            MembershipUser user = null;
            using (DataHelper dataHelper = new DataHelper(this.m_GetUserStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(7);
                parameters.Add(new DataParameter("@vchTableName", this.m_TableName));
                parameters.Add(new DataParameter("@vchUserIdField", this.m_ContactIdField));
                parameters.Add(new DataParameter("@vchUserLoginField", this.m_UserLoginField));
                parameters.Add(new DataParameter("@vchUserPasswordField", this.m_UserPasswordField));
                //	parameters.Add(new DataParameter("@vchUserGroupField", this.m_UserGroupField));
                parameters.Add(new DataParameter("@vchUserLoginValue", username));
                using (IDataReader reader = dataHelper.ExecuteReader(parameters))
                {
                    if (reader.Read())
                    {
                        user = new MembershipUser(this.Name, reader["Email"].ToString(), null,
                            reader["Email"].ToString(), null, "",
                            true, false, Convert.ToDateTime(reader["CreatedDate"]),
                            Convert.ToDateTime(reader["LastLoginDate"]),
                            Convert.ToDateTime(reader["LastActivityDate"]),
                            Convert.ToDateTime(reader["PasswordChangeDate"]),
                            Convert.ToDateTime(reader["LastLockoutDate"]));
                    }
                }
            }
            return user;
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return 0; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return 0; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return 7; }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { return false; }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        private string GenerateRandomPassword()
        {

            int maxSize = 20;
            int minSize = 8;
            char[] passwordCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray();
            //char[] passwordCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789".ToCharArray();

            int size = maxSize;
            byte[] data = new byte[7];
            System.Security.Cryptography.RNGCryptoServiceProvider crypto = new System.Security.Cryptography.RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            size = (data[0] % (maxSize - minSize)) + minSize;
            // ERROR: Not supported in C#: ReDimStatement
            crypto.GetNonZeroBytes(data);
            System.Text.StringBuilder result = new System.Text.StringBuilder(size);
            foreach (byte datum in data)
            {
                result.Append(passwordCharacters[datum % (passwordCharacters.Length - 1)]);
            }

            return result.ToString();

        }
        public override string ResetPassword(string username, string answer)
        {

            HaccpUser user = new HaccpUser();
            DataModel.Contact con;
    
            string newPassword = GenerateRandomPassword();

            if (username.Contains("@"))
            {
                con = (from n in _context.Contacts
                       where n.EmailAddress == username && n.IsUpdated == true
                       select n).FirstOrDefault();
            
            }
            else
            {
                //cusomter login
                con = (from n in _context.Contacts
                       where n.UserId == username
                       select n).FirstOrDefault();

            }


            if (con != null)
            {
              
                string pwd = Utilities.CreatePasswordHash(newPassword, con.PasswordSalt);

                con.Password = pwd;
                _context.SaveChanges();

                
            }


            return newPassword;
        }


        public override bool UnlockUser(string userName)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new Exception("The method or operation is not implemented.");
        }

        public override bool ValidateUser(string username, string password)
        {
            HaccpUser user = new HaccpUser();
            DataModel.Contact con;
            if (username.Contains("'"))
            {
                return false;
            }
            else
            {
                if (username.Contains("@"))
                {
                    con = (from n in _context.Contacts
                           where n.EmailAddress == username && n.IsUpdated == true
                           select n).FirstOrDefault();
                    if (con != null)
                    {
                        string pwd = Utilities.CreatePasswordHash(password, con.PasswordSalt);
                        if (con.Password != pwd)
                            return false;
                    }
                    else
                        return false;
                }
                else
                {
                    //cusomter login
                    con = (from n in _context.Contacts
                           where n.UserId == username && n.Password == password
                           select n).FirstOrDefault();

                }
                if (con != null)
                {
                    var us = con;
                    user.ContactId = us.ContactId;
                    user.EmailAddress = us.EmailAddress;
                    user.Fax = us.Fax;
                    user.Initials = us.Initials;
                    user.Name = us.Name;
                    user.Password = us.Password;
                    user.PrimaryPhone = us.PrimaryPhone;
                    user.UserId = us.UserId;
                    user.PasswordSalt = us.PasswordSalt;
                    user.IsUpdated = us.IsUpdated != null ? (bool)us.IsUpdated : false;

                    HttpContext.Current.Session[m_UserIdSessionVariable] = us.ContactId.ToString();
                    HttpContext.Current.Session[m_UserLoginSessionVariable] = username;
                    HttpContext.Current.Session["User"] = user;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            using (DataHelper dataHelper = new DataHelper(this.m_ValidateUserStoredProcedure))
            {
                List<DataParameter> parameters = new List<DataParameter>(7);
                parameters.Add(new DataParameter("@vchTableName", this.m_TableName));
                parameters.Add(new DataParameter("@vchUserIdField", this.m_ContactIdField));
                parameters.Add(new DataParameter("@vchUserLoginField", this.m_UserLoginField));
                parameters.Add(new DataParameter("@vchUserPasswordField", this.m_UserPasswordField));
                //	parameters.Add(new DataParameter("@vchUserGroupField", this.m_UserGroupField));
                parameters.Add(new DataParameter("@vchUserLoginValue", username));
                parameters.Add(new DataParameter("@vchUserPasswordValue", password));
                using (IDataReader reader = dataHelper.ExecuteReader(parameters))
                {
                    if (reader.Read())
                    {
                        HttpContext.Current.Session[m_UserIdSessionVariable] = reader[m_ContactIdField].ToString();
                        //if (!string.IsNullOrEmpty(m_UserGroupField))
                        //{
                        //    HttpContext.Current.Session[m_UserGroupSessionVariable] = reader[m_UserGroupField].ToString();
                        //}
                        HttpContext.Current.Session[m_UserLoginSessionVariable] = username;
                        return true;
                    }
                }
                return false;
            }
        }

    }
}

