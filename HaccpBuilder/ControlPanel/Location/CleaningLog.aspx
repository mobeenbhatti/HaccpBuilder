<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" Inherits="ControlPanel_Location_CleaningLog" Title="HACCP Builder | Cleaning Log" Codebehind="CleaningLog.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

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
        function CheckTemperature1(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemp1');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTemCleaningigh = document.getElementById('PlaceHolder_hfTemCleaningigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTemCleaningigh.value != 'NA') {
                if (txtTemp1.value != '') {

                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTemCleaningigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;

                    }
                }
            }
        }

        function CheckCorrectItem(sender, args) {
            alert('hello');
            var rdbCorrectNo = document.getElementById('PlaceHolder_rdbCorrectNo');
            var rdlCorrectiveAction1 = document.getElementById('PlaceHolder_rdlCorrectiveAction1');
            alert(rdlCorrectiveAction1);
             args.IsValid = false;
             if (rdbCorrectNo.checked == true) {
                 var radioButtonlist = document.getElementsByName("<%=rdlCorrectiveAction1.ClientID%>");
                 alert(radioButtonlist);
             for (var x = 0; x < radioButtonlist.length; x++) {
                 if (radioButtonlist[x].checked) {
                     alert("Selected item Value " + radioButtonlist[x].value);
                 }
             }

             ///////////////////////////////////////////
                 alert(rdlCorrectiveAction1.length);
            //var collection = document.getElementById(rdlCorrectiveAction1).getElementsByTagName('INPUT');
                for (var x = 0; x < rdlCorrectiveAction1.length; x++) {
                    alert(rdlCorrectiveAction1[x].checked);
                    if (rdlCorrectiveAction1[x].checked == true) { // if a button in group is checked,

                     args.IsValid = true;  // uncheck it
                }
            }                
               
            }
        }
    </script>

    <h3>Cleaning and Sanitization Log</h3>
   
    <div class="clear tenpx"></div>
    
    <p> Directions: Record item name, time, the Cleaning levels, and any corrective action taken on this form. 
                <b>If no items are testing any working day, indicate "No Ingredient/No Menu Item" in the form. </b>
                The foodservice manager will verify that foodservice employees have taken the required Cleaning level by visually monitoring foodservice employees
                 and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.</p>
   
    <div class="row">
    <!------------- INPUT FORM --------------->
    <div class="col-lg-6 col-md-6 portfolio-ite">
        <div class=".form-horizontal">  
            <div class="control-group">
                <asp:HiddenField ID="hfTempLow" runat="server" />
                <asp:HiddenField ID="hfTemCleaningigh" runat="server" />
                <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="alert alert-danger"
                    Enabled="true" />
            </div>      
            <div class="control-group">
                <label class="control-label" for="inputEmail">QCL Maximum Cleaning Level:</label>
                <div class="controls">
                <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">QCL Minimum Cleaning Level:</label>
                <div class="controls">
                <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label>
                </div>
            </div>
             <div class="control-group">
                <label class="control-label" for="inputEmail">Today's Date:</label>
                <div class="controls">
                <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Equipment or Facility Area Item:</label>
                <div class="controls">
                <asp:DropDownList ID="ddlInventory" DataSourceID="sqlDsKitchenInventory" Enabled="true" CssClass="log_textbox"
                    DataTextField="Name" DataValueField="Id" Width="200px" runat="server" data-editableCombobox="true"
                    AppendDataBoundItems="false">
                    <asp:ListItem>Select Equipment/Inventory</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvInventory" Enabled="true" runat="server" Display="None"
                    ErrorMessage="Please Select Equipment / Inventory Item" ControlToValidate="ddlInventory" CssClass="log_textbox"
                    Font-Names="Verdana" Font-Size="10px" InitialValue="Select Equipment/Inventory"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Equipment Item or Area is Working Properly:</label>
                <div class="controls">
                <asp:RadioButton ID="rdbCorrectYes"  Text="Yes"
                            CssClass="LogText" GroupName="CorrectItem" runat="server" />
                <asp:RadioButton ID="rdbCorrectNo"  Text="No"
                            CssClass="LogText" GroupName="CorrectItem" runat="server" />                                     
                    <asp:CustomValidator ID="custCorrectiveAction" runat="server" OnServerValidate="ValidateCorrect" 
                    ErrorMessage =" Please select Corrective Action field" Display="None"></asp:CustomValidator>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Corrective Action:</label>
                <div class="controls">
                <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false" CssClass="LogText"></asp:Label>
                                    <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="7" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" CssClass="LogText" runat="server">
                                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="control-group" id="trClearCorrectiveActions" runat="server">
                <label class="control-label" for="inputEmail">Clear Corrective Action:</label>
                <div class="controls">
                <asp:CheckBox ID="chkClear" runat="server" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Select Cleaning Solutions/Sanitizers:</label>
                <div class="controls">
                <asp:DropDownList ID="ddlSenitizer" Width="200px" DataSourceID="odsSentizerDevice" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="Id" AppendDataBoundItems="false" data-editableCombobox="true"
                                        runat="server">
                                        <asp:ListItem>Select Cleaning Solutions/Sanitizers</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSenitizer" runat="server" Display="None" ErrorMessage="Please Select Cleaning Solutions/Sanitizers"
                                        ControlToValidate="ddlSenitizer" CssClass="log_textbox" Enabled="true" Font-Names="Verdana"
                                        Font-Size="10px" InitialValue="Select Cleaning Solutions/Sanitizers"></asp:RequiredFieldValidator>
                                    <asp:ObjectDataSource ID="odsSentizerDevice" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetPhLogSentizers" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPhLog">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Sanitizer Strength:</label>
                <div class="controls">
                <asp:TextBox ID="txtSanitizer" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSanitizerLength" runat="server" Display="None" ErrorMessage="Please fill Sanitizer Length field"
                    ControlToValidate="txtSanitizer" CssClass="log_textbox" Enabled="true" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail"> Describe what was done?:</label>
                <div class="controls">
                 <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
                 </div>               
            </div>
            <div class="control-group">
                <label class="control-label" for="inputEmail">Verified By*:</label>
                <div class="controls">
                <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="log_textbox"></asp:TextBox>
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
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
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
          <asp:GridView ID="grdCleaning" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID"  />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/CleaningLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Clean">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>           
    </div>
 </div>
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetCleaningLogDataSetByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetCleaningLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                         <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource> 
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
         <asp:SqlDataSource ID="sqlDsKitchenInventory" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspAdm_GetKitchenInventoryFilteredBySortOrder" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="9" Name="nSortOrder" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>   
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCleaningLogInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCleaningLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
