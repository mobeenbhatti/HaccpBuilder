<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="FreezerLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.FreezerLogN" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Freezer Log</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
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


    </script>



    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />


    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />


    <p class="mt30 mb30">
        <strong>Drirections: </strong>
        A designated foodservice employee will record the location or description of holding unit, date, time, air temperature, corrective action, and initials on this log. The foodservice manager will verify that foodservice employees have taken the required temperatures by visually monitoring food employees during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>


    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Freezer Log
            </div>
            <div class="panel-body tasks">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="temp-max">QCL Maximum Temp:</label>
                                <asp:TextBox ReadOnly="true" runat="server" CssClass="form-control" ID="Lbl_QCLMaxtempValue"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="temp-min">QCL Minimum Temp:</label>
                                <asp:TextBox ReadOnly="true" runat="server" CssClass="form-control" ID="Lbl_QCLMintempValue"></asp:TextBox>
                            </div>
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
                        <div class="col-sm-6">
                            <label for="freezer-device">Select Freezer Device:</label>
                            <asp:DropDownList ID="ddlFreezerNewLogDevice" Width="200px" DataSourceID="odsFreezerNewLogDevice"
                                CssClass="form-control" DataTextField="Name" DataValueField="Id" Font-Size="Small" AppendDataBoundItems="false" data-editableCombobox="true"
                                runat="server">
                                <asp:ListItem>Select Freezer Device</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Freezer Device"
                                ControlToValidate="ddlFreezerNewLogDevice" CssClass="form-control" Font-Names="Verdana"
                                Font-Size="10px" InitialValue="Select Freezer Device"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="temp-unit-device">Unit/Device Temperature:</label>

                                <asp:TextBox ID="txtTemperature" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" OnServerValidate="ValidateTemp1"
                                    runat="server" ErrorMessage="Please select Corrective Action" Display="None"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
                                    Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                    Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="tempratureTime1">Temperature Time:</label>
                                <div class="input-group bootstrap-timepicker">
                                    <asp:TextBox ID="tempratureTime1" MaxLength="8" runat="server" CssClass="form-control"></asp:TextBox>
                                    <span class="input-group-addon">
                                        <i class="fa fa-clock-o"></i>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-tasks"></i>Corrective Action
                            </div>
                            <div class="panel-body tasks">
                                <div class="col-sm-6">
                                    <label>
                                        <%--  <input type="radio" name="dispose-item" id="dispose" />
                                        <span class="lbl padding-8">Disposed of product/item</span>--%>


                                        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false" CssClass="form-control"></asp:Label>

                                        <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                            DataSourceID="odsCorrectiveAction" DataTextField="Name" CssClass="lbl padding-8" runat="server">
                                        </asp:RadioButtonList>

                                        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="7" Name="nLogTypeId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
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
                                        <label for="entry-date">Entry Date:</label>

                                        <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true"    CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12">


                                    <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-primary" OnClick="cmdDelete_Click" runat="server" />
                                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-default" OnClick="cmdCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <asp:GridView ID="grdHotHolding" HeaderStyle-CssClass="col" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-responsive table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                            <asp:TemplateField HeaderText="Service Date">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/FreezerNewLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Unit/Device" />
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
        SelectMethod="GetFreezerNewLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreezerNewLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsFreezerNewLogDevice" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetFreezerNewlogCustomInventoriesByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreezerNewLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
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
        SelectMethod="GetVendorByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= cldMealDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

            $('#<%= cldMealDate.ClientID %>').datepicker({
                format: "dd/mm/yyyy"
            });

            $('#<%= tempratureTime1.ClientID %>').timepicker();

        });
    </script>
</asp:Content>
