<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_ReviewQuestion" Title="Untitled Page" Codebehind="ReviewQuestion.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div class="MainHeading">
               REVIEW CUSTOM CHECK LIST QUESTION             
     </div>
      <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>                
                <div class="Clearer"></div>                
        </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>            
    </div>
    <div class="GirdDiv"></div>
</asp:Content>

