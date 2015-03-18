<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIndexPrintDetail.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.PlanIndexPrintDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="haccpInner">
         <div width="100%" >
    <asp:Repeater ID="rptKitchenPlan" runat="server" >                                                
        <ItemTemplate>
        <div id="dvKitchenPlanText" runat="server" style="padding:25px;">
        <%# Eval("PlanText") %>
        </div>                                  
        </ItemTemplate>                                                
    </asp:Repeater>       
    </div>
    </div>
    </form>
</body>
</html>
