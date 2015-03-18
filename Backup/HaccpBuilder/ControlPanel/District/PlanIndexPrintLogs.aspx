<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIndexPrintLogs.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.PlanIndexPrintLogs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=pgTitle%></title>
    <link type="text/css" rel="Stylesheet" href="../../App_Themes/Default/Default3.css" />
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    <div class="haccpInner">    
    
        <div class="log_form_left">
        <h2 id="lblLog" runat="server"></h2>
        <asp:Repeater ID="rptCorrectiveAction" runat="server">
        <HeaderTemplate><div style="margin:2px 0px 0px 10px; padding:2px 0px 0px 10px;"><ul></HeaderTemplate>
        <ItemTemplate><li><%# Eval("Name") %></li></ItemTemplate>
        <FooterTemplate></ul></div></FooterTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="12" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource> 
        </div>
        <div class="content_right">        
        <asp:Image ImageUrl="" runat="server" ID="imgLog" />
        
        </div>
      
    </div>
    </form>
</body>
</html>
