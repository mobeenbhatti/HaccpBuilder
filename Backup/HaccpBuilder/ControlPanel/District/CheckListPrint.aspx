<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckListPrint.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CheckListPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    <div class="bdy_contents">
      <div id="container">
         <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ CHECKLIST ADD ON }</td>
                            </tr>
                            <tr>
                              <td><Contact:Detail ID="cd" runat="server" /></td>
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
                    <tr>
                      <td height="54" background="../../images/District Images/bg_btns_strip.gif"><table width="690" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" width="10" height="12" /></td>
                        </tr>
                        <tr>
                          <td><table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" /></td>
                        </tr>
                      </table></td>
              </tr>
                  </table>
   		  </div>
   <div class="grey_bg_dis">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <b>Directions:</b> Use this checklist weekly to determine areas in your operations
                        requiring corrective action. Record corrective action taken and keep completed records
                        in a notebook for future reference.
                    </td>
                </tr>
            </table>
        </div>
        <div class="grey_bg_dis">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Report Date:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="pnlObserver" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtObserver" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Observer field" ForeColor="Red" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
        <div class="grey_bg_dis">
            <div class="red_heading">
                <asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
            </div>
        </div>
        <div class="table_view">
            <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false"
                SkinID="gridviewSkin" OnRowDataBound="grdChecklist_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="10px">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' runat="server" />
                            <asp:HiddenField ID="hfIsBoolActive" Value='<%# DataBinder.Eval(Container.DataItem, "BoolActive") %>' runat="server" />
                            <asp:HiddenField ID="hfIsOpenActive" Value='<%# DataBinder.Eval(Container.DataItem, "OFActive") %>' runat="server" />
                            <asp:HiddenField ID="hfOfRequired" Value='<%# DataBinder.Eval(Container.DataItem, "OFRequired") %>' runat="server" />
                            <asp:HiddenField ID="hfIsCorrectiveAction" Value='<%# DataBinder.Eval(Container.DataItem, "CAActive") %>' runat="server" />
                            <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField  ItemStyle-Width="10px">
                    <ItemTemplate>
                    <asp:Label ID="lblQuestionId" Text = '<%# DataBinder.Eval(Container.DataItem, "SortOrder") %>' runat="server"></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>--%>
                    <asp:BoundField DataField="Checklist" ItemStyle-Width="150px" HeaderText="Question" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="180px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="220px"
                                Height="60px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply remarkss."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                           <%-- <asp:RegularExpressionValidator ID="REV_txtCorrectiveAction" Display="Dynamic" runat="server" ForeColor="Red"
                                ControlToValidate="txtCorrectiveAction" ErrorMessage="Please enter valid corrective action."
                                ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="rdlCorrectiveActions" runat="server"></asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must select a corrective action"
                                ControlToValidate="rdlCorrectiveActions"></asp:RequiredFieldValidator>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>           
        </div>
      
     </div> 
 </div>
    </form>
</body>
</html>
