<%@ Control AutoEventWireup="true" Inherits="Controls_TopDistrictMenu"
	Language="C#" Codebehind="TopDistrictMenu.ascx.cs" %>
<%--<div id="mainmenu">
	<asp:Menu ID="menuTopMenu" runat="server" Orientation="Horizontal">
		<Items>
			<%--<asp:MenuItem NavigateUrl="~/ControlPanel/Default.aspx" Text="HOME" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Users.aspx" Text="USERS" Value="USERS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Kitchens.aspx" Text="KITCHENS"
				Value="KITCHENS"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Alerts.aspx" Text="ALERTS" Value="ALERTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Reports.aspx" Text="REPORTS" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="LOGOUT" Value="LOGOUT">
			</asp:MenuItem>--%>
			<%--<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" Text="CONTROL PANEL" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx" Text="BUILD HACCP PLAN" Value="BUILD">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default2.aspx?ViewPlan=1" Text="VIEW HACCP PLAN"
				Value="VIEW"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default2.aspx?PrintPlan=1" Target="_Blank" Text="PRINT HACCP PLAN" Value="PRINT">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/PlanIndex.aspx" Text="Plan Index" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" Text="MENU MANAGER" Value="MENUMANAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/InventoryItemManager.aspx" Text="INVENTORY MANAGER" Value="INVENTORYMNAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="SIGN OUT" Value="LOGOUT">
			</asp:MenuItem>
		</Items>
	</asp:Menu>
</div>--%>
<div id="mainmenu">
	<asp:Menu ID="menuTopMenu"  runat="server" Orientation="Horizontal">
		<Items>
			<%--<asp:MenuItem NavigateUrl="~/ControlPanel/Default.aspx" Text="HOME" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Users.aspx" Text="USERS" Value="USERS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Kitchens.aspx" Text="KITCHENS"
				Value="KITCHENS"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Alerts.aspx" Text="ALERTS" Value="ALERTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/District/Reports.aspx" Text="REPORTS" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="LOGOUT" Value="LOGOUT">
			</asp:MenuItem>--%>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" Text="CONTROL PANEL" Value="HOME"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/ProceduralQuestions.aspx" Text="BUILD HACCP PLAN" Value="BUILD">
			</asp:MenuItem>			
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default2.aspx?ViewPlan=1" Target="_Blank" Text="VIEW HACCP PLAN"
				Value="VIEW"></asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/Default2.aspx?PrintPlan=1" Target="_Blank" Text="PRINT HACCP PLAN" Value="PRINT">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/PlanIndex.aspx" Text="PLAN INDEX<br/>" Value="REPORTS">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" Text="MENU MANAGER" Value="MENUMANAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Kitchen/InventoryItemManager.aspx" Text="INVENTORY MANAGER" Value="INVENTORYMNAGER">
			</asp:MenuItem>
			<asp:MenuItem NavigateUrl="~/ControlPanel/Logout.aspx" Text="SIGN OUT" Value="LOGOUT">
			</asp:MenuItem>
		</Items>
	</asp:Menu>
</div>

<div id="Clearer"></div>
<%--<div id="bar1">
	<asp:LoginView ID="lvCurrentUserDisplay" runat="server">
		<LoggedInTemplate>
			<asp:LoginName ID="lnCurrentUser" runat="server" FormatString="You are logged in as {0}." />
		</LoggedInTemplate>
		<AnonymousTemplate>
			<asp:LoginStatus ID="lsCurrentStatus"  runat="server" />
		</AnonymousTemplate>
	</asp:LoginView>
</div>--%>

