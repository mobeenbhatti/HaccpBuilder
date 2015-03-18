<%@ Page AutoEventWireup="true" Inherits="RequestInformation"
	Language="C#" MasterPageFile="~/Marketing.master" Title="HACCP Builder | Request Information" Codebehind="RequestInformation.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="ucContent" %>
<%@ Register Src="Controls/Contact.ascx" TagName="Contact" TagPrefix="ucContact" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<ucContent:ContentWithTitle ID="ContentWithTitle1" runat="server" />
	<ucContact:Contact ID="Contact1" runat="server" />
</asp:Content>
<asp:Content ID="conSideContent" runat="Server" ContentPlaceHolderID="cphSideContent">
</asp:Content>
