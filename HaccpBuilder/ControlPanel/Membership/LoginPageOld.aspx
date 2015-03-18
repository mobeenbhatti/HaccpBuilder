<%--<%@ Page AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="ControlPanel_LoginPage"
	Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" %>
--%>

<%@ Page AutoEventWireup="true"  Inherits="ControlPanel_LoginPage"
	Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" Codebehind="LoginPageOld.aspx.cs" %>
<%--<asp:Content ID="conMainContent" ContentPlaceHolderID="cphMainContent" runat="Server">--%>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">	
    <div style="margin-left:350px; margin-top:150px;">
	<asp:Login ID="Login1" runat="server" 
	PasswordRecoveryText="Forgot Password?" 
	PasswordRecoveryUrl="PasswordRecovery.aspx"  
        onloggedin="Login1_LoggedIn1" >
	</asp:Login>
	</div>	
</asp:Content>
