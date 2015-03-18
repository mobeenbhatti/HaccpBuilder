<%@ Page Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_KitchenAlerts" Title="HACCP Builder | Kitchen Alerts" Codebehind="KitchenAlerts.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="bdy_contents">
<div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{  <asp:Label ID="lblKitchen" runat="server" Text=""></asp:Label> }</td>
                            </tr>
                            <tr>
                              <td><uc1:districtaddrssnew ID="DistrictAddrssNew1" runat="server" /> </td>
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
                              <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/District/LayoutTest.aspx"></asp:HyperLink></td>
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
    <div style="clear:both;"></div>
    <div class="table_view">
             <asp:GridView ID="grdDailyReports" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" onrowdatabound="grdDailyReports_RowDataBound" OnRowCommand="grdDailyReports_RowCommand" SkinID="gridviewSkin">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Daily Reports">
	                        <ItemTemplate>	                            
	                            <asp:Label ID="hlTableName" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>' runat="server"></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%--<asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag1")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate2" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag2")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate> 
	                            <asp:HyperLink ID="hlDat3" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag3")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate4" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag4")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate5" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag5")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Calendar">
                             <ItemTemplate>
                                 <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" 
                                     CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                     ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                             <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>--%>
	                    <asp:TemplateField HeaderText="Alerts">
	                        <ItemTemplate>
	                            <%--<asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl='<%# "~/ControlPanel/Kitchen/AlertsDates.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>--%>
	                            <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl="">
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                   <%-- <asp:TemplateField HeaderText="Report History">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/KitchenReport.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" HorizontalAlign="Center" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Actions">
	                        <ItemTemplate>                      
	                        <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl="">
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="View">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlPdf" runat="server" Text="PDF" NavigateUrl='<%# "~/ControlPanel/Kitchen/LogPdf.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName") %>' Target="_blank">
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>           
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
            <asp:QueryStringParameter Name="nKitchenId" QueryStringField="KitchenId" 
                Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    </div>
     <div class="table_view">
         <asp:GridView ID="grdWeeklyReports" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                    DataSourceID="ObjectDataSource2" onrowdatabound="grdWeeklyReports_RowDataBound"                     
                    onrowcommand="grdWeeklyReports_RowCommand">
                        <Columns>
	                        <asp:TemplateField HeaderText="Weekly Reports">
	                    <ItemTemplate>
	                        <%--<asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                        </asp:HyperLink>--%>
	                        <asp:Label ID="hlTableName" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>' runat="server"></asp:Label>
	                    </ItemTemplate>
	                    <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                        <%--<asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag1")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate2" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag2")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate> 
	                            <asp:HyperLink ID="hlDat3" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag3")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate4" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag4")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate5" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag5")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="Calendar">
                         <ItemTemplate>
                             <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" 
                                 CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                 ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                         </ItemTemplate>
                         <ItemStyle Width="100px" />
	                     <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField>--%>
	                        <asp:TemplateField HeaderText="Alerts">
	                    <ItemTemplate>	                       
	                        <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl="">
	                            </asp:HyperLink>
	                    </ItemTemplate>
	                    <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField>
	                <%-- <asp:TemplateField HeaderText="Report History">
	                    <ItemTemplate>
	                    <asp:HyperLink ID="hlView" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "N/A":"View"%>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "": "~/ControlPanel/Kitchen/KitchenReport.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                    </asp:HyperLink>
	                    </ItemTemplate>
	                     <ItemStyle Width="100px" HorizontalAlign="Center" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField>
	                <asp:TemplateField HeaderText="Actions">
	                    <ItemTemplate>	                    
	                     <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl="">
	                        </asp:HyperLink>
	                    </ItemTemplate>
	                    <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField>
	                <asp:TemplateField HeaderText="View">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlPdf" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "N/A":"PDF" %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "": "~/ControlPanel/Kitchen/LogPdf.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName") %>' Target="_blank">
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	               </asp:TemplateField>--%>        	        
	                    </Columns>
                        <AlternatingRowStyle CssClass="AlterRowStyle" />
                    </asp:GridView>
     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
            <asp:QueryStringParameter Name="nKitchenId" QueryStringField="KitchenId" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </div>
     <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</div>
                   
       
</asp:Content>

