<%@ Page Language="C#" AutoEventWireup="true" Inherits="_LoginStatus"
	MasterPageFile="~/ControlPanel/MasterPage.master" Title="Login Status" Codebehind="LoginStatus.aspx.cs" %>

<asp:Content runat="server" ContentPlaceHolderID="cphTopLeft">
	<p>
		Welcome to HACCP Builder.
	</p>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="cphMainContent">
	<div id="SampleLoginStatus">
		<asp:LoginStatus ID="loginstatus1" runat="server" LoginText="login" LogoutText="logout"
			LogoutAction="RedirectToLoginPage" ToolTip="Click to login/logout." />
	</div>
</asp:Content>
