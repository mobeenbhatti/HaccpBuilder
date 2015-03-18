<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="CleaningLog.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.CleaningLogNew" %>
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

     
    </script>
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Cleaning and Sanitization Log</h1>
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
    Service Date: <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                  <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate" Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                Type="Date"></asp:CompareValidator>
    </div>
  </div>
  <div class="clear"></div>
  <h2>Equipment or Facility Area Item:</h2>
  <div class="form3">
    <div class="left">      
      <div class="input">
        <div class="ui-widget"><asp:DropDownList ID="ddlInventory" DataSourceID="sqlDsKitchenInventory" Enabled="true" DataTextField="Name" DataValueField="Id" Width="200px" runat="server" data-editableCombobox="true" AppendDataBoundItems="false">
        <asp:ListItem>Select Equipment/Inventory</asp:ListItem>
        </asp:DropDownList></div>
        <asp:RequiredFieldValidator ID="rfvInventory" Enabled="true" runat="server" Display="None" ErrorMessage="Please Select Equipment / Inventory Item" ControlToValidate="ddlInventory" CssClass="log_textbox"
        Font-Names="Verdana" Font-Size="10px" InitialValue="Select Equipment/Inventory"></asp:RequiredFieldValidator>
      </div>
    </div>        
    <div class="left margin-lr">         
          <div class="input">
            <asp:DropDownList ID="ddlSenitizer" Width="200px" DataSourceID="odsSentizerDevice" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="false" data-editableCombobox="true" runat="server">
                <asp:ListItem>Select Cleaning Solutions/Sanitizers</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSenitizer" runat="server" Display="None" ErrorMessage="Please Select Cleaning Solutions/Sanitizers" ControlToValidate="ddlSenitizer" CssClass="log_textbox" Enabled="true" Font-Names="Verdana"
                Font-Size="10px" InitialValue="Select Cleaning Solutions/Sanitizers"></asp:RequiredFieldValidator>
            <asp:ObjectDataSource ID="odsSentizerDevice" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPhLogSentizers" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
          </div>
       </div>    
    <div class="clear"></div>
  </div>  
  <div class="form4 left marginright">
    <h2>Equipment Item or Area is Working Properly:</h2>
    <div class="input left">
         <asp:RadioButton ID="rdbCorrectYes"  Text="Yes" CssClass="LogText" GroupName="CorrectItem" runat="server" />
         <asp:RadioButton ID="rdbCorrectNo"  Text="No" CssClass="LogText" GroupName="CorrectItem" runat="server" />        
         <asp:CustomValidator ID="custCorrectiveAction" runat="server" OnServerValidate="ValidateCorrect" 
            ErrorMessage =" Please select Corrective Action field" Display="None"></asp:CustomValidator>
    </div>
    <div class="clear"></div>
    <br />
    <h4>Corrective Action:</h4>
    <div class="input">
        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>                                      
        <asp:RadioButtonList ID="rdlCorrectiveAction1"  DataValueField="CorrectiveActionID" DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server"></asp:RadioButtonList>   
        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                <asp:Parameter DefaultValue="12" Name="nLogTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
         
        <br />
      <div id="trClearCorrectiveActions" runat="server"><asp:CheckBox ID="chkClear" runat="server" />Clear Corrective Action</div>
    </div>
    <br />
  </div>
  <div class="form4 left">
    <h2 >Sanitizer Strength:</h2>
    <div class="input left">
        <asp:TextBox ID="txtSanitizer" runat="server" CssClass="log_textbox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSanitizerLength" runat="server" Display="None" ErrorMessage="Please fill Sanitizer Length field"
         ControlToValidate="txtSanitizer" CssClass="log_textbox" Enabled="true" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <h1 >Water Temperature Recorded:</h1>
    <div class="input left">
        <asp:TextBox ID="txtWaterTemp" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtWaterTemp" runat="server" ErrorMessage="Please select Corrective Action2 field for Water Temperature" Display="None"></asp:CustomValidator>
        <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtWaterTemp" Display="None" ErrorMessage="The value in field Water Temperature is not valid.Please enter the temperature value between 9999.99 to -9999.99"
            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <br />
    <h4>Describe what was done?:</h4>
    <div class="input">
        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
      <br />
      <div id="trClearCorrectiveActions2" runat="server"></div></div>
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
      <h4 class="left">List of Cleaning Log Entries</h4>
    </div>
    <asp:GridView ID="grdCleaning" runat="server" AutoGenerateColumns="False" CssClass="zebra"
        DataSourceID="ObjectDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
            <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/CleaningLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                        Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle Width="120px" />
                <HeaderStyle CssClass="gridheaderline" />
            </asp:TemplateField>                    
            <asp:TemplateField HeaderText=" Item Name">
                <ItemTemplate>
                    <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
                <HeaderStyle CssClass="gridheaderline" />
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Is Clean">
                <ItemTemplate>
                    <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
                <HeaderStyle CssClass="gridheaderline" />
            </asp:TemplateField>                   
            <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="120px" />
                <HeaderStyle CssClass="gridheaderline" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetCleaningLogDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetCleaningLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>     
    <div class="box-bottom"> </div>
  </div>
</div>
<asp:HiddenField ID="hfTempLow" runat="server" />
<asp:HiddenField ID="hfTemCleaningigh" runat="server" />
<asp:Label ID="Label2" ForeColor="Red" runat="server" Text=""></asp:Label>
<asp:HiddenField ID="hfMobileId" runat="server" />
<asp:SqlDataSource ID="sqlDsKitchenInventory" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspAdm_GetKitchenInventoryFilteredBySortOrder" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="9" Name="nSortOrder" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>      
         <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCleaningLogInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCleaningLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <%-- <div class="grey_bg_form">
            <a href="InventoryItemManager.aspx">Terms Of Use</a> <a href="InventoryItemManager.aspx">
                Training Manual</a>
        </div>--%>
        <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
