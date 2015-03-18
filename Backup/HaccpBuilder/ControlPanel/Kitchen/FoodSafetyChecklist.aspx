<%@ Page Title="HACCP Builder | Food Safety Checklist" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="FoodSafetyChecklist.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.FoodSafetyChecklistNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
    function check(txtobj, vldObj, enable) {
        if (enable == false) {

            ValidatorEnable(vldObj, false);
            txtobj.disabled = true;
            txtobj.value = "";
        }
        else {

            ValidatorEnable(vldObj, true);
            txtobj.disabled = false;
        }

    }
</script>
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Food Safety Checklist</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
<div class="ph-top">  
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Observer field" CssClass="msg-error" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
</div>
<div class="clear"></div>
<div class="form3">
   <b>Directions:</b> Use this checklist weekly to determine areas in your operations
    requiring corrective action. Record corrective action taken and keep completed records
    in a notebook for future reference.
</div>
<div class="form3">
    <div class="left">
        <label> Report Date:</label><div class="input"><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></div> 
    </div>
    <div class="left margin-lr" id="pnlObserver" runat="server">
        <label><asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label></label>
        <div class="input"><asp:TextBox ID="txtObserver" runat="server"></asp:TextBox></div>        
    </div>   
    <div class="clear"></div>
</div>
<div class="table">
    <div class="box-header">
      <h4 class="left"><asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></h4>
    </div>
    <asp:GridView ID="grdSafetyChecklist" runat="server" AutoGenerateColumns="false" CssClass="zebra" OnRowDataBound="grdSafetyChecklist_RowDataBound">
                <Columns>                   
                    <asp:BoundField DataField="Question"  HeaderText="Question" ItemStyle-Width="55%" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>'
                                runat="server" />
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="25%">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false"
                               runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply a corrective action or select Yes/NA."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetQuestionsDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="0" Name="tnPageIndex"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetResponsesDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nHistoryId" SessionField="HistoryId"
                Type="Int32" />
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="1" Name="nPageIndex"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>   
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
  <div class="form3">
      <div class="right button-margin">
            <asp:Button ID="btnContinue" runat="server" OnClick="Button1_Click" Text="CONTINUE" CssClass="blue button" />
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="BACK" CssClass="button"  />            
            <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>        
        </div>
        <div class="clear"></div>
  </div>
</div>
</asp:Content>
