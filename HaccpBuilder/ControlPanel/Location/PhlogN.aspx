﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="PhlogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.PhlogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Ph Log</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <script lang="javascript" type="text/javascript">
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


    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />
    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />


    <p class="mt30 mb30">
        <strong>Directions: </strong>
        Record item name, time, the pH levels, and any corrective action taken on this form. 
                <b>If no items are testing any working day, indicate "No Ingredient/No Menu Item" in the form. </b>
        The foodservice manager will verify that foodservice employees have taken the required pH level by visually monitoring foodservice employees
                 and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>

    <div class="row mt30">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-dashboard"></i>ph Log
            </div>
            <div class="panel-body">

                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="Lbl_QCLMaxtempValue">QCL Maximum Temp:</label>
                        <asp:TextBox ReadOnly="true" ID="Lbl_QCLMaxtempValue" CssClass="form-control" Text="NA" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-4">
                    <label for="freezer-device">QCL Minimum Temp:</label>
                    <asp:TextBox ReadOnly="true" ID="Lbl_QCLMintempValue" CssClass="form-control" Text="NA" runat="server"></asp:TextBox>



                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="cldMealDate">Today's Date:</label>

                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox CssClass="form-control" runat="server" ID="cldEntryDate"></asp:TextBox>

                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                        <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                            Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>

                    </div>
                </div>



            </div>




        </div>
    </div>

    <div class="row mt30">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-dashboard"></i>Measured Item
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">

                            <label for="ddlIngredient">
                                <asp:RadioButton ID="rdbIngredient" Checked="true" Text="Inputs" CssClass="form-control" onClick="SetFoodItem(2)"
                                    GroupName="FoodItem" runat="server" /></label>
                            <asp:DropDownList ID="ddlIngredient" DataSourceID="odsIngredient" CssClass="form-control"
                                DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true"
                                runat="server">
                                <asp:ListItem>Select Input</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input"
                                ControlToValidate="ddlIngredient" Enabled="false" Font-Names="Verdana"
                                Font-Size="10px" InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">

                            <label for="ddlMenuItem">
                                <asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(3)"
                                    GroupName="FoodItem" runat="server" CssClass="form-control" /></label>
                            <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false" CssClass="form-control"
                                DataTextField="Name" DataValueField="MenuItemId" runat="server" data-editableCombobox="true"
                                AppendDataBoundItems="false">
                                <asp:ListItem>Select Output</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None"
                                ErrorMessage="Please Select Output" ControlToValidate="ddlMenuItem"
                                Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="ddlIngredient">
                                <asp:RadioButton ID="rdbSenitizer" Checked="true" Text="Cleaning Solutions/Sanitizers" onClick="SetFoodItem(1)" CssClass="form-control"
                                    GroupName="FoodItem" runat="server" />
                            </label>
                            <asp:DropDownList ID="ddlSenitizer" DataSourceID="odsSentizerDevice" CssClass="form-control" data-editableCombobox="true"
                                DataTextField="Name" DataValueField="Id" AppendDataBoundItems="false"
                                runat="server">
                                <asp:ListItem>Select Cleaning Solutions/Sanitizers</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSenitizer" runat="server" Display="None" ErrorMessage="Please Select Cleaning Solutions/Sanitizers"
                                ControlToValidate="ddlSenitizer" CssClass="form-control" Enabled="false" Font-Names="Verdana"
                                Font-Size="10px" InitialValue="Select Cleaning Solutions/Sanitizers"></asp:RequiredFieldValidator>s


                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="ddlIngredient">
                                <asp:RadioButton ID="rdbInventory" Text="Equipment Inventory Item" onClick="SetFoodItem(4)"
                                    CssClass="form-control" GroupName="FoodItem" runat="server" />

                                <asp:DropDownList ID="ddlInventory" DataSourceID="odsPhLogKitchenInvetory" Enabled="false" CssClass="form-control"
                                    DataTextField="Name" DataValueField="Id" runat="server" data-editableCombobox="true"
                                    AppendDataBoundItems="false">
                                    <asp:ListItem>Select Equipment Inventory Item</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInventory" Enabled="false" runat="server" Display="None"
                                    ErrorMessage="Please Select Equipment Inventory Item" ControlToValidate="ddlInventory" CssClass="form-control"
                                    Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
                            </label>

                        </div>
                    </div>
                </div>

            </div>




        </div>
    </div>

    <div class="row mt10">
        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>PH Level and Time Recorded
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtPhLevel" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtPhLevel" OnServerValidate="ValidateTemp1"
                                runat="server" ErrorMessage="Please select Corrective Action1 field for pH Level"
                                Display="None"></asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtPhLevel"
                                Display="None" ErrorMessage="The value in field pH Level is not valid.Please enter the value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="PhLevelTime" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-clock-o"></i>
                            </span>
                        </div>
                    </div>
                    <hr />
                    <p>Corrective Actions</p>
                    <ul class="corrective-actions">
                        <li>
                            <label>
                                <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
                                <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="9" Name="nLogTypeId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:RadioButtonList ID="rdlCorrectiveAction1" DataValueField="CorrectiveActionID"
                                    DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                </asp:RadioButtonList>
                            </label>
                        </li>

                    </ul>
                    <hr />
                    <div id="trClearCorrectiveActions" runat="server" class="text-center">
                        <asp:Button runat="server" ID="chkClear" CausesValidation="false" CssClass="btn btn-warning" Text="Clear Corrective Actions" />
                    </div>



                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>Water Temp and Time Recorded
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtWaterTemp" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>


                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtWaterTemp"
                                runat="server" ErrorMessage="Please select Corrective Action2 field for Water Temperature"
                                Display="None"></asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtWaterTemp"
                                Display="None" ErrorMessage="The value in field Water Temperature is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="PhWaterTime" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-clock-o"></i>
                            </span>
                        </div>
                    </div>
                    <hr />
                    <p>Corrective Actions</p>
                    <ul class="corrective-actions">
                        <li>
                            <label>
                                <asp:Label ID="Lbl_CorrectiveAction2" runat="server" Visible="false"></asp:Label>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:RadioButtonList ID="rdlCorrectiveAction2" DataValueField="CorrectiveActionID"
                                    DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                </asp:RadioButtonList>
                            </label>
                        </li>

                    </ul>
                    <hr />
                    <div id="trClearCorrectiveActions2" runat="server" class="text-center">
                        <asp:Button runat="server" ID="chkClear2" CausesValidation="false" CssClass="btn btn-warning" Text="Clear Corrective Actions" />
                    </div>


                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>Minutes Contact and Time Recorded
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtContactMinutes" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>


                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtContactMinutes"
                                Display="None" ErrorMessage="The value in field Contact minutes is not valid.Please enter the value less than 999"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="PhMinutesTime" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-clock-o"></i>
                            </span>
                        </div>
                    </div>
                    <hr />
                    <p>Corrective Actions</p>
                    <ul class="corrective-actions">
                        <li>
                            <label>
                                <asp:Label ID="Lbl_CorrectiveAction3" runat="server" Visible="false"></asp:Label>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:RadioButtonList ID="rdlCorrectiveAction3" DataValueField="CorrectiveActionID"
                                    DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                </asp:RadioButtonList>
                            </label>
                        </li>

                    </ul>
                    <hr />
                    <div id="trClearCorrectiveActions3" runat="server" class="text-center">
                        <asp:Button runat="server" ID="chkClear3" CausesValidation="false" CssClass="btn btn-warning" Text="Clear Corrective Actions" />
                    </div>


                </div>
            </div>
        </div>

    </div>

    <div class="row mt10">
        <div class="panel panel-default plr-15">
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6">
                    <label class="control-label">
                        Lot/Batch Number:
                    </label>

                    <asp:TextBox ID="txtBarch" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    
                </div>
                    <div class="col-sm-6">
                    <label class="control-label">
                        Volume:
                    </label>

                    <asp:TextBox ID="txtVolume" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                   
                </div>

                </div>
                <div class="row">
                <div class="col-sm-3">
                    <label class="mt10">
                        Verified By*:
                    </label>

                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-3">

                    <div class="form-group">
                        <label class="mt10" for="cldVerifiedDate">Verified Date:</label>

                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox CssClass="form-control" runat="server" ID="cldVerifiedDate"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>

                        </div>
                        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                            Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>
                        <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
                            Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                            Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                    </div>


                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="mt10" for="serviceDate">Entry Date </label>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>


                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="margin-top: 34px;">


                    <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-danger" OnClick="cmdDelete_Click" runat="server" />
                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-warning" OnClick="cmdCancel_Click" />
                </div>
                    </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">List of PH Log Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                    <asp:GridView ID="grdPh" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                            <asp:TemplateField HeaderText="Service Date">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/PhLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Category">
                                <ItemTemplate>
                                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("[CategoryName]")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Item Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetPhLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
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
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>

      <script type="text/javascript">
          $(document).ready(function () {
              $('#<%= cldEntryDate.ClientID %>').datepicker({
                  format: "dd/mm/yyyy"
              });

              $('#<%= cldVerifiedDate.ClientID %>').datepicker({
                  format: "dd/mm/yyyy"
              });

              $('#<%= PhLevelTime.ClientID %>').timepicker();
              $('#<%= PhWaterTime.ClientID %>').timepicker
              $('#<%= PhMinutesTime.ClientID %>').timepicker();

          });
    </script>
</asp:Content>