<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Temp.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.Temp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="bdy_contents"> 
        <div class="grey_bg_dis" style="font-size:small;">
            <b>Directions:</b>  Please review the answers to your questions.  If you would like to change an 
            answer please click on Back button to go back to the Validation Checklist.
        </div>
        <div class="grey_bg_dis">
	<table  border="0" cellspacing="0" cellpadding="0"> 
                 <tr>
                   <td colspan="3">&nbsp;</td>                  
                </tr>                  
                <tr>
                  <td style="font-size:small;" >Person Responsible for Validation:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td style="font-size:small;"><asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label>
                </tr>
                <tr>
                  <td style="font-size:small;">Entry Date:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  style="font-size:small;"> <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>	
                </tr>
                <tr>
                   <td colspan="3">&nbsp;</td>                  
                </tr>  
    </table>
    </div>
    <div class="table_view">               
             <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" 
             DataSourceID="ObjectDataSource1" 
                 onrowdatabound="grdQuestion_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="2px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />                           
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
                    </asp:TemplateField>                                        
                    <asp:TemplateField ItemStyle-Width="550px" HeaderText="Question"  HeaderStyle-Font-Size="Small" ItemStyle-Font-Size="Small" ItemStyle-Height="50px" >
                        <ItemTemplate>                                                                      
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="550px"></ItemStyle>
                    </asp:TemplateField>                     
                    <asp:TemplateField ItemStyle-Width="120px" HeaderText="Answers" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Font-Size="Small" ItemStyle-Font-Size="Small">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="200px" HeaderText="Corrective Action" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"   HeaderStyle-Font-Size="Small" ItemStyle-Font-Size="Small">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Remarks") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="200px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetResponsesByHistoryId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationResponse">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="nHistoryId" 
                        SessionField="HistoryId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
           
    </div>   
    <div class="grey_bg_form">              
       
        <%-- <asp:ImageButton ID="cmdBack"  runat="server" 
                ImageUrl="~/images/buttons/ButtonGoBack.png"
                onclick="cmdBack_Click" />
        <asp:ImageButton ID="cmdContinue" ImageUrl="~/images/buttons/ButtonConfirm.png"  
                runat="server" onclick="cmdContinue_Click" />     --%>
       <asp:Button ID="btnBack" runat="server" CausesValidation="false" Width="90px" Font-Size="Medium" OnClick="btnBack_Click" Text="Go Back"  />
            <asp:Button ID="btnContinue" runat="server" OnClick="cmdContinue_Click" Width="90px" Font-Size="Medium" Text="Confirm" />   
    </div>  
  </div>
    </form>
</body>
</html>


<%----%>