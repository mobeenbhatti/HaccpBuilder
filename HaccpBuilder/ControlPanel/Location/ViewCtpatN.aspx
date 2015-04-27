<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ViewCtpatN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ViewCtpatN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>HACCP-Based Ctpats </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row mt30">
        <div class="panel panel-primary">

            <div class="panel-body tasks">

                <asp:Repeater ID="rptCtpat" runat="server" DataSourceID="sqlDSCtpat">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <ul class="tasksTime">

                            <li>
                                <div class="col-xs-10">
                                    <%# DataBinder.Eval(Container.DataItem, "CtpatText")%>
                                </div>

                            </li>

                        </ul>

                    </ItemTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sqlDSCtpat" runat="server"
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
        SelectCommand="uspAdm_GetCtpatById"
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="nCtpatId"
                QueryStringField="CtpatId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
