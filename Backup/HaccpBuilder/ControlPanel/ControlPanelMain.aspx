<%@ Page AutoEventWireup="true" Inherits="ControlPanel_Default"
	Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" Codebehind="ControlPanelMain.aspx.cs" %>

<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc2" %>
<%@ Register src="../Controls/ContactDetail.ascx" tagname="ContactDetail" tagprefix="uc2" %>


<%@ Register src="../Controls/Advertisement.ascx" tagname="Advertisement" tagprefix="uc1" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>


<asp:Content ID="conMainContent" runat="Server" ContentPlaceHolderID="cphMainContent">    
        <table width="100%">          
            <tr>
                <td>
                </td>
	        </tr>	 
	                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
        </asp:ObjectDataSource>
            <tr>
                <td>
                    <asp:GridView ID="grdDailyReports" runat="server" AutoGenerateColumns="false" 
                    DataSourceID="ObjectDataSource1" onrowdatabound="grdWeeklyReports_RowDataBound" 
                    CssClass="TempGridView"  AlternatingRowStyle-CssClass="AlterRowStyle" 
                    onrowcommand="grdDailyReports_RowCommand">
                        <Columns>
	                    <asp:TemplateField HeaderText="Daily Reports">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag1")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate2" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag2")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate> 
	                            <asp:HyperLink ID="hlDat3" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag3")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate4" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag4")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate5" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
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
                                     ImageUrl="~/images/Calendar_scheduleHS.png" />
                             </ItemTemplate>
                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Alerts">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl=''>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Report History">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl=''>
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Actions">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl=''>
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
            	        
	                </Columns>
                    <AlternatingRowStyle CssClass="AlterRowStyle" />
                    </asp:GridView>
                </td>
            </tr>   
            <tr>
                <td> 
                    <asp:GridView ID="grdWeeklyReports" runat="server" AutoGenerateColumns="false" 
                    DataSourceID="ObjectDataSource2" onrowdatabound="grdWeeklyReports_RowDataBound" 
                    CssClass="TempGridView"  AlternatingRowStyle-CssClass="AlterRowStyle" 
                    onrowcommand="grdWeeklyReports_RowCommand">
                        <Columns>
	                        <asp:TemplateField HeaderText="Weekly Reports">
	                    <ItemTemplate>
	                        <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                        </asp:HyperLink>
	                    </ItemTemplate>
	                    <ItemStyle Width="200px" />
	                    </asp:TemplateField >
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag1")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate2" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag2")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate> 
	                            <asp:HyperLink ID="hlDat3" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag3")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate4" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag4")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate5" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
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
                                 ImageUrl="~/images/Calendar_scheduleHS.png" />
                         </ItemTemplate>
                </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Alerts">
	                    <ItemTemplate>
	                        <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl=''>
	                        </asp:HyperLink>
	                    </ItemTemplate>
	                </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Report History">
	                    <ItemTemplate>
	                    <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl=''>
	                    </asp:HyperLink>
	                    </ItemTemplate>
	                </asp:TemplateField>
	                        <asp:TemplateField HeaderText="Actions">
	                    <ItemTemplate>
	                    <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl=''>
	                    </asp:HyperLink>
	                    </ItemTemplate>
	                </asp:TemplateField>        	        
	                    </Columns>
                        <AlternatingRowStyle CssClass="AlterRowStyle" />
                    </asp:GridView>                    
                </td>        
            </tr>    
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
	       
	        <tr>
	            <td>	
	                <asp:GridView ID="grdCorrectiveAction" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:CommandField HeaderText="Corrective Action" SelectText="" 
                        ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
            <tr>
        <td>   
            <asp:GridView ID="grdMangerList" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:CommandField HeaderText="Managers Check List" SelectText="" 
                        ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </td>
     </tr>
            <tr>
        <td>    
            <input id="hiddenCtrlInputDate" type="hidden" runat="server" />
            <input id="hiddenCtrlInputDateXPos" type="hidden" runat="server"  />
             <input id="hiddenCtrlInputDateYPos" type="hidden" runat="server" />
        </td>
    </tr>
            <tr>
        <td>        
            <asp:GridView ID="grdTraining" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:CommandField HeaderText="Training" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Log 1" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Log 2" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Log 3" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Log 4" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Log 5" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Training" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Status" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Training" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Status" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Training" SelectText="" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="Status" SelectText="" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
         </td>
     </tr>
            <tr>
        <td>
	        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>   
        </td>
    </tr>
        </table>                 
  
</asp:Content>
<asp:Content ID="conTopLeft" runat="Server" ContentPlaceHolderID="cphTopLeft">
        <table width="60%">
    <tr>
    <td width="30%">
        <uc2:ContactDetail ID="ContactDetail1" runat="server" />
     </td>
     <td width="30%">
     </td>
     <td width="30%">
     </td>
    </tr>
     <tr>
    <td >
        <asp:Button ID="btnEditPlan" Text="Edit HAACP Plan" runat="server" />
    </td>
    <td >
         <asp:Button ID="btnInventoryItems" Text="Inventory Items" runat="server" />
    </td>
     <td>
         <asp:Button ID="btnViewSop" Text="View SOP's" runat="server" />
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnMenuItems" Text="Menu Items" runat="server" />
    </td>
    <td>
        <asp:Button ID="btnActiveAlert" Text="Active Alerts" runat="server" />
    </td>
    </tr>
    </table>
</asp:Content>
<asp:Content ID="conTopRight" runat="Server" ContentPlaceHolderID="cphTopRight">
        <table width="40%"  >
    <tr>
        <td>        
            <uc1:Advertisement ID="Advertisement1" runat="server" />        
        </td>
    </tr>   
    </table>     

</asp:Content>
