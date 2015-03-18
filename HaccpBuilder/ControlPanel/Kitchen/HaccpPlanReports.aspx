<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HaccpPlanReports.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.HaccpPlanReports" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
     <rsweb:ReportViewer ID="rptHazard" runat="server"  Width="90%" Height="900" PageCountMode="Actual">
     </rsweb:ReportViewer> 
      <rsweb:ReportViewer ID="rptHaccp" runat="server"  Width="90%" Height="900" PageCountMode="Actual">
     </rsweb:ReportViewer>    
    </div>
    </form>
</body>
</html>
