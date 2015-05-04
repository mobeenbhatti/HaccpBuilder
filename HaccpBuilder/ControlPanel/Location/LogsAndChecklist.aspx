<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="LogsAndChecklist.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.LogsAndChecklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Logs\CheckLists</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Logs
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptReports" runat="server" DataSourceID="ObjectDataSource1" OnItemDataBound="rptReports_ItemDataBound">
                    <HeaderTemplate>
                        <ul class="tasksTime">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-xs-10">
                                <span><i class="fa fa-file-text-o"></i></span>
                                <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/Default2N.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'></asp:HyperLink>
                            </div>

                        </li>

                    </ItemTemplate>

                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>


            </div>
        </div>


        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>CheckLists
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptChecklist" runat="server" DataSourceID="odsChecklist">
                    <HeaderTemplate>
                        <ul class="tasksTime">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-xs-10">
                                <span><i class="fa fa-check-square-o"></i></span>
                                <asp:HyperLink ID="hlEditQuestion" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' NavigateUrl='<%# "~/ControlPanel/Location/ChecklistQuestionN.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink>

                            </div>

                        </li>
                        <li>
                            <div class="col-xs-10">
                                <span><i class="fa fa-check-square-o"></i></span>

                                <asp:HyperLink ID="HyperLink3" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Location/ChecklistsHistoryN.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink>
                            </div>

                        </li>

                    </ItemTemplate>

                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>

        <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDailyReportsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                PropertyName="Text" Type="DateTime" />
            <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetchecklistSectionsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
        <SelectParameters>
            <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
