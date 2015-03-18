<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_TopMainMenu" Codebehind="TopMainMenu.ascx.cs" %>
<asp:Menu ID="menuTopMenu" runat="server" BackColor="#FFFFFF" DynamicHorizontalOffset="2"
	Orientation="Horizontal" StaticHoverStyle-ForeColor="#8E2323" StaticSubMenuIndent="10px">
	<Items>
		<asp:MenuItem NavigateUrl="~/FAQ.aspx" Text="FAQ" Value="FAQ"></asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/CustomerService.aspx" Text="Customer Service" Value="Customer Service">
		</asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/CostBenefitAnalysis.aspx" Text="Cost-Benefit Analysis">
		</asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/Shop/Default.aspx" Text="Online Store"></asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/ClientSampling.aspx" Text="Client Sampling" Value="Client Sampling">
		</asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/Partners.aspx" Text="Partners"></asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/USDA.aspx" Text="USDA"></asp:MenuItem>
		<asp:MenuItem Selectable="false" Text="&nbsp;|&nbsp;"></asp:MenuItem>
		<asp:MenuItem NavigateUrl="~/NFSMI.aspx" Text="NFSMI"></asp:MenuItem>
	</Items>
	<StaticMenuItemStyle HorizontalPadding="0px" VerticalPadding="2px" />
	<StaticSelectedStyle BackColor="#1C5E55" />
</asp:Menu>
