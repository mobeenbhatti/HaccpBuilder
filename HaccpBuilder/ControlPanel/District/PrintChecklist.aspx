<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_District_PrintChecklist" Codebehind="PrintChecklist.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Food Safety Checklist</title>
    <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    <div class="container">
    <div class="ph-top">
        <asp:Label ID="Label1" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            <h2><asp:Label ID="lblObserver" runat="server" Text="Observer: "></asp:Label></h2>
            <br />
            
            <h2> <asp:Label ID="lblInfo" runat="server" Text="FOOD SAFETY CHECK LIST"></asp:Label></h2>          
        </div>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left"> </h4>
    </div>

              
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1"
               onrowdatabound="grdQuestion_RowDataBound" >
                <Columns>
                    <asp:TemplateField HeaderText="Category" >
                        <ItemTemplate>
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                        <asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>
                       </ItemTemplate>
                    </asp:TemplateField>                      
                    <asp:TemplateField  HeaderText="Question" >
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField HeaderText="Answers">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="Corrective Action" >
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>                            
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
           
    </div>
    </div>    
    
         
    </form>
</body>
</html>
