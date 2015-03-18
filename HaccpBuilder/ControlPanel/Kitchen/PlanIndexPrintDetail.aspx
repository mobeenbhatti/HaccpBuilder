<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIndexPrintDetail.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexPrintDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="container">
     <div class="ph-top"></div>   
    <asp:Repeater ID="rptKitchenPlan" runat="server" >                                                
        <ItemTemplate>
        <h2>
            <%# Eval("Category") %>
        </h2>

        <h3><%# Eval("PlanTitle")%></h3>
        <div id="dvKitchenPlanText" runat="server" style="padding:25px;">
        <%# Eval("PlanText") %>
        </div>                                  
        </ItemTemplate>                                                
    </asp:Repeater>       
    
    </div>
    </form>
</body>
</html>
