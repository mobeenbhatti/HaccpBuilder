<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_District_ErrorPage" Title="HACCP Builder | Error" Codebehind="ErrorPage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="container">
    <form id="form1" runat="server">
    <center>
       <div class="container" style="margin-top:150px;">
        <div class="form3 ph-top">   
        <h2><asp:Label ID="lblMessage" Text="This service is not available for your Location's service level" runat="server" CssClass="msg-error"></asp:Label></h2>
              
          <asp:HyperLink ID="hlGotoMain" runat="server" Text="Go To Main Control Panel"  NavigateUrl="~/ControlPanel/District/LayoutTest.aspx" CssClass="button blue"></asp:HyperLink>
         </div> 
        </div>
       </center>
    </form>
  
</body>
</html>
