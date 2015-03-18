<%@ Page Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_EditSOPIE1" ValidateRequest="false" Title="HACCP Builder | SOPs" Codebehind="EditSOPIE1.aspx.cs" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="container">
    <div class="ph-top">
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Text=""></asp:Label>
    </div>
    <div class="form3">
        <h2> Add/Edit SOP, SSOP & GMP</h2>
        <div class="clear"></div>
    </div>
    <div class="form3">
    <asp:Label class="red_heading" Font-Size="Small" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
    Title*: 
    <asp:ValidationSummary CssClass="red_heading" Font-Size="Small"  ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true"
                                        Enabled="true" />
                <asp:TextBox ID="txtTitle" runat="server" MaxLength="200" Height="40px" Width="740px" CssClass="log_textbox"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server" ControlToValidate="txtTitle"
                                        Display="None" ErrorMessage="Please fill Title field."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtTitle" runat="server" ControlToValidate="txtTitle"
                                        Display="None" ErrorMessage="The value in field 'Title' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
<div class="clear"></div>
    </div>
    <div class="form3">
    <asp:Button ID="cmdSubmit" Text="Submit"
                runat="server" onclick="cmdSubmit_Click" />    
                <asp:HyperLink ID="hlCancel1" runat="server" Text="Cancel" CssClass="button"
                NavigateUrl="~/ControlPanel/District/CustomSOP.aspx"></asp:HyperLink>           
           
                <asp:Label ID="lblCustomSOP" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblIsAdditional" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblRemoved" runat="server" Visible="false"></asp:Label>
                <asp:HiddenField ID="hfGroupId" runat="server" />
    <div class="clear"></div>
    </div>
    <div class="form3">
    SOP, SSOP & GMP
    <FCKeditorV2:FCKeditor ID="txtSOP" FormatOutput="true"  BasePath="~/fckeditor/" runat="server"   Height="1000px" >
                </FCKeditorV2:FCKeditor>
    </div>
</div>  
</asp:Content>

