<%@ Page Language="C#" AutoEventWireup="true" Inherits="FreeTrialGlenn" Codebehind="FreeTrialGlenn.aspx.cs" %>

<%@ Register src="Controls/FreeTrialGlenn.ascx" tagname="FreeTrialGlenn" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Demonstration</title>
     <link href="App_Themes/Facility/style.css" type="text/css"  rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <center>                 
               <div style="width:600px; margin-top:20px;" class="form3">
             <div>
                <div class="left"><img src="App_Themes/Facility/Images/100_w_pixl_logo_small_03.gif" alt="" /></div>
                <div class="left"><img src="images/sqf_logo.jpg" alt="" style="margin-left:200px;"  /></div>
                <div class="right"><img src="images/Oster Logo h105.png" alt=""  />   </div>
                <div class="clear"></div>
              </div>
              <hr />               
              <h2> HACCP Builder Demonstration Sign Up </h2>
                    <uc1:FreeTrialGlenn ID="GlennFreeTrial" runat="server" />
                </div>                
        </center>
    </div>  
    </form>
</body>
</html>
