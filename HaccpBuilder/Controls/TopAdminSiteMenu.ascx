<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_TopAdminSiteMenu" Codebehind="TopAdminSiteMenu.ascx.cs" %>
<div id="mainmenu">
	<asp:Menu ID="menuTopMenu" runat="server" Orientation="Horizontal">
		<Items>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/Default.aspx" Text="ADMIN PANEL" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/CreateDistrict.aspx" Text="CREATE CMMAND CENTRAL" Value="USERS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/CreateHBFlex.aspx" Text="CREATE HBFlex DISTRICT" Value="HBFlex">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/CreateHBez.aspx" Text="CREATE HBez KITCHEN" Value="HBez">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/ViewKitchen.aspx" Text="VIEW KITCHEN"
				Value="KITCHENS"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Admin/EditKitchen.aspx" Text="EDIT KITCHEN"
				Value="COPYKITCHEN"></asp:MenuItem>			
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="LOGOUT" Value="LOGOUT">
			</asp:MenuItem>			
		</Items>
	</asp:Menu>
</div>
<%--<div id="bar">
	<asp:LoginView ID="lvCurrentUserDisplay" runat="server">
		<LoggedInTemplate>
			<asp:LoginName ID="lnCurrentUser" runat="server" FormatString="You are logged in as {0}." />
		</LoggedInTemplate>
		<AnonymousTemplate>
			<asp:LoginStatus ID="lsCurrentStatus" runat="server" />
		</AnonymousTemplate>
	</asp:LoginView>
</div>--%>