<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="FreezerLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.FreezerLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Cooling Temperature Log</h1>
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

   <%-- <p class="mt30 mb30">
        <strong>Drirections: </strong>
        Record temperatures every hour during the cooling cycle. Record corrective actions, if applicable. If no foods are cooled on any working day, indicate 'No Ingredient/No Menu Item' in the form. The foodservice manager will verify that the foodservice staff is cooling food properly by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>--%>

    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />
    <asp:HiddenField ID="hfTempLow1" runat="server" />
    <asp:HiddenField ID="hfTempHigh1" runat="server" />
    <asp:HiddenField ID="hfTempLow2" runat="server" />
    <asp:HiddenField ID="hfTempHigh2" runat="server" />
    <asp:HiddenField ID="hfTime1" runat="server" />
    <asp:HiddenField ID="hfTime2" runat="server" />
    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text="" ></asp:Label>

    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />


    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
               
                 <a href="#" data-toggle="tooltip" title="Drirections: Record temperatures every hour during the cooling cycle. Record corrective actions, if applicable. If no foods are cooled on any working day, indicate 'No Ingredient/No Menu Item' in the form. The foodservice manager will verify that the foodservice staff is cooling food properly by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.">
                <i class="fa fa-dashboard cw"></i></a>
               Cooling Temperature Log
            </div>
            <div class="panel-body">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="cldMealDate">Service Date:</label>

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
                <i class="fa fa-dashboard"></i>Food Items
            </div>
            <div class="panel-body">

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
                            <asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(1)"
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




        </div>
    </div>



    <div class="row mt10">
        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>Internal Temp 1 and Temp 1 Time
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemp1" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemp1" OnServerValidate="ValidateTemp1"
                                runat="server" ErrorMessage="Please select Corrective Action1 field for Temp1"
                                Display="None"></asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemp1"
                                Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="tempratureTime1" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

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
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
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
                    <i class="fa fa-info"></i>Internal Temp 2 and Temp 2 Time
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemp2" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTemp2" OnServerValidate="ValidateTemp2"
                                runat="server" ErrorMessage="Please select Corrective Action2 field for Temp2"
                                Display="None"></asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtTemp2"
                                Display="None" ErrorMessage="The value in field Internal Temp 2 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="tempratureTime2" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

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
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
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
                    <i class="fa fa-info"></i>Internal Temp 2 and Temp 2 Time
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemp3" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator3" ControlToValidate="txtTemp3" OnServerValidate="ValidateTemp3"
                                runat="server" ErrorMessage="Please fill Corrective Action field for Time/Temp 3"
                                Display="None"></asp:CustomValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTemp3"
                                Display="None" ErrorMessage="The value in field Internal Temp 3 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group bootstrap-timepicker">
                            <asp:TextBox ID="tempratureTime3" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

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
                                <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
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
                <div class="col-sm-3">
                    <label class="control-label">
                        Verified By*:
                    </label>

                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-3">

                    <div class="form-group">
                        <label for="cldVerifiedDate">Verified Date:</label>

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
                        <label for="serviceDate">Entry Date </label>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>


                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="margin-top: 24px;">


                    <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-danger" OnClick="cmdDelete_Click" runat="server" />
                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-warning" OnClick="cmdCancel_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">List of Cooling Temperature Log Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>



                    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                            <asp:TemplateField HeaderText="Service Date">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/FreezerLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Category">
                                <ItemTemplate>
                                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("FoodItem").ToString() == "2"? " Product/Menu Item":Eval("FoodItem").ToString() == "1"?"Ingredient":"No Ingredient/Menu Item"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product/Menu Item">
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ingredient">
                                <ItemTemplate>
                                    <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
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
                SelectMethod="GetFreezerLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreezerLog">
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


     <script type="text/javascript">
         $(document).ready(function () {
             $('#<%= cldEntryDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

            $('#<%= cldVerifiedDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

             $('#<%= tempratureTime1.ClientID %>').timepicker();
             $('#<%= tempratureTime2.ClientID %>').timepicker();
             $('#<%= tempratureTime3.ClientID %>').timepicker();
             $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</asp:Content>
