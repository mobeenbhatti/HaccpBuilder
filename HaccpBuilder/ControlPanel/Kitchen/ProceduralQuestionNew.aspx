<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ProceduralQuestionNew" Codebehind="ProceduralQuestionNew.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function SetValidator(Question,status)
{
   
    var txtQuestion1 = document.getElementById("<%= txtQuestion1.ClientID %>");
    var txtQuestion2A = document.getElementById("<%= txtQuestion2A.ClientID %>");
    var txtQuestion2B = document.getElementById("<%= txtQuestion2B.ClientID %>");
    var txtQuestion3 = document.getElementById("<%= txtQuestion3.ClientID %>");
    var txtQuestion4 = document.getElementById("<%= txtQuestion4.ClientID %>");


    var rfvQuestion2A = document.getElementById("<%= rfvQuestion2A.ClientID %>");
    var rfvQuestion2B = document.getElementById("<%= rfvQuestion2B.ClientID %>");
    var rfvQuestion4 = document.getElementById("<%= rfvQuestion4.ClientID %>");  
    

     if (Question == 1) {
         if (status == 1) {
             txtQuestion2A.disabled = false;
             ValidatorEnable(rfvQuestion2A, true);
             ValidatorEnable(rfvQuestion2B, true);
             txtQuestion2B.disabled = false;                 
         }
         else {
             txtQuestion2A.disabled = true;
             txtQuestion2B.disabled = true;  
             txtQuestion2A.value = '';
             txtQuestion2B.value = '';
             ValidatorEnable(rfvQuestion2A, false);
             ValidatorEnable(rfvQuestion2B, false);
             
         }
     }
     if (Question == 4) {
         if (status == 1) {
             txtQuestion4.disabled = false;
             ValidatorEnable(rfvQuestion4, true);            
         }
         else {
             txtQuestion4.disabled = true;             
             txtQuestion4.value = '';             
             ValidatorEnable(rfvQuestion4, false);
         }
     }
}


