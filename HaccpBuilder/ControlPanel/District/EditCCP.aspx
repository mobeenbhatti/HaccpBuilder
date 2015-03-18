<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_EditCCP" Title="HACCP Builder | Edit CCP" Codebehind="EditCCP.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
      Add/Edit Custom CCP and CP for Food Category              
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
    <div class="ContentLeft">
        <div class="Buttons">       
        <div class="LogHeading">Food Category/Group</div>
         <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" Visible="true" runat="server" />
        <asp:TextBox ID="txtCCP" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCCP" ControlToValidate="txtCCP" Text="Value in field Food Category/Group is required" Display="None" runat="server"></asp:RequiredFieldValidator>
        </div>
        <div class="Buttons">
        <div class="LogHeading">Critical Control Point (CCP) Requirement</div>
        <asp:TextBox ID="txtRequirement" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtRequirement" Text="Value in field CCP Requirement is required" Display="None" runat="server"></asp:RequiredFieldValidator>
        </div>
         <div class="Buttons">
        <div class="LogHeading">Control Point (CP) Requirement</div>
        <asp:TextBox ID="txtCPRequirement" TextMode="MultiLine" Width="400px" Height="100px" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtCPRequirement" Text="Value in field CP Requirement is required" Display="None" runat="server"></asp:RequiredFieldValidator>
        </div>
        <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="btnCreateChecklistGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonSubmitHere.jpg" 
                           onclick="btnCreateChecklistGroup_Click"/>  
                   </div>                  
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnAddKitchens"  runat="server"  
                           ImageUrl="~/images/buttons/ButtonCancel.gif" 
                           onclick="btnAddKitchens_Click"/>
                   </div>                   
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <div class="FloatLeft">
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>
                </div>
    </div>
    <div class="ContentRight">
        <%--<div class="Buttons">
        <div class="LogHeading">Select Section</div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="rdbSection" ErrorMessage="Select Selection Group"></asp:RequiredFieldValidator>
        <asp:RadioButtonList ID="rdbSection" runat="server">
            <asp:ListItem Value="1">Personal Hygiene</asp:ListItem>
            <asp:ListItem Value="2">Food Preparation</asp:ListItem>
            <asp:ListItem Value="3">Hot Holding</asp:ListItem>
            <asp:ListItem Value="4">Cold Holding</asp:ListItem>
            <asp:ListItem Value="5">Refrigerator, Freezer, And Milk Cooler</asp:ListItem>
            <asp:ListItem Value="6">Food Storage and Dry Storage</asp:ListItem>
            <asp:ListItem Value="7">Cleaning and Sanitizing</asp:ListItem>
            <asp:ListItem Value="8">Utensils and Equipment</asp:ListItem>
            <asp:ListItem Value="9">Large Equipment</asp:ListItem>
            <asp:ListItem Value="10">Garbage Storage and Disposal</asp:ListItem>
            <asp:ListItem Value="11">Pest Control</asp:ListItem>
            </asp:RadioButtonList>
        </div>--%>
        <asp:HiddenField ID="hfIsAdditional" runat="server" />
        <asp:HiddenField ID="hfIsCustom" runat="server" />
        <asp:HiddenField ID="hfIsSelected" runat="server" />
    </div>
                   
    </div>
    <div class="Clearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2008 " ForeColor="White" runat="server"></asp:Label>
    </div>                
    
</asp:Content>


