using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
using System.Data;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class LocationLayout : System.Web.UI.MasterPage
    {
        public string currentTime = DateTime.Now.ToShortTimeString();
        protected void Page_Load(object sender, EventArgs e)
        {

            getKitchName();
            getUserName();
            

            if (TypeId == 1)
            {
                hlUserGuide.HRef = "~/StaticContent/Files/Free Trial Instruction Guide.pdf";
            }
            else
            {
                hlUserGuide.HRef = "~/StaticContent/Files/HACCP Builder Instruction Guide.pdf";
            }
            if (Context.Session != null)
            {
                //Tested and the IsNewSession is more advanced then simply checking if 
                // a cookie is present, it does take into account a session timeout, because 
                // I tested a timeout and it did show as a new session
                if (Session.IsNewSession)
                {
                    // If it says it is a new session, but an existing cookie exists, then it must 
                    // have timed out (can't use the cookie collection because even on first 
                    // request it already contains the cookie (request and response
                    // seem to share the collection)
                    string szCookieHeader = Request.Headers["Cookie"];
                    if ((null != szCookieHeader) && (szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0))
                    {
                        // Request.Headers["Cookie"] = null;
                        // Response.Redirect("~/TimeOut.aspx");
                        // FormsAuthentication.SignOut();
                        // Response.Redirect("~/Default.aspx", true);
                        Response.Redirect("~/ControlPanel/Logout.aspx");
                    }
                }
                if (Session["KitchenId"] != null)
                currentTime = Utilities.GetTimeByZone((int)Session["KitchenId"]).ToShortTimeString();
            }
        }

        private void getKitchName()
        {

            if (Session["KitchenId"] != null)
            {
                ProcessGetKitchen pgk = new ProcessGetKitchen();
                DataSet DSKitchen = pgk.GetKitchenByKitchenId(int.Parse(Session["KitchenId"].ToString()));
                if (DSKitchen.Tables.Count > 0)
                {

                    lblFacultyName.Text = DSKitchen.Tables[0].Rows[0]["KitchenName"].ToString();
                }
                else
                {
                    lblFacultyName.Text = "";
                }
            }
            else
            {

                lblFacultyName.Text = "";

            }
        }


        private void getUserName()
        {

            if (Session["Username"] != null)
            {

                using (var _context = new Entities())
                {
                    string userName = Session["Username"].ToString();
                    string password = Session["Password"].ToString();
                    var cnt = (from c in _context.Contacts
                               where c.EmailAddress == userName && c.Password == password
                               select c).FirstOrDefault();
                    if (cnt != null)
                    {
                        lblUserName.Text = cnt.Name;
                    }
                    else
                    {
                        lblUserName.Text = "";

                    }
                }

            }
            else
            {
                lblUserName.Text = "";
            }


        }

        public int TypeId
        {
            get
            {
                if (Session["TypeId"] != null)
                    return (int)Session["TypeId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
    }
}