</script>
<div class="bdy_contents">
    <asp:MultiView ID="MultiView1" runat="server">
    <!-- QUESTION 1 -->
    <asp:View ID="panel1" runat="server">
     <div class="red_heading">
        BUYER SPECIFICATIONS: <span class="SecondaryHeading"> STEP <span style="color:Black;">ONE</span> OF NINE BUILDING YOUR HACCP PLAN </span>
    </div>
    <div class="grey_bg_dis">
        <div id="dvQuestion1">
             <div class="ProceduralLabel">Describe Establishment Requirements for Vendor Selection</div>
              <asp:TextBox ID="txtQuestion1" CssClass="ProceduralTextBox" TextMode="MultiLine" Visible="true" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvQuestion1" ErrorMessage="Please fill Answer field." 
        runat="server" ControlToValidate="txtQuestion1" Enabled="true"></asp:RequiredFieldValidator>
        <asp:HiddenField ID="hfResponse1" runat="server" />
        <div class="Clearer"></div>
        </div>
    </div>
    </asp:View>
    <!-- QUESTION 2 -->
    <asp:View ID="panel2" runat="server">
    <div class="red_heading">
        ALLERGEN MANAGEMENT: <span class="SecondaryHeading"> STEP <span style="color:Black;">TWO</span> OF NINE BUILDING YOUR HACCP PLAN </span>
    </div>
    <div class="grey_bg_dis">
        <div class="ProceduralDiv">
            <div class="ProceduralLabel">Do any menu items contain potential allergen ingredients:</div>
            <asp:RadioButton ID="rdbYes" Text="Yes" onClick="SetValidator(1,1)" GroupName="Answer" runat="server" />
            <asp:RadioButton ID="rdbNo" Text="No" GroupName="Answer" onClick="SetValidator(1,0)" runat="server" />
                
            <div class="Clearer"></div>        
        </div>
        <div class="ProceduralDiv">
            <div class="ProceduralLabel">If yes, describe allergen ingredients</div>
            <div class="ChecklistTextBox">
            <asp:TextBox ID="txtQuestion2A" CssClass="ProceduralTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQuestion2A" ErrorMessage="Please fill Answer field." 
            runat="server" Enabled ="false" ControlToValidate="txtQuestion2A"></asp:RequiredFieldValidator>
            <asp:HiddenField ID="hfResponse2" runat="server" />  
           
            </div>
            <div class="Clearer"></div>  
        </div>   
        <div class="ProceduralDiv">   
            <div class="ProceduralLabel">Please describe procedures for allergen control</div>
            <div class="ChecklistTextBox">
            <asp:TextBox ID="txtQuestion2B" CssClass="ProceduralTextBox" TextMode="MultiLine" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQuestion2B" ErrorMessage="Please fill Procedures for Allergan control field." 
            runat="server" ControlToValidate="txtQuestion2B" Enabled="false"></asp:RequiredFieldValidator> 
            <asp:HiddenField ID="hfResponse3" runat="server" />  
            </div>
            <div class="Clearer"></div>
        </div>       
    </div>
    </asp:View>
    <!-- QUESTION 3 -->
    <asp:View ID="panel3" runat="server">
         <div class="red_heading">
        SAFETY HAZARD PROCEDURES: <span class="SecondaryHeading"> STEP <span style="color:Black;">THREE</span> OF NINE BUILDING YOUR HACCP PLAN </span>
        </div>
        <div class="grey_bg_dis">
            <div id="Div1">
                 <div class="ProceduralLabel">Describe basic procedures to eliminate menu items from contamimation by biological, chemical and physical food safety hazards</div>
                  <asp:TextBox ID="txtQuestion3" CssClass="ProceduralTextBox" TextMode="MultiLine" Visible="true" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQuestion3" ErrorMessage="Please fill Answer field." 
            runat="server" ControlToValidate="txtQuestion3" Enabled="true"></asp:RequiredFieldValidator>
                 <asp:HiddenField ID="hfResponse4" runat="server" /> 
            <div class="Clearer"></div>
            </div>
        </div>
    </asp:View>
    <!-- QUESTION 4 -->
    <asp:View ID="panel4" runat="server">
        <div class="red_heading">
        SOIL AND UNSANITIZED SURFACES: <span class="SecondaryHeading"> STEP <span style="color:Black;">FOUR</span> OF NINE BUILDING YOUR HACCP PLAN </span>
        </div>
    <div class="grey_bg_dis">
        <div class="ProceduralDiv">
            <div class="ProceduralLabel">Do soiled and unsanitized surfaces of equipment and utensils contact raw or cooked food:</div>
            <asp:RadioButton ID="rdbYes4" Text="Yes" onClick="SetValidator(4,1)" GroupName="Answer" runat="server" />
            <asp:RadioButton ID="rdbNo4" Text="No" GroupName="Answer" onClick="SetValidator(4,0)" runat="server" />       
            <div class="Clearer"></div>        
        </div>
        <div class="ProceduralDiv">
            <div class="ProceduralLabel">If yes, describe how the raw or cooked food comes into contact with unclean or unsanitized surfaces</div>
            <div class="ChecklistTextBox">
            <asp:TextBox ID="txtQuestion4" CssClass="ProceduralTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQuestion4" ErrorMessage="Please fill Answer field." 
            runat="server" Enabled ="false" ControlToValidate="txtQuestion4"></asp:RequiredFieldValidator>
             <asp:HiddenField ID="hfResponse5" runat="server" />   
            </div>
            <div class="Clearer"></div>  
        </div>
     </div>   
    </asp:View>
    <!-- QUESTION 5 -->
    <asp:View ID="panel5" runat="server">
         <div class="red_heading">
            DAILY REQUIREMENTS: <span class="SecondaryHeading"> STEP <span style="color:Black;">FIVE</span> OF NINE BUILDING YOUR HACCP PLAN </span>
         </div>
         <div class="grey_bg_dis">
            
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="false" 
            SkinID="gridviewSkin" >
            <Columns>
            <asp:TemplateField  ItemStyle-Width="10px">
                <ItemTemplate>
                <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />                    
                </ItemTemplate>
            </asp:TemplateField>               
            <asp:BoundField DataField="Question" ItemStyle-Width="550px" HeaderText="Question" />                
            <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                <ItemTemplate >
                    <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
                    <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
                    <asp:Label ID="lblValidateProcess" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  ItemStyle-Width="10px">
                <ItemTemplate>
                <asp:HiddenField ID="hfResponseId" Value="" runat="server" />                    
                </ItemTemplate>
            </asp:TemplateField>   
            <%--<asp:TemplateField HeaderText="Detail if needed" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px" Height="30px"   runat="server" ></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Static" Enabled="false" 
                     ErrorMessage="You must supply a corrective action or select Yes." ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
            </asp:GridView>    
             <asp:HiddenField ID="hfResponse6" runat="server" />
         </div>
    </asp:View>
    </asp:MultiView>
    <asp:Label ID="lblStatus" runat="server" Visible="false" Text=""></asp:Label>   
    <div class="grey_bg_form">
       <asp:ImageButton ID="btnContinue" runat="server" align="right"  
                            ImageUrl="~/images/buttons/ButtonFisnishContinue.png" onclick="btnContinue_Click" />
       <asp:Label ID="lblTest" runat="server"></asp:Label>
    </div>
</div>
</asp:Content>

