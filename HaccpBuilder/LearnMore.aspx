<%@ Page AutoEventWireup="true" Inherits="LearnMore"
	Language="C#" MasterPageFile="~/Marketing.master" Title="HACCP Builder | Learn More" Codebehind="LearnMore.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="uc1" %>

<asp:Content ID="conMainContent" ContentPlaceHolderID="cphMainContent" runat="Server">
	<uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
</asp:Content>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="cphSideContent">
</asp:Content>
