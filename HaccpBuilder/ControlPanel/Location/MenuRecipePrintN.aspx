<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="MenuRecipePrintN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.MenuRecipePrintN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Menu Item Recipe</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">

    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Menu Items
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptRecipe" runat="server" DataSourceID="sqlDSRecipe">
                    <HeaderTemplate>
                        <table class="table table-striped table-hover">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>Date : </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "EntryDate", "{0:d}")%></td>
                        </tr>
                        <tr>
                            <td>Product/Menu Item : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Menu")%>
                            </td>
                        </tr>
                        <tr>
                            <td>Portion Size : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "PortionSize")%>
                        </tr>
                        <tr>
                            <td>Yield : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Yield")%></td>
                        </tr>
                        <tr>
                            <td>Written By : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "WrittenBy")%> </td>
                        </tr>
                        <tr>
                            <td>Preparation : </td>
                            <td><%# DataBinder.Eval(Container.DataItem, "Preparation")%> </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

                <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSRecipeDetails" DataKeyNames="MenuRecipeDetailID" Width="100%" CssClass="table table-striped table-hover table-responsive table-bordered">
                    <Columns>
                        <asp:BoundField HeaderText="Ingredients" DataField="Ingredient" />
                        <asp:BoundField HeaderText="Specifications" DataField="Specs" />
                        <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "EPWeight")%>&nbsp;&nbsp;&nbsp;
                            <%# DataBinder.Eval(Container.DataItem, "EPVolume")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="EP Weight %" DataField="EPPercentage" />
                        <asp:BoundField HeaderText="CCP/CL" DataField="CCP" />
                        <asp:TemplateField ItemStyle-Width="5px">
                            <ItemTemplate></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="CP" DataField="CP" />
                        <asp:TemplateField>
                            <ItemTemplate></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Biological Hazards" DataField="BiologicalHazard" />
                    </Columns>
                </asp:GridView>
            </div>
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
