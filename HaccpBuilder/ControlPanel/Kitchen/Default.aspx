<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" EnableViewState="true" Inherits="ControlPanel_test" Title="HACCP Builder Control Panel" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
    <div class="bdy_contents">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                
            <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />
            <cc1:ModalPopupExtender ID="ModalPopupTimeZone" runat="server" TargetControlID="btnShowModalPopup" PopupDragHandleControlID="panelDragHandle1" BackgroundCssClass="overlay"
                PopupControlID="divPopUp1">
            </cc1:ModalPopupExtender>
           <div class="popUpStyleNew" id="divPopUp1" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <table width="100%">
                    <tr>
                        <td class="formtext" style="height: 23px; width: 150px;" align="left">
                            Select Timezone:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				                        DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				                        CssClass="DropDown" ondatabound="ddlTimeZone_DataBound" >
				                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>                            
                        </td>
                        <td>
                            <asp:Button ID="cmdUpdateTimeZone" runat="server" Text="Update" 
                                onclick="cmdUpdateTimeZone_Click"  />
                            <asp:Button ID="Button3" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
           </div>  
           <div class="popUpStyleNew" id="divPopUpChecklist" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panel1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <table width="100%">
                    <tr>
                        <td class="formtext" style="height: 23px; width: 150px;" align="left">
                            Select Date:
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dqlDsTimeZone"
				                        DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				                        CssClass="DropDown" ondatabound="ddlTimeZone_DataBound" >
				                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>                            
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Update" 
                                onclick="cmdUpdateTimeZone_Click"  />
                            <asp:Button ID="Button2" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
           </div>       
        </ContentTemplate>
        </asp:UpdatePanel>
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
                                                { MAIN CONTROL PANEL }
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                          <Contact:Detail ID="cd" runat="server" />
                                            </td>
                                        </tr>
                                       <%-- <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>--%>
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
                                            <td width="180">
                                                <asp:HyperLink ImageUrl="~/images/District Images/ButtonUserGuide.png" Width="180"
                                                    Height="30" NavigateUrl="~/StaticContent/Files/Free Trial Instruction Guide.pdf"
                                                    runat="server" ID="hlUserGuide" Target="_blank"></asp:HyperLink>
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>                                            
                                            <td width="180">
                                                <asp:HyperLink ImageUrl="~/images/Buttons/ButtonLocationEmployee.gif" Width="180"
                                                    Height="30" NavigateUrl="~/ControlPanel/Kitchen/LocationOperator.aspx" runat="server"
                                                    ID="hlLocationStaff"></asp:HyperLink>
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">                                               
                                                <asp:ImageButton ID="cmdTimeZone" runat="server" 
                                                    ImageUrl="~/images/buttons/ButtonTimeZone.png" 
                                                    onclick="cmdTimeZone_Click" />
                                                <%--<asp:HyperLink ImageUrl="~/images/buttons/ButtonTimeZone.gif" Width="180"
                                                    Height="30" NavigateUrl="~/ControlPanel/Kitchen/LocationOperator.aspx" runat="server"
                                                    ID="hlTimeZone"></asp:HyperLink>--%>
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
        <div class="buttons_bg" align="center">
            <asp:ImageButton ID="btnEditPlan" runat="server" Height="37" OnClick="btnEditPlan_Click"
                ImageUrl="~/images/buttons/ButtonEditPlan.png" />
            <asp:ImageButton ID="btnInventoryManager" Height="37" OnClick="btnInventoryManager_Click"
                runat="server" ImageUrl="~/images/buttons/ButtonInventory.png" />
           <%-- <asp:ImageButton ID="btnMenuManager" Height="37" OnClick="btnMenuManager_Click" runat="server"
                ImageUrl="~/images/buttons/ButtonMenu.png" /> --%>
            <asp:ImageButton ID="btnMenuManager" Height="37" Width="225" OnClick="btnMenuManager_Click" runat="server"
                ImageUrl="~/images/buttons/outputs.png" />            
           <%-- <asp:Button ID="btnMenuManager" CssClass="bt-pink" Text="Outputs/Menu Items" runat="server" OnClick="btnMenuManager_Click" />--%>
           
            <%--<asp:ImageButton ID="btnIngredient" Height="37" ImageUrl="~/images/buttons/ButtonIngredient.png"
                runat="server" OnClick="btnIngredient_Click" />--%>
            <asp:ImageButton ID="btnIngredient" Height="37" Width="225" ImageUrl="~/images/buttons/Inputs.png"
                runat="server" OnClick="btnIngredient_Click" />
            <asp:ImageButton ID="btnVendors" runat="server" Height="37" ImageUrl="~/images/buttons/ButtonVendor.png"
                runat="server" OnClick="btnVendors_Click" />
            <asp:ImageButton ID="btnViewSop" runat="server" Height="37" ImageUrl="~/images/buttons/ButtonSOP.png"
                OnClick="btnViewSop_Click" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
            SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>    
        <asp:SqlDataSource ID="dqlDsTimeZone" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspDS_GetTimeZones" SelectCommandType="StoredProcedure">       
            </asp:SqlDataSource>   
        <div class="table_view">
            <asp:GridView ID="grdDailyReports" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                OnRowDataBound="grdDailyReports_RowDataBound" OnRowCommand="grdDailyReports_RowCommand"
                SkinID="gridviewSkin">
                <Columns>
                    <asp:TemplateField HeaderText="Daily Reports">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlDate1" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
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
                            <asp:HyperLink ID="hlDate2" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
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
                            <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
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
                    <asp:TemplateField HeaderText="Report History">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/KitchenReportsNew.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <%--<asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl='<%# "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                        </asp:HyperLink>--%>
                            <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl="">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlPdf" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"?"View":"PDF" %>'
                                NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "~/ControlPanel/Kitchen/FoodSafetyChecklistPrint.aspx": "~/ControlPanel/Kitchen/LogPdf.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName") %>'
                                Target="_blank">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="table_view">
            <asp:GridView ID="grdWeeklyReports" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                DataSourceID="ObjectDataSource2" OnRowDataBound="grdWeeklyReports_RowDataBound"
                OnRowCommand="grdWeeklyReports_RowCommand">               
                <Columns>
                    <asp:TemplateField HeaderText="Weekly Reports">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             >
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlDate1" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
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
                            <asp:HyperLink ID="hlDate2" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
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
                            <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Alerts">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl="">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="40px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Report History">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/KitchenReportsNew.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
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
                            <asp:HyperLink ID="hlPdf" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"?"View":"PDF" %>'
                                NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Food Safety Check List"? "~/ControlPanel/Kitchen/FoodSafetyChecklistPrint.aspx": "~/ControlPanel/Kitchen/LogPdf.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName") %>'
                                Target="_blank">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle CssClass="AlterRowStyle" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div class="table_view">
                <asp:GridView ID="grdOtherReports" runat="server" AutoGenerateColumns="false" SkinID="gridviewSkin"
                    DataSourceID="ObjectDataSource3" OnRowDataBound="grdOtherReports_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Other Reports">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" NavigateUrl="~/ControlPanel/Kitchen/ValidationDates.aspx">
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="140px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Report History">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/KitchenReportsNew.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
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
                                <asp:HyperLink ID="hlPdf" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/ValidationPrint.aspx" %>'
                                    Target="_blank">
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetOtherReport" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                            PropertyName="Text" Type="DateTime" />
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
                    SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </div>
            <div class="table_view">
             <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false" SkinID="gridviewSkin"
                    DataSourceID="odsChecklist" onrowcommand="grdCheckList_RowCommand" 
                    onrowdatabound="grdCheckList_RowDataBound">
                    <Columns>                 
                        <asp:TemplateField HeaderText="Add Checklist Questions" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlSection" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestion.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="150px"></ItemStyle>
                        </asp:TemplateField>         
	                    <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEditQuestion" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistsHistory.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="140px"></ItemStyle>
                        </asp:TemplateField> 
                         <asp:TemplateField HeaderText="Report History">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Kitchen/KitchenReportsNew.aspx?task=ChecklistAddOn"   %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>                  
                        <asp:TemplateField ItemStyle-Width="50px" HeaderText="View"  HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
               </asp:GridView>
               <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                    <SelectParameters>                       
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
              </div>
           <%-- <div class="grey_bg_dis">
                <div class="red_heading">
                    CORRECTIVE ACTIONS
                </div>
                <div>
                    <asp:HyperLink ID="hlCorrectivePolicy" runat="server" Text="HACCP Corrective Actions Policy"
                        NavigateUrl="~/StaticContent/Files/haccp builder corrective actions policy.pdf"
                        Target="_blank"></asp:HyperLink>
                </div>
                <div>
                    <asp:HyperLink ID="hlCorrectiveAction" runat="server" Text="HACCP Corrective Actions"
                        NavigateUrl="~/StaticContent/Files/haccp builder haccp corrective actions.pdf"
                        Target="_blank"></asp:HyperLink>
                </div>
                <div class="red_heading">
                    MANAGERS CHECKLIST
                </div>
                <div>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text="HACCP Review Policy" NavigateUrl="~/StaticContent/Files/haccp builder haccp review policy.pdf"
                        Target="_blank"></asp:HyperLink>
                </div>
                <div>
                    <asp:HyperLink ID="HyperLink2" runat="server" Text="HACCP Monitoring Policy" NavigateUrl="~/StaticContent/Files/haccp builder monitoring policy.pdf"
                        Target="_blank"></asp:HyperLink>
                </div>
            </div>--%>
            <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
            <%-- <asp:CommandField HeaderText="Corrective Action" SelectText="" 
                        ShowSelectButton="True" />--%>
        </div>
    </div>
</asp:Content>
