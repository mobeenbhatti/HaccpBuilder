<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan5" Codebehind="HaccpPlan5.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="haccpInner1">
         <div style="width:100%" >
                <div class="BackGround1">Menu Item Recipe</div> 
                <asp:Repeater ID="rptMenu" runat="server" DataSourceID="sqlDSMenu" 
                    onitemdatabound="rptMenu_ItemDataBound" >
                <ItemTemplate>
                <asp:HiddenField ID="hfMenuId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "MenuItemId")%>' />
           	    <asp:Repeater ID="rptRecipe" runat="server">
            	    <HeaderTemplate>
            	        <table border="0" cellpadding="0" cellspacing="8" width="100%">
            	    </HeaderTemplate>
            	    <ItemTemplate> 
            	        <tr>
                        	<td class="text_bold" align="right">Product/Menu Item : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Menu")%>
                            </td>
                        </tr>
            	        <tr>
                        	<td class="text_bold" align="right" width="180">Date : </td>
                            <td>
                            <%# DataBinder.Eval(Container.DataItem, "EntryDate", "{0:d}")%></td>                              
                        </tr>                        
                        <tr>
                        	<td class="text_bold" align="right">Portion Size : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "PortionSize")%> </tr>
                        <tr>
                        	<td class="text_bold" align="right">Yield : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Yield")%></td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Written By : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "WrittenBy")%> </td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Preparation : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Preparation")%> </td>
                        </tr>
            	    </ItemTemplate>
            	    <FooterTemplate>
            	         </table>
            	    </FooterTemplate>
            	    </asp:Repeater>               	        	   
       	   <asp:GridView ID="grdRecipeDetails" runat="server" AutoGenerateColumns="False"  DataKeyNames="MenuRecipeDetailID" Width="100%" SkinID="gridviewHaccpSkin">
                <Columns> 
                    <asp:BoundField HeaderText="Ingredients" DataField="Ingredient" ItemStyle-Width="80px"/>
                    <asp:BoundField HeaderText="Specifications" DataField="Specs" ItemStyle-Width="60px"/>
                    <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EPWeight")%>&nbsp;&nbsp;&nbsp;
                            <%# DataBinder.Eval(Container.DataItem, "EPVolume")%>                            
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="EP Weight %" DataField="EPPercentage" ItemStyle-Width="50px"/>
                    <asp:BoundField HeaderText="CCP/CCL" DataField="CCP" ItemStyle-Width="100px" />
                     <asp:TemplateField ItemStyle-Width="5px"><ItemTemplate></ItemTemplate></asp:TemplateField>
                    <asp:BoundField HeaderText="CP" DataField="CP" ItemStyle-Width="100px" />
                    <asp:TemplateField ItemStyle-Width="5px"><ItemTemplate></ItemTemplate></asp:TemplateField>
                    <asp:BoundField HeaderText="Biological Hazards" DataField="BiologicalHazard" ItemStyle-Width="130px"/>
                   </Columns>
            </asp:GridView> 
           <div><hr /></div>           
            <div style="page-break-after:always"></div> 
              </ItemTemplate>
                </asp:Repeater>
                </div> 
       <%-- <div class="grey_bg_form">          
          <asp:ImageButton ID="cmdCancel" ImageUrl="~/images/buttons/ButtonCancel.png" 
                runat="server" onclick="cmdCancel_Click" />         
        </div>  --%>       
        </div>     
    <asp:SqlDataSource ID="sqlDSMenu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetMenuItemsNewDistinctByKitchenId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:SessionParameter DefaultValue="1" Name="KitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSRecipe" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetMenuItemRecipeByMenuId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:QueryStringParameter DefaultValue="1" Name="MenuId" 
                QueryStringField="MenuId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSRecipeDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetMenuItemRecipeDetailsByMenuId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:QueryStringParameter DefaultValue="1" Name="MenuId" 
                QueryStringField="MenuId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
