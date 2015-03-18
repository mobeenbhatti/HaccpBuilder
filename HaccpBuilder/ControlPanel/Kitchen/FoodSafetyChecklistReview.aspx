<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="FoodSafetyChecklistReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.FoodSafetyChecklistReviewNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Food Safety checklist Review</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
    <div class="ph-top"></div>
    <div class="form3">
      <b>Directions:</b>  Please review the answers to your questions.  If you would like to change an 
            answer please click on the category hotlink in the left-hand column to go back to the requested 
            category section.  The system will require you to page through each remaining category to return to 
            the review page.
    </div>
    <div class="clear tenpx"></div>     
    <div class="form3">
        <div class="left">
            <label> Report Date:</label><div class="input"><asp:Label ID="lblWeekDate" Text="" runat="server"></asp:Label></div> 
        </div>
        <div class="left margin-lr" id="pnlObserver" runat="server">
            <label><asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label></label>
            <div class="input"><asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label></div>        
        </div>   
        <div class="left">
            <label>Entry Date</label>
            <div class="input"><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></div>
        </div>
         <div class="right">
            <asp:Button ID="cmdContinue" runat="server" OnClick="cmdContinue_Click" Text="CONFIRM" CssClass="blue button" />
                
        </div>
        <div class="clear"></div>
    </div>

    <div class="table">
        <div class="box-header"></div>
         <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" onrowdatabound="grdQuestion_RowDataBound" >
            <Columns>                   
                <asp:TemplateField HeaderText="Category" ItemStyle-Width="15%">
                    <ItemTemplate>
                    <%--<asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>--%>
            <%-- MBS-(03-19-10)
                BUG ID - 1877--%>
                    <asp:HyperLink ID="hlCategory" Text = '<%# Eval("Section") %>' ForeColor="Blue" runat="server"></asp:HyperLink>
                    </ItemTemplate>                       
                </asp:TemplateField>                      
                <asp:TemplateField HeaderText="Question" ItemStyle-Width="60%">
                    <ItemTemplate>                                               
                    <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                    </ItemTemplate>                      
                </asp:TemplateField>                     
                <asp:TemplateField HeaderText="Answers" ItemStyle-Width="10%">
                    <ItemTemplate>
                    <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>                  
                    </ItemTemplate>                       
                </asp:TemplateField>
	            <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblType" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>        
                          <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                        <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />                    
                    </ItemTemplate>                       
                </asp:TemplateField>
            </Columns>                
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetResponsesByHistoryId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="nHistoryId" 
                    SessionField="HistoryId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="box-bottom"> </div>
    </div>
    

</div>
</asp:Content>
