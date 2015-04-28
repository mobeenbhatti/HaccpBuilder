<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ThermoCalibrationLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ThermoCalibrationLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Thermometer Calibration Log</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <script language="javascript" type="text/javascript">
        function CheckTemperature(sender, args) {
            var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemp1');
            var txtTemp2 = document.getElementById('PlaceHolder_txtTemp2');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTempHigh = document.getElementById('PlaceHolder_hfTempHigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');
            if (hfTempHigh.value != 'NA') {
                if (txtTemp1.value != '') {
                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                        //ValidatorEnable(vldMenuItem, true);
                        args.IsValid = false;
                    }
                }

                if (hfTempHigh.value != 'NA') {
                    if (txtTemp2.value != '') {
                        if ((txtTemp2.value < hfTempLow.value || txtTemp2.value > hfTempHigh.value) && txtCorrectiveAction.value == '') {
                            //  ValidatorEnable(vldMenuItem, true);
                            args.IsValid = false;
                        }
                    }
                }
            }
        }
        function checkValidation() {
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-dashboard"></i>Thermometer Calibration Log
            </div>
            <div class="panel-body">

                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="cldMealDate">Service Date:</label>

                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox CssClass="form-control" runat="server" ID="cldMealDate"></asp:TextBox>

                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                        <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate"
                            Display="None" ErrorMessage="Service Date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <label for="freezer-device">Thermometer/Instrument:</label>


                    <asp:DropDownList ID="ddlThermometerDevice" DataSourceID="odsThermometerDevice"
                        CssClass="form-control" DataTextField="Name" DataValueField="Id" Font-Size="Small" AppendDataBoundItems="true" data-editableCombobox="true"
                        runat="server">
                        <asp:ListItem>Select Thermometer Device</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="reqvldLocation" runat="server" Display="None" ErrorMessage="Please Select Thermometer Device"
                        ControlToValidate="ddlThermometerDevice" CssClass="form-control" Font-Names="Verdana"
                        Font-Size="10px" InitialValue="Select Thermometer Device"></asp:RequiredFieldValidator>

                </div>
                <div class="col-sm-4">
                </div>
            </div>

             
        </div>
    </div>

    <div class="row mt10">
        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>T0 Temperature
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemperature" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>

                            <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
                                Display="None" ErrorMessage="The value in field 'T0 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <hr />
                    <p>This is the temperature reading you get when you first use your reference standard(whether ice water or boiling).</p>

                </div>
            </div>
        </div>


        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>T1 Temperature
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemperature2" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTemperature2"
                                Display="None" ErrorMessage="The value in field 'T1 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <hr />
                    <p>If the instrument is out of range, here is where you record the degree variance for the instrument.  This is recorded in tenths and is known as "offset depression".</p>

                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-default plr-15">
                <div class="panel-heading">
                    <i class="fa fa-info"></i>T2 Temperature
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="input-group">
                            <asp:TextBox ID="txtTemperature3" runat="server" MaxLength="8" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon">
                                <i class="fa fa-info-circle"></i>
                            </span>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTemperature3"
                                Display="None" ErrorMessage="The value in field ''T2 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <hr />
                    <p>This is where you record the temperature that matches your calibration standard.</p>

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

                                               
                                            </div> 
                                            <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                                Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                                Type="Date"></asp:CompareValidator>
                                            <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldMealDate"
                                                Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                                Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                        </div>

                    
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="serviceDate">Entry Date </label>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>

                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
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
                            <asp:BoundField DataField="Id" HeaderText="Entry ID"  />
                            <asp:TemplateField HeaderText="Service Date" >
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/ThermoCalibrationLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Thermometer" HeaderText="Thermometer" />
                            <%--    <asp:BoundField DataField="Temperature" HeaderText="Reading" ItemStyle-Width="50px"
                        HeaderStyle-CssClass="gridheaderline" />--%>
                            <asp:TemplateField HeaderText="Reading" >
                                <ItemTemplate>
                                    <asp:Label ID="lblReading" runat="server" Text='<%# Eval("Temperature").ToString()=="99999.00"? "":Eval("Temperature") %>'></asp:Label>
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
        SelectMethod="GetThermoCalibrationLogByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetThermoCalibrationLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsThermometerDevice" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetThermometersByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetThermoCalibrationLog">
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
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
