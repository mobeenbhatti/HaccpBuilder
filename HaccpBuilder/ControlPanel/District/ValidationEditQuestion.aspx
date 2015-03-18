<%@ Page Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_ValidationEditQuestion" Title="HACCP Builder | Edit Question" Codebehind="ValidationEditQuestion.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="container">
    <div class="ph-top">
    <asp:Label CssClass="msg-error" ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvFoodCategory" ControlToValidate="txtQuestion" Text="Value in field Question is required" Display="Dynamic" runat="server" CssClass="msg-error"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REV_txtQuestion" runat="server" ControlToValidate="txtQuestion" CssClass="msg-error"
                                        Display="Dynamic" ErrorMessage="Please enter a question without special characters (@#$*&?)."
                                        ValidationExpression="^[A-Za-z0-9.\-_,\'#!()= ]+$"></asp:RegularExpressionValidator>
    </div>
    <div class="form3">
        <h2>CREATE CUSTOM VALIDATION QUESTION</h2>
        <div class="clear"></div>
    </div>
    <div class="form3">
    Create Question*
    <asp:TextBox ID="txtQuestion" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
        
<div class="clear"></div>
    </div>
    <div class="form3">
    <asp:Button ID="btnCreateChecklistGroup" Text="Submit"
                runat="server" onclick="btnCreateChecklistGroup_Click" />    
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/ControlPanel/District/ValidationCustomQuestion.aspx" CssClass="button"></asp:HyperLink>          
           
    <div class="clear"></div>
    </div>
<asp:HiddenField ID="hfIsAdditional" runat="server" />
<asp:HiddenField ID="hfIsCustom" runat="server" />
<asp:HiddenField ID="hfIsSelected" runat="server" />.
<asp:HiddenField ID="hfGroupId" runat="server" /> 
</div>               
    
</asp:Content>

