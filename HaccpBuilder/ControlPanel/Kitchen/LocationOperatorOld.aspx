<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_LocationOperator" Title="HACCP Builder | Create Location Operator" Codebehind="LocationOperatorOld.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <div class="bdy_contents">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Create Location Employee}</div>
            <div class="discp_txt">
                <%--Directions: Use this Log for deliveries or receiving foods. Record any temperatures
                and corrective action taken on the Receiving Log. <b>If no foods are received on any
                    working day, indicate "No Ingredient/No Menu Item" in the form. </b>--%>
                    &nbsp;
            </div>
        </div>
        <div class="discp_bottom_bg">
            <div class="disc_buttons">
                <asp:ImageButton ID="cmdAddNew" CausesValidation="false" runat="server"
                    ImageUrl="~/images/buttons/btn_add_new_black.jpg" 
                    onclick="cmdAddNew_Click" /></div>
            <div class="disc_buttons">
                <asp:HyperLink ID="hlBack" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" ImageUrl="~/images/buttons/btn_back_to_black.jpg"
                    runat="server"></asp:HyperLink></div>
        </div>
        <div class="log_heading">
            <div class="red_heading">
                { List of Location Employee }</div>
        </div>
        <div class="log_form_left">
            <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>                   
                    <asp:TemplateField HeaderText="Employee Name" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/LocationOperator.aspx?Id=" + DataBinder.Eval(Container.DataItem, "ContactId") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "Manager")  %>'></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                     <asp:BoundField DataField="EmailAddress" HeaderText="Email" 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >                 
                    </asp:BoundField>
                 </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetKitchenContact" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                    <asp:Parameter Name="nRoleId" Type="Int32" DefaultValue="8" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="content_right">
            <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
                <tr>
                    <td bgcolor="#E3245A">
                        <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="368" border="0" cellspacing="0" cellpadding="0">
                            <tr align="right">
                                <td colspan="3" align="left" class="red_heading">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{
                                    Add/Edit Locaiton Employee }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading" style="padding-left:5px;">
                                    <asp:HiddenField ID="hfStateId" runat="server" />
                                    <asp:HiddenField ID="hfContactId" runat="server" />
                                     <asp:HiddenField ID="hfAddressId" runat="server" />
                                    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lblInfo" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" />
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    Employee Name:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                   <asp:TextBox ID="txtEmployeeName" runat="server" Width="200px" ></asp:TextBox>
                                                                
                                </td>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"  
                                ErrorMessage="The value in field Employee Name is required." ControlToValidate="txtEmployeeName"  Font-Names="Verdana" Font-Size="10px"
                                ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmployeeName"
		                        Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
		                        ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>   
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    Employee Email:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" ></asp:TextBox>                                      
                                </td>
                                 <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="None" 
                                     ErrorMessage="The value in field Employee Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                                     InitialValue="Select Value"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				                     Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </tr>
                            <tr id="trClearCorrectiveActions" runat="server">
                                <td align="right">
                                    Assign/Edit User Name:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                   <asp:TextBox ID="txtUserId" runat="server" Width="200px" ></asp:TextBox>                                    
                                </td>                               
                            </tr>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
                                    ErrorMessage="The value in field User ID is required." ControlToValidate="txtUserId"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtUser" runat="server" ControlToValidate="txtUserId"
                                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid user name."
                                    ValidationExpression="^[a-zA-Z0-9.\s\,\.\-_ ]{1,40}$"></asp:RegularExpressionValidator>
                            <tr>
                                <td align="right">
                                    Password:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" ></asp:TextBox>                                     
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="None"
                                    ErrorMessage="The value in field Password is required." ControlToValidate="txtPassword"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                            </tr>
                             <tr>
                                <td align="right">
                                    Initials:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtInitials" runat="server" Width="200px" MaxLength="3" ></asp:TextBox>                                                                
                                </td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                                    ErrorMessage="The value in field Initials is required." ControlToValidate="txtInitials"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtInitials"
                                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid user name."
                                    ValidationExpression="^[a-zA-Z0-9.\s\,\.\-_ ]{1,40}$"></asp:RegularExpressionValidator>    
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                   Address Line One:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                   <asp:TextBox ID="txtAddress1" runat="server" Width="200px" Enabled="false" ></asp:TextBox>
                                </td>
                            </tr> 
                            <tr>
                                <td align="right">                                           
                                    Address Line 2:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress2" runat="server" Width="200px" Enabled="false" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    City:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" Width="200px" Enabled="false" ></asp:TextBox>
                                </td>
                            </tr>                                
                            <tr>
                                <td align="right">
                                   State:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtState" runat="server" Width="200px" Enabled="false" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>                 
                              <td align="right" >TiimeZone:</td>
                              <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                              <td><asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				                        DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				                        CssClass="DropDown" >
				                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			                        </asp:DropDownList>
                             </td>                
                            </tr>    
                            <tr>
                                <td align="right">
                                    Zip Code:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                   <asp:TextBox ID="txtZipCode" runat="server" Width="200px" Enabled="false" MaxLength="10" ></asp:TextBox>                                   
                                </td>
                            </tr>
                             <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
				            Display="None" EnableClientScript="true" 
				            ErrorMessage="Please enter valid Zip code." ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                            <tr>
                                <td align="right">
                                    Main Phone Number:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone1" runat="server" Width="200px"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone1"
				                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid Phone Number."
				                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'\-]{1,100}$"></asp:RegularExpressionValidator>   
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Alternate Phone Number:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone2" runat="server" MaxLength="10"   Width="200px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone2"
				                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid Alt Phone Number."
				                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'\-]{1,100}$"></asp:RegularExpressionValidator>   
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                   Fax:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                   <asp:TextBox ID="txtFax" runat="server" Width="200px" ></asp:TextBox>
                                     
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:ImageButton ID="cmdSubmit" runat="server" ImageUrl="~/images/buttons/ButtonUpdate.png"
                                        OnClick="cmdSubmit_Click" Visible="false" />
                                    <asp:ImageButton ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click"
                                        runat="server" ImageUrl="~/images/buttons/ButtonDelete.png" />
                                    <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png"
                                        OnClick="cmdAdd_Click" />
                                    <asp:ImageButton ID="cmdCancel" CausesValidation="false" runat="server" ImageUrl="~/images/buttons/ButtonCancel.png"
                                        OnClick="cmdCancel_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E3245A">
                        <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                    </td>
                </tr>
            </table>

        </div>
       
        <%-- <div class="grey_bg_form">
            <a href="InventoryItemManager.aspx">Terms Of Use</a> <a href="InventoryItemManager.aspx">
                Training Manual</a>
        </div>--%>
        <asp:Label ID="Label2" runat="server" Visible="false" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="dqlDsTimeZone" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspDS_GetTimeZones" SelectCommandType="StoredProcedure">       
            </asp:SqlDataSource> 
    </div>
    </b>
</asp:Content>

