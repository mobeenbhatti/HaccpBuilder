using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class CustomErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session != null)
            {
                if (Session["error"] != null)
                    this.lblError.Text = "Technical Information: " + Session["error"].ToString();
            }
            if (Request.QueryString["error"] != null)
            {
                this.lblError.Text = "Technical Information: " + Request.QueryString["error"];
            }
            Server.ClearError();
            //string errMessage = "";
        }
     //Exception appException = Server.GetLastError();
     //if (appException != null)
     //{
     //    errMessage += "The following error occurred<BR>" + appException.ToString();
     //}
     //if (((appException) is HttpException)) {
     //    HttpException checkException = (HttpException)appException;
     //    errMessage += "The following error occurred<BR>" + appException.ToString();
     //    //switch (checkException.GetHttpCode) {
     //    //    case 400:
     //    //        errMessage += "Bad request. The file size is too large.";
     //    //        break;
     //    //    case 401:
     //    //        errMessage += "You are not authorized to view this page.";
     //    //       break;
     //    //    case 403:
     //    //        errMessage += "You are not allowed to view that page.";
     //    //        break;
     //    //    case 404:
     //    //        errMessage += "The page you have requested can't be found.";
     //    //        break;
     //    //    case 408:
     //    //        errMessage += "The request has timed out.";
     //    //        break;
     //    //    case 500:
     //    //        errMessage += "The server can't fulfill your request.";
     //    //        break;
     //    //    default:
     //    //        errMessage += "The server has experienced an error.";
     //    //        break;
     //    //}
     //}
     //else {
         
     //}
     //lblError.Text = errMessage + "<BR>We're sorry for the inconvenience.";
     //Server.ClearError();
     //  }

    }
}
