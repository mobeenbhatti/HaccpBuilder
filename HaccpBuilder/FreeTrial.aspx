<%@ Page AutoEventWireup="true" Inherits="FreeTrial"
	Language="C#" MasterPageFile="~/Marketing.master" Title="HACCP Builder | Free Trial Signup" Codebehind="FreeTrial.aspx.cs" %>

<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="ucContent" %>
<%@ Register Src="Controls/Contact.ascx" TagName="Contact" TagPrefix="ucContact" %>
<%@ Register src="Controls/FreeTrial.ascx" tagname="FreeTrial" tagprefix="uc1" %>
<%@ Register src="Controls/FreeTrialKitchen.ascx" tagname="FreeTrialKitchen" tagprefix="uc2" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<ucContent:ContentWithTitle ID="ContentWithTitle1" runat="server" />
	<uc2:FreeTrialKitchen ID="FreeTrialContact" runat="server" />
	<%--<uc1:FreeTrial ID="FreeTrial1" runat="server" />--%>
	<%--<ucContact:Contact ID="FreeTrialContact" runat="server" />--%>
    
</asp:Content>
<asp:Content ID="conSideContent" runat="Server" ContentPlaceHolderID="cphSideContent">

</asp:Content>
