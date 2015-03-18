<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_CookingTemperature"
    Title="HACCP Builder | Cooking & Reheating Temperature Log" Codebehind="TemperatureLogOld.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

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
                // ValidatorEnable(vldMenuItem, true);
                // ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = false;
                ddlIngredient.disabled = true;
                ddlIngredient.selectedIndex = 0
            }
            if (status == 2) {
                // ValidatorEnable(vldMenuItem, false);
                //  ValidatorEnable(vldIngrdient, true);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = false;
            }
            if (status == 3) {
                // ValidatorEnable(vldMenuItem, false);
                //  ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = true;
                ddlIngredient.selectedIndex = 0
            }
        }
        function CheckTemperature() {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');


            var txtTemp1 = document.getElementById("<%= txtTemp1.ClientID %>").value;
            var txtTemp2 = document.getElementById("<%= txtTemp2.ClientID %>").value;
            var hfTempLow = document.getElementById("<%= hfTempLow.ClientID %>").value;

            var hfTempHigh = document.getElementById("<%= hfTempHigh.ClientID %>").value;

            var ddlCorrectiveAction1 = document.getElementById("<%= rdlCorrectiveAction1.ClientID %>");
            var radio1 = ddlCorrectiveAction1.getElementsByTagName("input");
            var ddlCorrectiveAction2 = document.getElementById("<%= rdlCorrectiveAction2.ClientID %>");
            var radio2 = ddlCorrectiveAction2.getElementsByTagName("input");
            var validSummary = document.getElementById("<%=vldSummary.ClientID %>");
            var erroMsg = '';
            var valid = true;
            var nStatus = 0;
            var temp1 = 0;
            var temp2 = 0;
            ////////////////////////
            // FOR LOW TEMP
            ///////////////////////

            if (hfTempLow.length > 0) {
                if (hfTempLow.trim() != 'NA') {
                    if (txtTemp1.trim() != '') {
                        if (txtTemp1 < hfTempLow) {
                            for (var j = 0; j < radio1.length; j++) {
                                if (radio1[j].checked) {
                                    nStatus = 1;
                                }
                            }
                            if (nStatus == 0) {
                                valid = false;
                                erroMsg = erroMsg + "• C1 - Please select Corrective Action for Temp1 field <BR>";
                                temp1 = 1;
                            }
                        }
                    }
                    status = 0;
                    if (txtTemp2.trim() != '') {
                        if (txtTemp2 < hfTempLow) {

                            for (var j = 0; j < radio2.length; j++) {
                                if (radio2[j].checked)
                                    nStatus = 1;
                            }
                            if (nStatus == 0) {
                                valid = false;
                                erroMsg = erroMsg + "• C1 - Please select Corrective Action for Temp2 field <BR>";
                                var temp2 = 1;
                            }
                        }
                    }
                }
            }
            ///////////////////////
            // FOR HIGH TEMP
            //////////////////////

            status = 0;
            if (hfTempHigh.length > 0) {
                if (hfTempHigh.trim() != 'NA') {
                    if (txtTemp1.trim() != '') {
                        if (txtTemp1 > hfTempHigh) {

                            for (var j = 0; j < radio1.length; j++) {
                                if (radio1[j].checked)
                                    nStatus = 1;
                            }
                            if (nStatus == 0) {
                                valid = false;
                                if (temp1 == 0)
                                    erroMsg = erroMsg + "• C2- Please select Corrective Action for Temp1 field <BR>";
                            }
                        }
                    }
                    nStatus = 0;
                    if (txtTemp2.trim() != '') {
                        if (txtTemp2 > hfTempHigh) {

                            for (var j = 0; j < radio2.length; j++) {
                                if (radio2[j].checked)
                                    nStatus = 1;
                            }
                            if (nStatus == 0) {
                                valid = false;
                                if (temp2 == 0)
                                    erroMsg = erroMsg + "• C2 - Please select Corrective Action for Temp2 field <BR>";
                            }
                        }
                    }
                }
            }

            if (valid == false) {
                validSummary.innerHTML = erroMsg;
                validSummary.style.display = "";
                return false;
            }
            else {
                validSummary.innerHTML = '';
                return true;
            }
        }
        function CheckTemperature1(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemp1');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');
            var nStatus = 0;

            if (hfTempHigh.value != 'NA') {
                if (txtTemp1.value != '') {

                    if (txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) {
                        var radio = document.getElementsByName("<%= rdlCorrectiveAction1.ClientID %>");

                        for (var j = 0; j < radio.length; j++) {

                            if (radio[j].checked)

                                nStatus = 1;

                        }
                        if (nStatus = 0) {

                            args.IsValid = false;
                        }
                    }
                }
            }
        }
    </script>

    <div class="bdy_contents">
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Cooking & Reheating Temperature Log }</div>
            <div class="discp_txt">
                Directions: Record product name, time, the two temperatures/times, and any corrective
                action taken on this form. <b>If no foods are cooked on any working day, indicate "No
                    Ingredient/No Menu Item" in the form.</b> The foodservice manager will verify
                that foodservice employees have taken the required cooking temperatures by visually
                monitoring foodservice employees and preparation procedures during the shift and
                reviewing, initialing, and dating this log daily. Maintain this log for a minimum
                of 1 year.
            </div>
        </div>
        <div class="discp_bottom_bg">
            <div class="disc_buttons">
                <asp:ImageButton ID="cmdAddNew" runat="server" CausesValidation="false" OnClick="cmdCancel_Click"
                    ImageUrl="~/images/buttons/btn_add_new_black.jpg" /></div>
            <div class="disc_buttons">
                <asp:HyperLink ID="hlBack" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" ImageUrl="~/images/buttons/btn_back_to_black.jpg"
                    runat="server"></asp:HyperLink></div>
        </div>
        <div class="log_heading">
            <div class="red_heading">
                { List of Temperature Log Entries }</div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/TemperatureLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
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
                            <asp:TemplateField HeaderText=" Output">
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
                        SelectMethod="GetTemperatureLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetTemperatureLog">
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
                                            Add/Edit Temperature Log }
                                        </td>
                                    </tr>
                                    <tr align="right">
                                        <td colspan="3" class="red_heading" align="left">
                                            <asp:Label ID="lblError" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="red_heading">
                                            <asp:HiddenField ID="hfTempLow" runat="server" />
                                            <asp:HiddenField ID="hfTempHigh" runat="server" />
                                            <asp:HiddenField ID="hfMobileId" runat="server" />
                                            <asp:Label ForeColor="Red" ID="LogError" runat="server" Text=""></asp:Label>
                                            <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                                Enabled="true" />
                                        </td>
                                    </tr>
                                    <tr>
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
                                    </tr>
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
                                    <tr>
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
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbIngredient" Text="Input" onClick="SetFoodItem(2)" CssClass="log_textbox"
                                                GroupName="FoodItem" runat="server" />
                                            <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient" AutoPostBack="true"
                                                CssClass="log_textbox" Enabled="false" DataTextField="Name" DataValueField="IngredientId"
                                                AppendDataBoundItems="false" runat="server" EnableViewState="true" OnSelectedIndexChanged="ddlIngredient_SelectedIndexChanged">
                                                <asp:ListItem Value="-1">Select Input</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input"
                                                ControlToValidate="ddlIngredient" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                                                Font-Size="10px" InitialValue="Select Input"></asp:RequiredFieldValidator>
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
                                                CssClass="log_textbox" GroupName="FoodItem" runat="server" />
                                            <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false" CssClass="log_textbox"
                                                DataTextField="Name" DataValueField="MenuItemId" Width="200px" runat="server"
                                                AppendDataBoundItems="false">
                                                <asp:ListItem>Select Output</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None"
                                                ErrorMessage="Please Select Menu Item" ControlToValidate="ddlMenuItem" CssClass="log_textbox"
                                                Font-Names="Verdana" Font-Size="10px" InitialValue="Select Output"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Internal Temp 1:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTemp1" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemp1" OnServerValidate="ValidateTemp1"
                                                runat="server" ErrorMessage="Please select Corrective Action1 field for Temp1"
                                                Display="None"></asp:CustomValidator>
                                            <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemp1"
                                                Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Temp 1 Time:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <%--<asp:TextBox ID="tpTime1" runat="server" CssClass="log_textbox"></asp:TextBox>
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
                                            <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpHour1"
                                            Display="None" ErrorMessage="The value in field Temp1 Hour is not valid. Please enter value les then or equal to 12"
                                            ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                            Font-Size="10px"></asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tpMinute1"
                                            Display="None" ErrorMessage="The value in field Temp1 Minute is not valid."
                                            ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                                            Font-Size="10px"></asp:RegularExpressionValidator>
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
                                            <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                    <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                                DataTextField="Name" runat="server">
                                            </asp:RadioButtonList>
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
                                            Internal Temp 2:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTemp2" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTemp2" OnServerValidate="ValidateTemp2"
                                                runat="server" ErrorMessage="Please select Corrective Action2 field for Temp2"
                                                Display="None"></asp:CustomValidator>
                                            <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtTemp2"
                                                Display="None" ErrorMessage="The value in field Internal Temp 2 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Temp 2 Time:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                        </td>
                                        <td>
                                            <%--<asp:TextBox ID="tpTime2" runat="server" CssClass="log_textbox"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpTime2"
                                                Display="None" ErrorMessage="The value in field Temp2 Time is not valid. Use the following format: hh:mm AM/PM."
                                                ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                                Font-Size="10px"></asp:RegularExpressionValidator>--%>
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
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tpMinute2"
                                                Display="None" ErrorMessage="The value in field Temp2 Minute is not valid."
                                                ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                                                Font-Size="10px"></asp:RegularExpressionValidator>
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
                                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                    <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:RadioButtonList ID="rdlCorrectiveAction2" Width="200px" DataValueField="CorrectiveActionID"
                                                DataTextField="Name" runat="server">
                                            </asp:RadioButtonList>
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
                                            Lot/Batch No:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBatchNo" runat="server" MaxLength="50" CssClass="log_textbox" ></asp:TextBox>                                            
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBatchNo"
                                                Display="None" ErrorMessage="The value in field 'Lot/Batch No' is not valid."
                                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
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
                                            <asp:ImageButton ID="cmdCancel" runat="server" ImageUrl="~/images/buttons/ButtonCancel.png"
                                                CausesValidation="false" OnClick="cmdCancel_Click" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updProgress" runat="server" Visible="true" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div id="Logprogress">
                    <img src="../../images/buttons/ajax-loader1.gif" alt="" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
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
