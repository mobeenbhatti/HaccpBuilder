<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" Inherits="ControlPanel_Location_HotHoldingLog" Title="HACCP Builder | Hot Holding Time & Temperature Log" Codebehind="HotHoldingLog.aspx.cs" %>

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

                ValidatorEnable(vldMenuItem, true);
                ValidatorEnable(vldIngrdient, false);                
                ddlMenuItem.disabled = false;
                ddlIngredient.disabled = true;
                ddlIngredient.selectedIndex = 0

            }
            if (status == 2) {

                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldIngrdient, true);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = false;
                ddlMenuItem.selectedIndex = 0
            }
            if (status == 3) {
                //        ValidatorEnable(vldMenuItem, false);
                //         ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = true;
                ddlIngredient.disabled = true;
                ddlMenuItem.selectedIndex = 0
                ddlIngredient.selectedIndex = 0
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
     <h3>Hot Holding Time & Temperature Log</h3>
   
    <div class="clear tenpx"></div>
    
    <p> Directions: Record product name, time, the two temperatures/times, and any corrective
                action taken on this form. <b>If no foods are hot held on any working day, indicate
                    "No Ingredient/No Menu Item" in the form.</b> The foodservice manager will verify
                that foodservice employees have taken the required cooking temperatures by visually
                monitoring foodservice employees and preparation procedures during the shift and
                reviewing, initialing, and dating this log daily. Maintain this log for a minimum
                of 1 year.</p>
   
    <div class="row">
    <!------------- INPUT FORM --------------->
    <div class="col-lg-6 col-md-6 portfolio-ite">
        <div class=".form-horizontal">  
            <div class="control-group">
               <asp:HiddenField ID="hfTempLow" runat="server" />
                <asp:HiddenField ID="hfTempHigh" runat="server" />
                <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                <asp:HiddenField ID="hfMobileId" runat="server" />
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="alert alert-danger"
                    Enabled="true" />
            </div>      
            <div class="control-group">
                <label class="control-label" for="inputEmail">QCL Maximum Temp:</label>
                <div class="controls">
                <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">QCL Minimum Temp:</label>
                <div class="controls">
                <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label>
                </div>
            </div>
             <div class="control-group">
                <label class="control-label" for="inputEmail">Service Date:</label>
                <div class="controls">
                <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                    Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                    Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Food Item:</label>
                <div class="controls">
                <asp:RadioButton ID="rdbIngredient" Checked="true" Text="Inputs" onClick="SetFoodItem(2)" CssClass="log_textbox"
                                        GroupName="FoodItem" runat="server" /><br />
                                    <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient" CssClass="log_textbox"
                                      DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Input</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input"
                                        ControlToValidate="ddlIngredient" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
                                        Font-Size="10px" InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
                </div>
                <div class="controls">
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
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Internal Temp 1:</label>
                <div class="controls">
                <asp:TextBox ID="txtTemp1" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemp1" OnServerValidate="ValidateTemp1"
                    runat="server" ErrorMessage="Please select Corrective Action1 field for Temp1"
                    Display="None"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemp1"
                    Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                    Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Temp 1 Time:</label>
                <div class="controls">
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
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Corrective Action 1:</label>
                <div class="controls">
                 <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
                <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                    <SelectParameters>
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                        <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                    DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                </asp:RadioButtonList>
                </div>
            </div>
            <div class="control-group" id="trClearCorrectiveActions" runat="server">
                <label class="control-label" for="inputEmail">Clear Corrective Action:</label>
                <div class="controls">
                <asp:CheckBox ID="chkClear" runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail"> Internal Temp 2:</label>
                <div class="controls">
                <asp:TextBox ID="txtTemp2" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTemp2" OnServerValidate="ValidateTemp2"
                    runat="server" ErrorMessage="Please select Corrective Action2 field for Temp2"
                    Display="None"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtTemp2"
                    Display="None" ErrorMessage="The value in field Internal Temp 2 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                    Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Temp 2 Time:</label>
                <div class="controls">
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
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Corrective Action 2:</label>
                <div class="controls">
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
                </div>
            </div>
            <div class="control-group" id="trClearCorrectiveActions2" runat="server">
                <label class="control-label" for="inputEmail">Clear Corrective Action:</label>
                <div class="controls">
                <asp:CheckBox ID="chkClear2" runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Verified By*:</label>
                <div class="controls">
                <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="log_textbox"></asp:TextBox>
                                   <%-- <asp:RequiredFieldValidator ID="rfvVerified" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="Please fill Verified By field"></asp:RequiredFieldValidator>--%>
                                     <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Verified Date:</label>
                <div class="controls">
                <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                        Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                        Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Entry Date:</label>
                <div class="controls">
                <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" Width="150px" CssClass="log_textbox"></asp:TextBox>
                </div>
            </div>
            <div class="tenpx"></div>
            <div class="control-group">
                <div class="controls">
                <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-primary" OnClick="cmdDelete_Click" runat="server"/>
                <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-default" OnClick="cmdCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="tenpx"></div>
    <!------------ GRID ---------------->
    <div class="col-lg-6 col-md-6 col-xs-12 portfolio-ite">
       <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin" CssClass="table table-striped table-hover"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" />                   
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/HotHoldingLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
                        <ItemTemplate>
                            <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("FoodItem").ToString() == "2"? " Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Output">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Input">
                        <ItemTemplate>
                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
      </div>
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetHotHoldingLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetHotHoldingLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource> 
    <asp:Label ID="Label2" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
