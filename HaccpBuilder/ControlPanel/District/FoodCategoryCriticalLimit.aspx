<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_FoodCategoryCriticalLimit" Codebehind="FoodCategoryCriticalLimit.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
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


 
function MoveBack()
{
window.location = "DistrictControl.aspx";
}
function CheckLimits() {
    var txtCclHigh = document.getElementById("<%= txtCclHigh.ClientID %>").value;
    var txtCclLow = document.getElementById("<%= txtCclLow.ClientID %>").value;
    var txtQclLow = document.getElementById("<%= txtQclLow.ClientID %>").value;
    var txtQclHigh = document.getElementById("<%= txtQclHigh.ClientID %>").value;
    var validSummary = document.getElementById("<%=vldSummary.ClientID %>");
    var erroMsg = '';
    var valid = true;
   
    if (txtCclHigh.trim() == '' && txtQclHigh.trim() != '') {
        valid = false;
        erroMsg = erroMsg + "• QCL High value cannot be entered without CCL High value  <BR>";
    }
    if (txtCclLow.trim() == '' &&  txtQclLow.trim() != '') {
        valid = false;
        erroMsg = erroMsg + "• QCL Low value cannot be entered without CCL Low value  <BR>";
    }
    if (txtCclLow.trim() != '' ) {
        if (txtQclHigh.trim() != '' && parseFloat(txtQclHigh) < parseFloat(txtCclLow)) {
            valid = false;
            erroMsg = erroMsg + "• QCL High value should be greater than or equal to CCL Low value  <BR>";
        }
        if (txtQclLow.trim() != '' && parseFloat(txtQclLow) < parseFloat(txtCclLow)) {
            valid = false;
            erroMsg = erroMsg + "• QCL Low value should be greater than or equal to CCL Low value  <BR>";
        }
    }
    if (txtCclHigh.trim() != '') {
        if (parseFloat(txtQclHigh) > parseFloat(txtCclHigh)) {
            valid = false;
            erroMsg = erroMsg + "• QCL High value should be less than or equal to CCL High value  <BR>";
        }
        if (parseFloat(txtQclLow) > parseFloat(txtCclHigh)) {
            valid = false;
            erroMsg = erroMsg + "• QCL Low value should be less than or equal to CCL High value  <BR>";
        }
    }
    if (txtQclHigh.trim() != '') {
        if (parseFloat(txtQclLow.trim()) > parseFloat(txtQclHigh.trim())) {
            valid = false;
            erroMsg = erroMsg + "• QCL Low value should be less than or equal to QCL High value  <BR>";
        }
    }
    if (txtQclLow.trim() != '') {
    if(txtQclHigh.trim() != '' ){
        if (parseFloat(txtQclHigh) < parseFloat(txtQclLow)) {
            valid = false;
            erroMsg = erroMsg + "• QCL High value should be greater than or equal to QCL Low value  <BR>";
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
function CheckLimitsOld() {
    
    var txtCclHigh = document.getElementById("<%= txtCclHigh.ClientID %>");
    var txtCclLow = document.getElementById("<%= txtCclLow.ClientID %>");
    var txtQclLow = document.getElementById("<%= txtQclLow.ClientID %>");
    var txtQclHigh = document.getElementById("<%= txtQclHigh.ClientID %>");
    var lblMsg = document.getElementById("<%= lblMsg.ClientID %>");
    var check = 0;
   
    if (txtQclLow.value < txtCclLow.value) {
        alert('Low 1');
        lblMsg.value = 'QCL low temp value should be within range of CCL';        
        return false;  
    }
    if (txtQclLow.value > txtCclHigh.value) {
        alert('Low 2');
        lblMsg.value += '<br/>QCL low temp value should be within range of CCL';
        return false; 
    }
    if (txtQclHigh.value < txtCclLow.value ) {
        alert('High 1');
        lblMsg.value += '<br/>QCL high temp value should be within range of CCL';
        return false;           
    }
    if (txtQclHigh.value > txtCclHigh.value) {
        alert('High 2');
        lblMsg.value += '<br/>QCL high temp value should be within range of CCL';
        return false; 
    }    
    else{
        alert('ELSE');
        lblMsg.value = '';
        return true;
    }
    function SetValidation() {
        var vldCorrectiveAction = document.getElementById("<%= rfvCorrectiveAction.ClientID %>");
        ValidatorEnable(vldCorrectiveAction, false);
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
    <div class="ph-top">
    <asp:Label CssClass="msg-error" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
   <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" runat="server" ShowSummary="true" />
        <asp:HiddenField ID="hfCCPLimit" runat="server" />
        <asp:HiddenField ID="hfCorrectiveAction" runat="server" />
        <asp:HiddenField ID="hfSortOrder" runat="server" />
    </div>
 <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp"
                BackgroundCssClass="overlay"
                PopupDragHandleControlID="panelDragHandle" />
            <br />
            <div class="popUpStyleNew" id="divPopUp" style="display:none;">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>        
                    <br /> 
                <asp:Label ID="lblActionName" runat="server" Text = "Name"></asp:Label>       
                <asp:TextBox ID="txtActionName" TextMode="MultiLine" MaxLength="25" runat="server" ></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvCorrectiveAction" runat="server" ControlToValidate="txtActionName" Enabled="false" ErrorMessage="Please enter corrective Action name"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                             ControlToValidate="txtActionName"
                             ErrorMessage="The value in field Action Name is not valid." 
                             Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
                <br /> 
                <br />                       
                <asp:Button ID="cmdClose" runat="server" Text="OK" onclick="cmdClose_Click" />
                <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClientClick="SetValidation();" Text="Cancel" onclick="cmdCancel_Click"   />
               <br />
            </div>
            <div class="popUpStyleNew" id="divPopup1" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>        
                    <br /> 
               Successfully Updated!
                <br /> 
                <br />                       
                <asp:Button ID="cmdGo" runat="server" Text="OK" onclick="cmdGo_Click" />                
               <br />
            </div>
     <div class="form3">
        <h2>{ <asp:Label ID="lblLog" Text="" runat="server"></asp:Label>: Critical Control Points and Corrective Action Manager }</h2>
        <div class="clear"></div>
    </div>
     <div class="form3">
        <h2>{ Store cold or frozen until use - 41 degrees F or less, cold holding of 41 degrees F or lower, hygiene requirements, time requirements and prevention of cross-contamination. }</h2>
        <h1><b>Scientific Control Limit (SCL):</b></h1><br />
        <h1><b>Critical Control Limit (CCL): </b></h1><br />
        <h1><b>Quality Control Limit (QCL):</b></h1>
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
                  <td align="left">You have the option to deliver four different corrective actions to the 
                  person placing data in the log (here we will call that person the logger).</td>
                </tr>
                <tr>
                  <td align="left"> Once you click submit, an email will be sent to the email address
                    that you provided in the Location Manager Email field.  The email
                    sent to that address will provide the recipient with their new
                    logins to log into their location to begin building their Location
                    HACCP plan and reporting.</td>                  
                </tr>
                <tr>
                  <td align="left">The Boolean field on the right hand side of the Corrective Options turns on or off the specific					
                        corrective action.  A turned on corrective action will be delivered in the log for the logger					
                        to select as a corrective action executed at the point of a variance from the QCL.					
                  </td>                  
                </tr>
                <tr>
                  <td align="left">When you turn on a corrective option, the system will require you to enter the desired action					
                        option in the data field.  This message will be delivered to the logger at the time of a variance					
                  </td>
                </tr>  
                <tr>
                  <td align="left">At that time, the logger will select the option taken by clicking on the Boolean field of the 					
                       corrective action taken to log the data in your HACCP Builder Compliance system.	
                  </td>
                </tr> 
                <tr>
                  <td align="left"><b>NOTE:</b> The requested corrective action must be 124 characters or less.					
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
                    <table width="540">
                    <tr>
                    <td width="250">Type of Critical Limit</td>
                    <td align="center" >Minimum Temperature Requirement(F)</td>
                    <td align="center" >Maximum Temperature Requirement(F)</td>
                    <td align="center">Minimum Time Requirement(Minutes)</td>
                    <td align="center">Maximum Time Requirement(Minutes)</td>
                    </tr>     
                    <tr>
                    <td colspan="5">
                    <asp:ValidationSummary DisplayMode="List" ID="ValidationSummary1" runat="server" ShowSummary="true" />
                    <asp:Label ID="lblMsg" runat="server" Text="Test" Visible="true"></asp:Label>
                    <asp:HiddenField ID="hfCriticalLimitId" runat="server" />
                    <asp:HiddenField ID="hfCorrectiveActionId" runat="server" />
                    <asp:HiddenField ID="hfCorrectiveActionName" runat="server" />
                    <asp:HiddenField ID="hfFoodCategoryId" runat="server" />
                    </td>
                    </tr>           
                    <tr>
                        <td width="250">SCL</td>
                        <td align="center">
                            <asp:TextBox ID="txtSclLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                            
                            
                            
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="txtSclLow" Display="None" 
                             ErrorMessage="The value in field SCL Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>                    
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtSclHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txtSclHigh" Display="None" 
                                 ErrorMessage="The value in field  SCL High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                                 ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtSclHigh" ControlToCompare="txtSclLow"
                            Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Cooling Temperature Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtSclMin" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSclMin" Display="None" 
                                 ErrorMessage="The value in field SCL minimum time is not valid." Font-Names="Verdana" Font-Size="10px" 
                                 ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td>  
                        <td align="center">
                            <asp:TextBox ID="txtSclMax" runat="server"  CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSclMax" Display="None" 
                                 ErrorMessage="The value in field SCL maximum time is not valid." Font-Names="Verdana" Font-Size="10px" 
                                 ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td>
                                      
                    </tr>
                    <tr>
                        <td width="250">CCL</td>
                        <td align="center">
                            <asp:TextBox ID="txtCclLow" runat="server" MaxLength="8"  CssClass="TextTemperature" ></asp:TextBox>                                               
                                 <asp:RegularExpressionValidator ID="REV_txtCclLow"  runat="server" ControlToValidate="txtCclLow"
                                        Display="None" ErrorMessage="The value in field 'CCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtCclHigh" runat="server" MaxLength="8"  CssClass="TextTemperature" ></asp:TextBox>     
                            <asp:RegularExpressionValidator ID="REV_txtCclHigh" runat="server" ControlToValidate="txtCclHigh"
                                        Display="None" ErrorMessage="The value in field 'CCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>                       
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtCclMin" runat="server" MaxLength="5"  CssClass="TextTemperature"></asp:TextBox>                            
                    <asp:RegularExpressionValidator ID="REV_txtCclMin" runat="server" ControlToValidate="txtCclMin"
                                        Display="None" ErrorMessage="The value in field 'CCL(Maximum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtCclMax" runat="server" MaxLength="5"  CssClass="TextTemperature"></asp:TextBox>                           
              <asp:RegularExpressionValidator ID="REV_txtCclMax" runat="server" ControlToValidate="txtCclMax"
                                        Display="None" ErrorMessage="The value in field 'CCL(Minimum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td>
                                        
                    </tr>
                    <tr>
                        <td width="250">QCL</td>
                        <td align="center">
                            <asp:TextBox ID="txtQclLow" runat="server" MaxLength="8"  CssClass="TextTemperature" ></asp:TextBox>
                             <asp:RegularExpressionValidator ID="REV_txtQclLow" runat="server" ControlToValidate="txtQclLow"
                                        Display="None" ErrorMessage="The value in field 'QCL(Maximum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtQclHigh" runat="server" MaxLength="8"  CssClass="TextTemperature" ></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REV_txtQclHigh" runat="server" ControlToValidate="txtQclHigh"
                                        Display="None" ErrorMessage="The value in field 'QCL(Minimum Temperature)' is not valid.Please enter the temperature value between 9999 to -9999"
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[\-+]?[0-9]{1,4}(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>  
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtQclMin" runat="server" MaxLength="5" CssClass="TextTemperature"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="REV_txtQclMin" runat="server" ControlToValidate="txtQclMin"
                                        Display="None" ErrorMessage="The value in field 'QCL(Maximum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td> 
                        <td align="center">
                            <asp:TextBox ID="txtQclMax" runat="server" MaxLength="5"   CssClass="TextTemperature"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="REV_txtQclMax" runat="server" ControlToValidate="txtQclMax"
                                        Display="None" ErrorMessage="The value in field 'QCL(Minimum Time)' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                        </td>
                        
                     </tr> 
                     
                     
                      <asp:CompareValidator ID="cpvQCLHigh" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtQclLow" Display="None" Operator="GreaterThanEqual"
                                        ErrorMessage="The value in QCL High Temp field should be greter than QCL low Temp field"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh1" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtCclHigh" Display="None" ErrorMessage="The value in QCL High Temp field should be less than or equal to CCL High Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>
                                   
                                    <asp:CompareValidator ID="cpvQCLHigh2" runat="server" ControlToValidate="txtQclHigh" Type="Double"
                                        ControlToCompare="txtCclLow" Display="None" ErrorMessage="The value in QCL High Temp field should be greater than or equal to CCL Low Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
                                   
                                    <%--02-18-11
                                    <asp:CompareValidator ID="cpvQCLLow" runat="server" ControlToValidate="txtQclLow"  Type="Double"
                                        ControlToCompare="txtCclHigh" Display="None" ErrorMessage="The value in QCL Low Temp field should be less than or equal to CCL High Temp field"
                                        Operator="LessThanEqual"></asp:CompareValidator>--%>
                                   
                                    <asp:CompareValidator ID="cpvQCLLow1" runat="server" ControlToValidate="txtQclLow" Type="Double"
                                        ControlToCompare="txtCclLow" Display="None" ErrorMessage="The value in QCL Low Temp field should be greater than or equal to CCL Low Temp field"
                                        Operator="GreaterThanEqual"></asp:CompareValidator>
 
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCclHigh"
                                        ControlToCompare="txtCclLow" Display="None" Type="Double" Operator="GreaterThanEqual"
                                        ErrorMessage="The Value in field CCL High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                                     
                     
                     
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
                        DataSourceID="ObjectDataSource1" CssClass="zebra" onrowcommand="grdCorrectiveAction_RowCommand">                
                <Columns>                    
                        <asp:TemplateField HeaderText="Corrective Action Name" >
	                        <ItemTemplate>
	                            <asp:HiddenField ID="hfCorrectiveActionId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "CorrectiveActionID")  %>' />
	                            <asp:Label ID="lblName" runat="server" Text ='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Status" >
                            <ItemTemplate >
                                <asp:RadioButton ID="rdbAnswerYes" Text="ON" Checked='<%# Eval("Status").ToString() == "1"? true:false %>' GroupName="Status" runat="server" /> 
                                <asp:RadioButton ID="rdbAnswerNo" Text="OFF" Checked='<%# Eval("Status").ToString() == "0"? true:false %>' GroupName="Status"  runat="server" /> 
                            </ItemTemplate>
                        </asp:TemplateField>	                                        
	                    <asp:TemplateField HeaderText="Replace with new">
	                        <ItemTemplate>
	                            <asp:LinkButton ID="lkbReplace" Text="Replace" CommandName="Replace" CommandArgument='<%# Eval("CorrectiveActionID") %>'  runat="server" 
                               ></asp:LinkButton>
	                        </ItemTemplate>
	                    </asp:TemplateField > 
                </Columns>
            </asp:GridView>
                </td>
                </tr>                
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>       
                 
			     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetFoodCategoryCorrectiveActions" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategory">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="nFoodCategoryId" 
                        QueryStringField="FoodCategoryId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <tr>
                <td colspan="3"><asp:Button ID="cmdSubmit" runat="server" OnClientClick=" return CheckLimits();" Text="Submit" onclick="cmdSubmit_Click" />
                <asp:HyperLink ID="hlCancel" runat="server" CssClass="button" Text="Cancel" NavigateUrl = "~/ControlPanel/District/CustomFoodCategory.aspx"></asp:HyperLink>
                </td>          
                </tr>               
              </table>
        
        <div class="clear"></div>
    </div>
    
</div>
     </ContentTemplate>            
            </asp:UpdatePanel>

</asp:Content>
