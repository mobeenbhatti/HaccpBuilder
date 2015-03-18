<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" Inherits="ControlPanel_Location_ThermoCalibrationLog"
    Title="HACCP Builder | Thermometer Calibration Log" Codebehind="ThermoCalibrationLog.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

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
    
    <h3>Thermometer Calibration Log</h3>
   
    <div class="clear tenpx"></div>
    
    <p>Directions: Foodservice employees will record the calibration temperature and corrective
                action taken, if applicable, on the Thermometer Calibration Log each a time thermometer
                is calibrated. The foodservice manager will verify that foodservice employees are
                using and calibrating thermometers properly by making visual observations of employee
                activities during all hours of operation. The foodservice ma nager will review and
                initial the log daily. Maintain this log for a minimum of 1 year.</p>
   
    <div class="row">
    <!------------- INPUT FORM --------------->
    <div class="col-lg-6 col-md-6 portfolio-ite">
        <div class=".form-horizontal">  
            <div class="control-group">
                <asp:HiddenField ID="hfTempLow" runat="server" />
                <asp:HiddenField ID="hfTempHigh" runat="server" />
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" Enabled="true" />
            </div>      
            <div class="control-group">
                <label class="control-label" for="inputEmail">Service Date:</label>
                <div class="controls">
                <ew:CalendarPopup ID="cldMealDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate"
                                        Display="None" ErrorMessage="Service Date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Thermometer/Instrument:</label>
                <div class="controls">
                <asp:DropDownList ID="ddlThermometerDevice" Width="200px" DataSourceID="odsThermometerDevice"
                                        CssClass="log_textbox" DataTextField="Name" DataValueField="Id" Font-Size="Small" AppendDataBoundItems="true" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Thermometer Device</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqvldLocation" runat="server" Display="None" ErrorMessage="Please Select Thermometer Device"
                                        ControlToValidate="ddlThermometerDevice" CssClass="log_textbox" Font-Names="Verdana"
                                        Font-Size="10px" InitialValue="Select Thermometer Device"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail"> T0 Temperature:</label>
                <div class="controls">
                <asp:TextBox ID="txtTemperature" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <%--  <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for temperature" OnServerValidate="ValidateTemp1" Display="None"></asp:CustomValidator>--%>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
                                        Display="None" ErrorMessage="The value in field 'T0 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                 </div>
                <div class="controls">
                 This is the temperature reading you get when you first use your reference standard(whether ice water or boiling).
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">T1 Temperature:</label>
                <div class="controls">
                <asp:TextBox ID="txtTemperature2" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <%--  <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for temperature" OnServerValidate="ValidateTemp1" Display="None"></asp:CustomValidator>--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTemperature2"
                                        Display="None" ErrorMessage="The value in field 'T1 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                </div>
                <div class="controls">
                    If the instrument is out of range, here is where you record the degree variance for the instrument.  This is recorded in tenths and is known as "offset depression".
                </div>
                
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">T2 Temperature:</label>
                <div class="controls">
                 <asp:TextBox ID="txtTemperature3" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <%--  <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" runat="server"
                                        ErrorMessage="Please fill Corrective Action field for temperature" OnServerValidate="ValidateTemp1" Display="None"></asp:CustomValidator>--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTemperature3"
                                        Display="None" ErrorMessage="The value in field ''T2 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                </div>
                <div class="controls">
                This is where you record the temperature that matches your calibration standard.
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
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldMealDate"
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
          <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="30px" HeaderStyle-Width="30px" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" HeaderStyle-Font-Size="Small">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/ThermoCalibrationLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Thermometer" HeaderText="Thermometer"  />
                    <%--    <asp:BoundField DataField="Temperature" HeaderText="Reading" ItemStyle-Width="50px"
                        HeaderStyle-CssClass="gridheaderline" />--%>
                    <asp:TemplateField HeaderText="Reading" ItemStyle-Width="30px"  HeaderStyle-Width="30px" >
                        <ItemTemplate>
                            <asp:Label ID="lblReading" runat="server" Text='<%# Eval("Temperature").ToString()=="99999.00"? "":Eval("Temperature") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="50px"  HeaderStyle-Width="50px" >
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           
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
