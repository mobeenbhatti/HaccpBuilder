<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" CodeBehind="VAlidationCheck.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.VAlidationCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
 
   <h3>&nbsp;</h3> Observer: <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Error Testing" 
    CssClass="alert alert-danger" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
     <asp:Button ID="btnContinue" runat="server" OnClick="Button1_Click" Text="Continue" CssClass="btn btn-primary" />
</asp:Content>
