<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_LogAlerts" Title="HACCP Builder | Log Alerts" Codebehind="LogAlerts.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div>
        <div class="MainHeading">
              <asp:Label ID="lblMain" Text="LOGS ALERTS" runat="server"></asp:Label>
        </div>
        <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>                
            </div>
        <div class="ContentRight">                
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
       <div class="Clearer"></div>
    </div>
    <div class="GirdDiv">
    <asp:GridView ID="grdLogAlerts" DataSourceID="ObjectDataSource1" runat="server" 
            AutoGenerateColumns="false" onrowcommand="grdLogAlerts_RowCommand" 
            onrowdatabound="grdLogAlerts_RowDataBound">
        <Columns>
            <asp:TemplateField ControlStyle-CssClass="LogHeading" HeaderText="Log Table">
                <ItemTemplate>
                <asp:Label ID="lblLogName" Text='<%#CheckIfTitleExists(Eval("TableName").ToString()) %>' runat="server"></asp:Label>
                </ItemTemplate>                                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date">
                <ItemTemplate>
                <asp:LinkButton ID="lkbDate" runat="server" CommandName="AlertDate" Text='<%#Eval("EntryDate","{0:d}") %>'></asp:LinkButton>
                <asp:HiddenField ID="hfTableName" Value='<%#Eval("TableName") %>' runat="server" />
                </ItemTemplate>                                
            </asp:TemplateField>            
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetLogAlerts" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </div>
    <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
</asp:Content>

