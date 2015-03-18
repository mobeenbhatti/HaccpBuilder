using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Web;
using System.Collections.Generic;
using System.Diagnostics;

namespace SchoolHaccp.Operational
{
	public class EmailManager
	{
		private bool m_IsSent;

        private string m_ToAddress;
        //{
        //    get { return ConfigurationManager.AppSettings["ToAddress"]; }
        //}

		public EmailManager()
		{
		}
        public string ToAddress
        {
            get
            {
                return this.m_ToAddress;
            }
            set
            {
                this.m_ToAddress = value;
            }
        }

		public void Send(EmailContents emailcontents)
		{
            string strSMTPServer = ConfigurationManager.AppSettings["ServerUrl"];
          
            SmtpClient smtpClient = new SmtpClient("smtp2.sixrm.com");            
          
			string fromAddress = ConfigurationManager.AppSettings["FromAddress"];
			string fromName = ConfigurationManager.AppSettings["FromName"];
			string bccAddress = ConfigurationManager.AppSettings["BccAddress"];
            
            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress("support@haccpbuilder.com", "HACCP Builder Info");
            mMailMessage.To.Add("FreeTrial@haccpbuilder.com");
            
                using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/FreeTrialKitchen.htm")))
				{
					string stringBody = sr.ReadToEnd();

					string messageBody = stringBody;
					messageBody = messageBody.Replace("{KITCHENNAME}", emailcontents.ContactInfo.DistrictName);
					messageBody = messageBody.Replace("{FIRSTNAME}", emailcontents.ContactInfo.FirstName);
					messageBody = messageBody.Replace("{LASTNAME}", emailcontents.ContactInfo.LastName);
					messageBody = messageBody.Replace("{TITLE}", emailcontents.ContactInfo.Title);                   
					messageBody = messageBody.Replace("{EMAILADDRESS}", emailcontents.ContactInfo.EmailAddress);
					messageBody = messageBody.Replace("{PHONENUMBER}", emailcontents.ContactInfo.PhoneNumber);
					messageBody = messageBody.Replace("{CITY}", emailcontents.ContactInfo.City);
					messageBody = messageBody.Replace("{STATE}", emailcontents.ContactInfo.State);
					messageBody = messageBody.Replace("{ZIPCODE}", emailcontents.ContactInfo.ZipCode);
                    messageBody = messageBody.Replace("{TYPE}", emailcontents.ContactInfo.Type);
					messageBody = messageBody.Replace("{MESSAGEBODY}", emailcontents.Body);

                    mMailMessage.Subject = "Free Trial Request";
                    mMailMessage.Body = messageBody;
                    mMailMessage.IsBodyHtml = true;

					try
					{
                      
                        smtpClient.Send(mMailMessage);
						this.m_IsSent = true;
					}
					catch (Exception ex)
					{                       
                        this.m_IsSent = false;
                        FileStream fs = new FileStream(@"D:\Log.txt", FileMode.Append, FileAccess.Write);
                        StreamWriter m_streamWriter = new StreamWriter(fs);
                        m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
                        m_streamWriter.WriteLine(ex.InnerException + DateTime.Now.ToString());
                        m_streamWriter.Flush();
                        m_streamWriter.Close();
					}
				}
			//}
		}
        public void SendUserInfo(EmailContents emailcontents)
        {
            
            string strSMTPServer = ConfigurationManager.AppSettings["ServerUrl"];
            int nSMTPPort = 25;
           
           // SmtpClient smtpClient = new SmtpClient("mail.nxb.com.pk");
            //SmtpClient smtpClient = new SmtpClient("mail.haccpbuilder.net");
           // SmtpClient smtpClient = new SmtpClient("66.135.41.10");
            SmtpClient smtpClient = new SmtpClient("smtp2.sixrm.com");
           // SmtpClient smtpClient = new SmtpClient(strSMTPServer, nSMTPPort);
            //smtpClient.Credentials = new System.Net.NetworkCredential("g.quas@haccpbuilder.net", "W@zzmer");
           // smtpClient.UseDefaultCredentials = true;
            string fromAddress = ConfigurationManager.AppSettings["FromAddress"];
            string fromName = ConfigurationManager.AppSettings["FromName"];
            string bccAddress = ConfigurationManager.AppSettings["BccAddress"];

            MailAddress from = new MailAddress(fromAddress,fromName);
            MailAddress bcc = new MailAddress(bccAddress);
            MailAddress to = new MailAddress(m_ToAddress);

            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress("support@haccpbuilder.com", "HACCP Builder Info");
            mMailMessage.To.Add(new MailAddress(this.ToAddress));
            mMailMessage.CC.Add(new MailAddress("s.schany@schoolhaccp.com"));
            mMailMessage.CC.Add(new MailAddress("rehman.gull@nxb.com.pk"));
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/LoginInfo.htm")))
            {
                string stringBody = sr.ReadToEnd();
                string messageBody = stringBody;
                messageBody = messageBody.Replace("{MESSAGE}", emailcontents.Body);
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(messageBody, null, "text/html");
                //LinkedResource imagelink = new LinkedResource(HttpContext.Current.Server.MapPath(".") + @"\100_w_pixl_logo_small_03.gif", "image/png");
                LinkedResource imagelink = new LinkedResource(HttpContext.Current.Server.MapPath("~/App_Themes/Default/Images/100_w_pixl_logo_small_03.gif"), "image/gif");
                imagelink.ContentId = "imageId";
                imagelink.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;
                htmlView.LinkedResources.Add(imagelink);
                mMailMessage.AlternateViews.Add(htmlView);
                

               // string messageBody = emailcontents.Body;
                mMailMessage.Subject = emailcontents.Subject;
                //mMailMessage.Body = messageBody;
                mMailMessage.IsBodyHtml = true;
            }
                    try
                    {
                        //smtpClient.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
                        smtpClient.Send(mMailMessage);
                        
                        this.m_IsSent = true;
                    }
                    catch (Exception ex)
                    {
                        this.m_IsSent = false;
                        //StreamWriter sw = new StreamWriter("D:\\Log.txt");
                        //sw.Write(ex.Message);
                        //sw.Write("\n\r");
                        //sw.Close();
                        //this.m_IsSent = false;

                        FileStream fs = new FileStream(@"D:\Log.txt", FileMode.Append, FileAccess.Write);
                        StreamWriter m_streamWriter = new StreamWriter(fs);
                        m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
                        m_streamWriter.WriteLine(ex.InnerException + DateTime.Now.ToString());
                        m_streamWriter.Flush();
                        m_streamWriter.Close();
                    }                
            
        }
        public void SendCaterTrax(EmailContents emailcontents)
        {
            string strSMTPServer = ConfigurationManager.AppSettings["ServerUrl"];
                  
            SmtpClient smtpClient = new SmtpClient("smtp2.sixrm.com");           

            string fromAddress = ConfigurationManager.AppSettings["FromAddress"];
            string fromName = ConfigurationManager.AppSettings["FromName"];
            string bccAddress = ConfigurationManager.AppSettings["BccAddress"];

            
            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress("support@haccpbuilder.com", "HACCP Builder Info");
            mMailMessage.To.Add("FreeTrial@haccpbuilder.com");
          
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/FreeTrialCartrax.htm")))
            {
                string stringBody = sr.ReadToEnd();

                string messageBody = stringBody;
                messageBody = messageBody.Replace("{KITCHENNAME}", emailcontents.ContactInfo.DistrictName);
                messageBody = messageBody.Replace("{FIRSTNAME}", emailcontents.ContactInfo.FirstName);
                messageBody = messageBody.Replace("{LASTNAME}", emailcontents.ContactInfo.LastName);
                messageBody = messageBody.Replace("{TITLE}", emailcontents.ContactInfo.Title);              
                messageBody = messageBody.Replace("{EMAILADDRESS}", emailcontents.ContactInfo.EmailAddress);
                messageBody = messageBody.Replace("{PHONENUMBER}", emailcontents.ContactInfo.PhoneNumber);
                messageBody = messageBody.Replace("{CITY}", emailcontents.ContactInfo.City);
                messageBody = messageBody.Replace("{STATE}", emailcontents.ContactInfo.State);
                messageBody = messageBody.Replace("{ZIPCODE}", emailcontents.ContactInfo.ZipCode);
                messageBody = messageBody.Replace("{TYPE}", emailcontents.ContactInfo.Type);
                messageBody = messageBody.Replace("{MESSAGEBODY}", emailcontents.Body);

                mMailMessage.Subject = emailcontents.Subject;
                mMailMessage.Body = messageBody;
                mMailMessage.IsBodyHtml = true;

                try
                {                   
                    smtpClient.Send(mMailMessage);
                    this.m_IsSent = true;
                }
                catch (Exception ex)
                {                   
                    this.m_IsSent = false;
                    FileStream fs = new FileStream(@"D:\Log.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter m_streamWriter = new StreamWriter(fs);
                    m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
                    m_streamWriter.WriteLine(ex.InnerException + DateTime.Now.ToString());
                    m_streamWriter.Flush();
                    m_streamWriter.Close();
                }

            }
        }
        public void SendGlenn(EmailContents emailcontents)
        {
            string strSMTPServer = ConfigurationManager.AppSettings["ServerUrl"];
            //int nSMTPPort = 25;
            int nSMTPPort = 993;
            /// UPDATED ON 01-14-10            
            SmtpClient smtpClient = new SmtpClient("smtp2.sixrm.com");          

            string fromAddress = ConfigurationManager.AppSettings["FromAddress"];
            string fromName = ConfigurationManager.AppSettings["FromName"];
            string bccAddress = ConfigurationManager.AppSettings["BccAddress"];

            
            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress("support@haccpbuilder.com", "HACCP Builder Info");
            mMailMessage.To.Add("FreeTrial@haccpbuilder.com");
           
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/FreeTrialGlenn.htm")))
            {
                string stringBody = sr.ReadToEnd();

                string messageBody = stringBody;
                messageBody = messageBody.Replace("{PARTNERNAME}", emailcontents.ContactInfo.PartnerName);
                messageBody = messageBody.Replace("{KITCHENNAME}", emailcontents.ContactInfo.DistrictName);
                messageBody = messageBody.Replace("{FIRSTNAME}", emailcontents.ContactInfo.FirstName);
                messageBody = messageBody.Replace("{LASTNAME}", emailcontents.ContactInfo.LastName);
                messageBody = messageBody.Replace("{TITLE}", emailcontents.ContactInfo.Title);               
                messageBody = messageBody.Replace("{EMAILADDRESS}", emailcontents.ContactInfo.EmailAddress);
                messageBody = messageBody.Replace("{PHONENUMBER}", emailcontents.ContactInfo.PhoneNumber);
                messageBody = messageBody.Replace("{CITY}", emailcontents.ContactInfo.City);
                messageBody = messageBody.Replace("{STATE}", emailcontents.ContactInfo.State);
                messageBody = messageBody.Replace("{ZIPCODE}", emailcontents.ContactInfo.ZipCode);
                messageBody = messageBody.Replace("{TYPE}", emailcontents.ContactInfo.Type);
                messageBody = messageBody.Replace("{MESSAGEBODY}", emailcontents.Body);

                mMailMessage.Subject = emailcontents.Subject;
                mMailMessage.Body = messageBody;
                mMailMessage.IsBodyHtml = true;

                try
                {                    
                    smtpClient.Send(mMailMessage);
                    this.m_IsSent = true;
                }
                catch (Exception ex)
                {                    
                    this.m_IsSent = false;
                    FileStream fs = new FileStream(@"D:\Log.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter m_streamWriter = new StreamWriter(fs);
                    m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
                    m_streamWriter.WriteLine(ex.InnerException + DateTime.Now.ToString());
                    m_streamWriter.Flush();
                    m_streamWriter.Close();
                }

            }
        }
        public void SendAlert(AlertContents emailcontents)
        {
            string strSMTPServer = ConfigurationManager.AppSettings["ServerUrl"];
            //int nSMTPPort = 25;
            int nSMTPPort = 993;
            /// UPDATED ON 01-14-10            
            SmtpClient smtpClient = new SmtpClient("smtp2.sixrm.com");

            string fromAddress = ConfigurationManager.AppSettings["FromAddress"];
            string fromName = ConfigurationManager.AppSettings["FromName"];
            string bccAddress = ConfigurationManager.AppSettings["BccAddress"];


            System.Net.Mail.MailMessage mMailMessage = new System.Net.Mail.MailMessage();
            mMailMessage.From = new MailAddress(emailcontents.FromEmailAddress, emailcontents.FromName);
            mMailMessage.To.Add(emailcontents.To);
            if(emailcontents.Bcc != null)
            foreach(string item in emailcontents.Bcc)
            {
                mMailMessage.Bcc.Add(item);
            }
            mMailMessage.Subject = emailcontents.Subject;
            mMailMessage.Body = emailcontents.Body;
            //using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/FreeTrialGlenn.htm")))
            //{
                //string stringBody = sr.ReadToEnd();

                //string messageBody = stringBody;
                //messageBody = messageBody.Replace("{PARTNERNAME}", emailcontents.ContactInfo.PartnerName);
                //messageBody = messageBody.Replace("{KITCHENNAME}", emailcontents.ContactInfo.DistrictName);
                //messageBody = messageBody.Replace("{FIRSTNAME}", emailcontents.ContactInfo.FirstName);
                //messageBody = messageBody.Replace("{LASTNAME}", emailcontents.ContactInfo.LastName);
                //messageBody = messageBody.Replace("{TITLE}", emailcontents.ContactInfo.Title);
                //messageBody = messageBody.Replace("{EMAILADDRESS}", emailcontents.ContactInfo.EmailAddress);
                //messageBody = messageBody.Replace("{PHONENUMBER}", emailcontents.ContactInfo.PhoneNumber);
                //messageBody = messageBody.Replace("{CITY}", emailcontents.ContactInfo.City);
                //messageBody = messageBody.Replace("{STATE}", emailcontents.ContactInfo.State);
                //messageBody = messageBody.Replace("{ZIPCODE}", emailcontents.ContactInfo.ZipCode);
                //messageBody = messageBody.Replace("{TYPE}", emailcontents.ContactInfo.Type);
                //messageBody = messageBody.Replace("{MESSAGEBODY}", emailcontents.Body);

                //mMailMessage.Subject = emailcontents.Subject;
                //mMailMessage.Body = messageBody;
                //mMailMessage.IsBodyHtml = true;

                try
                {
                    smtpClient.Send(mMailMessage);
                    this.m_IsSent = true;
                }
                catch (Exception ex)
                {
                    if (System.Diagnostics.EventLog.SourceExists("AlertServiceLog"))
                    {                        
                        throw new Exception("EmailFailure" + ex.Message);
                    }
                    this.m_IsSent = false;
                    FileStream fs = new FileStream(@"D:\Log.txt", FileMode.Append, FileAccess.Write);
                    StreamWriter m_streamWriter = new StreamWriter(fs);
                    m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
                    m_streamWriter.WriteLine(ex.InnerException + DateTime.Now.ToString());
                    m_streamWriter.Flush();
                    m_streamWriter.Close();
                }

           // }
        }
		public bool IsSent
		{
			get { return m_IsSent; }
			set { m_IsSent = value; }
		}

		public static string GetSubject(string p)
		{
			string result = "";
			switch (p)
			{
				case "Contact.aspx":
					result = "Contact Request";
					break;
				case "FreeTrial.aspx":
					result = "Free Trial Request";
					break;
                case "FreeTrialKitchen.aspx":
                    result = "Free Trial Request";
                    break;
                case "FreeTrialGlenn.aspx":
                    result = "Free Trial Request from Glenn";
                    break;
                case "FreeTrialAceFood.aspx":
                    result = "Free Trial Request from Ace Food Safety";
                    break;
                case "FreeTrialTomFood.aspx":
                    result = "Free Trial Request from Tom Food Safe";
                    break;
				case "InformationRequest.aspx":
					result = "Information Request";
					break;
                default:
                    result = "Free Trial Request";
                    break;
			}
			return result;
		}
	}

	public struct EmailContents
	{
		public string To;
		public string FromName;
		public string FromEmailAddress;
		public string Subject;
		public string Body;
		public ContactInformation ContactInfo;
        
	}
    public class AlertContents
    {
        public string To{get;set;}

        public string FromName { get; set; }
        public string FromEmailAddress { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public List<string> Bcc { get; set; }

    }

	public struct ContactInformation
	{
		public string DistrictName;
		public string FirstName;
		public string LastName;
		public string Title;
		public int NumberOfKitchens;
		public string EmailAddress;
		public string PhoneNumber;
		public string City;
		public string State;
		public string ZipCode;
        public string PartnerName;
        public string Type;
	}

	public class NewsletterManager
	{
		private DataSet m_UserData;
		private string m_MessageBody;

		public NewsletterManager()
		{
		}

		public void SendNewsletter()
		{
			string serverUrl = ConfigurationManager.AppSettings["ServerUrl"];
			string unsubscribe = string.Empty;
			string messageBody = string.Empty;
			EmailManager mailManager = new EmailManager();
			EmailContents mailContents = new EmailContents();

			using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("/StaticContent/MailerTemplates/CustomerNewsletter.htm")))
			{
				string stringBody = sr.ReadToEnd();

				foreach (DataRow dr in UserData.Tables[0].Rows)
				{
					messageBody = stringBody;

					unsubscribe = "<a href=\"" + serverUrl + "/Unsubscribe.aspx?EndUserID=" +
						dr["EndUserID"].ToString() + "?FullName=" + dr["FirstName"].ToString() + " " + dr["LastName"].ToString() +
						"\"Target=\"_blank\"\">Click here</a>";

					messageBody = messageBody.Replace("{Name}", dr["FirstName"].ToString() + " " + dr["LastName"].ToString());
					messageBody = messageBody.Replace("{MessageBody}", this.MessageBody);
					messageBody = messageBody.Replace("{ClickHere}", unsubscribe);

					mailContents.To = "steven@primecipher.com"; // dr["Email"].ToString();
					mailContents.FromName = "HACCP Builder, Inc.";
					mailContents.FromEmailAddress = "steve@thomsonsolutions.com";
					mailContents.Subject = "Newsletter";
					mailContents.Body = messageBody;

					mailManager.Send(mailContents);
				}
			}
		}

		public string MessageBody
		{
			get { return m_MessageBody; }
			set { m_MessageBody = value; }
		}

		public DataSet UserData
		{
			get { return m_UserData; }
			set { m_UserData = value; }
		}
	}
}
