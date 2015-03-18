<%@ Page AutoEventWireup="true" Inherits="FAQ" Language="C#"
	MasterPageFile="~/Marketing.master" Title="HACCP Builder | FAQ" Codebehind="FAQ.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="uc1" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
</asp:Content>
<asp:Content ID="conSideContent" ContentPlaceHolderID="cphSideContent" runat="Server">
</asp:Content>
