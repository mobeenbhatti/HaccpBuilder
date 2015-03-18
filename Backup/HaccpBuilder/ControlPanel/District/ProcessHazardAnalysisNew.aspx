<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master" AutoEventWireup="true" CodeBehind="ProcessHazardAnalysisNew.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.ProcessHazardAnalysisNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
    <asp:DataList ID="dtProcessHeader" runat="server" RepeatDirection="Horizontal" >
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
        <%# Eval("ColValue") %>
    </ItemTemplate>
    </asp:DataList>

</asp:Content>
