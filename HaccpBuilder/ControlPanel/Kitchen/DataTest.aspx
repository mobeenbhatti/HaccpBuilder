<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_DataTest" Title="Untitled Page" Codebehind="DataTest.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="MenuItems" style="width:400px; margin-top:30px;" >
            <table>
                <tr>
                    <td>       
                        <asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1">
                     <HeaderTemplate>
                        <table> 
                            <tr style="background-color:Silver;">             
                                <td width="100px" align="center" ><b>Menu Items</b></td>
                                <td width = "150px" align="center" ></td>                                
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >                            
                            <td ><%#Eval("ItemId")%></td>
                            <td ><%#Eval("MenuItem")%></td>                            
                        </tr> 
                        <tr>
                        <td colspan="4"><hr /></td>
                        </tr>
                     </ItemTemplate>
                     <FooterTemplate>
                     </table>
                     </FooterTemplate>
                </asp:Repeater>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        </div>
</asp:Content>

