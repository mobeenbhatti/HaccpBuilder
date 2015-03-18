<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_District_ViewCCP" Title="HACCP Builder | View CCP" Codebehind="ViewCCP.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MainHeading"></div>
    <div class="ContentLeft">
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
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1"  runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPById" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP">
            <SelectParameters>
                <asp:QueryStringParameter Name="nCCPId" QueryStringField="CCPId" Type="Int32" />               
            </SelectParameters></asp:ObjectDataSource>
    </form>
</body>
</html>
