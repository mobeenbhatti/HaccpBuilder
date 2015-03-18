<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_District_Kitchens" Codebehind="Kitchens.aspx.cs" %>

<%@ Register src="../../Controls/ContentWithTitle.ascx" tagname="ContentWithTitle" tagprefix="uc1" %>
<%@ Register src="../../Controls/Contact.ascx" tagname="Contact" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMainContent" runat="Server">
    <uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
    <uc2:Contact ID="Contact1" runat="server" />
   
</asp:Content>
