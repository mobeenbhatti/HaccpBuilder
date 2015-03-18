<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintChecklist.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PrintChecklistNew" Title="HACCP Builder | Food Safety Checklist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
   <div class="container">
    <div class="ph-top"></div>
    <div class="form3"><h2>Food Safety Checklist</h2></div>
    <div class="form3">
        <div class="left">
            <label><asp:Label ID="lblObserver" runat="server" Text="Observer: "></asp:Label></label>
        </div>         
        <div class="left margin-lr" id="pnlObserver" runat="server">
            <label><asp:Label ID="lblInfo" runat="server" Text="FOOD SAFETY CHECK LIST"></asp:Label></label>
            <div class="input"></div>        
        </div>          
        <div class="clear"></div>
    </div>
    <div class="table">
         <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" onrowdatabound="grdQuestion_RowDataBound" >
                <Columns>                   
                    <asp:TemplateField HeaderText="Category"  ItemStyle-Width="15%">
                        <ItemTemplate>
                        <asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>
                       </ItemTemplate>                        
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Question" ItemStyle-Width="55%">
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
    </form>
</body>
</html>
