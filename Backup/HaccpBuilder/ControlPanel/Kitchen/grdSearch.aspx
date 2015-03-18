<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_grdSearch" Title="Untitled Page" Codebehind="grdSearch.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTopLeft" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopRight" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" Runat="Server">
<table width="100%" style="background-color: #C0C0C0; background-repeat: repeat-x">
    <tr style="color: #6699FF"><th>EDIT</th>
<th>Year</th>
<th>Week</th>
<th>Observer</th></tr>
<tr>
<td align="center"><a href="Datalist.aspx">Edit</a></td>
<td align="center">2007</td>
<td align="center">49</td>
<td align="center">Quas</td>
</tr>
<tr>
<td align="center"><a href="Datalist.aspx">Edit</a></td>
<td align="center">2008</td>
<td align="center">4</td>
<td align="center">Steve</td>
</tr>
<tr>
<td align="center"><a href="Datalist.aspx">Edit</a></td>
<td align="center">2007</td>
<td align="center">5</td>
<td align="center">Quas</td>
</tr>
</table>
<table>
<tr><td colspan="5">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical">
    <FooterStyle BackColor="#CCCC99" />
    <RowStyle BackColor="#F7F7DE" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" HeaderText="View Checklist" />
        <asp:CommandField ShowEditButton= "true" HeaderText="Edit Checklist" />
        <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" 
            SortExpression="CreatedDate" />
        <asp:BoundField DataField="Name" HeaderText="Observer" SortExpression="Name" />
    </Columns>
    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
</td></tr>
</table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="SELECT [CreatedDate], [Name] FROM [Contact]">
    </asp:SqlDataSource>
</asp:Content>


