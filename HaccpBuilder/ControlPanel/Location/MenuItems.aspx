<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="MenuItems.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.MenuItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>MenuItems</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Menu Items
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptMenuItems" runat="server" DataSourceID="sqlDSMenu">
                    <HeaderTemplate>
                        <ul class="tasksTime">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>

                            <div class="col-xs-10">
                                <span><i class="fa fa-file-text-o"></i></span>
                                <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/MenuRecipePrintN.aspx?MenuId=" + Eval("MenuItemID")%>'
                                    Text='<%#Eval("Name")  %>'></asp:HyperLink>
                            </div>

                        </li>

                    </ItemTemplate>

                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>


            </div>
        </div>

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
</asp:Content>
