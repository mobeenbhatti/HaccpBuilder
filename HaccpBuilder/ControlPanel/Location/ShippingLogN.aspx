<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ShippingLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ShippingLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Shipping Log</h1>
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
            var rfvCustomer = document.getElementById('PlaceHolder_rfvCustomer');
            var ddlMenuItem = document.getElementById('PlaceHolder_ddlMenuItem');
            var ddlVendor = document.getElementById('PlaceHolder_ddlVendor');

            if (status == 1) {
                // ValidatorEnable(vldMenuItem, true);
                // ValidatorEnable(vldIngrdient, false);
                //  ddlMenuItem.disabled = false;
                //ddlIngredient.disabled = true;
                //ddlIngredient.selectedIndex = 0

            }
            if (status == 2) {
                //  ValidatorEnable(vldMenuItem, false);
                //  ValidatorEnable(vldIngrdient, true);
                ddlMenuItem.disabled = false;
                ddlVendor.disabled = false;
                //ddlIngredient.disabled = false;
            }
            if (status == 3) {
                // ValidatorEnable(vldMenuItem, false);
                // ValidatorEnable(vldIngrdient, false);
                ddlMenuItem.disabled = true;
                ddlVendor.disabled = true;
                ddlMenuItem.selectedIndex = 0
                ddlVendor.selectedIndex = 0
                //ddlIngredient.disabled = true;
            }
        }
        function CheckTemperature(sender, args) {
            var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemperature');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');
            if (hfTempHigh.value != 'NA') {
                if (txtTemp1.value != '') {
                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
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

    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />
    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />


  <%--  <p class="mt30 mb30">
        <strong>Directions: </strong>
        Use this Log for deliveries or shipping foods. Record any temperatures and corrective action taken on the Shipping Log.If no foods are received on any working day, indicate 'No Ingredient/No Menu Item' in the form.The foodservice manager will verify that foodservice employees are shipping products using the proper procedure by visually monitoring foodservice employees and shipping practices during the shift and reviewing the log daily. Maintain this log for a minimum of 1 year.
    </p>--%>


    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-dashboard"></i>

                 <a href="#" data-toggle="tooltip" title="Drirections: Use this Log for deliveries or shipping foods. Record any temperatures and corrective action taken on the Shipping Log.If no foods are received on any working day, indicate 'No Ingredient/No Menu Item' in the form.The foodservice manager will verify that foodservice employees are shipping products using the proper procedure by visually monitoring foodservice employees and shipping practices during the shift and reviewing the log daily. Maintain this log for a minimum of 1 year.">
                    <i class="fa fa-dashboard cw"></i></a>
                Shipping Log
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6">

                        <div class="row">
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
                                    <label for="cldMealDate">Service Date:</label>

                                    <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                        <asp:TextBox CssClass="form-control" runat="server" ID="cldMealDate"></asp:TextBox>

                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate"
                                        Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label for="ddlIngredient">
                                    <asp:RadioButton ID="rdbMenuItem" Checked="true" Text="Product/Menu Item"
                                        GroupName="FoodItem" runat="server" /></label>
                                <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" CssClass="form-control"
                                    DataTextField="Name" DataValueField="MenuItemId" runat="server" data-editableCombobox="true"
                                    AppendDataBoundItems="false">
                                    <asp:ListItem>Select Menu Item</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None"
                                    ErrorMessage="Please Select Menu Item" ControlToValidate="ddlMenuItem" CssClass="form-control"
                                    Font-Names="Verdana" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-6">
                                <label class="mt8" for="ddlMenuItem">
                                    Customer</label>
                                <asp:DropDownList ID="ddlVendor" runat="server" DataSourceID="odsVendor" CssClass="form-control" data-editableCombobox="true"
                                    DataTextField="CompanyName" DataValueField="CustomerID" Font-Size="Small" AppendDataBoundItems="false">
                                    <asp:ListItem>Select Customer</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCustomer" Enabled="true" runat="server" Display="None"
                                    InitialValue="Select Customer" ErrorMessage="Please Select Customer" ControlToValidate="ddlVendor"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12  mt12">
                                <label>
                                    <asp:CheckBox ID="chkTempRequired" Text="Temperature Not Required" OnCheckedChanged="chkTempRequired_CheckedChanged"
                                        AutoPostBack="true" Checked="false"  runat="server" />
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">

                                 <div class="input-group">
                                <asp:TextBox ID="txtTemperature" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
                                 <span class="input-group-addon">
                                    <i class="fa fa-info-circle"></i>
                                </span>
                                     </div>
                                <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" OnServerValidate="ValidateTemp1"
                                    runat="server" ErrorMessage="Please select Corrective Action field" Display="None"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
                                    Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                    ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                               
                        </div>
                        <div class="col-sm-6">
                                <div class="input-group bootstrap-timepicker">
                                    <asp:TextBox ID="tempratureTime1" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>

                                    <span class="input-group-addon">
                                        <i class="fa fa-clock-o"></i>
                                    </span>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-6">
                                <label class="mt12" for="txtBatch">Batch No:</label>
                                <asp:TextBox ID="txtBatch" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBatch"
                                    Display="None" ErrorMessage="The value in field Batch No. is not valid."
                                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,50}$"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-sm-6">
                                <label class="mt12" for="txtBatch">Volume:</label>
                                <asp:TextBox ID="txtVolume" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtVolume"
                                    Display="None" ErrorMessage="The value in field Volume is not valid."
                                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,10}$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-tasks"></i>Corrective Action
                            </div>
                            <div class="panel-body tasks">
                                <div class="col-sm-12">
                                    <label>

                                        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
                                        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="10" Name="nLogTypeId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        <asp:RadioButtonList ID="rdlCorrectiveAction1" DataValueField="CorrectiveActionID"
                                            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                                <div class="col-sm-12" id="trClearCorrectiveActions" runat="server">
                                    <label>
                                        <asp:CheckBox ID="chkClear" runat="server" />
                                        <span class="lbl padding-8">Clear Corrective Action</span>

                                    </label>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="verified-by">Verified By:</label>

                                        <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>

                                        <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                            Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                    <div class="form-group">
                                        <label for="cldVerifiedDate">Verified Date:</label>

                                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                            <asp:TextBox CssClass="form-control" runat="server" ID="cldVerifiedDate"></asp:TextBox>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>

                                        </div>
                                        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                            Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                            Type="Date"></asp:CompareValidator>
                                        <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldMealDate"
                                            Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                            Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceDate">Entry Date </label>
                                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-danger" OnClick="cmdDelete_Click" runat="server" />
                                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-warning" OnClick="cmdCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <div class="col-sm-12">
                    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-responsive table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                            <asp:TemplateField HeaderText="Service Date">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/ShippingLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Customer" HeaderText="Customer" />
                            <asp:TemplateField HeaderText=" Product/Menu Item">
                                <ItemTemplate>
                                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                                <HeaderStyle CssClass="gridheaderline" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>




    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetShippingLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetShippingLog">
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
    <asp:ObjectDataSource ID="odsVendor" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCustomerByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= cldMealDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

            $('#<%= cldVerifiedDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

            $('#<%= tempratureTime1.ClientID %>').timepicker();
            $('[data-toggle="tooltip"]').tooltip();

        });
    </script>
</asp:Content>
