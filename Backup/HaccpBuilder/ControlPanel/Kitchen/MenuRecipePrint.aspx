<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuRecipePrint" Codebehind="MenuRecipePrint.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Item Recipe</title>
        <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
     <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />    
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">   
    <div class="ph-top"></div>     
      <h2>Menu Item Recipe</h2> 
      <div class="form3">
           <asp:Repeater ID="rptRecipe" runat="server" DataSourceID="sqlDSRecipe">
            	    <HeaderTemplate>
            	        <table border="0" cellpadding="0" cellspacing="8" width="100%">
            	    </HeaderTemplate>
            	    <ItemTemplate> 
            	        <tr>
                        	<td class="text_bold" align="right" width="180">Date : </td>
                            <td>
                            <%# DataBinder.Eval(Container.DataItem, "EntryDate", "{0:d}")%></td>                              
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
       </div>
           <div class="table">
           <div class="box-header"></div>
       	    <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSRecipeDetails" DataKeyNames="MenuRecipeDetailID" CssClass="zebra">
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
            <div class="box-bottom"> </div>
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
    </form>
</body>
</html>
