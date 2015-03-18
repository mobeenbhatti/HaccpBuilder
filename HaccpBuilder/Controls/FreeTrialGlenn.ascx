<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_FreeTrialGlenn" Codebehind="FreeTrialGlenn.ascx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<table border="0" cellpadding="0" cellspacing="0" class="zebra" style="text-align:left">
     <tr>
    <td colspan="2" class="ph-top">
        <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" ShowSummary="true" runat="server" />
    </td>
    </tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvKitchenName" runat="server" ControlToValidate="txtKitchenName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter your Company name.<br />"></asp:RequiredFieldValidator>
			<%--<asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtKitchenName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
				ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,50}$"></asp:RegularExpressionValidator>--%>
			Company Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtKitchenName" runat="server" Columns="50" CssClass="textField"
				MaxLength="50"></asp:TextBox>
		</td>
	</tr>
	<%--<tr>
		<td>
			<asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtNumberOfKitchens"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid integer."
				ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
			<asp:RequiredFieldValidator ID="rfvNumberOfKitchens" runat="server" ControlToValidate="txtNumberOfKitchens"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter number of kitchens in Kitchen.<br />"></asp:RequiredFieldValidator>
			Number of Kitchens in Kitchen:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtNumberOfKitchens" runat="server" Columns="50" CssClass="textField"></asp:TextBox>
		</td>
	</tr>--%>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvContactFirstName" runat="server" ControlToValidate="txtContactFirstName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter contact first name.<br />"></asp:RequiredFieldValidator>
			Contact First Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtContactFirstName" runat="server" Columns="50" CssClass="textField"
				MaxLength="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvContactLastName" runat="server" ControlToValidate="txtContactLastName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter contact last name.<br />"></asp:RequiredFieldValidator>
			Contact Last Name:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtContactLastName" runat="server" Columns="50" CssClass="textField"
				MaxLength="100"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter your job title."></asp:RequiredFieldValidator>
			Title:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtTitle" runat="server" Columns="50" CssClass="textField" MaxLength="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a city.<br />"></asp:RequiredFieldValidator>
			City:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtCity" runat="server" Columns="50" CssClass="textField" MaxLength="50"></asp:TextBox>
		</td>
	</tr>
    <tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountryRegion"
				Display="None" EnableClientScript="true" ErrorMessage="Please select a country.<br />"></asp:RequiredFieldValidator>
			Country:&nbsp;</td>
		<td>
			<%--<asp:DropDownList ID="ddlCountryRegion" runat="server" DataSourceID="odsCountryRegion"
				DataTextField="Name" DataValueField="CountryRegionCode" OnDataBound="ddlCountryRegion_DataBound">
			</asp:DropDownList><asp:ObjectDataSource ID="odsCountryRegion" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetCountryRegionDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessCountryRegion">
			</asp:ObjectDataSource>--%>
            <asp:DropDownList ID="ddlCountryRegion" runat="server" Width="200px"  DataSourceID="sqlDsCountry" DataTextField="Name" DataValueField ="CountryRegionCode"
            AutoPostBack="true"  onselectedindexchanged="ddlCountry_SelectedIndexChanged" >	
                            <%--<asp:ListItem Text="United States" Value="US" />			            
				            <asp:ListItem Text="Canada" Value="CA" />--%>				            
			            </asp:DropDownList>
             <asp:SqlDataSource ID="sqlDsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspDS_GetCountryRegion" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource> 
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlStateProvince"
				Display="None" EnableClientScript="true" ErrorMessage="Please select a state.<br />"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator>
			State:&nbsp;</td>
		<td>
			<asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates"
				DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true">
				<asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			</asp:DropDownList>
           <asp:TextBox ID="txtState" runat="server" Visible="false" Columns="50" CssClass="textField"></asp:TextBox>            
            <asp:HiddenField ID="hfState" runat="server" />
           <%-- <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
			</asp:ObjectDataSource>--%>
            <asp:SqlDataSource ID="sqlDsStates" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetStateProvinceByCountry" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCountryRegion" DefaultValue="US" 
                Name="chCountryCode" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a zip code.<br />"></asp:RequiredFieldValidator>
            <%-- <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
				Display="None" EnableClientScript="true" 
				ErrorMessage="Please enter valid Zip code." ValidationExpression="(\d)+"></asp:RegularExpressionValidator> --%>
			Zip Code:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtZipCode" runat="server" Columns="50" CssClass="textField" MaxLength="15"></asp:TextBox>
           
		</td>
	</tr>	
	<tr>
		<td>
			<asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter your email.<br />"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
			Email Address:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="textField" MaxLength="50"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width: 200px;">
			<asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter your phone number.<br />"></asp:RequiredFieldValidator>
			Phone Number:&nbsp;</td>
		<td>
			<asp:TextBox ID="txtPhone" runat="server" Columns="50" CssClass="textField" MaxLength="25"></asp:TextBox>
		</td>
	</tr>
	
    <tr>
        <td>
            Corporate Package</td>
        <td>
            <asp:DropDownList ID="ddlType" runat="server" AppendDataBoundItems="true" Width="200px"
               >
                <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                <asp:ListItem Value="0">Haccp Builder </asp:ListItem>
                <asp:ListItem Value="1">Haccp Builder & C-TPAT</asp:ListItem>
                <asp:ListItem Value="2">C-TPAT Only</asp:ListItem>
            </asp:DropDownList>
        </td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None"
            ErrorMessage="The value in field Corporate Package is required." ControlToValidate="ddlType"
            Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
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
			<asp:Button ID="commandSubmit" runat="server" CssClass="button blue" OnClick="commandSubmit_Click"
				Text="Submit" />&nbsp;</td>
	</tr>
</table>
