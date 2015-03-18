<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_PrintError" Title="SchoolHACCP | Print Not Allowed" Codebehind="PrintError.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div class="MainHeading">
              Printing Option is not available to this Kitchen.
               <span style="font-size:10px; margin-left:315px">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/District Images/ButtonGoToMain.png" />                
               </span>
            </div>        
</asp:Content>

