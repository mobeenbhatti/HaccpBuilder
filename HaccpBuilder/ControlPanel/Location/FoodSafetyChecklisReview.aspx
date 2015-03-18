<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Location_FoodSafetyChecklisReview" Title="Food Safety Checklist Review" Codebehind="FoodSafetyChecklisReview.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
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
                  <td colspan="3"><b>Directions:</b>  Please review the answers to your questions.  If you would like to change an 
            answer please click on the category hotlink in the left-hand column to go back to the requested 
            category section.  The system will require you to page through each remaining category to return to 
            the review page.</td>                  
                </tr>
   </table>
   </div>
    <div class="grey_bg_form">
        <asp:ImageButton ID="cmdBack"  runat="server" 
                ImageUrl="~/images/buttons/ButtonGoBack.png" Visible="False" />
        <asp:ImageButton ID="cmdContinue" ImageUrl="~/images/buttons/ButtonConfirm.png"  
                runat="server" onclick="cmdContinue_Click" />
        <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>           
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
                  <td>Report Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <asp:Label ID="lblWeekDate" Text="" runat="server"></asp:Label></td>
                </tr>
                <tr>
                  <td>Entry Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></td>
                </tr>                
   </table>
   </div>
         
    <div class="table_view">               
             <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" 
            SkinID="gridviewSkin" DataSourceID="ObjectDataSource1"
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
                        <%--<asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>--%>
               <%-- MBS-(03-19-10)
                    BUG ID - 1877--%>
                        <asp:HyperLink ID="hlCategory" Text = '<%# Eval("Section") %>' ForeColor="Blue" runat="server"></asp:HyperLink>
                       </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="100px" ForeColor="Blue"></ItemStyle>
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
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Corrective Action" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
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
 
    
</asp:Content>

