<%@ Page Language="C#" MasterPageFile= "~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_Default" Title="HACCP Builder | District Control Panel" Codebehind="DistrictControl.aspx.cs" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
         <div class="MainHeading">
              MAIN CONTROL PANEL  
          <span style="font-size:10px; margin-left:340px;">
               <a href="../../StaticContent/Files/Free Trial Instruction Guide.pdf" target="_blank"><img src="../../images/buttons/ButtonViewManual.jpg" alt="" /></a>            
               </span>                 
         </div>            
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
       </div>
       <div class="ContentRight">       
       </div>
       <div class="Clearer"></div>                
                <div class="Buttons">
                  <%-- <div class="FloatLeft">
                       <asp:ImageButton ID="btnCreateKitchen" runat="server" 
                           ImageUrl="~/images/District Images/ButtonCreateKitchen.jpg" 
                           onclick="btnCreateKitchen_Click" /> 
                   </div>                             
                   <div style="float:left; padding-left:110px;">
                        <asp:ImageButton ID="btnCopyKitchen" runat="server"  
                           ImageUrl="~/images/District Images/ButtonCopyKitchen.jpg" 
                           onclick="btnCopyKitchen_Click" />  
                   </div>                   
                   <div style="float:left; padding-left:110px;">
                       <asp:ImageButton ID="btnReports" runat="server"  
                           ImageUrl="~/images/District Images/ButtonReports.jpg" 
                           onclick="btnReports_Click" />  
                   </div> --%>
                   <div class="Clearer"> </div>
                   <div class="FloatLeft">                 
                   <asp:ImageButton ID="ImageButton1" runat="server"  
                           ImageUrl="~/images/District Images/ButtonViewKitchen.jpg" 
                           onclick="ImageButton1_Click" /> 
                   </div>
                   <div style="float:left; margin-left:170px; padding-left:5px;">
                        <asp:ImageButton ID="ImageButton2"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonAssignKitchens.jpg" 
                           onclick="btnAddKitchenSOP_Click"/> 
                   </div>                  
                   <div class="Clearer"></div>    
                 <%--<div class="ViewPlanClearer"></div>--%>          
                   <div style="float:left; border:solid 1px black; padding:5px;">
                    <div class="SimpleHeading">SOP MANAGER PANEL</div>
                    <div class="Clearer"></div>
                    <div class="FloatLeft">
                     <asp:ImageButton ID="btnCreateSOPGroup" runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateSOPGroup.jpg" 
                           onclick="btnCreateSOPGroup_Click" />
                   </div>
                   <div class="Clearer"></div>                   
                    <div class="FloatLeft">                    
                            <asp:ImageButton ID="btnCreateCustomSOP"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateCustomSOP.jpg" 
                           onclick="btnCreateCustomSOP_Click"/>      
                   </div>  
                   <div class="Clearer"></div>
                   <div class="FloatLeft">                    
                            <asp:ImageButton ID="btnSOPReview"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonSOPReview.jpg" 
                           onclick="btnSOPReview_Click"/>
                   </div>  
                   </div> 
                   <div style="float:left; border:solid 1px black; margin-left:95px; padding:5px;">
                    <div class="SimpleHeading">FOOD SAFETY MANAGER PANEL</div>
                    <div class="Clearer"></div>
                     <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateChecklistGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateChecklistGroup.jpg" 
                           onclick="btnCreateChecklistGroup_Click"/> 
                   </div>                                 
                   <div class="Clearer"></div>
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateQuestion"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateQuestion.jpg" 
                           onclick="btnCreateQuestion_Click"/> 
                   </div>
                   <div class="Clearer"></div>
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnChecklistReview"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonChecklistReview.jpg" 
                           onclick="btnChecklistReview_Click"/> 
                   </div>
                   </div>  
                   <div style="float:left; border:solid 1px black; margin-left:95px; padding:5px;">
                    <div class="SimpleHeading">VALIDATION MANAGER PANEL</div>
                    <div class="Clearer"></div>
                     <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateValidationGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateValidationGroup.jpg" 
                           onclick="btnCreateValidationGroup_Click" /> 
                   </div>                   
                   <div class="Clearer"></div>
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateValidationQuestion"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateValidationQuestion.jpg" 
                           onclick="btnCreateValidationQuestion_Click"  /> 
                   </div>
                   <div class="Clearer"></div>
                    <div class="FloatLeft">
                    <asp:ImageButton ID="btnValidationReview"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonValidationReview.jpg" 
                           onclick="btnValidationReview_Click" /> 
                   </div>
                   </div>                  
                  <div class="Clearer"></div>
                  <%--<div style="float:left; border:solid 1px black; padding:5px;">
                    <div class="SimpleHeading">CCP and CP MANAGER PANEL</div>
                    <div class="Clearer"></div>
                    <div class="FloatLeft">
                     <asp:ImageButton ID="btnCreateCCPGroup" runat="server"  
                            onclick="btnCreateCCPGroup_Click" ImageUrl="~/images/District Images/ButtonCreateCCPGroup.jpg" 
                           />
                   </div>                  
                   <div class="Clearer"></div>
                    <div class="FloatLeft">                    
                            <asp:ImageButton ID="btnCreateCustomCCP"  runat="server"  
                            onclick="btnCreateCustomCCP_Click" ImageUrl="~/images/District Images/ButtonCreateCustomCCP.jpg" />      
                   </div>  
                   <div class="Clearer"></div>
                   <div class="FloatLeft">                    
                            <asp:ImageButton ID="btnCCPReview"  runat="server"  
                           onclick="btnCCPReview_Click" ImageUrl="~/images/District Images/ButtonReviewCCP.jpg" 
                           />
                   </div>  
                   </div>--%>  
                  <div style="float:left; border:solid 1px black; margin-left:5px; padding:5px;">
                    <div class="SimpleHeading">FOOD CATEGORY MANAGER PANEL</div>
                    <div class="Clearer"></div>
                     <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateFoodCategoryGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateFoodGroup.jpg" onclick="btnCreateFoodCategoryGroup_Click" 
                           /> 
                   </div>                                   
                   <div class="Clearer"></div>
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnCreateFoodCategory"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateCustomFoodCategory.jpg" onclick="btnCreateFoodCategory_Click" 
                          /> 
                   </div>
                   <div class="Clearer"></div>
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnFoodCategoreyReview"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonReviewFoodCategory.jpg" onclick="btnFoodCategoreyReview_Click" 
                           /> 
                   </div>
                   </div>  
                 <%-- <div class="ViewPlanClearer"></div> Second Row--%> 
                   <%--<div class="Clearer" style="margin-top:15px" ></div>--%>
                   <%--<div class="ViewPlanClearer"></div> Third Row--%>
                   <%--<div class="Clearer" style="margin-top:15px"></div>--%>
                   <%--<div class="ViewPlanClearer"></div>-- Fourth Row%>
                  
                   
                   
                   <div class="Clearer" style="margin-top:15px"></div>
                   <%--<div class="ViewPlanClearer"></div>--%>
                  <%-- <div class="Clearer" style="margin-top:15px"></div>--%>
                </div>
                <div class="Clearer"></div> 
                <%-- <div class="ViewPlanClearer"></div> --%>
    </div>    
    <%--<div class="SearchDiv">
            <div class="SearchCol1">KITCHENS IN THE DISTRICT</div>
            <div class="SearchCol2">Search <span>Kitchens:</span></div>
            <div class="SearchCol3">
                <asp:TextBox ID="TextBox2" runat="server" Width="240px" CssClass="TextBox"></asp:TextBox>
            </div>
            
     </div>--%>
     
     
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2008 " ForeColor="White" runat="server"></asp:Label>
    </div>               
</asp:Content>

