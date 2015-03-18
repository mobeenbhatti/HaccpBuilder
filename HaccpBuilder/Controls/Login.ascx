<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_Login" Codebehind="Login.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:UpdatePanel ID="upLogin" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
		<ul>
			<li style="padding-bottom: 5px;">District <u>L</u>ogin<br />
				<%--<asp:TextBox ID="txtDistrictLogin" runat="server" AccessKey="L" CssClass="loginbox">
				</asp:TextBox><asp:RequiredFieldValidator ID="rfvDistrictLogin" runat="server" ControlToValidate="txtDistrictLogin"
					Display="Dynamic" ValidationGroup="vgDistrictLoginGroup"><br />district login required.</asp:RequiredFieldValidator>
				<ajax:TextBoxWatermarkExtender ID="tbwDistrictLogin" runat="server" TargetControlID="txtDistrictLogin"
					WatermarkText="district username">
				</ajax:TextBoxWatermarkExtender>--%>
			</li>
			<asp:Button ID="btnDistrictLogin" runat="server" CssClass="button-login" OnClick="btnDistrictLogin_Click"
				Text="District Login" ValidationGroup="vgDistrictLoginGroup" />
			<li style="padding-bottom: 5px;">Kitchen <u>L</u>ogin<br />
				<%--<asp:TextBox ID="txtKitchenLogin" runat="server" AccessKey="L" CssClass="loginbox">
				</asp:TextBox><asp:RequiredFieldValidator ID="rfvKitchenLogin" runat="server" ControlToValidate="txtKitchenLogin"
					Display="Dynamic" ValidationGroup="vgKitchenLoginGroup"><br />kitchen login required.</asp:RequiredFieldValidator>
				<ajax:TextBoxWatermarkExtender ID="tbwKitchenLogin" runat="server" TargetControlID="txtKitchenLogin"
					WatermarkText="kitchen username">
				</ajax:TextBoxWatermarkExtender>--%>
			</li>
			<asp:Button ID="btnKitchenLogin" runat="server" CssClass="button-login" Text="Kitchen Login"
				ValidationGroup="vgKitchenLoginGroup" OnClick="btnKitchenLogin_Click" />
		</ul>
	</ContentTemplate>
</asp:UpdatePanel>
