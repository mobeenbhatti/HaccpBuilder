<%@ Page AutoEventWireup="true" Inherits="USDA" Language="C#"
	MasterPageFile="~/Marketing.master" Title="HACCP Builder | USDA" Codebehind="USDA.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="uc1" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="cphSideContent">
</asp:Content>
