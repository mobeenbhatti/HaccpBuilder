<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" CodeBehind="ChecklistsHistory.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistsHistory" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<h3>Checklist Review</h3>
<div class="row">                  
            <div class="log_form_left" class="LogText">
                <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover">
                    <Columns>                 
                        <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" >
                        </asp:BoundField>
	                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date" >
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
    </div>
</asp:Content>
