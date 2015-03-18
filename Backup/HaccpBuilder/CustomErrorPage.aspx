<%@ Page Language="C#" AutoEventWireup="true" Inherits="CustomErrorPage" Title="HACCP Builder | Application Error" Codebehind="CustomErrorPage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link id="Link1" runat="server" rel="Shortcut Icon" href="~/App_Themes/Grid/favicon.ico" type="image/x-icon" />
        <link id="Link2" runat="server" rel="icon" href="~/App_Themes/Grid/favicon.ico" type="image/ico" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
               <div style="margin-top:150px; border:solid 1px black; width:300px; ">
                    <img src="App_Themes/Grid/Images/100_w_pixl_logo_small_03.gif" />
                   
              </div>            
               <div style="border:solid 1px black; width:300px; background-color:#dcdcdc; text-align:left;" >
                     <span style="color:Red">ERROR:<br /> We apologize for the inconvenience, we are currently updating the system and we will be back online shortly.
                       If you need assistance please call 866 577 4030 ext. 1 or email support@haccpbuilder.com.<br /><br />
                     <asp:Label ID="lblError" runat="server" /><br />
                     </span>
                     To Log Back Into The System <a href ="ControlPanel/Membership/LoginPage.aspx">  Click Here</a>
                    
              </div>
        </center>
    </div>
    </form>
</body>
</html>
