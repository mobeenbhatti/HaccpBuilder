<%@ Page AutoEventWireup="true" Inherits="Partners" Language="C#"
	MasterPageFile="~/Marketing.master" Title="HACCP Builder | Partners" Codebehind="Partners.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="uc1" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
</asp:Content>
<asp:Content ID="conSideContent" runat="Server" ContentPlaceHolderID="cphSideContent">
</asp:Content>
