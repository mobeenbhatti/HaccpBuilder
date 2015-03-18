<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ChecklistsHistory.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ChecklistHistoryNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="ph-top"></div>
    <div class="table">
        <div class="box-header">
            <h4 class="left">CHECKLIST HISTORY</h4>
        </div>
        <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false" CssClass="zebra">
            <Columns>                 
                <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" >               
                </asp:BoundField>
	            <asp:TemplateField HeaderText="Entry Date">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestion.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId") +"&Date=" + DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") + "&SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Edit=1"   %>'></asp:HyperLink>
                    </ItemTemplate>                   
                </asp:TemplateField> 
                    <asp:BoundField DataField="Observer" HeaderText="Observer">               
                </asp:BoundField>
                <asp:TemplateField  HeaderText="Account Type" >
                    <ItemTemplate>
                        <asp:Label ID="lblAccountType" Text='<%# DataBinder.Eval(Container.DataItem, "AccountType").ToString() == "1"? "Location Level":"Mobile Level"  %>' runat="server"></asp:Label>
                    </ItemTemplate>                   
                </asp:TemplateField>  
            </Columns>
        </asp:GridView>
        <div class="box-bottom"> </div>
    </div>
</div>
</asp:Content>
