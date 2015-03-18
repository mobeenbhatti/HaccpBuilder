<%@ Page Title="HACCP Builder | Shipping Log" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ShippingLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ShippingLogNew" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Shipping Log</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
  <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="msg-error" Enabled="true" />  
  <asp:Label ID="LogError" CssClass="msg-error" runat="server" Text="" Visible="false"></asp:Label>
  </div>
  <div class="ph-top">
    <div class="left"> QCL Minimum: <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label></div>
    <div class="left margin-lr"> QCL Maximum: <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label> </div>
    <div class="left"> 
    Service Date: <ew:CalendarPopup ID="cldMealDate" runat="server"  CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                  <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldMealDate" Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                Type="Date"></asp:CompareValidator>
    </div>
  </div>
  <div class="clear"></div>
  <h2>Food Item:</h2>
  <div class="form3">
    <div class="left"> 
        <label><asp:RadioButton ID="rdbMenuItem"  Checked="true" Text="Output"  GroupName="FoodItem" runat="server" /></label>     
      <div class="input">
         <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem"   DataTextField="Name" DataValueField="MenuItemId"  runat="server" data-editableCombobox="true" AppendDataBoundItems="false">
            <asp:ListItem>Select Output</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None" ErrorMessage="Please Select Output" ControlToValidate="ddlMenuItem" 
            Font-Names="Verdana" Font-Size="10px" InitialValue="Select Output"></asp:RequiredFieldValidator>    
      </div>
    </div>  
    <div class="left margin-lr"> 
        <label>Customer</label>     
      <div class="input">
         <asp:DropDownList ID="ddlVendor" runat="server"  DataSourceID="odsVendor" data-editableCombobox="true" DataTextField="CompanyName" DataValueField="CustomerID" AppendDataBoundItems="false">
            <asp:ListItem>Select Customer</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvCustomer" Enabled="true" runat="server" Display="None"  InitialValue="Select Customer" ErrorMessage="Please Select Customer" ControlToValidate="ddlVendor"
            Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
      </div>
    </div>  
    <div class="clear"></div>
  </div>  
  <div class="form4 left marginright">
    <h2>Temperature:</h2>
    <div class="input left">
        <asp:TextBox ID="txtTemperature" Enabled="true" runat="server" MaxLength="8" ></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemperature" OnServerValidate="ValidateTemp1" runat="server" ErrorMessage="Please select Corrective Action field" Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemperature"
            Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r"> Temperature Not Required:</h1>
    <div class="input left"> <asp:CheckBox ID="chkTempRequired" OnCheckedChanged="chkTempRequired_CheckedChanged" AutoPostBack="true" Checked="false" runat="server" /></div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Temperatur Time:</h1>
    <div class="input left">
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
    <div class="clear"></div>
    <br />
    <h4>Corrective Action:</h4>
    <div class="input">
        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="8" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction1"  DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
        </asp:RadioButtonList>
        <br />
      <div id="trClearCorrectiveActions" runat="server"><asp:CheckBox ID="chkClear" runat="server" />Clear Corrective Action</div>
    </div>
    <br />
  </div>  
   <div class="form4 left">
    <h2 class="left h2margin-r">Batch No.:</h2>
    <div class="input left">
        <asp:TextBox ID="txtBatch" runat="server" MaxLength="50" ></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBatch"
            Display="None" ErrorMessage="The value in field Batch No. is not valid." Font-Names="Verdana"
            Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,50}$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r"> Volume:</h1>
    <div class="input left"> 
        <asp:TextBox ID="txtVolume" runat="server" MaxLength="10" ></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtVolume"
            Display="None" ErrorMessage="The value in field Volume is not valid." Font-Names="Verdana"
            Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,10}$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <br />
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
      <h4 class="left">List of Shipping Log Entries</h4>
    </div>
     <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="zebra"  DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />           
            <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/ShippingLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                        Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:BoundField DataField="Customer" HeaderText="Customer"  />            
            <asp:TemplateField HeaderText=" Output">
                <ItemTemplate>
                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
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
        SelectMethod="GetShippingLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetShippingLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="box-bottom"> </div>
  </div>
<asp:HiddenField ID="hfTempLow" runat="server" />
<asp:HiddenField ID="hfTempHigh" runat="server" />
<asp:HiddenField ID="hfMobileId" runat="server" />
<asp:ObjectDataSource ID="odsFreezerNewLogDevice" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetFreezerNewlogCustomInventoriesByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreezerNewLog">
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
</div>
</asp:Content>
