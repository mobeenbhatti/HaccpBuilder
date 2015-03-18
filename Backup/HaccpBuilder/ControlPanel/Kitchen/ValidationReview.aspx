<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ValidationReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ValidationReviewNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<div class="ph-top">  
  
</div>
<div class="form3">
 <b>Directions:</b>  Please review the answers to your questions.  If you would like to change an 
            answer please click on Back button to go back to the Validation Checklist.
</div>
<div class="form3">
    <div class="left">
        <label>Person Responsible for Validation::</label>
        <div class="input">
            <asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Entry Date:</label>
        <div class="input">
            <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
        </div>        
    </div>       
    <div class="clear"></div>
</div>


<div class="table">
    <div class="box-header">
      <h4 class="left"></h4>
    </div>
    <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" 
                 onrowdatabound="grdQuestion_RowDataBound">
                <Columns>                                                     
                    <asp:TemplateField  HeaderText="Question" ItemStyle-Width="70%">
                        <ItemTemplate>                            
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Answers" ItemStyle-Width="15%">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                         <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />     
                        </ItemTemplate>                       
                    </asp:TemplateField>
	                <asp:TemplateField  HeaderText="Corrective Action" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Remarks") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>  
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
  <div class="form3">
      <div class="right button-margin">
            <asp:Button ID="cmdContinue" runat="server" Text="CONTINUE" OnClick="cmdContinue_Click" CssClass="button blue" />
            <asp:Button ID="cmdBack" runat="server" CausesValidation="false" OnClick="cmdBack_Click" Text="BACK" CssClass="button"  /> 
        </div>
         <div class="clear"></div>
  </div>
</div>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetResponsesByHistoryId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationResponse">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="nHistoryId" 
                        SessionField="HistoryId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
</asp:Content>
