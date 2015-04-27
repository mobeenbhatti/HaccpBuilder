<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="SOPs.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.SOPs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Standard Operating Procedures</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">

    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Standard Operating Procedures - SOP Detailed Index
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptSop" runat="server">
                    <HeaderTemplate>
                        <ul class="tasksTime">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-xs-10">
                                <span><i class="fa fa-file-text-o"></i></span>
                                <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                                    NavigateUrl='<%# "~/ControlPanel/Location/ViewSOPN.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "KitchenSOPId") %>'
                                    runat="server" Target="_blank"></asp:HyperLink>
                            </div>

                        </li>

                    </ItemTemplate>

                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

                <asp:Repeater ID="rptCtpat" runat="server">
                    <HeaderTemplate>
                        <ul class="tasksTime">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-xs-10">
                                <span><i class="fa fa-file-text-o"></i></span>
                                <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                                    NavigateUrl='<%# "~/ControlPanel/Location/ViewCtpat.aspx?CtpatId=" + DataBinder.Eval(Container.DataItem, "KitchenCtpatId") %>'
                                    runat="server" Target="_blank"></asp:HyperLink>
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

    <asp:SqlDataSource ID="sqlDSSOP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetSOPsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource> 
        <asp:SqlDataSource ID="sqlDsCtpat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetCtpatsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource> 
</asp:Content>
