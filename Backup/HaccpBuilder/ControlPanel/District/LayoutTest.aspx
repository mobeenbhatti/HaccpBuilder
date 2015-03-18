<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master"
    AutoEventWireup="true" Inherits="LayoutTest" Codebehind="LayoutTest.aspx.cs" %>

<%@ Register Src="../../Controls/DistrictAddrssNew.ascx" TagName="DistrictAddrssNew"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Corporate Dashboard</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
 <div class="left"><br /><!----BODY-TOP-START----->    
    <%--<h2>Heading</h2>--%>
    <uc1:DistrictAddrssNew ID="DistrictAddrssNew1" runat="server" />
  </div>
  <div class="right"><br />
    <%--<h2>Heading</h2>--%>
    <div class="form"> <div class="client-logo"></div></div>
  </div><!----BODY-TOP-END----->
  
  <div class="clear tenpx"></div>
  
  <div class="nav2"> <!----BODY-NAV-2-START----->
    <ul id="menu">
      <li runat="server" id="pnlInventory"><a   href="../../StaticContent/Files/HACCP Builder Instruction Guide.pdf">User Guide/ Training Manual</a></li>
      <li runat="server" id="pnlVendors"><a href="../../ControlPanel/District/ViewKitchen.aspx">See Your Individual Locations</a></li>
      <li runat="server" id="pnlCutomers"><a href="../../ControlPanel/District/KitchenGroup.aspx">Assign Location Master Page</a></li>
    </ul>
  </div><!----BODY-NAV-2-END----->  
  <div class="clear"></div>
  <div class="left" runat="server" id="pnlSop"><br /><!----SOP Panel-START----->
    
    <div class="box-header"><h4>SOP, SSOP & GMP MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td ><a href="SOPGroup.aspx" >Create SOP, SSOP & GMP Group</a>
                </td>
            </tr>
            <tr>  
                <td><a href="CustomSOP.aspx">Create Custom SOP, SSOP & GMP's In Group</a>
                </td>           
            </tr>
            <tr>
                <td><a href="SOPReview.aspx" >Review SOP, SSOP & GMP's In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----SOP Panel-END----->
  <div  class="left form-margin" runat="server" id="pnlFoodSafety"><br /><!----Food Safety Panel-START----->
   <div class="box-header"><h4>FOOD SAFETY MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td ><a href="ChecklistGroup.aspx" >Create Custom Food Safety List Group</a>
                </td>
            </tr>
            <tr>  
                <td><a href="CustomQuestion.aspx" >Create Food Safety Question In Group</a>
                </td>           
            </tr>
            <tr>
                <td><a href="QuestionsReview.aspx" >Review Food Safety Questions In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----Food Safety Panel-END----->
  <div class="left" runat="server" id="pnlValidation"><br /><!----Validation Panel-START----->   
    <div class="box-header"><h4>VALIDATION MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td >
                    <a href="ValidationGroup.aspx" >Create Custom Validation Group</a>
                </td>
            </tr>
            <tr>  
                <td>
                    <a href="ValidationCustomQuestion.aspx" >Create Validation Question In Group</a>
                </td>           
            </tr>
            <tr>
                <td>
                 <a href="ValidationQuestionReview.aspx" >Review Validation Questions Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----Validation Panel-END----->
  <div class="clear"></div>
   <div class="left" runat="server" id="pnlFoodCategory"><br /><!----Food Category Panel-START----->   
    <div class="box-header"><h4>FOOD CATEGORY MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td >
                   <a href="FoodCategoryGroup.aspx" >Create Custom Food Group</a>
                </td>
            </tr>
            <tr>  
                <td>
                    <a href="CustomFoodCategory.aspx" >Create Custom Food Category And Hazards</a>
                </td>           
            </tr>
            <tr>
                <td>
                 <a href="FoodCategoryReview.aspx" >Review Food Category In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----Food Category Panel-END----->
   <div  class="left form-margin" runat="server" id="pnlProcess"><br /><!----Process Panel-START----->    
    <div class="box-header"><h4>PROCESSES MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td >
                    <a href="ProcessGroup.aspx" >Create Custom Process Group</a>
                </td>
            </tr>
            <tr>  
                <td>
                    <a href="CustomProcess.aspx" >Create Custom Process In Group</a>
                </td>           
            </tr>
            <tr>
                <td>
                    <a href="ProcessReview.aspx" >Review Processes In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----Process Panel-END----->
   <div class="left" runat="server" id="pnlChecklist"><br /><!----Checklist Add-on Panel-START----->   
    <div class="box-header"><h4>CHECKLIST ADD-ON MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td >
                    <a href="ChecklistAddOnGroup.aspx" >Create Custom Checklist Group</a>
                </td>
            </tr>
            <tr>  
                <td>
                    <a href="ChecklistSections.aspx" >Create Custom Checklist In Group</a>
                </td>           
            </tr>
            <tr>
                <td>
                 <a href="ChecklistSections.aspx" >Review Checklists In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----Checklist Add-On Panel-END----->
  <div class="clear"></div>
   <div class="left form-margin" runat="server" id="pnlCtpat"><br /><!----C-Tpat Panel-START----->
   <div class="box-header"><h4>C-TPAT MANAGER PANEL</h4> </div>
    <div class="form2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td >
                    <a href="CtpatGroup.aspx" >Create Custom C-TPAT Group</a>
                </td>
            </tr>
            <tr>  
                <td>
                    <a href="CustomCtpat.aspx" >Create Custom C-TPAT's In Groups</a>
                </td>           
            </tr>
            <tr>
                <td>
                    <a href="CtpatReview.aspx" >Review C-TPAT In Group</a>
                </td>
            </tr>
        </table>
    </div>
  </div><!----C-Tpat Panel-END----->  
</div>
    
</asp:Content>
