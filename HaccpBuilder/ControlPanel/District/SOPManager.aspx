<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_SOPManager" Title="HACCP Builder | SOP Manager" Codebehind="SOPManager.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               CUSTOM SOP MANAGER (move SOP's in and out of groups)
               <span style="font-size:10px; ">
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
                    <div class="DistrictSearchCol1">Select Kithen Group</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlKitchen" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Select SOP to Customize</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="DropDownList1" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div> 
                <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Add New Custom Sop:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="TextBox1" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearch" runat="server" Text="GO" Width="87px" CssClass="ButtonSearch" />
                    </div>
                </div>                      
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="btnEditSOPGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateSOPGroup.jpg"/>  
                   </div>                  
                   <div class="Clearer" style="margin-top:15px"></div>
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnCreateCustomSOP"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonEditKitchenSOPGroup.jpg"/>
                   </div>                   
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnSOPManager"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateCustomSOPjpg.jpg"/> 
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
                <div class="ViewPlanClearer"></div>  
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Select Kitchen Group</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="DropDownList2" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div> 
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>            
    </div>
</asp:Content>

