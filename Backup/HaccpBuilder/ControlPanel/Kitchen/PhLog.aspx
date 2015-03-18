<%@ Page Title="HACCP Builder | Ph Time & Temperature Log" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="PhLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PhLogNew" %>
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

            var vldSenitizer = document.getElementById('<%=rfvSenitizer.ClientID%>');
            var vldIngrdient = document.getElementById('<%=rfvIngredient.ClientID%>');
            var vldMenuItem = document.getElementById('<%= rfvMenuItem.ClientID%>');   
            var vldInventory = document.getElementById('<%=rfvInventory.ClientID%>');

            var ddlMenuItem = document.getElementById('<%=ddlMenuItem.ClientID%>');
            var ddlIngredient = document.getElementById('<%=ddlIngredient.ClientID%>');
            var ddlsenitizer = document.getElementById('<%=ddlSenitizer.ClientID%>');
            var ddlInventory = document.getElementById('<%=ddlInventory.ClientID%>');
           // Senitizers
            if (status == 1) {

                ValidatorEnable(vldSenitizer, true);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = false;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = true;
                ddlsenitizer.selectedIndex = 0

            }
            // Ingredients
            if (status == 2) {

                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, true);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = false;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = true;
                ddlIngredient.selectedIndex = 0
            }
            // Menu Items
            if (status == 3) {
                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, true);
                ValidatorEnable(vldInventory, false);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = false;
                ddlInventory.disabled = true;
                ddlMenuItem.selectedIndex = 0
            }
            // Inventory
            if (status == 4) {

                ValidatorEnable(vldSenitizer, false);
                ValidatorEnable(vldIngrdient, false);
                ValidatorEnable(vldMenuItem, false);
                ValidatorEnable(vldInventory, true);

                ddlsenitizer.disabled = true;
                ddlIngredient.disabled = true;
                ddlMenuItem.disabled = true;
                ddlInventory.disabled = false;
                ddlInventory.selectedIndex = 0

            }
        }
        
