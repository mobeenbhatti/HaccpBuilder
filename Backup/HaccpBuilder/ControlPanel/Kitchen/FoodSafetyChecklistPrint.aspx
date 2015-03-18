<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FoodSafetyChecklistPrint.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.FoodSafetyChecklistPrintNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="table">
    <div class="box-header">
      <h4 class="left">FOOD SAFETY CHECKLIST</h4>
    </div>
    <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="SqlDataSource1"  onrowdatabound="grdQuestion_RowDataBound" >
                <Columns>                   
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                        <asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>
                       </ItemTemplate>                       
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Question">
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Answers">
                        <ItemTemplate>
                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                        <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                        </ItemTemplate>                       
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="200px" Height="30px"   runat="server" ></asp:TextBox>                             
                        </ItemTemplate>                        
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetAllQuestions" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="box-bottom"> </div>
  </div>
    </div>
    </form>
</body>
</html>
