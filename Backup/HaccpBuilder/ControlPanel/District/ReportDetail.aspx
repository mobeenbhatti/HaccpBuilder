<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_ReportDetail" Title="HACCP Builder | District Reports Detail " Codebehind="ReportDetail.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               INDIVIDUAL REPORT DETAIL PAGE
               <span style="font-size:10px; margin-left:120px;">
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
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Search By Report</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="DropDownList1" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Search By Date</div>
                    <div class="DistrictSearchCol2">
                        <ew:CalendarPopup ID="cldStartDate" runat="server" AutoPostBack="True" 
                                             CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                             ImageUrl="~/images/Calendar_scheduleHS.png" Width="160px" 
                             />
                    </div>                    
                </div>
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="btnEditSOPGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonBackToReports.jpg"/>  
                   </div>                  
                   <div class="Clearer" style="margin-top:15px"></div>
                </div>                
         </div>
         <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>
                     
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div> 
    </div>
</asp:Content>

