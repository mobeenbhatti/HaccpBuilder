<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ProceduralQuestions" Title="HACCP Builder | Procedural Questions" Codebehind="ProceduralQuestions.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function SetValidator(status)
{
     
     var txtYes = document.getElementById('PlaceHolder_txtYes');
     var txtNo = document.getElementById('PlaceHolder_txtNo');
     var rfvYes = document.getElementById('PlaceHolder_rfvYes');
     var rfvNo = document.getElementById('PlaceHolder_rfvNo');
     var lblQuestion = document.getElementById('PlaceHolder_lblQuestionHeading');
    
     
     if(status == 1)
     {
         txtYes.disabled = false;         
         ValidatorEnable(rfvYes, true);
         txtNo.disabled = false;
         if(lblQuestion.innerText == 'ALLERGEN MANAGEMENT')
         {
             
            ValidatorEnable(rfvNo, true);
         }
         else
         {
             
            ValidatorEnable(rfvNo, false);
         }
         
       // txtNo.disabled = true;
//         ValidatorEnable(vldVerifiedControl, true);
//         ValidatorEnable(vldCorrectiveControl, true);
//         ValidatorEnable(vldTrainingControl, true);
     }
     else
     {
        txtYes.disabled = true;         
        ValidatorEnable(rfvYes, false);
        txtNo.disabled = true;
        if(lblQuestion.innerText == 'ALLERGEN MANAGEMENT')
         {
          
            ValidatorEnable(rfvNo, false);
         }
         else
         {
            
            ValidatorEnable(rfvNo, true);
         }
    
//         ValidatorEnable(vldVerifiedControl, false);
//         ValidatorEnable(vldCorrectiveControl, false);
//         ValidatorEnable(vldTrainingControl, false);
     }    
}


</script>
 <div class="bdy_contents">
    <div class="red_heading">
        <asp:Label ID="lblQuestionHeading" Text="" runat="server"></asp:Label>: <span class="SecondaryHeading"> STEP <asp:Label ID="lblStep" Text="" ForeColor="Black" runat="server"></asp:Label> OF NINE BUILDING YOUR HACCP PLAN </span>
    </div>
    <%--<div class="LogHeading">
    HACCP Procedural Questions Required - <asp:Label ID="lblQuestionType" Text="" runat="server"></asp:Label>
    </div>--%>
    <div class="grey_bg_dis">
    <div id="dvQuestion1" runat="server">
        <div class="ProceduralDiv">
        <div class="ProceduralLabel"><asp:Label ID="lblQuestion" Text="" runat="server"></asp:Label></div>
        <div class="ChecklistTextBox"><asp:RadioButton ID="rdbYes" Text="Yes" onClick="SetValidator(1)" GroupName="Answer" runat="server" />
        <asp:RadioButton ID="rdbNo" Text="No" GroupName="Answer" onClick="SetValidator(0)" runat="server" />
        <asp:TextBox ID="txtAnswer" CssClass="ProceduralTextBox" TextMode="MultiLine" Visible="false" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAnswer" ErrorMessage="Please fill Answer field." 
        runat="server" ControlToValidate="txtAnswer" Enabled="false"></asp:RequiredFieldValidator>
        </div>
        <div class="Clearer"></div>
        </div>
        <div class="ProceduralDiv" id="dvYes" runat="server">
        <div class="ProceduralLabel"><asp:Label ID="lblYes" Text="" runat="server"></asp:Label></div>
        <div class="ChecklistTextBox">
        <asp:TextBox ID="txtYes" CssClass="ProceduralTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvYes" ErrorMessage="Please fill Answer field." 
        runat="server" Enabled ="false" ControlToValidate="txtYes"></asp:RequiredFieldValidator>  
        </div>
        <div class="Clearer"></div>  
        </div>   
        <div class="ProceduralDiv" id="dvNo" runat="server">   
        <div class="ProceduralLabel"><asp:Label ID="lblNo" Text="" runat="server"></asp:Label></div>
        <div class="ChecklistTextBox">
        <asp:TextBox ID="txtNo" CssClass="ProceduralTextBox" TextMode="MultiLine" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNo" ErrorMessage="Please fill Procedures for Allergan control field." 
        runat="server" ControlToValidate="txtNo" Enabled="false"></asp:RequiredFieldValidator>  
        </div>
        <div class="Clearer"></div>
        </div>
    </div>
    </div>
    <div class="table_view">
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
    <asp:Label ID="lblStatus" runat="server" Visible="false" Text=""></asp:Label>
    </div>
    <div class="grey_bg_form">
       <asp:ImageButton ID="btnContinue" runat="server" align="right"  
                            ImageUrl="~/images/buttons/ButtonFisnishContinue.png" onclick="btnContinue_Click" />
    </div>
</div>
</asp:Content>

