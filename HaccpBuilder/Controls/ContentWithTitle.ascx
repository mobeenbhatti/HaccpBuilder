<%@ Control Language="C#" AutoEventWireup="true"
	Inherits="Controls_ContentWithTitle" Codebehind="ContentWithTitle.ascx.cs" %>
<asp:DataList ID="DataList1" runat="server">
	<ItemTemplate>
		<h1>
			<%# DataBinder.Eval(Container.DataItem, "TitleContent")%>
		</h1>
		<%# DataBinder.Eval(Container.DataItem, "BodyContent")%>
		<div class="clear">
		</div>
	</ItemTemplate>
</asp:DataList>
