<%@ Application Language="C#" %>
<%@ Import Namespace="SchoolHaccp.Operational" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net.Mail" %>
<script runat="server">
   
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        /////////////////////////////////
        // TESTING CODE FROM OTHER SITE
        ////////////////////////////////
    //    Exception objErr = Server.GetLastError().GetBaseException();
    //string err =	"Error Caught in Application_Error event\n" +
    //        "Error in: " + Request.Url.ToString() +
    //        "\nError Message:" + objErr.Message.ToString()+ 
    //        "\nStack Trace:" + objErr.StackTrace.ToString();
    //    EventLog.WriteEntry("Sample_WebApp",err,EventLogEntryType.Error);
    //Server.ClearError();
    //////////////////////////////////////////
        
        // Code that runs when an unhandled error occurs
        Exception ex = Server.GetLastError();
        string strErrorMessage = "";
        strErrorMessage = ex.Message;
        string user, url, strFrom, strTo, strCC, strMessageBody, strSubject, messageBody;
         //Do something with the exception like logging etc.
        //if (ex.InnerException != null)
        //{
        //    if (ex.InnerException.GetType().Name == "TargetInvocationException")
        //    {
        //        strErrorMessage = ex.InnerException.GetType().Name + " System cannot connect to database correctly.";
        //    }
        //    else

        //        if (ex.InnerException.GetType().Name == "ArgumentException")
        //        {
        //            strErrorMessage = ex.InnerException.GetType().Name + " Please allow page to download completely, then perform any action. Thanks.";
        //        }
        //        else
        //        {
        //            strErrorMessage = ex.Message;
        //        }
        //}
        //else
        //{
            //strErrorMessage = ex.Message;
        //}
        // ////////////////////////////////////////////////////
        // // EMAIL SENDING
        // ////////////////////////////////////////////////////
        // //Exception ex = Server.GetLastError().GetBaseException();

        //user = HttpContext.Current.User.Identity.Name;

        //url = HttpContext.Current.Request.Url.ToString();



        ////Emails the exception to me  

        //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
        //strFrom = "info@haccpbuilder.com";
        //// strTo = "greg@sixrm.com";
        //strTo = "rehman.gull@nxvt.com";
        //strSubject = "HACCP Builder ERROR ALERT";

        ////strMessageBody = string.Format("For User: {0}\nAt: {1}\n{2}", user, url, ex.StackTrace);
        //using (System.IO.StreamReader sr = new System.IO.StreamReader(HttpContext.Current.Server.MapPath("~/StaticContent/MailerTemplates/ErrorReport.htm")))
        //{
        //    string stringBody = sr.ReadToEnd();

        //    messageBody = stringBody;
        //    messageBody = messageBody.Replace("{USER}", user);
        //    messageBody = messageBody.Replace("{URL}", url);
        //    messageBody = messageBody.Replace("{ERROR}", ex.StackTrace);
        //}

        //System.Net.Mail.MailAddress From = new System.Net.Mail.MailAddress(strFrom);
        //mail.To.Add(strTo);
        //mail.From = From;
        ////mail.CC.Add(strCC);
        //mail.Body = messageBody;
        //mail.Subject = strSubject;
        //mail.IsBodyHtml = true;
        //SmtpClient smtpClient = new SmtpClient("mail.nxb.com.pk");

        ////System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient("mail.nxb.com.pk");
        //smtpClient.Credentials = new System.Net.NetworkCredential("rehman.gull@nxb.com.pk", "basith");
        ////client.UseDefaultCredentials = true;
        //smtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.PickupDirectoryFromIis;
        //smtpClient.Send(mail);
        //Server.ClearError();
        //EventLog.WriteEntry("HaccpBuilder_Error", ex.Message, EventLogEntryType.Error);
        //Server.Transfer("~/CustomErrorPage.aspx?error=" + strErrorMessage);
        //Server.ClearError();
        //Response.Redirect("~/CustomErrorPage.aspx?error=" + strErrorMessage);
        //Response.Redirect("~/CustomErrorPage.aspx");
        //this.ErrorPage = "/ErrorHandling/ErrorPages/BaseError.html";
        //Server.Transfer("~/Errors.aspx");

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started  

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
