<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_CleaningLog" Title="HACCP Builder | Cleaning Log" Codebehind="CleaningLogOld.aspx.cs" %>

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

    <div class="bdy_contents">
        <div class="grey_bg_dis">
            <div class="red_heading">
                { Cleaning and Sanitization Log }</div>
            <div class="discp_txt">
                Directions: Record item name, time, the Cleaning levels, and any corrective action taken on this form. 
                <b>If no items are testing any working day, indicate "No Ingredient/No Menu Item" in the form. </b>
                The foodservice manager will verify that foodservice employees have taken the required Cleaning level by visually monitoring foodservice employees
                 and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
            </div>
        </div>
        <div class="discp_bottom_bg">
            <div class="disc_buttons">
                <asp:ImageButton ID="cmdAddNew" CausesValidation="false" runat="server" OnClick="cmdAddNew_Click"
                    ImageUrl="~/images/buttons/btn_add_new_black.jpg" /></div>
            <div class="disc_buttons">
                <asp:HyperLink ID="hlBack" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" ImageUrl="~/images/buttons/btn_back_to_black.jpg"
                    runat="server"></asp:HyperLink></div>
        </div>
        <div class="log_heading">
            <div class="red_heading">
                { List of Cleaning and Sanitization Log Entries }</div>
        </div>
        <div class="log_form_left">
            <asp:GridView ID="grdCleaning" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin" CssClass="zebra"
                DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/CleaningLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
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
                    <asp:TemplateField HeaderText="Entry Date">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>                       
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
        </div>
        <div class="content_right">
            <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
                <tr>
                    <td bgcolor="#E3245A">
                        <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="368" border="0" cellspacing="0" cellpadding="0">
                            <tr align="right">
                                <td colspan="3" align="left" class="red_heading">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{
                                    Add/Edit Cleaning and Sanitization Log }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="red_heading">
                                    <asp:HiddenField ID="hfTempLow" runat="server" />
                                    <asp:HiddenField ID="hfTemCleaningigh" runat="server" />
                                    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:HiddenField ID="hfMobileId" runat="server" />
                                    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" />
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    QCL Maximum Cleaning Level:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <b>
                                        <asp:Label ID="Lbl_QCLMaxtempValue" Text="NA" runat="server"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    QCL Minimum Cleaning Level:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <b>
                                        <asp:Label ID="Lbl_QCLMintempValue" Text="NA" runat="server"></asp:Label></b>
                                </td>
                            </tr>
                            <tr>
                                <td width="138" align="right">
                                    Today's Date:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ErrorMessage="Service Date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                                </td>
                            </tr>                       
                            <tr>
                                <td align="right">
                                 <%-- &nbsp;--%>
                                   Equipment or Facility Area Item
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>                                    
                                    <div class="ui-widget"><asp:DropDownList ID="ddlInventory" DataSourceID="sqlDsKitchenInventory" Enabled="true" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="Id" Width="200px" runat="server" data-editableCombobox="true"
                                        AppendDataBoundItems="false">
                                        <asp:ListItem>Select Equipment/Inventory</asp:ListItem>
                                    </asp:DropDownList></div>
                                    <asp:RequiredFieldValidator ID="rfvInventory" Enabled="true" runat="server" Display="None"
                                        ErrorMessage="Please Select Equipment / Inventory Item" ControlToValidate="ddlInventory" CssClass="log_textbox"
                                        Font-Names="Verdana" Font-Size="10px" InitialValue="Select Equipment/Inventory"></asp:RequiredFieldValidator>
                                </td>
                            </tr>                             
                            <tr>
                                <td align="right">
                                   Equipment Item or Area is Working Properly:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>                                    
                                    <asp:RadioButton ID="rdbCorrectYes"  Text="Yes"
                                                CssClass="LogText" GroupName="CorrectItem" runat="server" />
                                    <asp:RadioButton ID="rdbCorrectNo"  Text="No"
                                                CssClass="LogText" GroupName="CorrectItem" runat="server" /> 
                                    <%--<asp:CustomValidator ID="CustomValidator2" ValidationGroup="CorrectItem" OnServerValidate="ValidateCorrect"
                                        runat="server" ErrorMessage="Please select Corrective Action field"
                                        Display="None"></asp:CustomValidator>   --%>
                                        <asp:CustomValidator ID="custCorrectiveAction" runat="server" OnServerValidate="ValidateCorrect" 
                                        ErrorMessage =" Please select Corrective Action field" Display="None"></asp:CustomValidator>
                                </td>
                            </tr>           
                            <tr>
                                <td align="right">
                                    Corrective Action :
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>                                      
                                    <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                        DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                    </asp:RadioButtonList>   
                                   <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="12" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource> 
                                </td>
                            </tr>
                            <tr id="trClearCorrectiveActions" runat="server">
                                <td align="right">
                                    Clear Corrective Action:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkClear" runat="server" />
                                </td>
                            </tr>  
                            <tr>
                                <td align="right">
                                 <%-- &nbsp;--%>
                                   Select Cleaning Solutions/Sanitizers
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>                                    
                                    <%--<asp:DropDownList ID="ddlSolvents" DataSourceID="ObjectDataSource3" Enabled="true" CssClass="log_textbox"
                                        DataTextField="Name" DataValueField="Id" Width="200px" runat="server"
                                        AppendDataBoundItems="false">
                                        <asp:ListItem>Chemicals/Solvents</asp:ListItem>
                                    </asp:DropDownList>--%>
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
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="true" runat="server" Display="None"
                                        ErrorMessage="Please Select Chemicals/Solvents" ControlToValidate="ddlSolvents" CssClass="log_textbox"
                                        Font-Names="Verdana" Font-Size="10px" InitialValue="Chemicals/Solvents"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>   
                            <tr>
                                <td width="138" align="right">
                                    Sanitizer Strength:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <asp:TextBox ID="txtSanitizer" runat="server" CssClass="log_textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSanitizerLength" runat="server" Display="None" ErrorMessage="Please fill Sanitizer Length field"
                                        ControlToValidate="txtSanitizer" CssClass="log_textbox" Enabled="true" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>   
                             <tr>
                                <td align="right">
                                    Water Temperature Recorded:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtWaterTemp" runat="server" MaxLength="8" CssClass="log_textbox"></asp:TextBox>
                                    <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtWaterTemp" 
                                        runat="server" ErrorMessage="Please select Corrective Action2 field for Water Temperature"
                                        Display="None"></asp:CustomValidator>
                                    <asp:RegularExpressionValidator ID="rglValidateTemp2" runat="server" ControlToValidate="txtWaterTemp"
                                        Display="None" ErrorMessage="The value in field Water Temperature is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>      
                            <tr>
                                <td width="138" align="right">
                                    Describe what was done?:
                                </td>
                                <td width="10">
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td width="225">
                                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>                             
                            <tr>
                                <td align="right">
                                    Verified By*:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="50" height="25" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="10" CssClass="log_textbox" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvVerified" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="Please fill Verified By field"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Verified Date:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                </td>
                                <td>
                                    <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                                        ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                                    <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                        Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>
                                    <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                        Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Entry Date:
                                </td>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="25" cssclass="log_textbox" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" Width="150px" CssClass="log_textbox"></asp:TextBox>
                                </td>
                            </tr>                           
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:ImageButton ID="cmdSubmit" runat="server" ImageUrl="~/images/buttons/ButtonUpdate.png"
                                        OnClick="cmdSubmit_Click" />
                                    <asp:ImageButton ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click"
                                        runat="server" ImageUrl="~/images/buttons/ButtonDelete.png" />
                                    <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png"
                                        OnClick="cmdAdd_Click" />
                                    <asp:ImageButton ID="cmdCancel" CausesValidation="false" runat="server" ImageUrl="~/images/buttons/ButtonCancel.png"
                                        OnClick="cmdCancel_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#E3245A">
                        <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                    </td>
                </tr>
            </table>
        </div>   
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
        <asp:Label ID="Label2" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
