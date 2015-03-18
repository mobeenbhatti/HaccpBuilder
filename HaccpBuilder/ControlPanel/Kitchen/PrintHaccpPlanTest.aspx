<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_PrintHaccpPlanTest" Title="Untitled Page" Codebehind="PrintHaccpPlanTest.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="MainHeading"></div>
 <asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="rptMealCalendar_OnItemCommand">
 <HeaderTemplate>
    <table border="1" style="border-collapse:collapse;"> 
        <tr>             
            <td><b>Date</b></td> 
            <td><b>BreakFast</b></td>
            <td><b>Select</b></td>
            <td><b>Lunch</b></td>
            <td><b>Select</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr>
        <td><asp:Label ID="lblDate" Text='<%# Eval("MealDate") %>' runat="server"></asp:Label></td>
        <td><asp:CheckBox ID="chkBreakFast" runat="server" Checked='<%# Eval("BreakFast").ToString() == "1"? true:false %>' /></td>
        <td><asp:LinkButton ID="LinkButton1" runat="server" Text="Show" CommandName="ShowHide" /></td>
        <td>
            <asp:DataGrid runat="server" ID="DataGrid1" DataSourceID="ObjectDataSource2" Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
            <asp:TemplateColumn>
            <ItemTemplate> 
            <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("MenuItem") %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateColumn>
            <%--<asp:BoundColumn DataField="ShipName" HeaderText="Ship Name" /> 
            <asp:TemplateColumn>
            <ItemTemplate>
            <asp:TextBox ID="txtRequiredDate" runat="server" Text='<%# Eval("RequiredDate") %>'></asp:TextBox> 
            </ItemTemplate> 
            </asp:TemplateColumn> 
            <asp:BoundColumn DataField="RequiredDate" HeaderText="Required Date" />
            <asp:ButtonColumn ButtonType="LinkButton" Text="Change Date" CommandName="Change" /> --%>
            </Columns>
            </asp:DataGrid>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetMenuItemsDataSet" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
            </asp:ObjectDataSource>
        </td>
        <td><asp:CheckBox ID="chkLunch" runat="server" Checked='<%# Eval("Lunch").ToString() == "1"? true:false %>' /></td>
        <td><asp:LinkButton ID="LinkButton2" runat="server" Text="Show" CommandName="ShowHide" /></td>
        <td>
            <asp:DataGrid runat="server" ID="DataGrid2" DataSourceID="ObjectDataSource2" Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
            <asp:TemplateColumn>
            <ItemTemplate> 
            <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("MenuItem") %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateColumn>
            <%--<asp:BoundColumn DataField="ShipName" HeaderText="Ship Name" /> 
            <asp:TemplateColumn>
            <ItemTemplate>
            <asp:TextBox ID="txtRequiredDate" runat="server" Text='<%# Eval("RequiredDate") %>'></asp:TextBox> 
            </ItemTemplate> 
            </asp:TemplateColumn> 
            <asp:BoundColumn DataField="RequiredDate" HeaderText="Required Date" />
            <asp:ButtonColumn ButtonType="LinkButton" Text="Change Date" CommandName="Change" /> --%>
            </Columns>
            </asp:DataGrid>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetMenuItemsDataSet" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
            </asp:ObjectDataSource>
        </td>
    </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater> 
<%--<asp:GridView ID="grdMenuItem" runat="server" AutoGenerateColumns="true">
</asp:GridView>
--%><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMealServingCalendarByKitchenId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMealServingCalendar">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    
</asp:Content>

