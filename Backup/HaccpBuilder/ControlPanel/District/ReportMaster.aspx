<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_ReportMaster" Title="HACCP Builder | District Reports" Codebehind="ReportMaster.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               INDIVIDUAL KITCHEN REPORTS
               <span style="font-size:10px; margin-left:160px;">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Kitchen Name:</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlKitchen" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div>
                <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By Manager Name:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="TextBox1" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearch" runat="server" Text="GO" Width="87px" CssClass="ButtonSearch" />
                    </div>
                </div>                
                <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By Email Address:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="TextBox3" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="Button2" runat="server" Text="GO" Width="87px" CssClass="ButtonSearch" />
                    </div>
                </div>
                <div style="margin-left:10px; margin-right:10px; margin-top:10px; width:400px;">
                    <b>DESCRIPTION:</b>Just click on the date to see the daily reports.  If there is an alert<br />
                    date will be flashing in red.  To see
                </div>
         </div>
         <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div> 
    </div>
</asp:Content>

