<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ViewSOPN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ViewSOPN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>HACCP-Based SOPs</h1>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row mt30">
        <div class="panel panel-primary">

            <div class="panel-body tasks">

                <asp:Repeater ID="rptSOP" runat="server" DataSourceID="sqlDSSOP">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <ul class="tasksTime">
                            <li>
                                <h3>
                                    <div class="col-xs-10">
                                        <i class="fa fa-tasks"></i>
                                        <strong>
                                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                        </strong>
                                    </div>
                                </h3>

                            </li>
                            <li>
                                <div class="col-xs-10">
                                    <%# DataBinder.Eval(Container.DataItem, "SOPText")%>
                                </div>

                            </li>

                        </ul>

                    </ItemTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="sqlDSSOP" runat="server"
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
        SelectCommand="uspAdm_GetSOPById"
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="nSOPId"
                QueryStringField="SOPId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
