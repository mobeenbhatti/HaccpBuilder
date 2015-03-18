<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_FreezerLog" Title="HACCP Builder | Cooling Temperature Log" Codebehind="FreezerLogOld.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

    <script language="javascript" type="text/javascript" src="../../JScript/overlibmws.js"></script>

    <script language="javascript" type="text/javascript">
        function MoveBack() {
            window.location = "Default.aspx";
        }
        function ClearCorrectiveActions(rdlCorrectiveActions) {
            var collection = document.getElementById(rdlCorrectiveActions).getElementsByTagName('INPUT');
            for (var x = 0; x < collection.length; x++) {

                if (collection[x].checked == true) { // if a button in group is checked,

                    collection[x].checked = false;  // uncheck it
                }
            }
        }
        function SetFoodItem(status) {
            var vldMenuItem = document.getElementById('PlaceHolder_rfvMenuItem');
            var vldIngrdient = document.getElementById('PlaceHolder_rfvIngredient');
            var ddlMenuItem = document.getElementById('PlaceHolder_ddlMenuItem');
            var ddlIngredient = document.getElementById('PlaceHolder_ddlIngredient');
            if (status == 1) {
                ValidatorEnable(vldMenuItem, true);
                ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = false;
                ddlIngredient.disabled = true;

            }
            if (status == 2) {
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldIngrdient, true);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = false;
            }
            if (status == 3) {
                //  ValidatorEnable(vldMenuItem, false);
                //  ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = true;
            }
        }
        function CheckTemperature1(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemp1');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTempHigh.value != 'NA') {
                if (txtTemp1.value != '') {

                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;
                    }
                }
            }
        }
        function CheckTemperature2(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp2 = document.getElementById('PlaceHolder_txtTemp2');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTempHigh.value != 'NA') {
                if (txtTemp2.value != '') {
                    if ((txtTemp2.value < hfTempLow.value || txtTemp2.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;
                    }
                }
            }
        }
        function CheckTemperature3(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp3 = document.getElementById('PlaceHolder_txtTemp3');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (txtTemp3.value != '') {
                if ((txtTemp3.value < hfTempLow.value || txtTemp3.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                    args.IsValid = false;
                }
            }
        }
        function CheckTemperature4(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp4 = document.getElementById('PlaceHolder_txtTemp4');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (txtTemp4.value != '') {
                if ((txtTemp4.value < hfTempLow.value || txtTemp4.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                    args.IsValid = false;
                }
            }
        }
        function CheckTemperature5(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp5 = document.getElementById('PlaceHolder_txtTemp5');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (txtTemp5.value != '') {
                if ((txtTemp5.value < hfTempLow.value || txtTemp5.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                    args.IsValid = false;
                }
            }
        }
        function CheckTemperature6(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp6 = document.getElementById('PlaceHolder_txtTemp6');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (txtTemp6.value != '') {
                if ((txtTemp6.value < hfTempLow.value || txtTemp6.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                    args.IsValid = false;
                }
            }
        }

    </script>

    <div class="bdy_contents">
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Cooling Temperature Log }</div>
            <div class="discp_txt">
                Directions: Record temperatures every hour during the cooling cycle. Record corrective
                actions, if applicable. <b>If no foods are cooled on any working day, indicate "No Ingredient/
                    No Menu Item" in the form. </b>The foodservice manager will verify that the
                foodservice staff is cooling food properly by visually monitoring foodservice employees
                during the shift and reviewing, initialing, and dating this log daily. Maintain
                this log for a minimum of 1 year.
            </div>
        </div>
        <div class="discp_bottom_bg">
            <div class="disc_buttons">
                <asp:ImageButton ID="cmdAddNew" CausesValidation="false" runat="server" OnClick="cmdAddNew_Click"
                    ImageUrl="~/images/buttons/btn_add_new_black.jpg" /></div>
            <div class="disc_buttons">
                <asp:HyperLink ID="hlBack" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" ImageUrl="~/images/buttons/btn_back_to_black.jpg"
                    runat="server"></asp:HyperLink></div>
        </div>
        <%--    <div class="log_heading">
            <div class="red_heading">
                { List of Cooling Temperature Log Entries }</div>
        </div>--%>
        <div class="log_form_left">
            <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/FreezerLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
                        <ItemTemplate>
                            <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("FoodItem").ToString() == "2"? " Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Output">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Input">
                        <ItemTemplate>
                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetFreezerLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreezerLog">
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
                                    Add/Edit Cooling Temperature Log }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading">
                                    <asp:HiddenField ID="hfTempLow" runat="server" />
                                    <asp:HiddenField ID="hfTempHigh" runat="server" />
                                    <asp:HiddenField ID="hfTempLow1" runat="server" />
                                    <asp:HiddenField ID="hfTempHigh1" runat="server" />
                                    <asp:HiddenField ID="hfTempLow2" runat="server" />
                                    <asp:HiddenField ID="hfTempHigh2" runat="server" />
                                    <asp:HiddenField ID="hfTime1" runat="server" />
                                    <asp:HiddenField ID="hfTime2" runat="server" />
                                    <asp:HiddenField ID="hfMobileId" runat="server" />
                                    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" />
                                </td>
                            </tr>
                            <%-- <tr>
                                <td width="138" align="right">
                                    QCL Maximum Temp:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <b>
                                        <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    QCL Minimum Temp:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <b>
                                        <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label></b>
                                </td>
                            </tr>--%>
                            <tr>
                                <td width="138" align="right">
                                    Service Date:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ErrorMessage="Service Date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                                </td>
                            </tr>
                            <%-- <tr>
                                <td align="right">
                                 Food Item:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                  <asp:RadioButton ID="rdbNoItem" Text="No Ingredient/Menu Item" CssClass="log_textbox"
                                        onClick="SetFoodItem(3)" Checked="true" GroupName="FoodItem" runat="server" />
                                </td>
                            </tr>--%>
                            <tr>
                                <td align="right">
                                    Food Item:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdbIngredient" Text="Input" Checked="true" onClick="SetFoodItem(2)"
                                       GroupName="FoodItem" runat="server" /><br />
                                    <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient"
                                        DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Input</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvIngredient" Enabled="false" runat="server" Display="None"
                                        ErrorMessage="Please Select Input" ControlToValidate="ddlIngredient" CssClass="log_textbox"
                                        Font-Names="Verdana" Font-Size="10px" InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(1)"
                                        CssClass="log_textbox" GroupName="FoodItem" runat="server" /><br />
                                    <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="MenuItemId" Width="200px" runat="server" data-editableCombobox="true"
                                        AppendDataBoundItems="false">
                                        <asp:ListItem>Select Output</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None"
                                        ErrorMessage="Please Select Output" ControlToValidate="ddlMenuItem" CssClass="log_textbox"
                                        Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time/Temp 1:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <%--<asp:TextBox ID="tpTime1" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ErrorMessage="Please fill Time/Temp 1 field."
                                        runat="server" Font-Names="Verdana" Font-Size="10px" ControlToValidate="tpTime1"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpTime1"
                                        Display="None" ErrorMessage="The value in field Temp1 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>--%>
                                    <asp:TextBox ID="tpHour1" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
                                    <asp:TextBox ID="tpMinute1" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                                    <asp:DropDownList ID="tpTime1" runat="server" Width="50">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" ErrorMessage="Please fill Time/Temp 1 field."
                                        runat="server" Font-Names="Verdana" Font-Size="10px" ControlToValidate="tpHour1"></asp:RequiredFieldValidator>                                  
                                    <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpHour1"
                                        Display="None" ErrorMessage="The value in field Temp1 Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tpMinute1"
                                        Display="None" ErrorMessage="The value in field Temp1 Minute is not valid."
                                        ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp1" runat="server" MaxLength="8" Width="80px" CssClass="log_textbox"></asp:TextBox>
                                    <img id="Img_helpcoolingTemp1" style="vertical-align: middle" alt="" runat="server"
                                        src="~/App_Themes/Control/images/board_help.gif" />
                                    <asp:RequiredFieldValidator ID="RFV_txtTemp1" Display="None" ErrorMessage="Please fill Internal Temp 1 field."
                                        runat="server" Font-Names="Verdana" Font-Size="10px" ControlToValidate="txtTemp1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemp1" OnServerValidate="ValidateTemp1"
                                        runat="server" ErrorMessage="Please fill Corrective Action field for Time/Temp 1"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemp1"
                                        Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Corrective Action 1:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
                                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                    </asp:RadioButtonList>
                                   
                                    <%--  <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCorrectiveAction" Enabled="false" runat="server"
                                        Display="None" ErrorMessage="Please fill Corrective Action field" ControlToValidate="txtCorrectiveAction"
                                        Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator></textarea>--%>
                                </td>
                            </tr>
                                <tr id="trClearCorrectiveActions" runat="server">
                                <td align="right">
                                    Clear Corrective Action:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkClear" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time/Temp 2:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                </td>
                                <td>
                                   <%-- <asp:TextBox ID="tpTime2" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpTime2"
                                        Display="None" ErrorMessage="The value in field Temp2 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="CV_tpTime2" ControlToValidate="tpTime2" OnServerValidate="ValidateTime2"
                                        runat="server" ErrorMessage="Time/Temp 2 should be greater than or equal to Time/Temp 1"
                                        Display="None"></asp:CustomValidator>--%>
                                    <asp:TextBox ID="tpHour2" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
                                    <asp:TextBox ID="tpMinute2" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                                    <asp:DropDownList ID="tpTime2" runat="server" Width="50">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                    </asp:DropDownList>                                                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpHour2"
                                        Display="None" ErrorMessage="The value in field Temp2 Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tpMinute2"
                                        Display="None" ErrorMessage="The value in field Temp2 Minute is not valid."
                                        ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="CV_tpTime2" ControlToValidate="tpHour2" OnServerValidate="ValidateTime2"
                                        runat="server" ErrorMessage="Time/Temp 2 should be greater than or equal to Time/Temp 1"
                                        Display="None"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp2" runat="server" MaxLength="8" Width="80px" CssClass="log_textbox"></asp:TextBox>
                                    <img id="Img_helpcoolingTemp2" style="vertical-align: middle" alt="" runat="server"
                                        src="~/App_Themes/Control/images/board_help.gif" />
                                    <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTemp2" OnServerValidate="ValidateTemp2"
                                        runat="server" ErrorMessage="Please fill Corrective Action field for Time/Temp 2"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtTemp2"
                                        Display="None" ErrorMessage="The value in field Internal Temp 2 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Corrective Action 2:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:Label ID="Lbl_CorrectiveAction2" runat="server" Visible="false"></asp:Label>
                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction2" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                    </asp:RadioButtonList>
                                     
                                    <%--  <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCorrectiveAction" Enabled="false" runat="server"
                                        Display="None" ErrorMessage="Please fill Corrective Action field" ControlToValidate="txtCorrectiveAction"
                                        Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator></textarea>--%>
                                </td>
                            </tr>
                             <tr id="trClearCorrectiveActions2" runat="server">
                                <td align="right">
                                    Clear Corrective Action:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkClear2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time/Temp 3:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                </td>
                                <td>
                                   <%-- <asp:TextBox ID="tpTime3" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator7" ControlToValidate="txtTemp3" runat="server"
                                        ErrorMessage="Please fill Corrective Action field" Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tpTime3"
                                        Display="None" ErrorMessage="The value in field Temp3 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px">
                                    </asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="CV_tpTime3" ControlToValidate="tpTime3" OnServerValidate="ValidateTime3"
                                        runat="server" ErrorMessage="Time/Temp 3 should be greater than or equal to Time/Temp 2"
                                        Display="None"></asp:CustomValidator>--%>
                                     <asp:TextBox ID="tpHour3" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
                                    <asp:TextBox ID="tpMinute3" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                                    <asp:DropDownList ID="tpTime3" runat="server" Width="50">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tpHour3"
                                        Display="None" ErrorMessage="The value in field Temp2 Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="tpMinute3"
                                        Display="None" ErrorMessage="The value in field Temp2 Minute is not valid."
                                        ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="CustomValidator7" ControlToValidate="txtTemp3" runat="server"
                                        ErrorMessage="Please fill Corrective Action field" Display="None"></asp:CustomValidator>
                                    <asp:CustomValidator ID="CV_tpTime3" ControlToValidate="tpHour3" OnServerValidate="ValidateTime3"
                                        runat="server" ErrorMessage="Time/Temp 3 should be greater than or equal to Time/Temp 2"
                                        Display="None"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp3" Width="80px" MaxLength="8" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <img id="Img_helpcoolingTemp3" style="vertical-align: middle" alt="" runat="server"
                                        src="~/App_Themes/Control/images/board_help.gif" />
                                    <asp:CustomValidator ID="CustomValidator3" ControlToValidate="txtTemp3" OnServerValidate="ValidateTemp3"
                                        runat="server" ErrorMessage="Please fill Corrective Action field for Time/Temp 3"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTemp3"
                                        Display="None" ErrorMessage="The value in field Internal Temp 3 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <%-- <tr>
                                <td align="right">
                                    Time/Temp 4:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tpTime4" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tpTime4"
                                        Display="None" ErrorMessage="The value in field Temp4 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp4" runat="server" MaxLength="8" Width="80px" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator4" ControlToValidate="txtTemp4" OnServerValidate="ValidateTemp4" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for Temp4" Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtTemp4"
                                        Display="None" ErrorMessage="The value in field Internal Temp 4 is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time/Temp 5:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tpTime5" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="tpTime5"
                                        Display="None" ErrorMessage="The value in field Temp5 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp5" runat="server" MaxLength="8" Width="80px" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator5" ControlToValidate="txtTemp5" OnServerValidate="ValidateTemp5" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for Temp5" Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtTemp5"
                                        Display="None" ErrorMessage="The value in field Internal Temp 5 is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time/Temp 6:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tpTime6" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="tpTime2"
                                        Display="None" ErrorMessage="The value in field Temp6 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemp6" runat="server" MaxLength="8" Width="80px" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator6" ControlToValidate="txtTemp6" OnServerValidate="ValidateTemp1" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for Temp6" Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtTemp6"
                                        Display="None" ErrorMessage="The value in field Internal Temp 6 is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>--%>
                            <tr>
                                <td align="right">
                                    Corrective Action 3:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:Label ID="Lbl_CorrectiveAction3" runat="server" Visible="false"></asp:Label>
                                    <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction3" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                    </asp:RadioButtonList>
                                    
                                    <%--  <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCorrectiveAction" Enabled="false" runat="server"
                                        Display="None" ErrorMessage="Please fill Corrective Action field" ControlToValidate="txtCorrectiveAction"
                                        Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator></textarea>--%>
                                </td>
                            </tr>
                             </tr>
                                <tr id="trClearCorrectiveActions3" runat="server">
                                <td align="right">
                                    Clear Corrective Action:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkClear3" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Verified By*:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="log_textbox" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvVerified" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="Please fill Verified By field"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Verified Date:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                        Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                        Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Entry Date:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" cssclass="log_textbox" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" Width="150px" CssClass="log_textbox"></asp:TextBox>
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
                                        OnClick="cmdSubmit_Click" />
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
        <asp:ObjectDataSource ID="odsIngredient" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetIngredientByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsMenuItem" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetMenuItemNewDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <%-- <div class="grey_bg_form">
            <a href="InventoryItemManager.aspx">Terms Of Use</a> <a href="InventoryItemManager.aspx">
                Training Manual</a>
        </div>--%>
        <asp:Label ID="Label2" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
