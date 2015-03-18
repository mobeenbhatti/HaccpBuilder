<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" Inherits="ControlPanel_Location_MenuRecipePrint" Codebehind="MenuRecipePrint.aspx.cs" %>


<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row">
         <div class="col-lg-12">
                <h3>Menu Item Recipe</h3>
                
           	    <asp:Repeater ID="rptRecipe" runat="server" DataSourceID="sqlDSRecipe">
            	    <HeaderTemplate>
            	        <table class="table table-striped table-hover">
            	    </HeaderTemplate>
            	    <ItemTemplate> 
            	        <tr>
                        	<td >Date : </td>
                            <td>
                            <%# DataBinder.Eval(Container.DataItem, "EntryDate", "{0:d}")%></td>                              
                        </tr>
                        <tr>
                        	<td >Product/Menu Item : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Menu")%>
                            </td>
                        </tr>
                        <tr>
                        	<td >Portion Size : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "PortionSize")%> </tr>
                        <tr>
                        	<td >Yield : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Yield")%></td>
                        </tr>
                        <tr>
                        	<td >Written By : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "WrittenBy")%> </td>
                        </tr>
                        <tr>
                        	<td >Preparation : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Preparation")%> </td>
                        </tr>
            	    </ItemTemplate>
            	    <FooterTemplate>
            	         </table>
            	    </FooterTemplate>
            	    </asp:Repeater>         
       	   <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSRecipeDetails" DataKeyNames="MenuRecipeDetailID" Width="100%" SkinID="gridviewHaccpSkin">
                <Columns> 
                    <asp:BoundField HeaderText="Ingredients" DataField="Ingredient" ItemStyle-Width="80px"/>
                    <asp:BoundField HeaderText="Specifications" DataField="Specs" ItemStyle-Width="60px"/>
                    <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "EPWeight")%>&nbsp;&nbsp;&nbsp;
                            <%# DataBinder.Eval(Container.DataItem, "EPVolume")%>                            
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="EP Weight %" DataField="EPPercentage" ItemStyle-Width="50px" />
                    <asp:BoundField HeaderText="CCP/CL" DataField="CCP" ItemStyle-Width="100px"/>   
                    <asp:TemplateField ItemStyle-Width="5px"><ItemTemplate></ItemTemplate></asp:TemplateField>                 
                    <asp:BoundField HeaderText="CP" DataField="CP" ItemStyle-Width="130px" />  
                    <asp:TemplateField ItemStyle-Width="5px"><ItemTemplate></ItemTemplate></asp:TemplateField>                  
                    <asp:BoundField HeaderText="Biological Hazards" DataField="BiologicalHazard" ItemStyle-Width="160px" />
                   </Columns>
            </asp:GridView> 
               
         </div>
       <%-- <div class="grey_bg_form">          
          <asp:ImageButton ID="cmdCancel" ImageUrl="~/images/buttons/ButtonCancel.png" 
                runat="server" onclick="cmdCancel_Click" />         
        </div>  --%>       
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
