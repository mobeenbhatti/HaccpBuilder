<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_DefaultTest" Title="Untitled Page" Codebehind="DefaultTest.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTopLeft" Runat="Server">
  <%--  <div class="MainHeading">
            MAIN CONTROL PANEL
    </div>
    <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:Button ID="btnEditPlan" runat="server" Text="Edit HACCP Plan" 
                           CssClass="Button" onclick="btnEditPlan_Click" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="btnInventoryManager" runat="server" Text="Inventroy Items" 
                            CssClass="Button" onclick="btnInventoryManager_Click" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="btnViewSop" runat="server" Text="View SOP's" 
                            CssClass="Button" />
                   </div>
                   <div class="Clearer" style="margin-top:15px"></div>
                   <div class="FloatLeft">
                       <asp:Button ID="btnMenuManager" runat="server" Text="Menu Items" 
                           CssClass="Button" onclick="btnMenuManager_Click" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="btnAlerts" runat="server" Text="Active Alerts" 
                            CssClass="Button" />
                   </div>
                   <div class="FloatLeft">
                   </div>
                   <div class="Clearer"></div>
                </div>
            </div>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopRight" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" Runat="Server">
</asp:Content>

