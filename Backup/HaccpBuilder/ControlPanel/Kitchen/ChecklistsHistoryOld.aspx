<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" CodeBehind="ChecklistsHistoryOld.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ChecklistsHistory" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<div class="bdy_contents">
        <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                            <tr>
                                <td height="165" valign="top">
                                    <table width="690" border="0" cellspacing="5">
                                        <tr>
                                            <td class="red_heading">
                                                { CHECKLIST HISTORY }
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Contact:Detail ID="cd" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="54" background="../../images/District Images/bg_btns_strip.gif">
                        <table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="12" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="690" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx"></asp:HyperLink>
                                            </td>
                                           
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons_bg">
        </div>
        <div class="grey_bg_dis">
            <div class="ContentRight">              
            </div>
            <div >
                <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false" SkinID="gridviewSkin">
                    <Columns>                 
                        <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" ItemStyle-Width="50px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
	                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestion.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId") +"&Date=" + DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") + "&SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Edit=1"   %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField> 
                         <asp:BoundField DataField="Observer" HeaderText="Observer" ItemStyle-Width="150px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField ItemStyle-Width="50px" HeaderText="Account Type" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountType" Text='<%# DataBinder.Eval(Container.DataItem, "AccountType").ToString() == "1"? "Location Level":"Mobile Level"  %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField>  
                    </Columns>
               </asp:GridView>               
            </div>
        </div>
    </div>
</asp:Content>
