<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_FreezerLogCustom" Codebehind="FreezerLogCustom.aspx.cs" %>
<%@ Register Src="../../Controls/DistrictAddrssNew.ascx" TagName="DistrictAddrssNew"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">
<style>
td {line-height: 2.0em;}
</style>
    <script language="javascript" type="text/javascript">

        //    var bEdited=new Boolean();

        //    function UnLoadWindow() {
        //       
        //        if (!(bEdited)) {
        //           return
        //        }
        //        return 'DMC strongly recommends NOT closing this window yet.'
        //    }
        // 
        //    window.onbeforeunload = UnLoadWindow;



        function MoveBack() {
            window.location = "DistrictControl.aspx";
        }
        
            function SetValidation() {
                alert('Hello');
                var vldCorrectiveAction = document.getElementById("<%= rfvCorrectiveAction.ClientID %>");
                var revCorrectiveAction = document.getElementById("<%= revCorrectiveAction.ClientID %>");
                alert(vldCorrectiveAction);
                alert(revCorrectiveAction);
                if (revCorrectiveAction) {
                   
                }
            }
        }
    </script>

   <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div class="container">
            <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="overlay" PopupDragHandleControlID="panelDragHandle" />
            <br />
            <div class="popUpStyleNew" id="divPopUp" style="display: none;">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
                <asp:Label ID="lblActionName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="txtActionName" TextMode="MultiLine" MaxLength="25" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvCorrectiveAction" ValidationGroup="CA" runat="server" ControlToValidate="txtActionName"
                    Enabled="false" ErrorMessage="Please enter corrective Action name"></asp:RequiredFieldValidator>
                <br />
                <%-- RGK(03-22-10) Bug Id:1691
                    Increase the length to 100. Also make validator disable on clicking "Cancel" button  --%>
                <asp:RegularExpressionValidator ID="revCorrectiveAction" runat="server" ControlToValidate="txtActionName"
                    ErrorMessage="The value in field Action Name is not valid." ValidationGroup="CA" Font-Names="Verdana"
                    Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\',\-.\/]{1,100}$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Button ID="cmdClose" runat="server" ValidationGroup="CA" Text="OK" OnClick="cmdClose_Click" />
                <asp:Button ID="cmdCancel" runat="server" CausesValidation="false"
                    Text="Cancel" OnClick="cmdCancel_Click" />
                <br />
            </div>
            <div class="popUpStyleNew" id="divPopup1" style="display: none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
                Successfully Updated!
                <br />
                <br />
                <asp:Button ID="cmdGo" runat="server" Text="OK" OnClick="cmdGo_Click" />
                <br />
            </div>
             <div class="ph-top">
    <asp:Label CssClass="msg-error" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
   <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" runat="server" ShowSummary="true" />
        <asp:HiddenField ID="hfCCPLimit" runat="server" />
        <asp:HiddenField ID="hfCorrectiveAction" runat="server" />
        <asp:HiddenField ID="hfSortOrder" runat="server" />
    </div>
     <div class="form3">
        <h2>{ <asp:Label ID="lblLog" Text="" runat="server"></asp:Label>: Critical Control Points and Corrective Action Manager }</h2>
        <div class="clear"></div>
    </div>
     <div class="form3">
        <h2>{ Store cold or frozen until use - 41 degrees F or less, cold holding of 41 degrees F or lower, hygiene requirements, time requirements and prevention of cross-contamination.}</h2><br />
        <div class="left">Scientific Control Limit (SCL):</div><div class="left marginright margin-lr">Critical Control Limit (CCL):</div>Quality Control Limit (QCL):
        <div class="clear"></div>
    </div>
    <div class="form3">  
        <table  border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td ></td>
            </tr>
            <tr>
              <td><table  border="0" cellspacing="0" cellpadding="0" padding="5px" width="100%">
                <tr align="right">
                  <td colspan="3" align="left"><h2>{ INSTRUCTIONS }</h2></td>
                </tr>
                <tr>
                  <td align="left">You have the option to deliver four different corrective actions to the person placing
                                            data in the log (here we will call that person the logger).</td>
                </tr>
                <tr>
                  <td align="left"> The Boolean field on the right hand side of the Corrective Options turns on or off
                                            the specific corrective action. A turned on corrective action will be delivered
                                            in the log for the logger to select as a corrective action executed at the point
                                            of a variance from the QCL.</td>                  
                </tr>
                <tr>  <td align="left">When you turn on a corrective option, the system will require you to enter the desired
                                            action option in the data field. This message will be delivered to the logger at
                                            the time of a variance				
                  </td>                  
                </tr>
                <tr>
                  <td align="left"> At that time, the logger will select the option taken by clicking on the Boolean
                                            field of the corrective action taken to log the data in your HACCP Builder Compliance
                                            system.				
                  </td>
                </tr>  
                <tr>
                  <td align="left"> <b>NOTE:</b> The requested corrective action must be 100 characters or less.
                  </td>
                </tr>               
              </table></td>
            </tr>
            <tr>
              <td ></td>
            </tr>
          </table>
        <div class="clear"></div>
     </div>
    <div class="form3">
	<table  border="0" cellspacing="0" cellpadding="0" > 
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>
                <tr>
                <td colspan="3">
                    <table width="540" border="0">
                                    <tr>
                                        <td width="250">
                                            Type of Critical Limit
                                        </td>
                                        <td align="center" >
                                           Temperature Requirement(F)
                                        </td>
                                       <%-- <td align="center">
                                            Maximum Temperature Requirement(F)
                                        </td>--%>
                                        <td align="center" >
                                            Time Requirement for Second Temp(Minutes)
                                        </td>
                                        <td align="center" >
                                            Time Requirement for Third Temp(Minutes)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <asp:ValidationSummary DisplayMode="List" ID="ValidationSummary1" runat="server" ShowSummary="true" />
                                            <%-- RGK 03-19-10   
                                            Remove label text
                                            --%>
                                            <asp:Label ID="lblMsg" runat="server" Visible="true"></asp:Label>
                                            
                                            <asp:HiddenField ID="hfCriticalLimitId" runat="server" />
                                            <asp:HiddenField ID="hfCorrectiveActionId" runat="server" />
                                            <asp:HiddenField ID="hfCorrectiveActionName" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">
                                            SCL
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtSclLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                           
                                        </td>
                                        <%--<td align="center">
                                            <asp:TextBox ID="txtSclHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                                           
                                            <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtSclHigh"
                                                ControlToCompare="txtSclLow" Display="None" Type="Double" Operator="GreaterThanEqual"
                                                ErrorMessage="The Value in field Cooling Temperature Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                                        </td>--%>
                                        <td align="center">
                                            <asp:TextBox ID="txtSclMax" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                                          
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtSclMin" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">
                                            CCL
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtCclLow" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="REV_txtCclLow" runat="server" ControlToValidate="txtCclLow"
                                        Display="None" ErrorMessage="The value in field 'CCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                
                                                      </td>
                                        <%--<td align="center">
                                            <asp:TextBox ID="txtCclHigh" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="REV_txtCclHigh" runat="server" ControlToValidate="txtCclHigh"
                                        Display="None" ErrorMessage="The value in field 'CCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>--%>
                                        <td align="center">
                                            <asp:TextBox ID="txtCclMax" MaxLength="5" runat="server" CssClass="TextTemperature"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="REV_txtCclMax" runat="server" ControlToValidate="txtCclMax"
                                        Display="None" ErrorMessage="The value in field 'CCL(Minimum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtCclMin" MaxLength="5" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="REV_txtCclMin" runat="server" ControlToValidate="txtCclMin"
                                        Display="None" ErrorMessage="The value in field 'CCL(Maximum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">
                                            QCL
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtQclLow" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="REV_txtQclLow" runat="server" ControlToValidate="txtQclLow"
                                        Display="None" ErrorMessage="The value in field 'QCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>
                                        <%--<td align="center">
                                            <asp:TextBox ID="txtQclHigh" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="REV_txtQclHigh" runat="server" ControlToValidate="txtQclHigh"
                                        Display="None" ErrorMessage="The value in field 'QCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>--%>
                                        <td align="center">
                                            <asp:TextBox ID="txtQclMax" MaxLength="5" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="REV_txtQclMax" runat="server" ControlToValidate="txtQclMax"
                                        Display="None" ErrorMessage="The value in field 'QCL(Minimum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtQclMin" MaxLength="5" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="REV_txtQclMin" runat="server" ControlToValidate="txtQclMin"
                                        Display="None" ErrorMessage="The value in field 'QCL(Maximum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                   <!-- SECOND TIME VALUES--> 
                                   <span id="tblCoolingLog" runat="server" visible="true">
                                                             
                                    <tr>
                                    <td colspan="5">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            SCL 2
                                        </td>
                                        <td align="center" >
                                            <asp:TextBox ID="txtSclLow1" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                           
                                        </td>
                                       <%-- <td align="center" >
                                            <asp:TextBox ID="txtSclHigh1" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtSclHigh1"
                                                ControlToCompare="txtSclLow1" Display="None" Type="Double" Operator="GreaterThanEqual"
                                                ErrorMessage="The Value in field Cooling Temperature Log High1 Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                                        </td> --%>
                                        <td >&nbsp;</td> 
                                         <td >&nbsp;</td>                                       
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            CCL 2
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtCclLow1" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCclLow1"
                                        Display="None" ErrorMessage="The value in field 'CCL 1(Minimum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                      </td>
                                       <%-- <td align="center">
                                            <asp:TextBox ID="txtCclHigh1" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCclHigh1"
                                        Display="None" ErrorMessage="The value in field 'CCL 1(Maximum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td> --%>
                                        <td>&nbsp;</td> 
                                        <td>&nbsp;</td>                                        
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            QCL 2
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtQclLow1" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtQclLow1"
                                        Display="None" ErrorMessage="The value in field 'QCL 1(Maximum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>
                                       <%-- <td align="center">
                                            <asp:TextBox ID="txtQclHigh1" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtQclHigh1"
                                        Display="None" ErrorMessage="The value in field 'QCL 1(Minimum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>--%>
                                        <td>&nbsp;</td> 
                                        <td>&nbsp;</td>                                         
                                    </tr>
                                    <!-- THIRD TIME VALUES-->
                                    <tr>
                                    <td colspan="5">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            SCL 3
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtSclLow2" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                           
                                        </td>
                                        <%--<td align="center">
                                            <asp:TextBox ID="txtSclHigh2" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                                           
                                            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtSclHigh2"
                                                ControlToCompare="txtSclLow2" Display="None" Type="Double" Operator="GreaterThanEqual"
                                                ErrorMessage="The Value in field Cooling Temperature Log High 2 Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                                        </td> --%>
                                        <td>&nbsp;</td> 
                                        <td>&nbsp;</td>                                       
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            CCL 3
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtCclLow2" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCclLow2"
                                        Display="None" ErrorMessage="The value in field 'CCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                      </td>
                                       <%-- <td align="center">
                                            <asp:TextBox ID="txtCclHigh2" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCclHigh2"
                                        Display="None" ErrorMessage="The value in field 'CCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>--%>
                                        <td>&nbsp;</td> 
                                        <td>&nbsp;</td>                                         
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            QCL 3
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="txtQclLow2" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtQclLow2"
                                        Display="None" ErrorMessage="The value in field 'QCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999.99 to -9999.99"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>
                                       <%-- <td align="center">
                                            <asp:TextBox ID="txtQclHigh2" MaxLength="8" runat="server" CssClass="TextTemperature"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtQclHigh2"
                                        Display="None" ErrorMessage="The value in field 'QCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                        </td>--%>
                                        <td>&nbsp;</td> 
                                        <td>&nbsp;</td>                                         
                                    </tr>
                                    </span> 
                                   <!-- Validation for First Set of Values -->
                                   <%-- <asp:CompareValidator ID="cpvQCLHigh" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtQclLow" Display="None" Operator="GreaterThanEqual"
                                        ErrorMessage="The value in QCL High Temp field should be greter than QCL low Temp field"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh1" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtCclHigh" Display="None" ErrorMessage="The value in QCL High Temp field should be less than or equal to CCL High Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh2" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtCclLow" Display="None" ErrorMessage="The value in QCL High Temp field should be greater than or equal to CCL Low Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLLow" runat="server" ControlToValidate="txtQclLow"  Type="Double"
                                        ControlToCompare="txtCclHigh" Display="None" ErrorMessage="The value in QCL Low Temp field should be less than or equal to CCL High Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                        
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCclHigh"
                                        ControlToCompare="txtCclLow" Display="None" Type="Double" Operator="GreaterThanEqual"
                                        ErrorMessage="The Value in field CCL High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                                  
                                   --%>
                                    <asp:CompareValidator ID="cpvQCLLow1" runat="server" ControlToValidate="txtQclLow" Type="Double"
                                        ControlToCompare="txtCclLow" Display="None" ErrorMessage="The value in QCL Low Temp field should be greater than or equal to CCL Low Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
 
                                   
                                  <!-- Validation for Second Set of Values -->
                                   <%-- <asp:CompareValidator ID="cpvQCLHigh11" runat="server" ControlToValidate="txtQclHigh1" Type="Double"
                                        ControlToCompare="txtQclLow1" Display="None" Operator="GreaterThanEqual"
                                        ErrorMessage="The value in QCL High2 Temp field should be greter than QCL Low2 Temp field"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh12" runat="server" ControlToValidate="txtQclHigh1" Type="Double"
                                        ControlToCompare="txtCclHigh1" Display="None" ErrorMessage="The value in QCL High2 Temp field should be less than or equal to CCL High2 Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh21" runat="server" ControlToValidate="txtQclHigh1" Type="Double"
                                        ControlToCompare="txtCclLow1" Display="None" ErrorMessage="The value in QCL High2 Temp field should be greater than or equal to CCL Low2 Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtQclLow1"  Type="Double"
                                        ControlToCompare="txtCclHigh1" Display="None" ErrorMessage="The value in QCL Low2 Temp field should be less than or equal to CCL High2 Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                   <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="txtCclHigh1"
                                        ControlToCompare="txtCclLow1" Display="None" Type="Double" Operator="GreaterThanEqual"
                                        ErrorMessage="The Value in field CCL High2 Temp field should be Greater than or equal to Low2 Temp field"></asp:CompareValidator>

                                   --%>
                                    <asp:CompareValidator ID="cpvQCLLow11" runat="server" ControlToValidate="txtQclLow1" Type="Double"
                                        ControlToCompare="txtCclLow1" Display="None" ErrorMessage="The value in QCL Low2 Temp field should be greater than or equal to CCL Low2 Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
 
                                    
                                  <!-- Validation for Third Set of Values -->
                                   <%-- <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtQclHigh2" Type="Double"
                                        ControlToCompare="txtQclLow2" Display="None" Operator="GreaterThanEqual"
                                        ErrorMessage="The value in QCL High3 Temp field should be greter than QCL Low3 Temp field"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh22" runat="server" ControlToValidate="txtQclHigh2" Type="Double"
                                        ControlToCompare="txtCclHigh2" Display="None" ErrorMessage="The value in QCL High3 Temp field should be less than or equal to CCL High3 Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtQclHigh2" Type="Double"
                                        ControlToCompare="txtCclLow2" Display="None" ErrorMessage="The value in QCL High3 Temp field should be greater than or equal to CCL Low3 Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLLow2" runat="server" ControlToValidate="txtQclLow2"  Type="Double"
                                        ControlToCompare="txtCclHigh2" Display="None" ErrorMessage="The value in QCL Low3 Temp field should be less than or equal to CCL High3 Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                        
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="txtCclHigh2"
                                        ControlToCompare="txtCclLow2" Display="None" Type="Double" Operator="GreaterThanEqual"
                                        ErrorMessage="The Value in field CCL High3 Temp field should be Greater than or equal to Low3 Temp field"></asp:CompareValidator>
                                    
                                   --%>
                                    <asp:CompareValidator ID="cpvQCLLow21" runat="server" ControlToValidate="txtQclLow2" Type="Double"
                                        ControlToCompare="txtCclLow2" Display="None" ErrorMessage="The value in QCL Low3 Temp field should be greater than or equal to CCL Low3 Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
 
                                    <!-- REQUIRED FIELD VALIDATORS -->
                                    <asp:RequiredFieldValidator ID="rfvSclLow" ControlToValidate="txtSclLow" runat="server" ErrorMessage="Value in  SCL Temp Low  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCclLow" ControlToValidate="txtCclLow" runat="server" ErrorMessage="Value in  CCL Temp Low  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQclLow" ControlToValidate="txtQclLow" runat="server" ErrorMessage="Value in  QCL Temp Low  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvSClLow1" ControlToValidate="txtSclLow1" runat="server" ErrorMessage="Value in  SCL Temp Low 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCClLow1" ControlToValidate="txtCclLow1" runat="server" ErrorMessage="Value in  CCL Temp Low 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQclLow1" ControlToValidate="txtQclLow1" runat="server" ErrorMessage="Value in  QCL Temp Low 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvSClLow2" ControlToValidate="txtSclLow2" runat="server" ErrorMessage="Value in  SCL Temp Low 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCClLow2" ControlToValidate="txtCclLow2" runat="server" ErrorMessage="Value in  CCL Temp Low 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQClLow2" ControlToValidate="txtQclLow2" runat="server" ErrorMessage="Value in  QCL Temp Low 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    
                                    <%-- <asp:RequiredFieldValidator ID="rfvSclHigh" ControlToValidate="txtSclHigh" runat="server" ErrorMessage="Value in  SCL Temp High  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCclHigh" ControlToValidate="txtCclHigh" runat="server" ErrorMessage="Value in  CCL Temp High  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQclHigh" ControlToValidate="txtQclHigh" runat="server" ErrorMessage="Value in  QCL Temp High  field is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvSclHigh1" ControlToValidate="txtSclHigh1" runat="server" ErrorMessage="Value in  SCL Temp High 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCclHigh1" ControlToValidate="txtCclHigh1" runat="server" ErrorMessage="Value in  CCL Temp High 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQclHigh1" ControlToValidate="txtQclHigh1" runat="server" ErrorMessage="Value in  QCL Temp High 2 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvSclHigh2" ControlToValidate="txtSclHigh2" runat="server" ErrorMessage="Value in  SCL Temp High 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvCclHigh2" ControlToValidate="txtCclHigh2" runat="server" ErrorMessage="Value in  CCL Temp High 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="rfvQclHigh2" ControlToValidate="txtQclHigh2" runat="server" ErrorMessage="Value in  QCL Temp High 3 field is required" Display="None" Enabled="false"></asp:RequiredFieldValidator> 
                                    --%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="txtCclMin" runat="server" ErrorMessage="The value in field 'CCL(Minimum Time)' is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="txtCclMax" runat="server" ErrorMessage="The value in field 'CCL(Maximum Time)' is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="txtQclMin" runat="server" ErrorMessage="The value in field 'QCL(Minimum Time)' is required" Display="None"></asp:RequiredFieldValidator> 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="txtQclMax" runat="server" ErrorMessage="The value in field 'QCL(Maximum Time)' is required" Display="None"></asp:RequiredFieldValidator> 
                                     
                                </table>
                </td>
                </tr>
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>    
                <tr>
                <td colspan="3">
                    <asp:GridView ID="grdCorrectiveAction" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="ObjectDataSource1" CssClass="zebra" OnRowCommand="grdCorrectiveAction_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Corrective Action Name" >
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hfCorrectiveActionId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "CorrectiveActionID")  %>' />
                                                <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" >
                                            <ItemTemplate>
                                                <asp:RadioButton ID="rdbAnswerYes" Text="ON" Checked='<%# Eval("Status").ToString() == "1"? true:false %>'
                                                    GroupName="Status" runat="server" />
                                                <asp:RadioButton ID="rdbAnswerNo" Text="OFF" Checked='<%# Eval("Status").ToString() == "0"? true:false %>'
                                                    GroupName="Status" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Replace with new" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkbReplace" Text="Replace" CommandName="Replace" CommandArgument='<%# Eval("CorrectiveActionID") %>'
                                                    runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                </td>
                </tr>                
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>       
                 
			     <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetKitchenCorrectiveActionByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                            <SelectParameters>
                                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                <asp:QueryStringParameter DefaultValue="1" Name="nLogTypeId" QueryStringField="LogType"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <tr>
                <td colspan="3"><asp:Button ID="cmdSubmit" runat="server" OnClientClick=" return CheckLimits();" Text="Submit" onclick="cmdSubmit_Click" />
                <asp:HyperLink ID="hlCancel" runat="server" CssClass="button" Text="Cancel" ></asp:HyperLink>
                </td>          
                </tr>               
              </table>
        
        <div class="clear"></div>
    </div>
</div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>
