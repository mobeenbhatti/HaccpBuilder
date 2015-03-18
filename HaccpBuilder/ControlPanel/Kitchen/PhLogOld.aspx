<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_PhLog" Title="HACCP Builder | Ph Time & Temperature Log" Codebehind="PhLogOld.aspx.cs" %>

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

            var vldSenitizer = document.getElementById('PlaceHolder_rfvSenitizer');
            var vldIngrdient = document.getElementById('PlaceHolder_rfvIngredient');
            var vldMenuItem = document.getElementById('PlaceHolder_rfvMenuItem');   
            var vldInventory = document.getElementById('PlaceHolder_rfvInventory');

            var ddlMenuItem = document.getElementById('PlaceHolder_ddlMenuItem');
            var ddlIngredient = document.getElementById('PlaceHolder_ddlIngredient');
            var ddlsenitizer = document.getElementById('PlaceHolder_ddlSenitizer');
            var ddlInventory = document.getElementById('PlaceHolder_ddlInventory');
           // Senitizers
            if (status == 1) {

                ValidatorEnable(vldSenitizer, true);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = false;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = true;
                ddlsenitizer.selectedIndex = 0

            }
            // Ingredients
            if (status == 2) {

                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, true);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = false;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = true;
                ddlIngredient.selectedIndex = 0
            }
            // Menu Items
            if (status == 3) {
                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, true);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = false;
                ddlInventory.disabled = true;
                ddlMenuItem.selectedIndex = 0
            }
            // Inventory
            if (status == 4) {

                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, true);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = false;
                ddlInventory.selectedIndex = 0

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
    </script>

    <div class="bdy_contents">
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Ph Log }</div>
            <div class="discp_txt">
                Directions: Record item name, time, the pH levels, and any corrective action taken on this form. 
                <b>If no items are testing any working day, indicate "No Ingredient/No Menu Item" in the form. </b>
                The foodservice manager will verify that foodservice employees have taken the required pH level by visually monitoring foodservice employees
                 and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
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
        <div class="log_heading">
            <div class="red_heading">
                { List of pH Log Entries }</div>
        </div>
        <div class="log_form_left">
            <asp:GridView ID="grdPh" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/PhLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
                        <ItemTemplate>
                            <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("[CategoryName]")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
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
                SelectMethod="GetPhLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
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
                                    Add/Edit pH Log }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading">
                                    <asp:HiddenField ID="hfTempLow" runat="server" />
                                    <asp:HiddenField ID="hfTempHigh" runat="server" />
                                    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:HiddenField ID="hfMobileId" runat="server" />
                                    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" />
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    QCL Maximum pH Level:
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
                                    QCL Minimum pH Level:
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
                                 <%-- &nbsp;--%>
                                   Measured Item:
                                </td><td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                            <td>&nbsp;</td>
                                <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdbSenitizer" Checked="true" Text="Cleaning Solutions/Sanitizers" onClick="SetFoodItem(1)" CssClass="log_textbox"
                                        GroupName="FoodItem" runat="server" />                                   
                                    <asp:DropDownList ID="ddlSenitizer" Width="200px" DataSourceID="odsSentizerDevice" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="Id" AppendDataBoundItems="false" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Cleaning Solutions/Sanitizers</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSenitizer" runat="server" Display="None" ErrorMessage="Please Select Cleaning Solutions/Sanitizers"
                                        ControlToValidate="ddlSenitizer" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                                        Font-Size="10px" InitialValue="Select Cleaning Solutions/Sanitizers"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdbIngredient"  Text="Inputs" onClick="SetFoodItem(2)" CssClass="log_textbox"
                                        GroupName="FoodItem" runat="server" /><br />
                                    <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient" CssClass="log_textbox"
                                      DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Input</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input"
                                        ControlToValidate="ddlIngredient" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                                        Font-Size="10px" InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
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
                                    <asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(3)"
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
                                    &nbsp;
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdbInventory" Text="Equipment Inventory Item" onClick="SetFoodItem(4)"
                                        CssClass="log_textbox" GroupName="FoodItem" runat="server" />
                                    <asp:DropDownList ID="ddlInventory" DataSourceID="odsPhLogKitchenInvetory" Enabled="false" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="Id" Width="200px" runat="server" data-editableCombobox="true"
                                        AppendDataBoundItems="false">
                                        <asp:ListItem>Select Equipment Inventory Item</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvInventory" Enabled="false" runat="server" Display="None"
                                        ErrorMessage="Please Select Equipment Inventory Item" ControlToValidate="ddlInventory" CssClass="log_textbox"
                                        Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Lot/Batch Number:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBarch" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>                                   
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Volume:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVolume" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>                                   
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    pH Level Recorded:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhLevel" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtPhLevel" OnServerValidate="ValidateTemp1"
                                        runat="server" ErrorMessage="Please select Corrective Action1 field for pH Level"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtPhLevel"
                                        Display="None" ErrorMessage="The value in field pH Level is not valid.Please enter the value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time of pH Record:
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
                                        Display="None" ErrorMessage="The value in field pH record Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tpMinute1"
                                        Display="None" ErrorMessage="The value in field pH record  Minute is not valid."
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
                                            <asp:Parameter DefaultValue="9" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
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
                                    Water Temperature Recorded:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtWaterTemp" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtWaterTemp" 
                                        runat="server" ErrorMessage="Please select Corrective Action2 field for Water Temperature"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtWaterTemp"
                                        Display="None" ErrorMessage="The value in field Water Temperature is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Time of Temperature Record:
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
                                        Display="None" ErrorMessage="The value in field Water Temp Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tpMinute2"
                                        Display="None" ErrorMessage="The value in field Water Temp Minute is not valid."
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
                                            <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction2" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
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
                                    Minutes in Contact:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContactMinutes" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtContactMinutes"
                                        Display="None" ErrorMessage="The value in field Contact minutes is not valid.Please enter the value less than 999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Temp 3 Time:
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
                                    <asp:TextBox ID="tpHour3" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
                                    <asp:TextBox ID="tpMinute3" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                                    <asp:DropDownList ID="tpTime3" runat="server" Width="50">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                    </asp:DropDownList>                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tpHour3"
                                        Display="None" ErrorMessage="The value in field Temp2 Hour is not valid. Please enter value les then or equal to 12"
                                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                                        Font-Size="10px"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="tpMinute3"
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
                                    <asp:Label ID="Lbl_CorrectiveAction3" runat="server" Visible="false"></asp:Label>
                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction3" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                    </asp:RadioButtonList>
                                     
                                </td>
                            </tr>
                              <tr id="tr1" runat="server">
                                <td align="right">
                                    Clear Corrective Action:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </td>
                            </tr>
                            <%-- <tr>
                  <td align="right">Corrective Action:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" runat="server" CssClass="log_textbox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvCorrectiveAction" Enabled="false" runat="server" Display="None" 
                             ErrorMessage="Please fill Corrective Action field" ControlToValidate="txtCorrectiveAction"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator></textarea></td>
                </tr>--%>
                            <tr>
                                <td align="right">
                                    Verified By*:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="50" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="10" CssClass="log_textbox" ></asp:TextBox>
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
         <asp:ObjectDataSource ID="odsSentizerDevice" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPhLogSentizers" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
         <asp:ObjectDataSource ID="odsPhLogKitchenInvetory" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPhLogKitchenInventory" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
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
