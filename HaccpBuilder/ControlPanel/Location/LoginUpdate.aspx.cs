using SchoolHaccp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
using SchoolHaccp.Operational;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class LoginUpdate : System.Web.UI.Page
    {
        private Entities _context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            string email = txtUserName.Value;
            string password = txtPassword.Value;
            string passwordSalt = Guid.NewGuid().ToString();


            if (Session["User"] != null)
            {
                HaccpUser user = (HaccpUser)Session["User"];
                if (Utilities.IsEmailExist(email, user.ContactId) != true)
                {
                    var contact = (from c in _context.Contacts
                                   where c.ContactId == user.ContactId
                                   select c).FirstOrDefault();
                    contact.EmailAddress = email;
                    contact.Password = Utilities.CreatePasswordHash(password, passwordSalt);
                    contact.UserId = email;
                    contact.IsUpdated = true;
                    contact.PasswordSalt = passwordSalt;
                    _context.SaveChanges();
                    int nUpdated = SendMessage(email, password, email);
                    if (nUpdated == 1)
                    {
                        errorMsg.InnerText = "Credentials updated Succesfully and sent at your email address. Please relogin with new credentials.";

                    }
                    else
                    {
                        errorMsg.InnerText = "Credentials Created Succesfully, but there is problem occured in email sending. Please relogin with new credentials.";

                    }

                }
                else
                {
                    errorMsg.InnerText = "Email Already exist. Please check different email ID";
                }

            }
            else
            {
                errorMsg.InnerText = "Session Expire. Please login again";
            }

        }
        private int SendMessage(string strUserName, string strPassword, string strEmail)
        {
            string strBody = "<br/> Hello,<br/> You are receiving this email from HACCP Builder because your company has set up HACCP  <br/> Builder to manage your site’s/location’s food safety program.  HACCP Builder makes it easy to <br/> build and manage your HACCP Plan plus keep your site/location in compliance with the <br/>USDA/FDA HACCP food safety regulations <br/> <br/> Please go to www.haccpbuilder.com and click on the CUSTOMER LOGIN tab on the upper right  <br/> hand of the page.  You will then land on the login page <br/><br/> Please login in with your credentials below: <br/>Your username is: " + strUserName + "<br/>Your password is: " + strPassword;
            strBody += "<br/><br/>Once you login a complete user’s guide is available by simply clicking on the <b>Users <br/>Guide/Training Manual</b> button. If you have any questions please email <br/>support@haccpbuilder.com. <br/><br/>Again, HACCP Builder is easy to understand and implement.  We look forward to serving your <br/>food safety needs<br/><br/>Respectfully,<br/><br/>The HACCP Builder Team";

            EmailContents contents = new EmailContents();
            contents.Body = strBody;
            contents.Subject = "HACCP Builder is now set-up for your location. Please use this information to sign in.";
            EmailManager emailManager = new EmailManager();
            try
            {
                emailManager.ToAddress = strEmail;
                emailManager.SendUserInfo(contents);
            }
            catch (Exception)
            {
                return 0;
            }
            if (emailManager.IsSent)
            {
                return 1;
            }
            else
            {
                return 0;
            }

        }
    }
}