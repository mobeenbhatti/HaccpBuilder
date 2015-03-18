<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_CustomMenuRecipe" Title="HACCP Builder | Custom Menu Item Recipe" Codebehind="CustomMenuRecipe.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
         <div class="MainHeading">
               CUSTOM MENU ITEM RECIPE
               <span style="font-size:10px; margin-left:210px;">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
              </span>
            </div>            
      </div>        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div>       
       <div class="Clearer"></div>
       <div class="GirdDiv">
       <asp:DetailsView ID="dtvRecipe" runat="server" AutoGenerateRows="False" 
                    DataSourceID="sqlDSCustomRecipe" Height="50px" Width="125px">    
                    <Fields>
                         <asp:TemplateField >
                                <ItemTemplate>
                                    <table >                                    
                                        <tr>                                               
                                            <td class="MainHeading" width="80%">
                                                <asp:Label ID="lblItem" Text='<%# DataBinder.Eval(Container.DataItem,"Name")  %>' runat="server"></asp:Label>                
                                            </td>
                                        </tr>
                                        <tr>                       
                                            <%--<td >
                                                <asp:Label ID="lblFoodGroup" Text='<%# DataBinder.Eval(Container.DataItem,"FoodGRoup") %>' runat="server"></asp:Label>
                                            </td> --%> 
                                        </tr>                                        
                                        <tr>                    
                                             <td class="LogHeading">
                                                 <asp:Label ID="lblRecipe" Text='<%#"Recipe: " + DataBinder.Eval(Container.DataItem,"Instructions") %>' runat="server"></asp:Label>
                                             </td> 
                                        </tr>
                                    </table>
                               </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="sqlDSCustomRecipe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetKitchenMenuCustomItem" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="nKitchenMenuCustomId" QueryStringField="Id" 
                            Type="Int32" />
    </SelectParameters>
                </asp:SqlDataSource>
       </div>
</asp:Content>

