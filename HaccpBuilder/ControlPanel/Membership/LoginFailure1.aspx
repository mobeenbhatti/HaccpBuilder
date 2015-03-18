<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Membership_LoginFailure" Title="Login Failure" Codebehind="LoginFailure1.aspx.cs" %>


<div class="MainHeading">   
    <asp:Label ID="lblMessage" Text="We are sorry, you can't logged into the site, as District is Inactive    " runat="server"></asp:Label>
</div>
<div class="Clearer"></div>
<div style="margin-left:10px;">
    <asp:HyperLink ID="hlBack" Text="Back to Login Page" runat="server" NavigateUrl="~/ControlPanel/Logout.aspx"></asp:HyperLink>    
 </div>


