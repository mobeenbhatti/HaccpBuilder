<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" CodeBehind="ChecklistQuestionReviewOld.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ChecklistQuestionReview" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<div class="bdy_contents">
 <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ Food Safety Checklist Review }</td>
                            </tr>
                            <tr>
                              <td><Contact:Detail ID="Detail1" runat="server" /></td>
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
 
   		<div class="buttons_bg"></div>
        <div class="grey_bg_dis">
	<table  border="0" cellspacing="0" cellpadding="0"> 
                 <tr>
                   <td colspan="3">&nbsp;</td>                  
                </tr>                  
                <tr>
                  <td colspan="3"><b>Section Name:<asp:Label ID="lblSection" runat="server"></asp:Label></td>                  
                </tr>
   </table>
   </div>
        <div class="grey_bg_dis">
	<table  border="0" cellspacing="0" cellpadding="0"> 
                 <tr>
                   <td colspan="3">&nbsp;</td>                  
                </tr>  
                <tr>
                  <td>Observer:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label></td>
                </tr> 
                <tr>
                  <td>Entry Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></td>
                </tr>                
   </table>
   </div>
         
    <div class="table_view">   
            <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false"
                SkinID="gridviewSkin" >
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
            
    </div>
     <div class="grey_bg_form">
        <asp:ImageButton ID="cmdContinue" ImageUrl="~/images/buttons/ButtonConfirm.png"  
                runat="server" onclick="cmdContinue_Click"  />
        </div>         
 </div>
</asp:Content>