</script>
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Ph Time & Temperature Log</h1>
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
    Service Date: <ew:CalendarPopup ID="cldEntryDate" runat="server"  CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                  <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate" Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                Type="Date"></asp:CompareValidator>
    </div>
  </div>
  <div class="clear"></div>
  <h2>Measured Item:</h2>
  <div class="form3">
    <div class="left">
      <label><asp:RadioButton ID="rdbSenitizer" Checked="true" Text="Cleaning Solutions/Sanitizers" onClick="SetFoodItem(1)"  GroupName="FoodItem" runat="server" /> </label>
      <div class="input">
        <asp:DropDownList ID="ddlSenitizer"  DataSourceID="odsSentizerDevice"  DataTextField="Name" DataValueField="Id" AppendDataBoundItems="false" data-editableCombobox="true" runat="server">
            <asp:ListItem>Select Cleaning Solutions/Sanitizers</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvSenitizer" runat="server" Display="None" ErrorMessage="Please Select Cleaning Solutions/Sanitizers" ControlToValidate="ddlSenitizer"  Enabled="false" Font-Names="Verdana"
            Font-Size="10px" InitialValue="Select Cleaning Solutions/Sanitizers"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="left" style="margin:25px 0 0 10px; width:20px; height:20px">
        <h1></h1>
    </div>
    <div class="left margin-lr">
        <label><asp:RadioButton ID="rdbIngredient"  Text="Inputs" onClick="SetFoodItem(2)"  GroupName="FoodItem" runat="server" /></label>
        <div class="input">
        <asp:DropDownList ID="ddlIngredient"  DataSourceID="odsIngredient"  DataTextField="Name" DataValueField="IngredientId" AppendDataBoundItems="false" data-editableCombobox="true" runat="server">
            <asp:ListItem>Select Input</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvIngredient" runat="server" Display="None" ErrorMessage="Please Select Input" ControlToValidate="ddlIngredient"  Enabled="false" Font-Names="Verdana"
            Font-Size="10px" InitialValue="Select Ingredient"></asp:RequiredFieldValidator>
        </div>
    </div>    
    <div class="clear"></div>
  </div>  
  <div class="form3">
    <div class="left">
      <label><asp:RadioButton ID="rdbMenuItem" Text="Output" onClick="SetFoodItem(3)"  GroupName="FoodItem" runat="server" /> </label>
      <div class="input">
        <asp:DropDownList ID="ddlMenuItem" DataSourceID="odsMenuItem" Enabled="false"  DataTextField="Name" DataValueField="MenuItemId"  runat="server" data-editableCombobox="true" AppendDataBoundItems="false">
            <asp:ListItem>Select Output</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvMenuItem" Enabled="false" runat="server" Display="None" ErrorMessage="Please Select Output" ControlToValidate="ddlMenuItem" 
            Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="left" style="margin:25px 0 0 10px; width:20px; height:20px">
        <h1></h1>
    </div>
    <div class="left margin-lr">
        <label><asp:RadioButton ID="rdbInventory" Text="Equipment Inventory Item" onClick="SetFoodItem(4)"  GroupName="FoodItem" runat="server" /></label>
        <div class="input">
         <asp:DropDownList ID="ddlInventory" DataSourceID="odsPhLogKitchenInvetory" Enabled="false"  DataTextField="Name" DataValueField="Id"  runat="server" data-editableCombobox="true" AppendDataBoundItems="false">
            <asp:ListItem>Select Equipment Inventory Item</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvInventory" Enabled="false" runat="server" Display="None" ErrorMessage="Please Select Equipment Inventory Item" ControlToValidate="ddlInventory" 
            Font-Names="Verdana" Font-Size="10px" InitialValue="Select Menu Item"></asp:RequiredFieldValidator>
        </div>
    </div>    
    <div class="clear"></div>
  </div>  
  <div class="form3">
    <div class="left">
      <label>Lot/Batch Number:</label>
      <div class="input">
        <asp:TextBox ID="txtBarch" runat="server" MaxLength="8" CssClass="large"></asp:TextBox> 
      </div>
    </div>
    <div class="left volume-marginl">
      <label>Volume:</label>
      <div class="input">
        <asp:TextBox ID="txtVolume" runat="server" MaxLength="8" CssClass="large"></asp:TextBox> 
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="form left">
    <h2 class="left h2margin-r">pH Level Recorded::</h2>
    <div class="input left">
        <asp:TextBox ID="txtPhLevel" runat="server" MaxLength="8" ></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator2" ControlToValidate="txtPhLevel" OnServerValidate="ValidateTemp1" runat="server" ErrorMessage="Please select Corrective Action1 field for pH Level"  Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp1" runat="server" ControlToValidate="txtPhLevel" Display="None" ErrorMessage="The value in field pH Level is not valid.Please enter the value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Time of pH Record:</h1>
    <div class="input left">
        <asp:TextBox ID="tpHour1" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
        <asp:TextBox ID="tpMinute1" MaxLength="2" runat="server" Width="20"></asp:TextBox>
        <asp:DropDownList ID="tpTime1" runat="server" Width="50">
        <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
        <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
        </asp:DropDownList>
                                    
        <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpHour1"
            Display="None" ErrorMessage="The value in field pH record Hour is not valid. Please enter value les then or equal to 12"
            ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
            Font-Size="10px"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tpMinute1"
            Display="None" ErrorMessage="The value in field pH record  Minute is not valid."
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
                <asp:Parameter DefaultValue="9" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction1"  DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
        </asp:RadioButtonList>
        <br />
      <div id="trClearCorrectiveActions" runat="server"><asp:CheckBox ID="chkClear" runat="server" />Clear Corrective Action</div>
    </div>
  </div>
  <div class="form left form-margin">
    <h2 class="left h2margin-r"> Water Temperature Recorded:</h2>
    <div class="input left">
         <asp:TextBox ID="txtWaterTemp" runat="server" MaxLength="8" ></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtWaterTemp"  runat="server" ErrorMessage="Please select Corrective Action2 field for Water Temperature" Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtWaterTemp" Display="None" ErrorMessage="The value in field Water Temperature is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r"> Time of Temperature Record:</h1>
    <div class="input left">
        <asp:TextBox ID="tpHour2" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
        <asp:TextBox ID="tpMinute2" MaxLength="2" runat="server" Width="20"></asp:TextBox>
        <asp:DropDownList ID="tpTime2" runat="server" Width="50">
        <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
        <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
        </asp:DropDownList>                                    
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpHour2"
            Display="None" ErrorMessage="The value in field Water Temp Hour is not valid. Please enter value les then or equal to 12"
            ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
            Font-Size="10px"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tpMinute2"
            Display="None" ErrorMessage="The value in field Water Temp Minute is not valid."
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
        <asp:RadioButtonList ID="rdlCorrectiveAction2"  DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
        </asp:RadioButtonList>
      <br />
      <div id="trClearCorrectiveActions2" runat="server"> <asp:CheckBox ID="chkClear2" runat="server" />Clear Corrective Action </div></div>
  </div>
  <div class="form left">
    <h2 class="left h2margin-r">Minutes in Contact:</h2>
    <div class="input left">
        <asp:TextBox ID="txtContactMinutes" runat="server" MaxLength="8" ></asp:TextBox>                                    
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtContactMinutes" Display="None" ErrorMessage="The value in field Contact minutes is not valid.Please enter the value less than 999"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r"> Temp 3 Time:</h1>
    <div class="input left">
        <asp:TextBox ID="tpHour3" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
        <asp:TextBox ID="tpMinute3" MaxLength="2" runat="server" Width="20"></asp:TextBox>
        <asp:DropDownList ID="tpTime3" runat="server" Width="50">
        <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
        <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
        </asp:DropDownList>                                    
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tpHour3"
            Display="None" ErrorMessage="The value in field Temp2 Hour is not valid. Please enter value les then or equal to 12"
            ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
            Font-Size="10px"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="tpMinute3"
            Display="None" ErrorMessage="The value in field Temp2 Minute is not valid."
            ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
            Font-Size="10px"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <br />
    <h4>Corrective Action 3</h4>
    <div class="input">
        <asp:Label ID="Lbl_CorrectiveAction3" runat="server" Visible="false"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:RadioButtonList ID="rdlCorrectiveAction3"  DataValueField="CorrectiveActionID"
            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
        </asp:RadioButtonList>
      <br />
      <div id="Div1" runat="server"><asp:CheckBox ID="CheckBox1" runat="server" />Clear Corrective Action </div></div>
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
      <h4 class="left">List of Ph Log Entries</h4>
    </div>
    <asp:GridView ID="grdPh" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID"  />                    
            <asp:TemplateField HeaderText="Service Date">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/PhLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                        Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Category">
                <ItemTemplate>
                    <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("[CategoryName]")%>'></asp:Label>
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Item Name">
                <ItemTemplate>
                    <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
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
        SelectMethod="GetPhLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
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
    <asp:ObjectDataSource ID="odsSentizerDevice" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetPhLogSentizers" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPhLogKitchenInvetory" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetPhLogKitchenInventory" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
