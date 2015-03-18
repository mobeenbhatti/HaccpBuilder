<%@ Page Language="C#" AutoEventWireup="true"
	Inherits="_PasswordRecovery" MasterPageFile="~/ControlPanel/MasterPage.master"
	Title="Password Recovery" Codebehind="PasswordRecovery.aspx.cs" %>

<asp:Content runat="server" ContentPlaceHolderID="cphTopLeft">
	<p>
		The PasswordRecovery control allows you to recover your password based on the security
		question and answer you provided when you signed up.
	</p>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="cphMainContent">
	<div>
		<asp:PasswordRecovery runat="server" ID="PasswordRecovery1" UserNameTitleText="Step 1"
			QuestionTitleText="Step 2" />
	</div>
</asp:Content>
