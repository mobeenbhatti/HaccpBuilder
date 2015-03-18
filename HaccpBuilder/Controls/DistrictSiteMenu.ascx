<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_DistrictSiteMenu" Codebehind="DistrictSiteMenu.ascx.cs" %>

<%--<table width="1000" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td width="20"><asp:Image ID="Image1" ImageUrl="~/images/District Images/spacer.gif" Width="20" Height="34" runat="server" /></td>
                     <td width="125" align="center"><a href="#" class="tab_blank">Control Pannel</a></td>
                     <td width="2"><asp:Image ID="Image2" ImageUrl="~/images/District Images/spacer.gif" Width="2" Height="34" runat="server" /></td>
                     <td width="125" ><a href="#" class="tab_blank" >Manage User</a></td>
                     <td width="2"><asp:Image ID="Image3" ImageUrl="~/images/District Images/spacer.gif" Width="2" Height="34" runat="server" /></td>
                     <td width="125"><a href="#" class="tab_blank">Create Location</a></td>
                     <td width="2"><asp:Image ID="Image4" ImageUrl="~/images/District Images/spacer.gif" Width="2" Height="34" runat="server" /></td>
                     <td width="125"><a href="#" class="tab_blank">Copy Location</a></td>
                     <td width="2"><asp:Image ID="Image5" ImageUrl="~/images/District Images/spacer.gif" Width="2" Height="34" runat="server" /></td>
                     <td width="125"><a href="#" class="tab_blank">Active Alerts</a></td>
                     <td width="2"><asp:Image ID="Image6" ImageUrl="~/images/District Images/spacer.gif" Width="2" Height="34" runat="server" /></td>
                     <td width="125"><a href="#" class="tab_blank">Reports</a></td>
                     <td>&nbsp;</td>
                     
                   </tr>
                 </table>--%>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<asp:Menu ID="menuTopMenu" runat="server" Orientation="Horizontal">
		<Items>				   
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
	</td>
</tr>
</table>