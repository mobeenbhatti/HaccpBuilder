<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="TemperatureLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.TemperatureLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Cooking & Reheating Temperature Log</h1>
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


    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />
    <asp:Label ForeColor="Red" ID="LogError" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />


   <%-- <p class="mt30 mb30">
        <strong>Directions: </strong>
        Record product name, time, the two temperatures/times, and any corrective action taken on this form. If no foods are cooked on any working day, indicate 'No Ingredient/No Menu Item' in the form. The foodservice manager will verify that foodservice employees have taken the required cooking temperatures by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>--%>


    <div class="row mt30">
        <div class="panel panel-default">
            <div class="panel-heading">
               
                 <a href="#" data-toggle="tooltip" title="Drirections: Record product name, time, the two temperatures/times, and any corrective action taken on this form. If no foods are cooked on any working day, indicate 'No Ingredient/No Menu Item' in the form. The foodservice manager will verify that foodservice employees have taken the required cooking temperatures by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.">
                    <i class="fa fa-dashboard cw"></i></a>
              Cooking & Reheating Temperature Log
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
                <div class="col-sm-4">
                    <div class="form-group">
                        <asp:RadioButton ID="rdbNoItem" Text="No Ingredient/Menu Item" CssClass="form-control"
                            onClick="SetFoodItem(3)" Checked="true" GroupName="FoodItem" runat="server" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">

                        <label for="ddlIngredient">
                            <asp:RadioButton ID="rdbIngredient" Text="Ingredients" onClick="SetFoodItem(2)" CssClass="form-control"
                                GroupName="FoodItem" runat="server" /></label>
                        <asp:DropDownList ID="ddlIngredient" DataSourceID="odsIngredient" AutoPostBack="true"
                            CssClass="form-control" Enabled="false" DataTextField="Name" DataValueField="IngredientId"
                            AppendDataBoundItems="false" runat="server" EnableViewState="true" OnSelectedIndexChanged="ddlIngredient_SelectedIndexChanged">
                            <asp:ListItem Value="-1">Select Ingredient</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Ingredient"
                            ControlToValidate="ddlIngredient" CssClass="form-control" Enabled="false" Font-Names="Verdana"
                            InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">

                        <label for="ddlMenuItem">
                            <asp:RadioButton ID="rdbMenuItem" Text="Menu Item" onClick="SetFoodItem(1)"
                                CssClass="form-control" GroupName="FoodItem" runat="server" /></label>
                        <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false" CssClass="form-control"
                            DataTextField="Name" DataValueField="MenuItemId" runat="server"
                            AppendDataBoundItems="false">
                            <asp:ListItem>Select Menu Item</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None"
                            ErrorMessage="Please Select Menu Item" ControlToValidate="ddlMenuItem" CssClass="form-control"
                            Font-Names="Verdana" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>

                    </div>
                </div>


            </div>




        </div>
    </div>

    <div class="row mt10">
        <div class="col-sm-6">
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
                        </li>

                    </ul>
                    <hr />
                    <div id="trClearCorrectiveActions" runat="server" class="text-center">
                        <asp:Button runat="server" ID="chkClear" CausesValidation="false" CssClass="btn btn-warning" Text="Clear Corrective Actions" />
                    </div>



                </div>
            </div>
        </div>

        <div class="col-sm-6">
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
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
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


    </div>


    <div class="row mt10">
        <div class="panel panel-default plr-15">
            <div class="panel-body">
                <div class="col-sm-2">
                    <label class="control-label">
                        Lot/Batch No
                    </label>

                    <asp:TextBox ID="txtBatchNo" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBatchNo"
                        Display="None" ErrorMessage="The value in field 'Lot/Batch No' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-2">
                    <label class="control-label">
                        Verified By*:
                    </label>

                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-2">

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
                <div class="col-sm-2">
                    <div class="form-group">
                        <label for="serviceDate">Entry Date </label>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>


                        </div>
                    </div>
                </div>
                <div class="col-sm-4" style="margin-top: 24px;">


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
            <h4 class="left">List Temperature Log Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>



                    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                         <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />
                            <asp:TemplateField HeaderText="Service Date" >
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/TemperatureLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Category" >
                                <ItemTemplate>
                                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("FoodItem").ToString() == "2"? " Product/Menu Item":Eval("FoodItem").ToString() == "1"?"Ingredient":"No Ingredient/Menu Item"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Product/Menu Item" >
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ingredient" >
                                <ItemTemplate>
                                    <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date" >
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
                        SelectMethod="GetTemperatureLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetTemperatureLog">
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
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>

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
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</asp:Content>
