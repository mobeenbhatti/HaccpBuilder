<%@ Page Language="C#" AutoEventWireup="true" Title="HACCP Builder | Validation Checklist"  Inherits="ControlPanel_District_ValidationPrint"  Codebehind="ValidationPrint.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
                              <td class="red_heading">{  Validation Checklist }</td>
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
    
    <div class="grey_bg_dis">
          <table  border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td><table  border="0" cellspacing="0" cellpadding="0">                
                <tr>
                  <td width="350px"  align="left">Name of person responsible for validation:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  ><asp:TextBox ID="txtResponsiblePerson" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                   <td width="350px"  align="left">Title:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                 </td>
                </tr>                
                <tr>
                   <td width="350px"  align="left">Frequency at which the validation is done(Per Year):</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <asp:TextBox ID="txtFrequency" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                   <td width="350px"  align="left">Any other reason than frequency for doing the validation:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtReason" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                   <td width="350px"  align="left">Date of last validation:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtLastDate" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                   <td width="350px"  align="left">The length of time this record is kept on file (i.e. #years):</td>
                  <td><img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtFileTime" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>               
                <tr>
                   <td width="350px"  align="left">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
               
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
          </table>
        </div>
    <div style="clear:both;"></div>
    <div class="table_view">
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" 
            SkinID="gridviewSkin" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="2px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
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
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="200px" Height="30px"   runat="server" ></asp:TextBox>                             
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>          
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetValidationQuestionsByGroupId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="nGroupId" QueryStringField="GroupId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    <div class="grey_bg_dis">
          <table  border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td>
              <table  border="0" cellspacing="0" cellpadding="0">
                
                <tr>
                  <td width="350px"  align="left">Validation Verified By Manager - Name:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td ><asp:TextBox ID="txtVerifiedBy" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <td width="350px"  align="left">Title:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtManagerTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                 </td>
                </tr>                
                <tr>
                  <td width="350px"  align="left">Manager Validation Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <asp:TextBox ID="txtManagerValidationDate" CssClass="ChecklistTextBox" runat="server"></asp:TextBox></td>
                </tr>                             
                <tr>
                  <td align="left">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
               
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
          </table>
        </div>
    <div id="footer" align="center"><div id="footer_txt">© HACCP Builder </div>
</div>
</div> 
    </form>
</body>
</html>