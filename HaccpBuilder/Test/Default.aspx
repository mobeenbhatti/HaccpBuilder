﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Test_Default" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>   
    <form id="form1" runat="server">
    <div>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
             Font-Size="8pt" Height="800px" InteractiveDeviceInfos="(Collection)" 
             WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1100px">
            <LocalReport ReportPath="Test\FreeTrialData.rdlc">
               
            </LocalReport>
        </rsweb:ReportViewer>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
             SelectCommand="uspAdm_GetFreeTrialRequestDetail" 
             SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
