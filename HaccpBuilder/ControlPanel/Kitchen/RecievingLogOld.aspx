<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_RecievingLog" Title="HACCP Builder | Receiving Log" Codebehind="RecievingLogOld.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">
<style>
.brd td
{
    border-bottom:1px dotted #777777;
    padding:6px;
}
</style>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            //data: { IngredientId: IngredientId },
            $("#PlaceHolder_ddlIngredient").on('BindVendors', function () {
                var Id = $(this).val();
                var sendInfo = { IngredientId: Id };
                var dataJsonString = JSON.stringify(sendInfo);
                $.ajax({
                    url: 'RecievingLog.aspx/GetVendor',
                    type: 'post',
                    data: dataJsonString,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        // $.each(data.data.variants, function (i, variant) {
                        //                            $states.append($('<option/>').text(variant.Name).attr('value', variant.Id));
                        // });
                        $('#PlaceHolder_dvVendor').text(response.d);
                       
                    },
                    error: function () {
                        alert('Error');
                    }
                });
            });
        });
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

            // var vldMenuItem = document.getElementById('PlaceHolder_rfvMenuItem');
            var vldIngrdient = document.getElementById('PlaceHolder_rfvIngredient');
            // var ddlMenuItem = document.getElementById('PlaceHolder_ddlMenuItem');
            var ddlIngredient = document.getElementById('PlaceHolder_ddlIngredient');

            if (status == 1) {
                //  ValidatorEnable(vldMenuItem, true);
                //  ValidatorEnable(vldIngrdient, false);
                //  ddlMenuItem.disabled = false;
                ddlIngredient.disabled = true;
                ddlIngredient.selectedIndex = 0

            }
            if (status == 2) {
                //   ValidatorEnable(vldMenuItem, false);
                // ValidatorEnable(vldIngrdient, true);
                //    ddlMenuItem.disabled = true;

                ddlIngredient.disabled = false;
            }
            if (status == 3) {
                //    ValidatorEnable(vldMenuItem, false);
                // ValidatorEnable(vldIngrdient, false);
                //    ddlMenuItem.disabled = true;
                ddlIngredient.selectedIndex = 0
                ddlIngredient.disabled = true;
            }
        }
        function CheckTemperature(sender, args) {
            var CorrectiveActionStatus = false;
            var rdlCorrectiveActions = document.getElementById('PlaceHolder_rdlCorrectiveAction1');
            var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemperature');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            //var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');
            var collection = rdlCorrectiveActions.getElementsByTagName('INPUT');
            for (var x = 0; x < collection.length; x++) {

                if (collection[x].checked == true) { // if a button in group is checked,

                    CorrectiveActionStatus = true;    // uncheck it
                }
            }
            if (hfTempHigh.value != 'NA') {
                if (txtTemp1.value != '' && CorrectiveActionStatus == false) {
                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) ) {
                        // ValidatorEnable(vldMenuItem, true);
                        args.IsValid = false;
                    }
                }
            }
        }
        function ValidatePage() {
            var validSummary = document.getElementById("<%=vldSummary.ClientID %>");
            var erroMsg = '';
            var valid = true;
            var txtTemp = document.getElementById("<%= txtTemperature.ClientID %>");
            var txtBatch = document.getElementById("<%= txtBatch.ClientID %>");

            if (txtTemp.value.length > 10) {
                erroMsg = erroMsg + "The value in field Internal Temp1 is not valid. <BR>";
                valid = false;
            }
            if (txtBatch.value.length > 10) {
                erroMsg = erroMsg + "The value in field Batch No. is not valid. <BR>";
                valid = false;
            }
            if (valid == false) {
                validSummary.innerHTML = erroMsg;
                validSummary.style.display = "";
                return true;
            }
            if (valid == true) {
                validSummary.innerHTML = '';
                return true;
            }


        }


    </script>

    <div class="bdy_contents">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Receiving Log }</div>
            <div class="discp_txt">
                Directions: Use this Log for deliveries or receiving foods. Record any temperatures
                and corrective action taken on the Receiving Log. <b>If no foods are received on any
                    working day, indicate "No Ingredient/No Menu Item" in the form. </b>The foodservice
                manager will verify that foodservice employees are receiving products using the
                proper procedure by visually monitoring foodservice employees and receiving practices
                during the shift and reviewing the log daily. Maintain this log for a minimum of
                1 year.
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
                { List of Receiving Log Entries }</div>
        </div>
         <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>--%>
        <div class="log_form_left">
            <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                DataSourceID="ObjectDataSource1" AllowPaging="True" 
                onrowcommand="grdHotHolding_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%--<asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/RecievingLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>--%>
                            <asp:LinkButton ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                                 CommandName="Receiving" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Vendor" HeaderText="Vendor" ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" />                   
                    <asp:TemplateField HeaderText="Input">
                        <ItemTemplate>
                            <asp:Label ID="lblIngredient" runat="server" Text='<%#Eval("FoodItem").ToString() == "3"?"No Ingredient/Menu Item":DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetReceivingLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetReceivingLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="content_right">
            <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view brd">
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
                                    Add/Edit Receiving Log }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading">
                                    <asp:HiddenField ID="hfTempLow" runat="server" />
                                    <asp:HiddenField ID="hfTempHigh" runat="server" />
                                    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:HiddenField ID="hfMobileId" runat="server" />
                                    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" ValidationGroup="ReceivingLog" />
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
                                    <ew:CalendarPopup ID="cldMealDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate"
                                        Display="None" ErrorMessage="Service Date should not be future date" Operator="LessThanEqual"
                                        Type="Date" ValidationGroup="ReceivingLog"></asp:CompareValidator>
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
                            <asp:UpdatePanel ID="upIngredient" runat="server" Visible>
                                <ContentTemplate>
                                    <tr>
                                        <td align="right">
                                            <%--&nbsp;--%>
                                             Food Item:
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbIngredient" Text="Input" onClick="SetFoodItem(2)" CssClass="log_textbox"
                                                GroupName="FoodItem" runat="server" /><br />
                                            <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient" CssClass="log_textbox"
                                                Enabled="false" DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true"
                                                runat="server" AutoPostBack="True">
                                                <asp:ListItem>Select Input</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input"
                                                ControlToValidate="ddlIngredient" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                                                Font-Size="10px" InitialValue="Select Input" ValidationGroup="ReceivingLog"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Vendor
                                        </td>
                                        <td>
                                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                        </td>
                                        <td> 
                                        <div id="dvVendor" runat="server"></div>                                     
                                        <%--<div style=" position:absolute; z-index:200; background: url('../../images/olverLay2.png') no-repeat; height:25px; width:190px; margin-top:-12px; " ></div> 
                                        <div style="position:absolute; z-index:100; margin-top:-12px;">  
                                            <asp:DropDownList ID="ddlVendor" runat="server" Width="200px" DataSourceID="odsVendor"
                                                DataTextField="VendorName" DataValueField="VendorID" AppendDataBoundItems="false" data-editableCombobox="true"
                                                Enabled="False">
                                               <%-- <asp:ListItem>Select Vendor</asp:ListItem>--%>
                                           <%-- </asp:DropDownList>
                                        </div> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="false" runat="server"
                                                Display="None" InitialValue="Select Vendor" ErrorMessage="The value in field Vendor Name is required"
                                                ControlToValidate="ddlVendor" Font-Names="Verdana" Font-Size="10px" ValidationGroup="ReceivingLog"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <tr>
                                <td align="right">
                                    Temperature Not Required:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkTempRequired" OnCheckedChanged="chkTempRequired_CheckedChanged"
                                        AutoPostBack="true" Checked="false" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Temperature:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTemperature" Enabled="true" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="csvRwmperature" ControlToValidate="txtTemperature" ErrorMessage="Please select Corrective Action field" Display="None" 
                                    runat="server" ClientValidationFunction="CheckTemperature" ></asp:CustomValidator>
                                   <%-- <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" OnServerValidate="ValidateTemp"
                                        runat="server" ErrorMessage="Please select Corrective Action field" Display="None" Enabled="true" ></asp:CustomValidator>--%>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
                                        Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$" ValidationGroup="ReceivingLog"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Temperatur Time:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <%--<asp:TextBox ID="tpTime" Enabled="true" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpTime"
                                        Display="None" ErrorMessage="The value in field Temp1 Time is not valid. Use the following format: hh:mm AM/PM."
                                        ValidationExpression="^([0]?[1-9]|[1][0-2]):([0-5][0-9]|[1-9]) [AP]M$" Font-Names="Verdana"
                                        Font-Size="10px" ValidationGroup="ReceivingLog"></asp:RegularExpressionValidator>--%>
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
                                    Batch No.:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBatch" runat="server" MaxLength="50" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBatch"
                                        Display="None" ErrorMessage="The value in field Batch No. is not valid." Font-Names="Verdana"
                                        Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,50}$" ValidationGroup="ReceivingLog"></asp:RegularExpressionValidator>
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
                                    <asp:TextBox ID="txtVolume" runat="server" MaxLength="10" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtVolume"
                                        Display="None" ErrorMessage="The value in field Volume is not valid." Font-Names="Verdana"
                                        Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,10}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Corrective Action:
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
                                            <asp:Parameter DefaultValue="4" Name="nLogTypeId" Type="Int32" />
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
                            <%--<tr>
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
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="log_textbox" ></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="rfvVerified" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="Please fill Verified By field" ValidationGroup="ReceivingLog"></asp:RequiredFieldValidator>
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
                                        Type="Date" ValidationGroup="ReceivingLog"></asp:CompareValidator>
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldMealDate"
                                        Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                        Operator="LessThanEqual" Type="Date" ValidationGroup="ReceivingLog"></asp:CompareValidator>
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
                                        OnClick="cmdSubmit_Click" ValidationGroup="ReceivingLog"/>
                                    <asp:ImageButton ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click"
                                        runat="server" ImageUrl="~/images/buttons/ButtonDelete.png" />
                                    <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png"
                                        OnClick="cmdAdd_Click" ValidationGroup="ReceivingLog"/>
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
       <%-- </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
         <ProgressTemplate>                     
         <div id="progress">
             <img src="../../images/buttons/ajax-loader1.gif" alt="" />
         </div>                    
         </ProgressTemplate>
         </asp:UpdateProgress>--%>
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
        <asp:ObjectDataSource ID="odsVendor" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetVendorByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
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
