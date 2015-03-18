<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_TopDistrictSiteMenu" Codebehind="TopDistrictSiteMenu.ascx.cs" %>

<div id="mainmenu">
	<asp:Menu ID="menuTopMenu" runat="server" Orientation="Horizontal">
		<Items>
		    <%--<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" Text="CONTROL PANEL" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx" Text="BUILD HACCP PLAN" Value="BUILD">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/ViewHaccpPlan.aspx" Text="VIEW HACCP PLAN"
				Value="VIEW"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/PrintHaccpPlan.aspx" Text="PRINT HACCP PLAN" Value="PRINT">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/PlanIndex.aspx" Text="Plan Index" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" Text="MENU MANAGER" Value="MENUMANAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/InventoryItemManager.aspx" Text="INVENTORY MANAGER" Value="INVENTORYMNAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="SIGN OUT" Value="LOGOUT">
			</asp:MenuItem>--%>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/DistrictControl.aspx" Text="CONTROL PANEL" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/DistrictUsers.aspx" Text="MANAGE USERS" Value="USERS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Redirect.aspx" Text="CREATE A LOCATION"
				Value="KITCHENS"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/CopyKitchen.aspx" Text="COPY A LOCATION"
				Value="COPYKITCHEN"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Alerts.aspx" Text="ACTIVE ALERTS" Value="ALERTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/DistrictReports.aspx" Text="REPORTS" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="LOGOUT" Value="LOGOUT">
			</asp:MenuItem>
			
		</Items>
	</asp:Menu>
</div>
<%--<div id="bar1">
	<asp:LoginView ID="lvCurrentUserDisplay" runat="server">
		<LoggedInTemplate>
			<asp:LoginName ID="lnCurrentUser" runat="server" FormatString="You are logged in as {0}." />
		</LoggedInTemplate>
		<AnonymousTemplate>
			    <asp:LoginStatus ID="lsCurrentStatus" runat="server"/>
		</AnonymousTemplate>
	</asp:LoginView>
</div>--%>