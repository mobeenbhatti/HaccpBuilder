<%@ Page AutoEventWireup="true" Inherits="ErrorPage"
	Language="C#" MasterPageFile="~/Marketing.master" Title="HACCP Builder | Application Error" Codebehind="ErrorPage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="Server">
	<span style="color: Red; padding-bottom: 10px;">Sorry, but there was an error.  Please go back and try again.</span>
	<br />
	<asp:Label ID="lblError" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSideContent" runat="Server">
    
</asp:Content>
