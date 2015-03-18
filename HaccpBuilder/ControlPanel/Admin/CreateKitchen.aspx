﻿<%@ Page Language="C#" MasterPageFile="~/ControlPanel/AdminMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Admin_CreateKitchen" Title="HACCP Builder | Edit Location" Codebehind="CreateKitchen.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <script language="javascript" type="text/javascript">
function MoveBack()
{
window.location = "DistrictControl.aspx";
}

function SetAlerts(nLogId)
{
     if(nLogId == 1)
     {
         var rdbColdHoldingLogOff= document.getElementById('PlaceHolder_rdbColdHoldingLogOff');
         var rdbColdHoldingLogOn= document.getElementById('PlaceHolder_rdbColdHoldingLogOn');
         var rdbColdHoldingLogAlertOn = document.getElementById('PlaceHolder_rdbColdHoldingLogAlertOn');
         var rdbColdHoldingLogAlertOff = document.getElementById('PlaceHolder_rdbColdHoldingLogAlertOff');
         
         if(rdbColdHoldingLogOff.checked == true)
         {
         rdbColdHoldingLogAlertOn.disabled = true;
         rdbColdHoldingLogAlertOff.disabled = true;
         rdbColdHoldingLogAlertOff.checked = true;
         }
         if(rdbColdHoldingLogOn.checked == true)
         {
         rdbColdHoldingLogAlertOn.disabled = false;
         rdbColdHoldingLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 2)
     {
         var rdbFreezerLogOff = document.getElementById('PlaceHolder_rdbFreezerLogOff');
         var rdbFreezerLogOn = document.getElementById('PlaceHolder_rdbFreezerLogOn');
         var rdbFreezerLogAlertOn = document.getElementById('PlaceHolder_rdbFreezerLogAlertOn');
         var rdbFreezerLogAlertOff = document.getElementById('PlaceHolder_rdbFreezerLogAlertOff');
         
         if(rdbFreezerLogOff.checked == true)
         {
         rdbFreezerLogAlertOn.disabled = true;
         rdbFreezerLogAlertOff.disabled = true;
         rdbFreezerLogAlertOff.checked = true;
         }
         if(rdbFreezerLogOn.checked == true)
         {
         rdbFreezerLogAlertOn.disabled = false;
         rdbFreezerLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 3)
     {
         var rdbFoodSafetyOff = document.getElementById('PlaceHolder_rdbFoodSafetyOff');
         var rdbFoodSafetyOn = document.getElementById('PlaceHolder_rdbFoodSafetyOn');
         var rdbFoodSafetyAlertOn = document.getElementById('PlaceHolder_rdbFoodSafetyAlertOn');
         var rdbFoodSafetyAlertOff = document.getElementById('PlaceHolder_rdbFoodSafetyAlertOff');
        
        if(rdbFoodSafetyOff.checked == true)
         {
         rdbFoodSafetyAlertOn.disabled = true;
         rdbFoodSafetyAlertOff.disabled = true;
         rdbFoodSafetyAlertOff.checked=true;
         }
         if(rdbFoodSafetyOn.checked == true)
         {
         rdbFoodSafetyAlertOn.disabled = false;
         rdbFoodSafetyAlertOff.disabled = false;
         }
     }
      if(nLogId == 4)
     {
         var rdbHotHoldingLogOff = document.getElementById('PlaceHolder_rdbHotHoldingLogOff');
         var rdbHotHoldingLogOn = document.getElementById('PlaceHolder_rdbHotHoldingLogOn');
         var rdbHotHoldingLogAlertOn = document.getElementById('PlaceHolder_rdbHotHoldingLogAlertOn');
         var rdbHotHoldingLogAlertOff = document.getElementById('PlaceHolder_rdbHotHoldingLogAlertOff');
         
         if(rdbHotHoldingLogOff.checked == true)
         {
         rdbHotHoldingLogAlertOn.disabled = true;
         rdbHotHoldingLogAlertOff.disabled = true;
         rdbHotHoldingLogAlertOff.checked = true;
         }
         if(rdbHotHoldingLogOn.checked == true)
         {
         rdbHotHoldingLogAlertOn.disabled = false;
         rdbHotHoldingLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 5)
     {
         var rdbReceivingLogOff = document.getElementById('PlaceHolder_rdbReceivingLogOff');
         var rdbReceivingLogOn = document.getElementById('PlaceHolder_rdbReceivingLogOn');
         var rdbReceivingLogAlertOn = document.getElementById('PlaceHolder_rdbReceivingLogAlertOn');
         var rdbReceivingLogAlertOff = document.getElementById('PlaceHolder_rdbReceivingLogAlertOff');
         
         if(rdbReceivingLogOff.checked == true)
         {
         rdbReceivingLogAlertOn.disabled = true;
         rdbReceivingLogAlertOff.disabled = true;
         rdbReceivingLogAlertOff.checked = true;
         }
         if(rdbReceivingLogOn.checked == true)
         {
         rdbReceivingLogAlertOn.disabled = false;
         rdbReceivingLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 6)
     {
         var rdbRefrigerationLogOff = document.getElementById('PlaceHolder_rdbRefrigerationLogOff');
         var rdbRefrigerationLogOn = document.getElementById('PlaceHolder_rdbRefrigerationLogOn');
         var rdbRefrigerationLogAlertOn = document.getElementById('PlaceHolder_rdbRefrigerationLogAlertOn');
         var rdbRefrigerationLogAlertOff = document.getElementById('PlaceHolder_rdbRefrigerationLogAlertOff');
         
         if(rdbRefrigerationLogOff.checked == true)
         {
         rdbRefrigerationLogAlertOn.disabled = true;
         rdbRefrigerationLogAlertOff.disabled = true;
         rdbRefrigerationLogAlertOff.checked = true;
         }
         if(rdbRefrigerationLogOn.checked == true)
         {
         rdbRefrigerationLogAlertOn.disabled = false;
         rdbRefrigerationLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 7)
     {
         var rdbTemperatureLogOff = document.getElementById('PlaceHolder_rdbTemperatureLogOff');
         var rdbTemperatureLogOn = document.getElementById('PlaceHolder_rdbTemperatureLogOn');
         var rdbTemperatureLogAlertOn = document.getElementById('PlaceHolder_rdbTemperatureLogAlertOn');
         var rdbTemperatureLogAlertOff = document.getElementById('PlaceHolder_rdbTemperatureLogAlertOff');
         
         if(rdbTemperatureLogOff.checked == true)
         {
         rdbTemperatureLogAlertOn.disabled = true;
         rdbTemperatureLogAlertOff.disabled = true;
         rdbTemperatureLogAlertOff.checked = true;
         }
        if(rdbTemperatureLogOn.checked == true)
         {
         rdbTemperatureLogAlertOn.disabled = false;
         rdbTemperatureLogAlertOff.disabled = false;
         }
     }
      if(nLogId == 8)
     {
         var rdbThermometerOff = document.getElementById('PlaceHolder_rdbThermometerOff');
         var rdbThermometerOn = document.getElementById('PlaceHolder_rdbThermometerOn');
         var rdbThermometerAlertOn = document.getElementById('PlaceHolder_rdbThermometerAlertOn');
         var rdbThermometerAlertOff = document.getElementById('PlaceHolder_rdbThermometerAlertOff');
         
         if(rdbThermometerOff.checked == true)
         {
         rdbThermometerAlertOn.disabled = true;
         rdbThermometerAlertOff.disabled = true;
         rdbThermometerAlertOff.checked=true;
         }
        if(rdbThermometerOn.checked == true)
         {
         rdbThermometerAlertOn.disabled = false;
         rdbThermometerAlertOff.disabled = false;
         }
     }
      if(nLogId == 9)
     {
         var rdbValidationOff = document.getElementById('PlaceHolder_rdbValidationOff');
         var rdbValidationOn = document.getElementById('PlaceHolder_rdbValidationOn');
         var rdbValidationAlertOn = document.getElementById('PlaceHolder_rdbValidationAlertOn');
         var rdbValidationAlertOff = document.getElementById('PlaceHolder_rdbValidationAlertOff');
         
         if(rdbValidationOff.checked == true)
         {
         rdbValidationAlertOn.disabled = true;
         rdbValidationAlertOff.disabled = true;
         rdbValidationAlertOff.checked = true;
         }
         if(rdbValidationOn.checked == true)
         {
         rdbValidationAlertOn.disabled = false;
         rdbValidationAlertOff.disabled = false;
         }
     }
     if (nLogId == 10) {

         var rdbFreezerNewLogOff = document.getElementById('PlaceHolder_rdbFreezerNewLogOff');
         var rdbFreezerNewLogOn = document.getElementById('PlaceHolder_rdbFreezerNewLogOn');
         var rdbFreezerNewLogAlertOn = document.getElementById('PlaceHolder_rdbFreezerNewLogAlertOn');
         var rdbFreezerNewLogAlertOff = document.getElementById('PlaceHolder_rdbFreezerNewLogAlertOff');

         if (rdbFreezerNewLogOff.checked == true) {
             rdbFreezerNewLogAlertOn.disabled = true;
             rdbFreezerNewLogAlertOff.disabled = true;
             rdbFreezerNewLogAlertOff.checked = true;
         }
         if (rdbFreezerNewLogOn.checked == true) {
             rdbFreezerNewLogAlertOn.disabled = false;
             rdbFreezerNewLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 11) {

         var rdbShippingLogOff = document.getElementById('PlaceHolder_rdbShippingLogOff');
         var rdbShippingLogOn = document.getElementById('PlaceHolder_rdbShippingLogOn');
         var rdbShippingLogAlertOn = document.getElementById('PlaceHolder_rdbShippingLogAlertOn');
         var rdbShippingLogAlertOff = document.getElementById('PlaceHolder_rdbShippingLogAlertOff');

         if (rdbShippingLogOff.checked == true) {
             rdbShippingLogAlertOn.disabled = true;
             rdbShippingLogAlertOff.disabled = true;
             rdbShippingLogAlertOff.checked = true;
         }
         if (rdbShippingLogOn.checked == true) {
             rdbShippingLogAlertOn.disabled = false;
             rdbShippingLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 12) {

         var rdbPhLogOff = document.getElementById('PlaceHolder_rdbPhLogOff');
         var rdbPhLogOn = document.getElementById('PlaceHolder_rdbPhLogOn');
         var rdbPhLogAlertOn = document.getElementById('PlaceHolder_rdbPhLogAlertOn');
         var rdbPhLogAlertOff = document.getElementById('PlaceHolder_rdbPhLogAlertOff');

         if (rdbPhLogOff.checked == true) {
             rdbPhLogAlertOn.disabled = true;
             rdbPhLogAlertOff.disabled = true;
             rdbPhLogAlertOff.checked = true;
         }
         if (rdbPhLogOn.checked == true) {
             rdbPhLogAlertOn.disabled = false;
             rdbPhLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 13) {

         var rdbPestLogOff = document.getElementById('PlaceHolder_rdbPestLogOff');
         var rdbPestLogOn = document.getElementById('PlaceHolder_rdbPestLogOn');
         var rdbPestLogAlertOn = document.getElementById('PlaceHolder_rdbPestLogAlertOn');
         var rdbPestLogAlertOff = document.getElementById('PlaceHolder_rdbPestLogAlertOff');

         if (rdbPestLogOff.checked == true) {
             rdbPestLogAlertOn.disabled = true;
             rdbPestLogAlertOff.disabled = true;
             rdbPestLogAlertOff.checked = true;
         }
         if (rdbPestLogOn.checked == true) {
             rdbPestLogAlertOn.disabled = false;
             rdbPestLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 14) {

         var rdbMaintenanceLogOff = document.getElementById('PlaceHolder_rdbMaintenanceLogOff');
         var rdbMaintenanceLogOn = document.getElementById('PlaceHolder_rdbMaintenanceLogOn');
         var rdbMaintenanceLogAlertOn = document.getElementById('PlaceHolder_rdbMaintenanceLogAlertOn');
         var rdbMaintenanceLogAlertOff = document.getElementById('PlaceHolder_rdbMaintenanceLogAlertOff');

         if (rdbMaintenanceLogOff.checked == true) {
             rdbMaintenanceLogAlertOn.disabled = true;
             rdbMaintenanceLogAlertOff.disabled = true;
             rdbMaintenanceLogAlertOff.checked = true;
         }
         if (rdbMaintenanceLogOn.checked == true) {
             rdbMaintenanceLogAlertOn.disabled = false;
             rdbMaintenanceLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 15) {

         var rdbCleaningLogOff = document.getElementById('PlaceHolder_rdbCleaningLogOff');
         var rdbCleaningLogOn = document.getElementById('PlaceHolder_rdbCleaningLogOn');
         var rdbCleaningLogAlertOn = document.getElementById('PlaceHolder_rdbCleaningLogAlertOn');
         var rdbCleaningLogAlertOff = document.getElementById('PlaceHolder_rdbCleaningLogAlertOff');

         if (rdbCleaningLogOff.checked == true) {
             rdbCleaningLogAlertOn.disabled = true;
             rdbCleaningLogAlertOff.disabled = true;
             rdbCleaningLogAlertOff.checked = true;
         }
         if (rdbCleaningLogOn.checked == true) {
             rdbCleaningLogAlertOn.disabled = false;
             rdbCleaningLogAlertOff.disabled = false;
         }
     }
     if (nLogId == 16) {

         var rdbChecklistOff = document.getElementById('PlaceHolder_rdbChecklistOff');
         var rdbChecklistOn = document.getElementById('PlaceHolder_rdbChecklistOn');
         var rdbChecklistAlertOn = document.getElementById('PlaceHolder_rdbChecklistAlertOn');
         var rdbChecklistAlertOff = document.getElementById('PlaceHolder_rdbChecklistAlertOff');

         if (rdbChecklistOff.checked == true) {
             rdbChecklistAlertOn.disabled = true;
             rdbChecklistAlertOff.disabled = true;
             rdbChecklistAlertOff.checked = true;
         }
         if (rdbChecklistOn.checked == true) {
             rdbChecklistAlertOn.disabled = false;
             rdbChecklistAlertOff.disabled = false;
         }
     }
}

</script>
    <div class="bdy_contents" >

     <asp:HiddenField ID="hfKitchenId" runat="server" />
    <asp:HiddenField ID="hfContactId" runat="server" />
    <asp:HiddenField ID="hfAddressId" runat="server" />
    <asp:HiddenField ID="hfUserId" runat="server" />
    <asp:HiddenField ID="hfPassword" runat="server" /> 
    <asp:HiddenField ID="hfTypeId" runat="server" />
    
	<div class="log_form_left">
	<table  border="0" cellspacing="0" cellpadding="0" width="540" class="table_form_view"> 
                <tr>
                   <td padding="10" width="200px">&nbsp;</td>                  
                   <td width="10px">&nbsp;</td>
                   <td width="200px">&nbsp;</td>
                </tr>  
                <tr>
                   <td class="red_heading" > 
                   <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
                   <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" /></td>                  
                   <td> </td>
                   <td></td>
                </tr>
                <tr>
                   <td colspan="3" padding="10"><b>MASTER LOCATIONS:</b>  Please refer to user's guide to understand the value of creating
                    a master location.  Creating a master location can save your Corporation an incredible amount
                    of time.</td> 
                </tr> 
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>                    
                <tr>
                  <td >Name of Location*:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  >  <asp:TextBox ID="txtKitchenName" runat="server" Width="200px" ></asp:TextBox></td>
                </tr>
                 <asp:RequiredFieldValidator ID="rqvldKitchenName" runat="server" Display="None"  
                             ErrorMessage="The value in field Location Name is required." ControlToValidate="txtKitchenName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtKitchenName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
				ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'\- ]{1,100}$"></asp:RegularExpressionValidator>     
                <tr>                 
                  <td >Location Manager Name*:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtManagerName" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:RequiredFieldValidator ID="rqvldManagerName" runat="server" Display="None" 
                             ErrorMessage="The value in field Manager is required." ControlToValidate="txtManagerName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                <tr>                 
                  <td >Location Manager Email:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtEmail" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" 
                             ErrorMessage="The value in field Contact Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                             InitialValue="Select Value"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
                <tr>                 
                  <td >Address Line One*:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAddress1" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" 
                             ErrorMessage="The value in field Address1 is required." ControlToValidate="txtAddress1"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator> 
                <tr>                 
                  <td >Address Line Two:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAddress2" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
               <tr>                 
                  <td >City:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtCity" runat="server" Width="200px" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REV_txtCity" runat="server" ControlToValidate="txtCity"
                        Display="None" ErrorMessage="The value in field 'City' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                 </td>                
                </tr>                      
                <tr>                 
                  <td >Country:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlCountry" runat="server" Width="200px" DataSourceID="sqlDsCountry" DataTextField="Name" DataValueField ="CountryRegionCode"
                          CssClass="DropDown" AutoPostBack="true"
                          onselectedindexchanged="ddlCountry_SelectedIndexChanged" >                         			            
				            <%--<asp:ListItem Text="Canada" Value="CA" />
				            <asp:ListItem Text="United States" Value="US" />--%>
			            </asp:DropDownList>
                 </td>                
                </tr>
                <tr>                 
                  <td >State/Province:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates"
				            DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			            </asp:DropDownList>
                     <asp:TextBox ID="txtState" runat="server" Visible="false" Width="200px" CssClass="TextBox1"></asp:TextBox>            
                    <asp:HiddenField ID="hfState" runat="server" />
                 </td>                
                </tr>               
                <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="None" 
                             ErrorMessage="The value in field State Id is required." ControlToValidate="ddlStateProvince"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator>
                 <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
				Display="None" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator> 
                 <tr>                 
                  <td >TiimeZone:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				            DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			         </asp:DropDownList>
                 </td>                
                </tr>    
                 <asp:RequiredFieldValidator ID="rfvTimeZone" runat="server" Display="None" 
                             ErrorMessage="The value in field Time Zone is required." ControlToValidate="ddlTimeZone"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator> 
                <tr>                 
                  <td >Zip Code:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtZipCode" MaxLength="10" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" 
                             ErrorMessage="The value in field Zip Code is required." ControlToValidate="txtZipCode"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>                
                <tr>                 
                  <td >Main Phone Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtPhone" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >Alternative Phone Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAltPhone" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >FAX Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtFax" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
			</asp:ObjectDataSource>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <!-- Logs -->
                <tr>
                <td colspan="3">
                <table  border="0" cellspacing="0" cellpadding="0" width="700" class="table_form_view"> 
                <!-- Logs -->
                <tr>
                <td colspan="3">
                <table width="700" style="padding-left:5px; padding-bottom:5px;">
                <tr>
                <th width="200" align="left">LOGS AND REPORTING</th>
                <th colspan="2" align="center" >ACTIVATION</th>
                <th colspan="2" align="center" >E-ALERTS</th>
                <%--<td colspan="2" align="center">Temperarture Range</td>--%>
                <th colspan="2" align="center">CUSTOMIZE LOGS AND REPORTS</th>
                </tr>
                <tr>
                <th width="200" align="left">LOGS:</th>
                <th align="center">ON</th><th align="center">OFF</th>
                <th align="center">ON</th><th align="center">OFF</th>
                <%--<td align="center">LOW</td><td align="center">HIGH</td>--%>
                <th colspan="2" align="center">SCL, CCL, AND QCL (CCL & QCL can be edited)</th>
                </tr>
                <tr>
                <td width="200">Cleaning Control Log</td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogOn" runat="server" onClick="SetAlerts(15)"  GroupName="CleaningLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogOff" runat="server" onClick="SetAlerts(15)"  GroupName="CleaningLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbCleaningLogAlertOn" runat="server" onClick="SetAlerts(15)" GroupName="CleaningLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbCleaningLogAlertOff" runat="server" GroupName="CleaningLogAlert" /></td>
                <td colspan="2">
                <asp:HyperLink ID="hlCleaningLog" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=12" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">Cold Holding Log</td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogOn" runat="server" onClick="SetAlerts(1)"  GroupName="ColdHoldingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogOff" runat="server" onClick="SetAlerts(1)"  GroupName="ColdHoldingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbColdHoldingLogAlertOn" runat="server" onClick="SetAlerts(1)" GroupName="ColdHoldingLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbColdHoldingLogAlertOff" runat="server" GroupName="ColdHoldingLogAlert" /></td>
               <%-- <td align="center"><asp:TextBox ID="txtColdHoldingLow" runat="server" CssClass="TextTemperature"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="txtColdHoldingLow" Display="None" 
                     ErrorMessage="The value in field Cold Holding Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                     ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator></td>
                <td align="center"> <asp:TextBox ID="txtColdHoldingHigh" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="txtColdHoldingHigh" Display="None" 
                             ErrorMessage="The value in field Cold Holding High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtColdHoldingHigh" ControlToCompare="txtColdHoldingLow"
             Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Cold Holding High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator></td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlColdHoldingLog" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=1" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">Cooling Temperature Log</td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogOn" runat="server" onClick="SetAlerts(2)"  GroupName="FreezerLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogOff" runat="server" onClick="SetAlerts(2)"  GroupName="FreezerLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogAlertOn" runat="server" onClick="SetAlerts(2)" GroupName="FreezerLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerLogAlertOff" runat="server" GroupName="FreezerLogAlert" /></td>
                <%--<td align="center"><asp:TextBox ID="txtFreezerLogLow" runat="server" CssClass="TextTemperature"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="txtFreezerLogLow" Display="None" 
                     ErrorMessage="The value in field Cooling Temperature Log Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                     ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator></td>
                <td align="center">
                <asp:TextBox ID="txtFreezerLogHigh" runat="server" CssClass="TextTemperature"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txtFreezerLogHigh" Display="None" 
                     ErrorMessage="The value in field  Cooling Temperature Log High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                     ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtFreezerLogHigh" ControlToCompare="txtFreezerLogLow"
                Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Cooling Temperature Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                </td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlCooling" runat="server" 
                NavigateUrl="~/ControlPanel/District/FreezerLogCustom.aspx?LogType=2" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr> 
                 <tr>
                <td width="200">Freezer Log</td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogOn" runat="server" onClick="SetAlerts(10)"  GroupName="FreezerNewLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogOff" runat="server" onClick="SetAlerts(10)"  GroupName="FreezerNewLog"/></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogAlertOn" runat="server" onClick="SetAlerts(10)" GroupName="FreezerNewLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbFreezerNewLogAlertOff" runat="server" GroupName="FreezerNewLogAlert" /></td>
                <%--<td align="center"><asp:TextBox ID="txtThermometerLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="txtThermometerHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlFreezerNewLog" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=7" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">End Point Temperature Log</td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogOn" runat="server" onClick="SetAlerts(7)"  GroupName="TemperatureLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogOff" runat="server" onClick="SetAlerts(7)"  GroupName="TemperatureLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogAlertOn" runat="server" onClick="SetAlerts(7)" GroupName="TemperatureLogAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbTemperatureLogAlertOff" runat="server" GroupName="TemperatureLogAlert" /></td>
                <%--<td align="center"><asp:TextBox ID="txtTemperatureLogLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox>
                </td>
                <td align="center"> <asp:TextBox ID="txtTemperatureLogHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>--%>
                <td colspan="2">This log is edited in the Food Category Panel</td>
                </tr>               
                <tr>
                <td width="200">Hot Holding Log</td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogOn" runat="server" onClick="SetAlerts(4)"   GroupName="HotHoldingLog"/></td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogOff" runat="server" onClick="SetAlerts(4)"  GroupName="HotHoldingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbHotHoldingLogAlertOn" runat="server" onClick="SetAlerts(4)" GroupName="HotHoldingLogAlert"  /></td>
                <td align="center"> <asp:RadioButton ID="rdbHotHoldingLogAlertOff" runat="server" GroupName="HotHoldingLogAlert" /></td>
               <%-- <td align="center"><asp:TextBox ID="txtHotHoldingLogLow" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtHotHoldingLogLow" Display="None" 
                             ErrorMessage="The value in field Hot Holding Log Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator></td>
                <td align="center">
                 <asp:TextBox ID="txtHotHoldingLogHigh" runat="server" CssClass="TextTemperature"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtHotHoldingLogHigh" Display="None" 
                 ErrorMessage="The value in field Hot Holding Log High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                 ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                 <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="txtHotHoldingLogHigh" ControlToCompare="txtHotHoldingLogLow"
                 Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Hot Holding Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator>
                </td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlHotHolding" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=3" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">Maintenance Control Log</td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogOn" runat="server" onClick="SetAlerts(14)"  GroupName="MaintenanceLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogOff" runat="server" onClick="SetAlerts(14)"  GroupName="MaintenanceLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbMaintenanceLogAlertOn" runat="server" onClick="SetAlerts(14)" GroupName="MaintenanceLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbMaintenanceLogAlertOff" runat="server" GroupName="MaintenanceLogAlert" /></td>
                <td colspan="2">
                <asp:HyperLink ID="hlMaintenance" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=11" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">PH Log</td>
                <td align="center"><asp:RadioButton ID="rdbPhLogOn" runat="server" onClick="SetAlerts(12)"  GroupName="PhLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbPhLogOff" runat="server" onClick="SetAlerts(12)"  GroupName="PhLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbPhLogAlertOn" runat="server" onClick="SetAlerts(12)" GroupName="PhLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbPhLogAlertOff" runat="server" GroupName="PhLogAlert" /></td>
                <td colspan="2">
                <asp:HyperLink ID="hlPh" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=9" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">Pest Control Log</td>
                <td align="center"><asp:RadioButton ID="rdbPestLogOn" runat="server" onClick="SetAlerts(13)"  GroupName="PestLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbPestLogOff" runat="server" onClick="SetAlerts(13)"  GroupName="PestLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbPestLogAlertOn" runat="server" onClick="SetAlerts(13)" GroupName="PestLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbPestLogAlertOff" runat="server" GroupName="PestLogAlert" /></td>
                <td colspan="2">
                <asp:HyperLink ID="hlPest" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=10" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>                
                <tr>
                <td width="200">Receiving Log</td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogOn" runat="server" onClick="SetAlerts(5)"  GroupName="ReceivingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogOff" runat="server" onClick="SetAlerts(5)"  GroupName="ReceivingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbReceivingLogAlertOn" runat="server" onClick="SetAlerts(5)" GroupName="ReceivingLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbReceivingLogAlertOff" runat="server" GroupName="ReceivingLogAlert" /></td>
               <%-- <td align="center"><asp:TextBox ID="txtReceivingLogLow" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtReceivingLogLow" Display="None" 
                             ErrorMessage="The value in field Receiving Log Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator></td>
                <td align="center"><asp:TextBox ID="txtReceivingLogHigh" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtReceivingLogHigh" Display="None" 
                             ErrorMessage="The value in field Receiving Log High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtReceivingLogHigh" ControlToCompare="txtReceivingLogLow"
             Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Receiving Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator></td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlReceiving" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=4" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>                
                <tr>
                <td width="200">Refrigeration Log</td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogOn" runat="server" onClick="SetAlerts(6)"  GroupName="RefrigerationLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogOff" runat="server" onClick="SetAlerts(6)"  GroupName="RefrigerationLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbRefrigerationLogAlertOn" runat="server" onClick="SetAlerts(6)" GroupName="RefrigerationLogAlert" /></td>
                <td align="center"> <asp:RadioButton ID="rdbRefrigerationLogAlertOff" runat="server" GroupName="RefrigerationLogAlert" /></td>
               <%-- <td align="center"><asp:TextBox ID="txtRefrigerationLogLow" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtRefrigerationLogLow" Display="None" 
                             ErrorMessage="The value in field Refrigeration Log Low Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator></td>
                <td align="center"><asp:TextBox ID="txtRefrigerationLogHigh" runat="server" CssClass="TextTemperature"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtRefrigerationLogHigh" Display="None" 
                             ErrorMessage="The value in field Refrigeration Log High Temp. is not valid." Font-Names="Verdana" Font-Size="10px" 
                             ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtRefrigerationLogHigh" ControlToCompare="txtRefrigerationLogLow"
             Display="None" Type="Double" Operator="GreaterThanEqual" ErrorMessage="The Value in field Refrigeration Log High Temp field should be Greater than or equal to Low Temp field"></asp:CompareValidator></td>--%>
                <td colspan="2">
                <asp:HyperLink ID="hlRefrigeration" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=5" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr> 
                <tr>
                <td width="200">Shipping Log</td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogOn" runat="server" onClick="SetAlerts(11)"  GroupName="ShippingLog" /></td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogOff" runat="server" onClick="SetAlerts(11)"  GroupName="ShippingLog" /></td>
                <td align="center"> <asp:RadioButton ID="rdbShippingLogAlertOn" runat="server" onClick="SetAlerts(11)" GroupName="ShippingLogAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbShippingLogAlertOff" runat="server" GroupName="ShippingLogAlert" /></td>
                <td colspan="2">
                <asp:HyperLink ID="hlShippingLog" runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=8" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>
                </td>
                </tr>
                <tr>
                <td width="200">Thermometer Calibration</td>
                <td align="center"><asp:RadioButton ID="rdbThermometerOn" runat="server" onClick="SetAlerts(8)"  GroupName="Thermometer" /></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerOff" runat="server" onClick="SetAlerts(8)"  GroupName="Thermometer"/></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerAlertOn" runat="server" onClick="SetAlerts(8)" GroupName="ThermometerAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbThermometerAlertOff" runat="server" GroupName="ThermometerAlert" /></td>
                <%--<td align="center"><asp:TextBox ID="txtThermometerLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="txtThermometerHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>--%>
                <td colspan="2">
                 Log customization feature is not available. 
              <%--  <asp:HyperLink ID="hlThermometerLog"  runat="server" 
                NavigateUrl="~/ControlPanel/District/ColdHoldingCustom.aspx?LogType=6" Text="Click Here To View/Edit HACCP and Corrective Actions"></asp:HyperLink>--%>
                </td>
                </tr>
                <tr>
                <th width="200" align="left">REPORTS:</th>
                </tr>
                <tr>
                <td width="200">Food Safety Checklist</td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyOn" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyOff" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyAlertOn" runat="server" onClick="SetAlerts(3)"  GroupName="FoodSafetChecklistAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbFoodSafetyAlertOff" runat="server" GroupName="FoodSafetChecklistAlert" /></td>                
                <%--<td align="center"><asp:TextBox ID="txtFSCLLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="txtFSCLHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>--%>
                <td colspan="2">This report is edited in the Food Safety Panel</td>
                </tr>
                <tr>
                <td width="200">Checklist Add-On</td>
                <td align="center"><asp:RadioButton ID="rdbChecklistOn" runat="server" onClick="SetAlerts(16)"  GroupName="Checklist" /></td>
                <td align="center"><asp:RadioButton ID="rdbChecklistOff" runat="server" onClick="SetAlerts(16)"  GroupName="Checklist" /></td>
                <td align="center"> <asp:RadioButton ID="rdbChecklistAlertOn" runat="server" onClick="SetAlerts(16)" GroupName="ChecklistAlert"  /></td>
                <td align="center"><asp:RadioButton ID="rdbChecklistAlertOff" runat="server" GroupName="ChecklistAlert" /></td>
                <td colspan="2">This report is edited in the Checklist Add-On Panel</td>
                </tr>
                <tr>
                <td width="200">Validation Checklist</td>
                <td align="center"><asp:RadioButton ID="rdbValidationOn" runat="server" onClick="SetAlerts(9)"  GroupName="Validation" /></td>
                <td align="center"><asp:RadioButton ID="rdbValidationOff" runat="server" onClick="SetAlerts(9)"  GroupName="Validation"/></td>
                <td align="center"><asp:RadioButton ID="rdbValidationAlertOn" runat="server" GroupName="ValidationAlert" /></td>
                <td align="center"><asp:RadioButton ID="rdbValidationAlertOff" runat="server" onClick="SetAlerts(9)" GroupName="ValidationAlert" /></td>
                <%--<td align="center"><asp:TextBox ID="txtValidationLow" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>
                <td align="center"><asp:TextBox ID="txtValidationHigh" runat="server" CssClass="TextTemperature" Enabled="false"></asp:TextBox></td>--%>
                <td colspan="2">This report is edited in the Validation Panel</td>
                </tr>               
                </table>
                </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr>   
              </table>
                </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <tr>
                <td colspan="3"><asp:ImageButton ID="cmdSubmit" runat="server" 
                        ImageUrl="~/images/District Images/ButtonSubmitNew.png" 
                        onclick="cmdSubmit_Click" Visible="false" />
                        <asp:ImageButton ID="cmdEdit" runat="server" Visible="false" 
                        ImageUrl="~/images/District Images/ButtonUpdate.png" onclick="cmdEdit_Click" />
                        <asp:ImageButton id="cmdCancel" runat="server"
                        ImageUrl="~/images/District Images/ButtonCancel.png" onclick="cmdCancel_Click" /></td>              
                                 
                </tr>               
              </table>
	</div>	
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetKitchenByDistrictId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
        <SelectParameters>
            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:SqlDataSource ID="sqlDsStates" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetStateProvinceByCountry" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCountry" DefaultValue="" 
                Name="chCountryCode" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetCountryRegion" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource> 
    <asp:SqlDataSource ID="dqlDsTimeZone" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetTimeZones" SelectCommandType="StoredProcedure">       
    </asp:SqlDataSource>
  <asp:HiddenField ID="HiddenField1" runat="server" />	    
    <div style="clear:both;"></div>    
</div>
</asp:Content>

