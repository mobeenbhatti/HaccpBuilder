<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_District_Users" Codebehind="Users.aspx.cs" %>

<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<asp:GridView ID="gvContacts" runat="server" DataSourceID="odsContacts" DataKeyNames="ContactId"
		AutoGenerateColumns="false">
		<HeaderStyle BackColor="Gray" ForeColor="White" />
		<Columns>
			<asp:HyperLinkField DataNavigateUrlFields="Name" DataNavigateUrlFormatString="~/ControlPanel/District/UserRecord.aspx?id={0}"
				HeaderText="Name" SortExpression="Name" DataTextField="Name" />
			<asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
			<asp:CheckBoxField DataField="EmailAlerts" HeaderText="Email Alerts" SortExpression="EmailAlerts" />
			<asp:BoundField DataField="PrimaryPhone" HeaderText="Primary Phone" SortExpression="PrimaryPhone" />
			<asp:BoundField DataField="SecondaryPhone" HeaderText="Secondary Phone" SortExpression="SecondaryPhone" />
			<asp:BoundField DataField="CreatedDate" HeaderText="Created Date" SortExpression="CreatedDate" />
			<asp:BoundField DataField="ModifiedDate" HeaderText="Modified Date" SortExpression="ModifiedDate" />
		</Columns>
	</asp:GridView>
	<asp:ObjectDataSource ID="odsContacts" runat="server" OldValuesParameterFormatString="original_{0}"
		SelectMethod="GetAllContacts" TypeName="SchoolHaccp.BusinessLogic.ProcessContact"
		EnablePaging="False"></asp:ObjectDataSource>
</asp:Content>
