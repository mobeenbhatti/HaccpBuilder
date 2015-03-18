<%@ Page Title="HACCP Builder | Thermometer Calibration Log" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ThermoCalibrationLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ThermoCalibrationLogNew" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript" src="../../JScript/overlibmws.js"></script>
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
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Thermometer Calibration Log</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
  <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="msg-error" Enabled="true" />  
  <asp:Label ID="LogError" CssClass="msg-error" runat="server" Text="" Visible="false"></asp:Label>
  </div> 
  <div class="clear"></div>
  <h2> Thermometer/Instrument:</h2>
  <div class="form3">
    <div class="left">
      <label><asp:RadioButton ID="rdbIngredient" Text="Input" Checked="true" onClick="SetFoodItem(2)"
                                         GroupName="FoodItem" runat="server" /></label>
      <div class="input">
        <asp:DropDownList ID="ddlThermometerDevice" Width="200px" DataSourceID="odsThermometerDevice" CssClass="log_textbox" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" data-editableCombobox="true" runat="server">
            <asp:ListItem>Select Thermometer Device</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="reqvldLocation" runat="server" Display="None" ErrorMessage="Please Select Thermometer Device" ControlToValidate="ddlThermometerDevice" CssClass="log_textbox" Font-Names="Verdana"
            Font-Size="10px" InitialValue="Select Thermometer Device"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="left margin-lr"> 
    <label>Service Date:</label>
    <div class="input"> 
        <ew:CalendarPopup ID="cldMealDate" runat="server"  CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
        <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate" Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
    </div>
    </div>
    <div class="clear"></div>
  </div>  
  <div class="form4 left marginright">
    <h2 class="left h2margin-r">T0 Temperature:</h2>
    <div class="input left">
        <asp:TextBox ID="txtTemperature" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <img id="Img_helpcoolingTemp1" style="vertical-align: middle" alt="" runat="server"  src="~/App_Themes/Facility/images/board_help.gif" />
        <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature" Display="None" ErrorMessage="The value in field 'T0 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
          Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">T1 Temperature::</h1>
    <div class="input left">
        <asp:TextBox ID="txtTemperature2" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <img id="Img_helpcoolingTemp2" style="vertical-align: middle" alt="" runat="server" src="~/App_Themes/Facility/images/board_help.gif" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTemperature2" Display="None" ErrorMessage="The value in field 'T1 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">T2 Temperature::</h1>
    <div class="input left">
        <asp:TextBox ID="txtTemperature3" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <img id="Img_helpcoolingTemp3" style="vertical-align: middle" alt="" runat="server" src="~/App_Themes/Facility/images/board_help.gif" />        
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtTemperature3" Display="None" ErrorMessage="The value in field ''T2 Temperature' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>    
  </div>  
  <div class="clear tenpx"></div>
  <div class="form3">
    <div class="left">
      <label> Verified By*:</label>
      <div class="input">
        <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="small" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvVerified" runat="server" ControlToValidate="txtVerifiedBy"
            Display="None" ErrorMessage="Please fill Verified By field"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
            Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
      </div>
    </div>
    <div class="left date-marginl">
      <label>Verified Date:</label>
      <div class="input">
        <ew:CalendarPopup ID="cldVerifiedDate" runat="server"  CommandName="Calendar"
            ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
            Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
            Type="Date"></asp:CompareValidator>
        <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldMealDate"
            Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
            Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
      </div>
    </div>
    <div class="left date-marginl2">
      <label>Entry Date:</label>
      <div class="input">
        <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" Width="150px" CssClass="small"></asp:TextBox>
      </div>
    </div>
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server" CssClass="blue button" OnClick="cmdSubmit_Click" Text="SUBMIT" />
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" />
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />         
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Thermometer Calibration Log Entries</h4>
    </div>
   <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="zebra"
        DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID" />           
            <asp:TemplateField HeaderText="Service Date">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/ThermoCalibrationLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:BoundField DataField="Thermometer" HeaderText="Thermometer"/>         
            <asp:TemplateField HeaderText="Reading" >
                <ItemTemplate>
                    <asp:Label ID="lblReading" runat="server" Text='<%# Eval("Temperature").ToString()=="99999.00"? "":Eval("Temperature") %>'></asp:Label>
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Entry Date">
                <ItemTemplate>
                    <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                </ItemTemplate>               
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetThermoCalibrationLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetThermoCalibrationLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="box-bottom"> </div>
  </div>
</div>
<asp:HiddenField ID="hfTempLow" runat="server" />
<asp:HiddenField ID="hfTempHigh" runat="server" />
<asp:HiddenField ID="hfMobileId" runat="server" />
 <asp:ObjectDataSource ID="odsThermometerDevice" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetThermometersByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetThermoCalibrationLog">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>
