<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_Membership_Loginfailure" Title="Login Failure" Codebehind="Loginfailure.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body id="container" >
    <form id="form1" runat="server">
    <div class="MainHeading">   
    <asp:Label ID="lblMessage" Text="" runat="server"></asp:Label>
</div>
<div class="Clearer"></div>
<div style="margin-left:10px;">
    <asp:HyperLink ID="hlBack" Text="Back to Login Page" runat="server" NavigateUrl="~/ControlPanel/Logout.aspx"></asp:HyperLink>    
 </div>
    </form>
</body>
</html>
