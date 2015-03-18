<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_District_FoodSafetyChecklistPrint" Codebehind="FoodSafetyChecklistPrint.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Food Safety Checklist</title>
</head >
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    <div class="bdy_contents">
    <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{  Food Safety Checklist }</td>
                            </tr>
                            <tr>
                              <td><uc1:DistrictAddrssNew ID="DistrictAddrssNew1" runat="server" /> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>                    
                  </table>
   		  </div>
    <div class="table_view">               
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" 
            SkinID="gridviewSkin" DataSourceID="SqlDataSource1"
               onrowdatabound="grdQuestion_RowDataBound" >
                <Columns>
                    <asp:TemplateField ItemStyle-Width="2px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Category" ItemStyle-Font-Bold="true" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>
                       </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="100px"></ItemStyle>
                    </asp:TemplateField>                      
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Question" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="350px"></ItemStyle>
                    </asp:TemplateField>                     
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Answers" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Corrective Action" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="200px" Height="30px"   runat="server" ></asp:TextBox>                             
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
           
    </div> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetQuestionsPrintByGroupId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="nGroupId" QueryStringField="GroupId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>   
    <div id="footer" align="center"><div id="footer_txt">© HACCP Builder </div>
    </div>
   </div>
    
    </form>
</body>
</html>
