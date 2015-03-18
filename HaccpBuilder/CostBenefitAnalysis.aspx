<%@ Page AutoEventWireup="true" Inherits="CostBenefitAnalysis"
	Language="C#" MasterPageFile="~/Marketing.master" Title="HACCP Builder | Cost Benefit Analysis" Codebehind="CostBenefitAnalysis.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Src="Controls/ContentWithTitle.ascx" TagName="ContentWithTitle" TagPrefix="uc1" %>
<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">
	<uc1:ContentWithTitle ID="ContentWithTitle1" runat="server" />
	<table>
		<tr>
			<td>
				Select Service Plan:</td>
			<td>
				<asp:DropDownList ID="ddlPlan" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPlan_SelectedIndexChanged">
					<asp:ListItem Selected="True" Text="Platinum Service" Value="platinum" />
					<asp:ListItem Text="Gold Service" Value="gold" />
				</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:UpdatePanel ID="upnlError" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<asp:Label ID="lblError" runat="server" Text="A positive number is required." Font-Italic="true"
							ForeColor="Red" Visible="false" /></ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="btnCalculate" />
					</Triggers>
				</asp:UpdatePanel>
			</td>
		</tr>
		<tr>
			<td valign="top">
				Number of Kitchens:</td>
			<td>
				<asp:TextBox ID="txtNumberOfKitchens" runat="server" Text="18" Style="text-align: center">
				</asp:TextBox>
				<ajax:NumericUpDownExtender ID="nudeNumberOfKitchens" runat="server" ServiceDownMethod=""
					ServiceUpMethod="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtNumberOfKitchens"
					Width="100">
				</ajax:NumericUpDownExtender>
				&nbsp;&nbsp;<asp:Button ID="btnCalculate" runat="server" Text=" Calculate " OnClick="btnCalculate_Click" />
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="2">
				<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<div id="divResults" style="">
						<h2>
							<asp:Label ID="lblProgram" runat="server" Text="HACCP Builder Platinum Service: Including automated temperature equipment, planner, reporting and alerts"></asp:Label></h2>
						</div>
						<table width="100%" border="1">
							<tr>
								<th colspan="4">
									IMPLEMENTING HACCP Builder
								</th>
								<th colspan="2">
									ADMIN&nbsp;COST&nbsp;W/OUT&nbsp;SCHOOL&nbsp;HACCP
								</th>
								<th colspan="4">
									SAVINGS WITH HACCP Builder
								</th>
							</tr>
							<tr>
								<td>
									Licensing Fee Plus Equipment
								</td>
								<td>
									Monthly Kitchen Fee
								</td>
								<td>
									First Year Cost
								</td>
								<td>
									Second Year & Beyond Cost
								</td>
								<td>
									Admin Hours Per Week
								</td>
								<td>
									Annual Admin Costs
								</td>
								<td>
									First Year Savings
								</td>
								<td>
									Second Year Savings
								</td>
								<td>
									First Year ROI
								</td>
								<td>
									Second Year ROI
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">
									<asp:Label ID="lblLicenseFee" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblMonthlyKitchenFee" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblFirstYearCost" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblSecondYearCost" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblAdminHours" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblAnnualAdminCost" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblFirstYearSavings" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblSecondYearSavings" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblFirstYearROI" runat="server"></asp:Label>
								</td>
								<td style="text-align: right;">
									<asp:Label ID="lblSecondYearROI" runat="server"></asp:Label>
								</td>
							</tr>
						</table>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="ddlPlan" EventName="SelectedIndexChanged" />
						<asp:AsyncPostBackTrigger ControlID="btnCalculate" />
					</Triggers>
				</asp:UpdatePanel>
			</td>
		</tr>
	</table>
</asp:Content>
<asp:Content ID="conSideContent" runat="Server" ContentPlaceHolderID="cphSideContent">
</asp:Content>
