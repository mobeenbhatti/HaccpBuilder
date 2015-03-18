<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_InventoryItems" Codebehind="InventoryItems.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div id="container">
    <div style="overflow:visible; height:50%;">
    	<table>
		
		
        <%-- Inventory Items Repeater --%>
        <tr>
			<td>
			    					
				<h2 style="color: #000; background-color:#99ccff">Inventory Items Review</h2>
				<asp:Repeater ID="rptInventory" runat="server" DataSourceID="ObjectDataSource2">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
        <td ><%#Eval("Quantity")%></td>
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>					
			</td>
		</tr>	
		</table>
    </div>
    </div>
    </form>
</body>
</html>
