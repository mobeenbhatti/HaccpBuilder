<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" Theme="Default" AutoEventWireup="true" Inherits="ControlPanel_District_ViewCCP" Title="Untitled Page" Codebehind="ViewCCP1.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="MainHeading"></div>
<asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" 
 DataSourceID="ObjectDataSource1" Height="50px" Width="100%">
<Fields>
<asp:TemplateField>
<ItemTemplate>
<div class="LogHeading">CCP</div>
<div class="FloatLeft">
<%# DataBinder.Eval(Container.DataItem, "CCP")%>
</div>
<div class="Clearer"></div>
<div class="LogHeading">CCP Requirement</div>
<div class="FloatLeft">
<%# DataBinder.Eval(Container.DataItem, "Requirement")%>
</div>
</ItemTemplate>
</asp:TemplateField>
</Fields>
</asp:DetailsView>


<asp:ObjectDataSource ID="ObjectDataSource1"  runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPByID" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP">
            <SelectParameters>
                <asp:QueryStringParameter Name="nCCPId" QueryStringField="CCPId" Type="Int32" />               
            </SelectParameters></asp:ObjectDataSource>
</asp:Content>

