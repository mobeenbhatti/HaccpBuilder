<%@ Page Title="HACCP Builder | Cooking & Reheating Temperature Log" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="TemperatureLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.TemperatureLogNew" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script language="javascript" type="text/javascript">
     $(document).ready(function () {
         var selected_value;
         $("#<%=ddlIngredient.ClientID %>").on('change', function () {
             var Id = $(this).val();
             __doPostBack('<%= ddlIngredient.UniqueID %>', '');
             <%-- var sendInfo = { IngredientId: Id };
             var dataJsonString = JSON.stringify(sendInfo);
             $.ajax({
                 url: 'TemperatureLog.aspx/GetCriticalLimits',
                 type: 'post',
                 data: dataJsonString,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) {
                     var obj = JSON.parse(response.d);
                     console.log(obj);
                     $("#<%= hfTempLow.ClientID %>").value = obj.TempLow;
                     $("#<%= hfTempHigh.ClientID %>").value = obj.TempHigh;
                     $("#<%= Lbl_QCLMaxtempValue.ClientID %>").text(obj.TempHigh);
                     $("#<%= Lbl_QCLMintempValue.ClientID %>").text(obj.TempLow);

                 },
                 error: function (data) {
                     console.log(data);
                     //alert('Error');
                 }
             });--%>
         });
     });
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
         var vldMenuItem = document.getElementById('<%=rfvMenuItem.ClientID %>');
         var vldIngrdient = document.getElementById('<%=rfvIngredient.ClientID %>');
         var ddlMenuItem = document.getElementById('<%=ddlMenuItem.ClientID %>');
         var ddlIngredient = document.getElementById('<%=ddlIngredient.ClientID %>');
         $("#<%= hfTempLow.ClientID %>").value = ""
         $("#<%= hfTempHigh.ClientID %>").value = "";
         $("#<%= Lbl_QCLMaxtempValue.ClientID %>").text("NA");
         $("#<%= Lbl_QCLMintempValue.ClientID %>").text("NA");
         if (status == 1) {
             // ValidatorEnable(vldMenuItem, true);
             // ValidatorEnable(vldIngrdient, false);
             ddlMenuItem.disabled = false;
             ddlIngredient.disabled = true;            
             $("select#<%=ddlIngredient.ClientID %>")[0].selectedIndex = 0;
             ddlIngredient.selectedIndex = 0;
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
             ddlIngredient.selectedIndex = 0;
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
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Temperature Log</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <ContentTemplate>--%>
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
  <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="msg-error" Enabled="true" />  
  <asp:Label ID="LogError" CssClass="msg-error" runat="server" Text="" Visible="false"></asp:Label>
  <asp:Label ID="lblError"  CssClass="msg-error" runat="server" Visible="false"></asp:Label>
  </div>
  <div class="ph-top">
    <div class="left">QCL Minimum: <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label> </div>
    <div class="left margin-lr">QCL Maximum: <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label> </div>
    <div class="left"> 
    Service Date: <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                  <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate" Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                Type="Date"></asp:CompareValidator>
    </div>
  </div>
  <div class="clear"></div>
  <h2>Food Items:</h2>
  <div class="form3">
    <div class="left">
    <label><asp:RadioButton ID="rdbNoItem" Text="No Ingredient/Menu Item" CssClass="log_textbox" onClick="SetFoodItem(3)" Checked="true" GroupName="FoodItem" runat="server" /></label>
    <div class="input"></div>
    </div>
    <div class="left margin-lr">
      <label><asp:RadioButton ID="rdbIngredient" Text="Input" Checked="true" onClick="SetFoodItem(2)"
                                        CssClass="log_textbox" GroupName="FoodItem" runat="server" /></label>
      <div class="input">
        <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient"
              DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" 
              data-editableCombobox="true" runat="server" 
              onselectedindexchanged="ddlIngredient_SelectedIndexChanged">
            <asp:ListItem>Select Input</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input" ControlToValidate="ddlIngredient" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
            Font-Size="10px" InitialValue="Please Select Input"></asp:RequiredFieldValidator>
      </div>
    </div>
        <div class="left" style="margin:25px 0 0 10px; width:20px; height:20px">
          <h1></h1>
        </div>
        <div class="left margin-lr">
          <label><asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(1)" GroupName="FoodItem" runat="server" /></label>
          <div class="input">
            <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false" DataTextField="Name" DataValueField="MenuItemId" Width="200px" runat="server" data-editableCombobox="true"
            AppendDataBoundItems="false">
                <asp:ListItem>Select Output</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None" ErrorMessage="Please Select Output" ControlToValidate="ddlMenuItem" CssClass="log_textbox"
             Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
          </div>
        </div>    
    <div class="clear"></div>
  </div>  
  <div class="form4 left marginright">
    <h2 class="left h2margin-r">Internal Temp 1:</h2>
    <div class="input left">
        <asp:TextBox ID="txtTemp1" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtTemp1" OnServerValidate="ValidateTemp1"
            runat="server" ErrorMessage="Please select Corrective Action1 field for Temp1"
            Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtTemp1"
            Display="None" ErrorMessage="The value in field Internal Temp1 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RFV_txtTemp1" Enabled="false" Display="None" ErrorMessage="Please fill Internal Temp 1 field."
            runat="server" Font-Names="Verdana" Font-Size="10px" ControlToValidate="txtTemp1"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h2margin-r"> Lot/Batch No:</h1>
    <div class="input left">
        <asp:TextBox ID="txtBatchNo" runat="server" MaxLength="50" CssClass="log_textbox" ></asp:TextBox>                                            
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBatchNo"
            Display="None" ErrorMessage="The value in field 'Lot/Batch No' is not valid."
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Temp 1 Time:</h1>
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
    <h4>Corrective Action 1</h4>
    <div class="input">
        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction1"  DataValueField="CorrectiveActionID" DataTextField="Name" runat="server">
        </asp:RadioButtonList> 
        <br />
      <div id="trClearCorrectiveActions" runat="server"><asp:CheckBox ID="chkClear" runat="server" />Clear Corrective Action</div>
    </div>
  </div>
  <div class="form4 left">    
    <h2 class="left h2margin-r">Internal Temp 2:</h2>
    <div class="input left">
        <asp:TextBox ID="txtTemp2" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTemp2" OnServerValidate="ValidateTemp2"
            runat="server" ErrorMessage="Please select Corrective Action2 field for Temp2"
            Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtTemp2"
            Display="None" ErrorMessage="The value in field Internal Temp 2 is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RFV_txtTemp2" Enabled="false" Display="None" ErrorMessage="Please fill Internal Temp 2 field."
            runat="server" Font-Names="Verdana" Font-Size="10px" ControlToValidate="txtTemp2"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Temp 2 Time:</h1>
    <div class="input left">
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
    <div class="clear"></div>
    <br />
    <h4>Corrective Action 2</h4>
    <div class="input">
        <asp:Label ID="Lbl_CorrectiveAction2" runat="server" Visible="false"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction2" DataValueField="CorrectiveActionID" DataTextField="Name" runat="server">
        </asp:RadioButtonList>
      <br />
      <div id="trClearCorrectiveActions2" runat="server"><asp:CheckBox ID="chkClear2" runat="server" />Clear Corrective Action </div></div>
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
      <h4 class="left">List of Cold Holding Log Entries</h4>
    </div>
    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID" />           
            <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/TemperatureLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
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
                    <asp:Label ID="lblMenuItem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Input">
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetTemperatureLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetTemperatureLog">
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

   <%-- </ContentTemplate>
    <Triggers>
   <asp:PostBackTrigger ControlID="ddlIngredient" />  
   </Triggers>
</asp:UpdatePanel>
<asp:UpdateProgress ID="updProgress" runat="server" Visible="true" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div id="Logprogress">
            <img src="../../images/buttons/ajax-loader1.gif" alt="" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>--%>
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
</asp:Content>
