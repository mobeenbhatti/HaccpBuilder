<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" ValidateRequest="false" Inherits="ControlPanel_District_EditProcess" Codebehind="EditProcess.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
function MoveBack()
{
    var GroupId = document.getElementById('PlaceHolder_hfGroupId').value;    
    window.location = "CustomProcess.aspx?GroupId=" + GroupId ;
}

</script>
<div class="container">
    <div class="ph-top">
    <asp:Label CssClass="msg-error" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>   
    </div>
    <div class="form3">
        <h2>CREATE CUSTOM Process</h2>
        <div class="clear"></div>
    </div>
    <div class="form4 left marginright">
         <h1 class="left h1margin-r">Process Name*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtProcess" Width="400px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvProcess" ControlToValidate="txtProcess" Text="Value in field Process Name is required"  runat="server" CssClass="msg-error"></asp:RequiredFieldValidator>
        </div>      
         <h1 class="left h1margin-r">Short Name*:</h1>
        <div class="input left">
           <asp:TextBox ID="txtShortName" Width="400px" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtShortName" Text="Value in field Process Short Name is required"  runat="server" CssClass="msg-error"></asp:RequiredFieldValidator>
        </div> 
        <div class="clear"></div>       
    </div>
    <div class="form4 left">  
        <h1 class="left h1margin-r">FSIS Regulation Module
            <asp:CheckBox ID="chkHazard" runat="server" AutoPostBack="true" 
                oncheckedchanged="chkHazard_CheckedChanged" /></h1>
        <div class="input left">
            <asp:LinkButton ID="lkbHazardAnalysis" runat="server" Text="Hazard Analysis Table" Visible="false"  onclick="lkbHazardAnalysis_Click" CssClass="button"></asp:LinkButton>
            <asp:LinkButton ID="lkbProcessCategory" Text="Haccp Plan Table" runat="server" Visible="false"  onclick="lkbProcessCategory_Click" CssClass="button"></asp:LinkButton>
        </div> 
        <div class="clear"></div>     
    </div>
     <div class="clear tenpx"></div>   
    <div class="form3">
        <asp:Button ID="btnCreateChecklistGroup"  runat="server" Text="Submit"
                           onclick="btnCreateChecklistGroup_Click1"/>&nbsp;
           <asp:HyperLink Text="Cancel" NavigateUrl="~/ControlPanel/District/CustomProcess.aspx" CssClass="button" runat="server" ID="hlCancel"></asp:HyperLink>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <h1 class="left h1margin-r"></h1>
        <FCKeditorV2:FCKeditor ID="txtProcessText" FormatOutput="true" BasePath="~/fckeditor/" runat="server" Height="600px">
                </FCKeditorV2:FCKeditor>
        <div class="clear"></div>
    </div>
<asp:HiddenField ID="hfIsAdditional" runat="server" />
<asp:HiddenField ID="hfIsCustom" runat="server" />
<asp:HiddenField ID="hfIsSelected" runat="server" />  
<asp:HiddenField ID="hfGroupId" runat="server" />    
 </div>    
</asp:Content>
