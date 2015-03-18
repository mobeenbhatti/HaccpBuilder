<%@ Page Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_EditFoodCategory" Title="HACCP Builder | Edit Food Category" Codebehind="EditFoodCategory.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
 <div class="container">
    <div class="ph-top">
    <asp:Label CssClass="msg-error" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
   <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" runat="server" ShowSummary="true" />
        <asp:HiddenField ID="hfCCPLimit" runat="server" />
        <asp:HiddenField ID="hfCorrectiveAction" runat="server" />
        <asp:HiddenField ID="hfSortOrder" runat="server" />
    </div>
    <div class="form3">
        <h2>CREATE CUSTOM FOOD CATEGORY</h2>
        <div class="clear"></div>
    </div>

     <div class="form4 left marginright">
         <h1 class="left h1margin-r">Create Food Category*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtFoodCategory" Width="400px" Height="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFoodCategory" ControlToValidate="txtFoodCategory" Text="Value in field FoodCategory is required" EnableClientScript="false" InitialValue="<br/>" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>        
        <h1 class="left h1margin-r">Biological Hazard*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtBiological" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBio" ControlToValidate="txtBiological" Text="Value in field Biological Hazard is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
        <h1 class="left h1margin-r">Chemical Hazard*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtChemical" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvChemical" ControlToValidate="txtChemical" Text="Value in field Chemical Hazard is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
        
        <div class="clear"></div>
     </div>
     <div class="form4 left">  
        <h1 class="left h1margin-r">Physical Hazard*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtPhysical" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhysical" ControlToValidate="txtPhysical" Text="Value in field Physical Hazard is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>      
        <h1 class="left h1margin-r">Critical Control Point (CCP) Requirement*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtCCP" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCCP" ControlToValidate="txtCCP" Text="Value in field CCP field is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
        <h1 class="left h1margin-r">Control Point (CP) Requirement*:</h1>
        <div class="input left">
            <asp:TextBox ID="txtCP" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>            
        <asp:RequiredFieldValidator ID="rfvCP" ControlToValidate="txtCP" Text="Value in field CP field is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>
     </div>
     <div class="clear tenpx"></div>
     <div class="form3">
        <asp:Button ID="btnCreateChecklistGroup" Text="Submit" runat="server" onclick="btnCreateChecklistGroup_Click1" />    
        <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="button" NavigateUrl="~/ControlPanel/District/CustomFoodCategory.aspx"></asp:HyperLink>                  
        <div class="clear"></div>
    </div>
<asp:HiddenField ID="hfIsAdditional" runat="server" />
        <asp:HiddenField ID="hfIsCustom" runat="server" />
        <asp:HiddenField ID="hfIsSelected" runat="server" />  
        <asp:HiddenField ID="hfGroupId" runat="server" /> 
</div>
</asp:Content>
