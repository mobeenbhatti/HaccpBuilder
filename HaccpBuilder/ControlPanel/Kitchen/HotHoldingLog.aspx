<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="HotHoldingLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.HotHoldingLogNew" %>
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

        var vldMenuItem = document.getElementById('<%=rfvMenuItem.ClientID%>');
        var vldIngrdient = document.getElementById('<%=rfvIngredient.ClientID%>');
        var ddlMenuItem = document.getElementById('<%=ddlMenuItem.ClientID%>');
        var ddlIngredient = document.getElementById('<%=ddlIngredient.ClientID%>');


        if (status == 1) {

            ValidatorEnable(vldMenuItem, true);
            ValidatorEnable(vldIngrdient, false);
            ddlMenuItem.disabled = false;
            ddlIngredient.disabled = true;
            ddlIngredient.selectedIndex = 0

        }
        if (status == 2) {
            ValidatorEnable(vldMenuItem, false);
            ValidatorEnable(vldIngrdient, true);
            ddlMenuItem.disabled = true;
            ddlMenuItem.selectedIndex = 0
            ddlIngredient.disabled = false;

        }
        if (status == 3) {
            //   ValidatorEnable(vldMenuItem, false);
            //   ValidatorEnable(vldIngrdient, false);
            ddlMenuItem.disabled = true;
            ddlMenuItem.selectedIndex = 0
            ddlIngredient.disabled = true;
            ddlIngredient.selectedIndex = 0


        }
    }    

</script>
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Hot holding Log</h1>
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
      <label><asp:RadioButton ID="rdbIngredient" Text="Input" Checked="true" onClick="SetFoodItem(2)"
                                        CssClass="log_textbox" GroupName="FoodItem" runat="server" /></label>
      <div class="input">
        <asp:DropDownList ID="ddlIngredient" Width="200px" DataSourceID="odsIngredient"  DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true" runat="server">
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
    <h2 class="left h2margin-r">Internal Temp 1::</h2>
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
                <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction1"  DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
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
                <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction2" DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
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
    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False" CssClass="zebra"
        DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />           
            <asp:TemplateField HeaderText="Service Date" >
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/HotHoldingLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
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
                    <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
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
        SelectMethod="GetHotHoldingLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetHotHoldingLog">
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
<%-- <div class="grey_bg_form">
    <a href="InventoryItemManager.aspx">Terms Of Use</a> <a href="InventoryItemManager.aspx">
        Training Manual</a>
</div>--%>
<asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
