<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ChecklistsHistoryN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistsHistoryN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Checklist Review</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">Checklist Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                    <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered">
                        <Columns>                 
                        <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" >
                        </asp:BoundField>
	                    <asp:TemplateField HeaderText="Entry Date" >
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Location/ChecklistQuestion.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId") +"&Date=" + DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") + "&SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Edit=1"   %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField> 
                         <asp:BoundField DataField="Observer" HeaderText="Observer" >
                        </asp:BoundField>
                        <asp:TemplateField  HeaderText="Account Type" >
                            <ItemTemplate>
                                <asp:Label ID="lblAccountType" Text='<%# DataBinder.Eval(Container.DataItem, "AccountType").ToString() == "1"? "Location Level":"Mobile Level"  %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>  
                    </Columns>
                    </asp:GridView>

                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>
</asp:Content>
