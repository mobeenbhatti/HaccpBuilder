<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_AlertsDates" Title="HACCP Builder | Alert Dates" Codebehind="AlertsDates.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="bdy_contents">
    <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ ALERT DATES }</td>
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
                              <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx"></asp:HyperLink></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="300" align="left"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
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
     <div class="grey_bg_form">
    <div class="red_heading"> <asp:Label ID="lblLog" runat="server"></asp:Label></div>
    </div>
    <div class="table_view">
            <asp:Repeater ID="rptAlertDates" runat="server" 
                DataSourceID="ObjectDataSource1"  
                OnItemCommand="rptAlertDates_OnItemCommand" onitemdatabound="rptAlertDates_ItemDataBound" 
                >
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;">
            <td width="920px" align="center" ><b>ALERT DATE</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
        <td align="center"><asp:LinkButton ID="lkbBreakFast" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")%>' CommandName="BreakFast" /></td>
     
     </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>             
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlertDates" 
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
    <div>
        <div class="MainHeading">
              <asp:Label ID="lblMain" Text="ALERT DATES" runat="server"></asp:Label>
        </div>
        <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>                
            </div>
        <div class="ContentRight">                
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
       <div class="Clearer"></div>
    </div>
        <div class="MainHeading">
             
        </div>
        
        <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
</asp:Content>

