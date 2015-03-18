<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_CorrectiveActions" Title="HACCP Builder | Corrective Actions" Codebehind="CorrectiveActions.aspx.cs" %>
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
                              <td class="red_heading">{ CORRECTIVE ACTIONS }</td>
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
                              <td width="180"><asp:HyperLink ImageUrl="~/images/District Images/ButtonUserGuide.png" Width="180" Height="30"
                          NavigateUrl="~/StaticContent/Files/Free Trial Instruction Guide.pdf" runat="server" 
                          ID="hlUserGuide"></asp:HyperLink></td>
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
    <div class="buttons_bg" align="center"></div>
    <div class="grey_bg_form">
    <div class="red_heading"><asp:Label ID="lblLog" runat="server"></asp:Label></div>
    </div>
    <div class="table_view">
     <asp:Repeater ID="rptCorrectiveActions" runat="server" 
                DataSourceID="ObjectDataSource1" 
            onitemdatabound="rptCorrectiveActions_ItemDataBound">
 <HeaderTemplate>
    <table> 
        <tr class="table_header">
            <td width="200px"  ><b>Entry Date</b></td>            
            <td width="500px"  ><b>Corrective Action</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
        <td >
        <asp:HiddenField ID="hfHistoryId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "LogId")%>' />
        <asp:HyperLink ID="hlEntryDate" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") + "&HistoryId=" + DataBinder.Eval(Container.DataItem, "LogId")   %>'
	        Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:HyperLink>
        </td>        
        <td ><asp:Label ID="lblCorrectiveAction" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction")%>' runat="server"></asp:Label>
        </td>
     
     </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>             
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCorrectiveActions" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblLog" DefaultValue="''" 
                Name="strTableName" PropertyName="Text" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </div>   
</div>
</asp:Content>

