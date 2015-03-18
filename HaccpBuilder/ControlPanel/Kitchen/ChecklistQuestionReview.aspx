<%@ Page Title="Haccp Builder | Checklist Question Review" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ChecklistQuestionReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.checklistQuestionReviewNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Checklist Review</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
     <div class="ph-top">      
      <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false"></asp:Label>
      </div>
    <div class="form3">
      <h2>Section Name: <asp:Label ID="lblSection" runat="server"></asp:Label></h2>
    </div>
    <div class="form3">
        <div class="left">
            <label>Observer: </label><div class="input"><asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label></div> 
        </div>
        <div class="left margin-lr">
            <label>Entry Date </label>
            <div class="input"><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></div>        
        </div>  
        <div class="clear"></div>
    </div>
    <div class="table">
         <div class="box-header"></div>
         <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false" CssClass="zebra" >
                <Columns>                  
                    <asp:BoundField DataField="Checklist" ItemStyle-Width="250px" HeaderText="Question" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="250px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:Label ID="lblAnswer" Text='<%# Eval("BoolResponse") != null ? Eval("BoolResponse").ToString() == "1"? "Yes":Eval("BoolResponse").ToString() == "2"?"NA":"No" : "" %>'  runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="80px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OFResponse" ItemStyle-Width="200px" HeaderText="Remarks">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction" Text='<%# Eval("CorrectiveAction").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="200px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>  
         <div class="box-bottom"> </div>     
    </div>
    <div class="clear tenpx"></div>
      <div class="form3">
          <div class="right button-margin">
                <asp:Button ID="cmdContinue" runat="server" OnClick="cmdContinue_Click" Text="CONTINUE" CssClass="blue button" />                      
            </div>
        <div class="clear"></div>
      </div>

</div>
</asp:Content>
