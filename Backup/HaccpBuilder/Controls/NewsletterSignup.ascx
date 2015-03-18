<%@ Control Language="C#" AutoEventWireup="true"
	Inherits="Controls_NewsletterSignup" Codebehind="NewsletterSignup.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
		<div id="signup" title="Join our mailing list">
			<fieldset>
				<legend>Join our mailing list</legend>
				<label for="name">
					your name
				</label>
				<asp:TextBox ID="txtName" runat="server" ValidationGroup="vgEmailSignupGroup">
				</asp:TextBox>
				<ajax:TextBoxWatermarkExtender ID="tbwName" runat="server" TargetControlID="txtName"
					WatermarkText="enter your name">
				</ajax:TextBoxWatermarkExtender>
				<label for="email">
					your email</label>
				<asp:TextBox ID="txtEmailAddress" runat="server">
				</asp:TextBox><br />
				<asp:RegularExpressionValidator ID="revEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
					ErrorMessage="email address is not in correct format." SetFocusOnError="true"
					Display="Dynamic" ValidationGroup="vgEmailSignupGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
				</asp:RegularExpressionValidator>
				<ajax:TextBoxWatermarkExtender ID="tbwEmail" runat="server" TargetControlID="txtEmailAddress"
					WatermarkText="enter your email address">
				</ajax:TextBoxWatermarkExtender>
				<fieldset>
					<legend>Select your preference:</legend>
					<label for="radFormat1" title="Receive emails in HTML format">
						<input id="radFormat1" checked="checked" name="radioformat" title="html format" type="radio"
							value="" />
						HTML format</label>
					<label for="radFormat2" title="Receive emails in plain text format">
						<input id="radFormat2" name="radioformat" title="text format" type="radio" value="" />
						Plain text format</label>
				</fieldset>
				<label for="check1">
					<input id="check1" name="check1" title="Subscribe" type="checkbox" value="" />
					Subscribe to our mailing list</label>
				<asp:Button ID="btnEmailSignup" runat="server" CssClass="button-big" Text="join"
					ValidationGroup="vgEmailSignupGroup" Width="75px" />
			</fieldset>
		</div>
	</ContentTemplate>
</asp:UpdatePanel>
