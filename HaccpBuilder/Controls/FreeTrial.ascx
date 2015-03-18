<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_FreeTrial" Codebehind="FreeTrial.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<table border="0" cellpadding="0" cellspacing="0" class="contact">
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvDistrictName" runat="server" ControlToValidate="txtDistrictName"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter your district name."></asp:RequiredFieldValidator>
			District Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtDistrictName" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
			<asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtNumberOfKitchens"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter a valid integer."
				ValidationExpression="(\d)+"><br /></asp:RegularExpressionValidator>
			<asp:RequiredFieldValidator ID="rfvNumberOfKitchens" runat="server" ControlToValidate="txtNumberOfKitchens"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter number of kitchens in district."><br /></asp:RequiredFieldValidator>
			Number of Kitchens in District:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtNumberOfKitchens" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvContactFirstName" runat="server" ControlToValidate="txtContactFirstName"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter contact first name."><br /></asp:RequiredFieldValidator>
			Contact First Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtContactFirstName" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvContactLastName" runat="server" ControlToValidate="txtContactLastName"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter contact last name."><br /></asp:RequiredFieldValidator>
			Contact Last Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtContactLastName" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter your job title."></asp:RequiredFieldValidator>
			Title:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtTitle" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter a city."><br /></asp:RequiredFieldValidator>
			City:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtCity" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter a state."><br /></asp:RequiredFieldValidator>
			State:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtState" runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter a zip code."><br /></asp:RequiredFieldValidator>
			Zip Code:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtZipCode" runat="server" Columns="15"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
			<asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="txtEmail"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter your email."><br /></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter a valid email."
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><br /></asp:RegularExpressionValidator>
			Email Address:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="textField"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
				Display="Dynamic" EnableClientScript="true" ErrorMessage="Please enter your phone number."></asp:RequiredFieldValidator>
			Phone Number:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtPhone" runat="server" Columns="20"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;</td>
	</tr>
	<tr>
		<td>
			Comments:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtComment" runat="server" Columns="40" CssClass="textField" Height="75px"
				TextMode="MultiLine"></asp:TextBox></td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;</td>
	</tr>
	<tr>
		<td>
			&nbsp;</td>
		<td style="height: 17px" valign="bottom">
			<asp:Button ID="commandReset" runat="server" CausesValidation="False" CssClass="button"
				OnClick="commandReset_Click" Text="Reset" />&nbsp;
			<asp:Button ID="commandSubmit" runat="server" CssClass="button" OnClick="commandSubmit_Click"
				Text="Submit" />&nbsp;</td>
	</tr>
</table>
