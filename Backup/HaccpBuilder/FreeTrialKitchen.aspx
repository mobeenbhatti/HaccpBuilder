<%@ Page Language="C#" AutoEventWireup="true"  Inherits="FreeTrialKitchen" Title="HACCP Builder | Demonstration Signup" Codebehind="FreeTrialKitchen.aspx.cs" %>

<%@ Register src="Controls/FreeTrialKitchen.ascx" tagname="FreeTrialKitchen" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Demonstration</title>
    <link href="App_Themes/Facility/style.css" type="text/css"  rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
    <div>
         <center>                 
               <div style="width:600px; margin-top:20px;" class="form3">
                 <img src="App_Themes/Facility/Images/100_w_pixl_logo_small_03.gif" alt=""  /><hr />
                 <h2> HACCP Builder Demonstration Sign Up </h2> 
                    <uc1:FreeTrialKitchen ID="FreeTrialContact" runat="server" />
              </div>
             <div class="ViewPlanClearer"></div>
        </center>
    </div>
    </div>
    </form>
</body>
</html>
