<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_Pager" Codebehind="Pager.ascx.cs" %>
<div>
    <div id="left" style="float:left;">
        <span>Show Page&nbsp;</span>
        <asp:DropDownList ID="ddlPageNumber" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageNumber_SelectedIndexChanged" Height="20px" ></asp:DropDownList>
        <span>&nbsp;of</span>
        <asp:Label ID="lblShowRecords" runat="server"></asp:Label>
        <span>Pages&nbsp;</span>
    </div>
    <%--<div id="right" style="float:right;">
        <span>Display&nbsp;</span>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Text="1" Value="1"></asp:ListItem>
            <asp:ListItem Text="5" Value="5"></asp:ListItem>
            <asp:ListItem Text="10" Value="10" Selected="true"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
            <asp:ListItem Text="25" Value="25"></asp:ListItem>
            <asp:ListItem Text="50" Value="50"></asp:ListItem>
        </asp:DropDownList>
        <span>&nbsp;Records per Page</span>
    </div>--%>
</div>
