﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class ControlPanel_MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.Session != null)
        {
            //Tested and the IsNewSession is more advanced then simply checking if 
            // a cookie is present, it does take into account a session timeout, because 
            // I tested a timeout and it did show as a new session
            if (Session.IsNewSession || Session["TypeId"] == null || Session["KitchenId"] == null)
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
            else
            {
                if ((int)Session["TypeId"] == 7)
                    pnlPlanIndex.Visible = false;
            }
        }
        //if (!IsPostBack)
        //{
           // Page.ClientScript.RegisterStartupScript(this.GetType(), "onLoad", "DisplayExtendSessionLifeBox();", true);
        //}
    }
    public void ShowError(string message)
    {
        pnlMessage.Visible = true;
        pnlMessage.CssClass = "messageBox messageBoxError";
        lMessage.Text = message;
        
    }
}
