<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_LocationOperator" Title="HACCP Builder | Create Location Operator" Codebehind="LocationOperatorOld1.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script type="text/javascript" language="javascript">
    function SetAlerts(nLogId) {
        if (nLogId == 1) {
            var rdbColdHoldingLogOff = document.getElementById('PlaceHolder_rdbColdHoldingLogOff');
            var rdbColdHoldingLogOn = document.getElementById('PlaceHolder_rdbColdHoldingLogOn');
            var rdbColdHoldingLogAlertOn = document.getElementById('PlaceHolder_rdbColdHoldingLogAlertOn');
            var rdbColdHoldingLogAlertOff = document.getElementById('PlaceHolder_rdbColdHoldingLogAlertOff');

            if (rdbColdHoldingLogOff.checked == true) {
                rdbColdHoldingLogAlertOn.disabled = true;
                rdbColdHoldingLogAlertOff.disabled = true;
                rdbColdHoldingLogAlertOff.checked = true;
            }
            if (rdbColdHoldingLogOn.checked == true) {
                rdbColdHoldingLogAlertOn.disabled = false;
                rdbColdHoldingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 2) {
            var rdbFreezerLogOff = document.getElementById('PlaceHolder_rdbFreezerLogOff');
            var rdbFreezerLogOn = document.getElementById('PlaceHolder_rdbFreezerLogOn');
            var rdbFreezerLogAlertOn = document.getElementById('PlaceHolder_rdbFreezerLogAlertOn');
            var rdbFreezerLogAlertOff = document.getElementById('PlaceHolder_rdbFreezerLogAlertOff');

            if (rdbFreezerLogOff.checked == true) {
                rdbFreezerLogAlertOn.disabled = true;
                rdbFreezerLogAlertOff.disabled = true;
                rdbFreezerLogAlertOff.checked = true;
            }
            if (rdbFreezerLogOn.checked == true) {
                rdbFreezerLogAlertOn.disabled = false;
                rdbFreezerLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 3) {
            var rdbFoodSafetyOff = document.getElementById('PlaceHolder_rdbFoodSafetyOff');
            var rdbFoodSafetyOn = document.getElementById('PlaceHolder_rdbFoodSafetyOn');
            var rdbFoodSafetyAlertOn = document.getElementById('PlaceHolder_rdbFoodSafetyAlertOn');
            var rdbFoodSafetyAlertOff = document.getElementById('PlaceHolder_rdbFoodSafetyAlertOff');

            if (rdbFoodSafetyOff.checked == true) {
                rdbFoodSafetyAlertOn.disabled = true;
                rdbFoodSafetyAlertOff.disabled = true;
                rdbFoodSafetyAlertOff.checked = true;
            }
            if (rdbFoodSafetyOn.checked == true) {
                rdbFoodSafetyAlertOn.disabled = false;
                rdbFoodSafetyAlertOff.disabled = false;
            }
        }
        if (nLogId == 4) {
            var rdbHotHoldingLogOff = document.getElementById('PlaceHolder_rdbHotHoldingLogOff');
            var rdbHotHoldingLogOn = document.getElementById('PlaceHolder_rdbHotHoldingLogOn');
            var rdbHotHoldingLogAlertOn = document.getElementById('PlaceHolder_rdbHotHoldingLogAlertOn');
            var rdbHotHoldingLogAlertOff = document.getElementById('PlaceHolder_rdbHotHoldingLogAlertOff');

            if (rdbHotHoldingLogOff.checked == true) {
                rdbHotHoldingLogAlertOn.disabled = true;
                rdbHotHoldingLogAlertOff.disabled = true;
                rdbHotHoldingLogAlertOff.checked = true;
            }
            if (rdbHotHoldingLogOn.checked == true) {
                rdbHotHoldingLogAlertOn.disabled = false;
                rdbHotHoldingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 5) {
            var rdbReceivingLogOff = document.getElementById('PlaceHolder_rdbReceivingLogOff');
            var rdbReceivingLogOn = document.getElementById('PlaceHolder_rdbReceivingLogOn');
            var rdbReceivingLogAlertOn = document.getElementById('PlaceHolder_rdbReceivingLogAlertOn');
            var rdbReceivingLogAlertOff = document.getElementById('PlaceHolder_rdbReceivingLogAlertOff');

            if (rdbReceivingLogOff.checked == true) {
                rdbReceivingLogAlertOn.disabled = true;
                rdbReceivingLogAlertOff.disabled = true;
                rdbReceivingLogAlertOff.checked = true;
            }
            if (rdbReceivingLogOn.checked == true) {
                rdbReceivingLogAlertOn.disabled = false;
                rdbReceivingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 6) {
            var rdbRefrigerationLogOff = document.getElementById('PlaceHolder_rdbRefrigerationLogOff');
            var rdbRefrigerationLogOn = document.getElementById('PlaceHolder_rdbRefrigerationLogOn');
            var rdbRefrigerationLogAlertOn = document.getElementById('PlaceHolder_rdbRefrigerationLogAlertOn');
            var rdbRefrigerationLogAlertOff = document.getElementById('PlaceHolder_rdbRefrigerationLogAlertOff');

            if (rdbRefrigerationLogOff.checked == true) {
                rdbRefrigerationLogAlertOn.disabled = true;
                rdbRefrigerationLogAlertOff.disabled = true;
                rdbRefrigerationLogAlertOff.checked = true;
            }
            if (rdbRefrigerationLogOn.checked == true) {
                rdbRefrigerationLogAlertOn.disabled = false;
                rdbRefrigerationLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 7) {
            var rdbTemperatureLogOff = document.getElementById('PlaceHolder_rdbTemperatureLogOff');
            var rdbTemperatureLogOn = document.getElementById('PlaceHolder_rdbTemperatureLogOn');
            var rdbTemperatureLogAlertOn = document.getElementById('PlaceHolder_rdbTemperatureLogAlertOn');
            var rdbTemperatureLogAlertOff = document.getElementById('PlaceHolder_rdbTemperatureLogAlertOff');

            if (rdbTemperatureLogOff.checked == true) {
                rdbTemperatureLogAlertOn.disabled = true;
                rdbTemperatureLogAlertOff.disabled = true;
                rdbTemperatureLogAlertOff.checked = true;
            }
            if (rdbTemperatureLogOn.checked == true) {
                rdbTemperatureLogAlertOn.disabled = false;
                rdbTemperatureLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 8) {
            var rdbThermometerOff = document.getElementById('PlaceHolder_rdbThermometerOff');
            var rdbThermometerOn = document.getElementById('PlaceHolder_rdbThermometerOn');
            var rdbThermometerAlertOn = document.getElementById('PlaceHolder_rdbThermometerAlertOn');
            var rdbThermometerAlertOff = document.getElementById('PlaceHolder_rdbThermometerAlertOff');

            if (rdbThermometerOff.checked == true) {
                rdbThermometerAlertOn.disabled = true;
                rdbThermometerAlertOff.disabled = true;
                rdbThermometerAlertOff.checked = true;
            }
            if (rdbThermometerOn.checked == true) {
                rdbThermometerAlertOn.disabled = false;
                rdbThermometerAlertOff.disabled = false;
            }
        }
        if (nLogId == 9) {
            var rdbValidationOff = document.getElementById('PlaceHolder_rdbValidationOff');
            var rdbValidationOn = document.getElementById('PlaceHolder_rdbValidationOn');
            var rdbValidationAlertOn = document.getElementById('PlaceHolder_rdbValidationAlertOn');
            var rdbValidationAlertOff = document.getElementById('PlaceHolder_rdbValidationAlertOff');

            if (rdbValidationOff.checked == true) {
                rdbValidationAlertOn.disabled = true;
                rdbValidationAlertOff.disabled = true;
                rdbValidationAlertOff.checked = true;
            }
            if (rdbValidationOn.checked == true) {
                rdbValidationAlertOn.disabled = false;
                rdbValidationAlertOff.disabled = false;
            }
        }
        if (nLogId == 10) {

            var rdbFreezerNewLogOff = document.getElementById('PlaceHolder_rdbFreezerNewLogOff');
            var rdbFreezerNewLogOn = document.getElementById('PlaceHolder_rdbFreezerNewLogOn');
            var rdbFreezerNewLogAlertOn = document.getElementById('PlaceHolder_rdbFreezerNewLogAlertOn');
            var rdbFreezerNewLogAlertOff = document.getElementById('PlaceHolder_rdbFreezerNewLogAlertOff');

            if (rdbFreezerNewLogOff.checked == true) {
                rdbFreezerNewLogAlertOn.disabled = true;
                rdbFreezerNewLogAlertOff.disabled = true;
                rdbFreezerNewLogAlertOff.checked = true;
            }
            if (rdbFreezerNewLogOn.checked == true) {
                rdbFreezerNewLogAlertOn.disabled = false;
                rdbFreezerNewLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 11) {

            var rdbShippingLogOff = document.getElementById('PlaceHolder_rdbShippingLogOff');
            var rdbShippingLogOn = document.getElementById('PlaceHolder_rdbShippingLogOn');
            var rdbShippingLogAlertOn = document.getElementById('PlaceHolder_rdbShippingLogAlertOn');
            var rdbShippingLogAlertOff = document.getElementById('PlaceHolder_rdbShippingLogAlertOff');

            if (rdbShippingLogOff.checked == true) {
                rdbShippingLogAlertOn.disabled = true;
                rdbShippingLogAlertOff.disabled = true;
                rdbShippingLogAlertOff.checked = true;
            }
            if (rdbShippingLogOn.checked == true) {
                rdbShippingLogAlertOn.disabled = false;
                rdbShippingLogAlertOff.disabled = false;
            }
        }        
        if (nLogId == 12) {

            var rdbPhLogOff = document.getElementById('PlaceHolder_rdbPhLogOff');
            var rdbPhLogOn = document.getElementById('PlaceHolder_rdbPhLogOn');
            var rdbPhLogAlertOn = document.getElementById('PlaceHolder_rdbPhLogAlertOn');
            var rdbPhLogAlertOff = document.getElementById('PlaceHolder_rdbPhLogAlertOff');

            if (rdbPhLogOff.checked == true) {
                rdbPhLogAlertOn.disabled = true;
                rdbPhLogAlertOff.disabled = true;
                rdbPhLogAlertOff.checked = true;
            }
            if (rdbPhLogOn.checked == true) {
                rdbPhLogAlertOn.disabled = false;
                rdbPhLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 13) {

            var rdbPestLogOff = document.getElementById('PlaceHolder_rdbPestLogOff');
            var rdbPestLogOn = document.getElementById('PlaceHolder_rdbPestLogOn');
            var rdbPestLogAlertOn = document.getElementById('PlaceHolder_rdbPestLogAlertOn');
            var rdbPestLogAlertOff = document.getElementById('PlaceHolder_rdbPestLogAlertOff');

            if (rdbPestLogOff.checked == true) {
                rdbPestLogAlertOn.disabled = true;
                rdbPestLogAlertOff.disabled = true;
                rdbPestLogAlertOff.checked = true;
            }
            if (rdbPestLogOn.checked == true) {
                rdbPestLogAlertOn.disabled = false;
                rdbPestLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 14) {

            var rdbMaintenanceLogOff = document.getElementById('PlaceHolder_rdbMaintenanceLogOff');
            var rdbMaintenanceLogOn = document.getElementById('PlaceHolder_rdbMaintenanceLogOn');
            var rdbMaintenanceLogAlertOn = document.getElementById('PlaceHolder_rdbMaintenanceLogAlertOn');
            var rdbMaintenanceLogAlertOff = document.getElementById('PlaceHolder_rdbMaintenanceLogAlertOff');

            if (rdbMaintenanceLogOff.checked == true) {
                rdbMaintenanceLogAlertOn.disabled = true;
                rdbMaintenanceLogAlertOff.disabled = true;
                rdbMaintenanceLogAlertOff.checked = true;
            }
            if (rdbMaintenanceLogOn.checked == true) {
                rdbMaintenanceLogAlertOn.disabled = false;
                rdbMaintenanceLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 15) {

            var rdbCleaningLogOff = document.getElementById('PlaceHolder_rdbCleaningLogOff');
            var rdbCleaningLogOn = document.getElementById('PlaceHolder_rdbCleaningLogOn');
            var rdbCleaningLogAlertOn = document.getElementById('PlaceHolder_rdbCleaningLogAlertOn');
            var rdbCleaningLogAlertOff = document.getElementById('PlaceHolder_rdbCleaningLogAlertOff');

            if (rdbCleaningLogOff.checked == true) {
                rdbCleaningLogAlertOn.disabled = true;
                rdbCleaningLogAlertOff.disabled = true;
                rdbCleaningLogAlertOff.checked = true;
            }
            if (rdbCleaningLogOn.checked == true) {
                rdbCleaningLogAlertOn.disabled = false;
                rdbCleaningLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 16) {

            var rdbChecklistOff = document.getElementById('PlaceHolder_rdbChecklistOff');
            var rdbChecklistOn = document.getElementById('PlaceHolder_rdbChecklistOn');
            var rdbChecklistAlertOn = document.getElementById('PlaceHolder_rdbChecklistAlertOn');
            var rdbChecklistAlertOff = document.getElementById('PlaceHolder_rdbChecklistAlertOff');

            if (rdbChecklistOff.checked == true) {
                rdbChecklistAlertOn.disabled = true;
                rdbChecklistAlertOff.disabled = true;
                rdbChecklistAlertOff.checked = true;
            }
            if (rdbChecklistOn.checked == true) {
                rdbChecklistAlertOn.disabled = false;
                rdbChecklistAlertOff.disabled = false;
            }
        }
    }
</script>
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
                DataSourceID="ObjectDataSource1" AllowPaging="True" 
                EnableModelValidation="True">
                <Columns>                   
                    <asp:TemplateField HeaderText="Employee Name" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/LocationOperator.aspx?Id=" + DataBinder.Eval(Container.DataItem, "MobileId") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "Employee")  %>'></asp:HyperLink>
                            <asp:HiddenField ID="hfMobileId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "MobileId") %>' />
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
                SelectMethod="GetMobileByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMobile">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
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
                                    Add/Edit Location Employee }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading" style="padding-left:5px;">
                                    <asp:HiddenField ID="hfStateId" runat="server" />
                                    <asp:HiddenField ID="hfContactId" runat="server" />
                                    <asp:HiddenField ID="hfAddressId" runat="server" />
                                    <asp:HiddenField ID="hfMobileId" runat="server" />
                                    <asp:HiddenField ID="hfTimeZone" runat="server" />
                                    <asp:HiddenField ID="hfCountry" runat="server" />
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Text="*"  
                                ErrorMessage="The value in field Employee Name is required." ControlToValidate="txtEmployeeName"  Font-Names="Verdana" Font-Size="10px"
                                ></asp:RequiredFieldValidator>   
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmployeeName"
		                        EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)." Text="*"
		                        ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>                          
                                </td>       
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
                                     <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Text="*"
                                     ErrorMessage="The value in field Employee Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                                     ></asp:RequiredFieldValidator> 
                                     <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Text="*"
				                     EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				                     ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                                     
                                </td>
                                
                                     
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
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*"
                                    ErrorMessage="The value in field User ID is required." ControlToValidate="txtUserId"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtUser" runat="server" ControlToValidate="txtUserId"
                                    EnableClientScript="true" ErrorMessage="Please enter a valid user name." Text="*"
                                    ValidationExpression="^[a-zA-Z0-9.\s\,\.\-_ ]{1,40}$"></asp:RegularExpressionValidator>                               
                                </td>                               
                            </tr>
                             
                            <tr>
                                <td align="right">
                                    Password:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" ></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*"
                                    ErrorMessage="The value in field Password is required." ControlToValidate="txtPassword"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>                                  
                                </td>
                                
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                                    ErrorMessage="The value in field Initials is required." ControlToValidate="txtInitials"
                                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtInitials"
                                    EnableClientScript="true" ErrorMessage="Please enter a valid user name." Text="*"
                                    ValidationExpression="^[a-zA-Z0-9.\s\,\.\-_ ]{1,40}$"></asp:RegularExpressionValidator>                                                              
                                </td>
                                  
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
                              <td><%--<asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				                        DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				                        CssClass="DropDown" >
				                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			                        </asp:DropDownList>--%>
                                    <asp:TextBox ID="txtTimeZone" runat="server" Width="200px" Enabled="false" ></asp:TextBox>
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
                                    <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
				            EnableClientScript="true" Text="*" 
				            ErrorMessage="Please enter valid Zip code." ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>                                
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right">
                                    Main Phone Number:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone1" runat="server" MaxLength="13" Width="200px"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone1"
				                    EnableClientScript="true" ErrorMessage="Please enter a valid Phone Number."
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
                                    <asp:TextBox ID="txtPhone2" runat="server" MaxLength="13"   Width="200px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone2"
				                    EnableClientScript="true" ErrorMessage="Please enter a valid Alt Phone Number."
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
                                   Active:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                   <asp:CheckBox ID="chkActive" runat="server" />
                                     
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
                            <td align="right" colspan="3">
                                <table width="390" style="padding-left:5px; padding-bottom:5px;">
                <tr>
                <th width="200" align="left">LOGS AND REPORTING</th>
                <th colspan="2" align="center" >ACTIVATION</th>
                <th colspan="2" align="center" >E-ALERTS</th>                
                </tr>
                <tr>
                <th width="200" align="left">LOGS:</th>
                <th align="center">ON</th><th align="center">OFF</th>
                <th align="center">ON</th><th align="center">OFF</th>               
                </tr>
                <tr>
                <td width="200">Cleaning and Sanitization Log</td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogOn" runat="server" onClick="SetAlerts(15)"  GroupName="CleaningLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogOff" runat="server" onClick="SetAlerts(15)"  GroupName="CleaningLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbCleaningLogAlertOn" runat="server" onClick="SetAlerts(15)" GroupName="CleaningLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogAlertOff" runat="server" GroupName="CleaningLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Cold Holding Log</td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogOn" runat="server" onClick="SetAlerts(1)"  GroupName="ColdHoldingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogOff" runat="server" onClick="SetAlerts(1)"  GroupName="ColdHoldingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbColdHoldingLogAlertOn" runat="server" onClick="SetAlerts(1)" GroupName="ColdHoldingLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogAlertOff" runat="server" GroupName="ColdHoldingLogAlert" /></td>              
                </tr>
                <tr>
                <td width="200">Cooling Temperature Log</td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogOn" runat="server" onClick="SetAlerts(2)"  GroupName="FreezerLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogOff" runat="server" onClick="SetAlerts(2)"  GroupName="FreezerLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogAlertOn" runat="server" onClick="SetAlerts(2)" GroupName="FreezerLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogAlertOff" runat="server" GroupName="FreezerLogAlert" /></td>                
                </tr> 
                 <tr>
                <td width="200">Freezer Log</td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogOn" runat="server" onClick="SetAlerts(10)"  GroupName="FreezerNewLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogOff" runat="server" onClick="SetAlerts(10)"  GroupName="FreezerNewLog"/></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogAlertOn" runat="server" onClick="SetAlerts(10)" GroupName="FreezerNewLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogAlertOff" runat="server" GroupName="FreezerNewLogAlert" /></td>                
                </tr>
                <tr>
                <td width="200">End Point Temperature Log</td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogOn" runat="server" onClick="SetAlerts(7)"  GroupName="TemperatureLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogOff" runat="server" onClick="SetAlerts(7)"  GroupName="TemperatureLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogAlertOn" runat="server" onClick="SetAlerts(7)" GroupName="TemperatureLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogAlertOff" runat="server" GroupName="TemperatureLogAlert" /></td>               
                </tr>               
                <tr>
                <td width="200">Hot Holding Log</td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogOn" runat="server" onClick="SetAlerts(4)"   GroupName="HotHoldingLog"/></td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogOff" runat="server" onClick="SetAlerts(4)"  GroupName="HotHoldingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogAlertOn" runat="server" onClick="SetAlerts(4)" GroupName="HotHoldingLogAlert"  /></td>
                <td align="center"> <asp:RadioButton ID="rdbHotHoldingLogAlertOff" runat="server" GroupName="HotHoldingLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Ph Log</td>
                <td align="center"><asp:RadioButton ID="rdbPhLogOn" runat="server" onClick="SetAlerts(12)"  GroupName="PhLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbPhLogOff" runat="server" onClick="SetAlerts(12)"  GroupName="PhLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbPhLogAlertOn" runat="server" onClick="SetAlerts(12)" GroupName="PhLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbPhLogAlertOff" runat="server" GroupName="PhLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Pest Control Log</td>
                <td align="center"><asp:RadioButton ID="rdbPestLogOn" runat="server" onClick="SetAlerts(13)"  GroupName="PestLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbPestLogOff" runat="server" onClick="SetAlerts(13)"  GroupName="PestLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbPestLogAlertOn" runat="server" onClick="SetAlerts(13)" GroupName="PestLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbPestLogAlertOff" runat="server" GroupName="PestLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Maintenance Control Log</td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogOn" runat="server" onClick="SetAlerts(14)"  GroupName="MaintenanceLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogOff" runat="server" onClick="SetAlerts(14)"  GroupName="MaintenanceLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbMaintenanceLogAlertOn" runat="server" onClick="SetAlerts(14)" GroupName="MaintenanceLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogAlertOff" runat="server" GroupName="MaintenanceLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Receiving Log</td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogOn" runat="server" onClick="SetAlerts(5)"  GroupName="ReceivingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogOff" runat="server" onClick="SetAlerts(5)"  GroupName="ReceivingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbReceivingLogAlertOn" runat="server" onClick="SetAlerts(5)" GroupName="ReceivingLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogAlertOff" runat="server" GroupName="ReceivingLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Refrigeration Log</td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogOn" runat="server" onClick="SetAlerts(6)"  GroupName="RefrigerationLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogOff" runat="server" onClick="SetAlerts(6)"  GroupName="RefrigerationLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogAlertOn" runat="server" onClick="SetAlerts(6)" GroupName="RefrigerationLogAlert" /></td>
                <td align="center"> <asp:RadioButton ID="rdbRefrigerationLogAlertOff" runat="server" GroupName="RefrigerationLogAlert" /></td>               
                </tr> 
                <tr>
                <td width="200">Shipping Log</td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogOn" runat="server" onClick="SetAlerts(11)"  GroupName="ShippingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogOff" runat="server" onClick="SetAlerts(11)"  GroupName="ShippingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbShippingLogAlertOn" runat="server" onClick="SetAlerts(11)" GroupName="ShippingLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogAlertOff" runat="server" GroupName="ShippingLogAlert" /></td>               
                </tr>
                <tr>
                <td width="200">Thermometer Calibration</td>
                <td align="center"><asp:RadioButton ID="rdbThermometerOn" runat="server" onClick="SetAlerts(8)"  GroupName="Thermometer" /></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerOff" runat="server" onClick="SetAlerts(8)"  GroupName="Thermometer"/></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerAlertOn" runat="server" onClick="SetAlerts(8)" GroupName="ThermometerAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerAlertOff" runat="server" GroupName="ThermometerAlert" /></td>                
                </tr>
                <tr>
                <th width="200" align="left">REPORTS:</th>
                </tr>
                <tr id="pnlFscl" runat="server">
                <td width="200">Food Safety Checklist</td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyOn" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyOff" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyAlertOn" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklistAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyAlertOff" runat="server" GroupName="FoodSafetChecklistAlert" /></td> 
                </tr>                
                <asp:Repeater ID="rptChecklist" runat="server">
                <ItemTemplate>
                <tr>
                <td width="200"><%# Eval("Name")%></td>
                <asp:HiddenField ID="hfKitchenChecklist" runat="server" Value='<%# Eval("CheckListSectionId") %>' />
                <td align="center"><asp:RadioButton ID="rdbChecklistOn" runat="server"  GroupName="Checklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbChecklistOff" runat="server"  GroupName="Checklist" /></td>
                <td align="center"> <asp:RadioButton ID="rdbChecklistAlertOn" runat="server" onClick="SetAlerts(16)" GroupName="ChecklistAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbChecklistAlertOff" runat="server" GroupName="ChecklistAlert" /></td>  
                </tr>
                </ItemTemplate>              
                </asp:Repeater>  
                <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                                    <SelectParameters>                       
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                    </SelectParameters>
                                   </asp:ObjectDataSource>                
                <tr id="pnlValidation" runat="server">
                <td width="200">Validation Checklist</td>
                <td align="center"><asp:RadioButton ID="rdbValidationOn" runat="server" onClick="SetAlerts(9)"  GroupName="Validation" /></td>
                <td align="center"><asp:RadioButton ID="rdbValidationOff" runat="server" onClick="SetAlerts(9)"  GroupName="Validation"/></td>
                <td align="center"><asp:RadioButton ID="rdbValidationAlertOn" runat="server" GroupName="ValidationAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbValidationAlertOff" runat="server" onClick="SetAlerts(9)" GroupName="ValidationAlert" /></td>               
                </tr>               
                </table>
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

