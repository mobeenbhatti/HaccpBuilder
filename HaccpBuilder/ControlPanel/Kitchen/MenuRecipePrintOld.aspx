<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuRecipePrint" Codebehind="MenuRecipePrintOld.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="bdy_contents">
        <div class="grey_bg_dis">        
        <table width="957" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF"
        style="border:1px solid #e0e0e0;">
        	<tr>
            	<td width="750">
            	    <asp:Repeater ID="rptRecipe" runat="server" DataSourceID="sqlDSRecipe">
            	    <HeaderTemplate>
            	        <table border="0" cellpadding="0" cellspacing="8">
            	    </HeaderTemplate>
            	    <ItemTemplate>
            	        <tr>
                        	<td class="text_bold" align="right" width="180">Date : </td>
                            <td>
                            <%# DataBinder.Eval(Container.DataItem, "EntryDate")%></td>                              
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Product/Menu Item : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Menu")%>
                            </td>
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
            	</td>               	
			</tr>
		</table>
        </div> 
        <div class="GirdDiv">        	
            <div class="lt">          
       	   <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSRecipeDetails" DataKeyNames="MenuRecipeDetailID" SkinID="gridviewSkin">
                <Columns> 
                    <asp:BoundField HeaderText="Ingredients" DataField="Ingredient" />
                    <asp:BoundField HeaderText="Specifications" DataField="Specs" />
                    <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EPWeight")%>
                            <%# DataBinder.Eval(Container.DataItem, "EPVolume")%>                            
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="EP Weight %" DataField="EPPercentage" />
                    <asp:BoundField HeaderText="CCP/CCL" DataField="CCP" />
                    <asp:BoundField HeaderText="CCP/CCL" DataField="CCP" />
                   </Columns>
            </asp:GridView>                     
            </div> 
        </div>
        <div class="grey_bg_form">          
          <asp:ImageButton ID="cmdCancel" ImageUrl="~/images/buttons/ButtonCancel.png" 
                runat="server" onclick="cmdCancel_Click" />         
        </div>         
    </div>
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
</asp:Content>
