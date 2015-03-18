<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" ValidateRequest="false" Inherits="ControlPanel_Kitchen_PlanIndexDetail" Codebehind="PlanIndexDetailOld.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<table id="adminedit" border="0" cellpadding="4">
        <tr>
			<td>
				&nbsp;
            </td>
			<td>
				<font color="red">*</font></td>
			<td style="width: 698px">
				
            </td>
			<td style="width: 118px" >			
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlanTitle"
					Display="Dynamic" ErrorMessage="Title is required.">
				</asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td>
				Title:</td>
			<td>
				<font color="red">*</font></td>
			<td style="width: 698px">
				<asp:TextBox ID="txtPlanTitle" runat="server" MaxLength="100" Width="300px">
				</asp:TextBox>
				<asp:LinkButton ID="lkbDefault" runat="server" Text="Revert to Default" 
                 oncommand="lkbDefault_Command"></asp:LinkButton>
				</td>
			<td style="width: 118px" >
			    
				<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtPlanTitle"
					Display="Dynamic" ErrorMessage="Title is required.">
				</asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td>
				Category:</td>
			<td>
				<font color="red">*</font></td>
			<td style="width: 698px">
				 <asp:DropDownList ID="ddlCategory" Width="200px" DataSourceID="odsCategory" CssClass="log_textbox"
                    DataTextField="Name" DataValueField="PlanCategoryId" AppendDataBoundItems="false"
                    runat="server" Visible="false">
                    <asp:ListItem>Select Category</asp:ListItem>
                </asp:DropDownList>  
                <asp:Label ID="lblCategory" runat="server" CssClass="red_heading"></asp:Label>              
		    </td>
			<td style="width: 118px" >			
				<asp:RequiredFieldValidator ID="rfvCategory" runat="server" Display="None" ErrorMessage="Please Select Category"
                    ControlToValidate="ddlCategory" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                    Font-Size="10px" InitialValue="Please Select Category" ></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td>
				Content:</td>
			<td>
				<font color="red">*</font></td>
			<td style="width: 698px">
                <FCKeditorV2:FCKeditor ID="txtPlanContent" runat="server" Height="600px"  BasePath="~/fckeditor/" Width="650px">
                </FCKeditorV2:FCKeditor>
			    <%--<FTB:FreeTextBox id="txtContent" runat="Server" Height="100px" />--%>
				<%--<asp:TextBox ID="txtContent" runat="server" Columns="70" Rows="5" TextMode="MultiLine">
				</asp:TextBox>--%>
		    </td>
			<td style="width: 118px" >
				<%--<asp:RequiredFieldValidator ID="rfvTitleContent" runat="server" ControlToValidate="txtContent"
					Display="Dynamic" ErrorMessage="Title Content is required.">
				</asp:RequiredFieldValidator>--%>
			</td>
		</tr>		
		<tr>
			<td>
				Active:</td>
			<td>
			</td>
			<td style="width: 698px">
				<asp:CheckBox ID="cbActive" runat="server" /></td>
			<td style="width: 118px" >
			</td>
		</tr>		
		<tr>
			<td colspan="2">
			</td>
			<td colspan="2">
			    <asp:ImageButton ID="cmdSubmit" runat="server" ImageUrl="~/images/buttons/ButtonUpdate.png"
                    OnClick="cmdSubmit_Click" />
                <asp:ImageButton ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click"
                    runat="server" ImageUrl="~/images/buttons/ButtonDelete.png" />
                <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png"
                    OnClick="cmdAdd_Click" />
                <asp:ImageButton ID="cmdCancel" runat="server" CausesValidation="false" ImageUrl="~/images/buttons/ButtonCancel.png"
                    OnClick="cmdCancel_Click" />
                <asp:HiddenField ID="hfPlanId" runat="server" />
                <asp:HiddenField ID="hfCustom" runat="server" />
                <asp:HiddenField ID="hfAdditional" runat="server" />
                <asp:HiddenField ID="hfChildId" runat="server" />	
                <asp:HiddenField ID="hfPlanCategoryId" runat="server" />			
			</td>
		</tr>
	</table>
	 <asp:ObjectDataSource ID="odsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetKitchenPlanCategoryByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

