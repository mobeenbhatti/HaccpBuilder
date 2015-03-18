<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_Default3" Title="Untitled Page" Codebehind="Default3.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" Runat="Server">
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>

<div>
<asp:GridView ID="grdDailyreport" runat="server" AutoGenerateColumns="false" >
<Columns>
<asp:BoundField DataField="RunName" HeaderText="Table Name" />
<asp:TemplateField>
<ItemTemplate>
<asp:UpdatePanel ID="updDate" runat="server">
<ContentTemplate>
<asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

                <asp:Calendar ID="cldDate" runat="server" BackColor="White" 
        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
        Width="200px">
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
    </asp:Calendar>
 
    <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" PopupControlID="cldDate" TargetControlID="txtDate" >
    </cc1:PopupControlExtender>
        </ContentTemplate>
</asp:UpdatePanel>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
              
 
 
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
 
</asp:Content>

