<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/ControlPanel/Location/LocationMaster.master" Inherits="ControlPanel_Location_test" Title="HACCP Builder Control Panel" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/ContactDetailKitchen.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
   
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">MAIN CONTROL PANEL               
            </h1>
        </div>
    </div>
    <div class="row">

            <div class="col-lg-8 col-md-8 portfolio-item">
                <%-- <Contact:Detail ID="cd" runat="server" />--%>
            </div>

            <div class="col-lg-4 col-md-4 portfolio-item">
                <asp:DropDownList ID="ddlMenuItem" runat="server" DataSourceID="sqlDSMenu" CssClass="dropdown"
        DataTextField="Name" DataValueField="MenuItemID" AppendDataBoundItems="true" 
               
        AutoPostBack="True" onselectedindexchanged="ddlMenuItem_SelectedIndexChanged">
        <asp:ListItem Text=" -- SELECT MENU ITEM -- " Value="" />       
        </asp:DropDownList > 
            </div>

        </div>
    <div class="clear tenpx"></div>
    <div class="row">
        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12  portfolio-item pull-right">
         <asp:Repeater ID="rptReports" runat="server" DataSourceID="ObjectDataSource1"   onitemdatabound="rptReports_ItemDataBound">
            <HeaderTemplate>
                <table class="table table-striped table-hover">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                  <td ><asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'></asp:HyperLink>
                  </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
       <asp:Repeater ID="rptWeekly" runat="server"   onitemdatabound="rptWeekly_ItemDataBound" DataSourceID="ObjectDataSource2">        
        <ItemTemplate>
            <tr>
              <td ><asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'></asp:HyperLink>
              </td>              
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
      </asp:Repeater>
       <asp:Repeater ID="rptChecklist" runat="server" DataSourceID="odsChecklist" >
        <HeaderTemplate>
            <table class="table table-striped table-hover">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
              <td > <asp:HyperLink ID="hlEditQuestion" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' NavigateUrl='<%# "~/ControlPanel/Location/ChecklistQuestion.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink></td>
              <td > <asp:HyperLink ID="HyperLink3" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Location/ChecklistsHistory.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString()   %>'></asp:HyperLink></td>
            </tr>
        </ItemTemplate>        
      </asp:Repeater>
      <asp:Repeater ID="rptOther" runat="server" DataSourceID="ObjectDataSource3" OnItemDataBound="rptOther_ItemDataBound">        
        <ItemTemplate>
            <tr>
              <td ><asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'></asp:HyperLink></td>
              <td ></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
      </asp:Repeater>
               <table class="table table-striped table-hover">               
                   <tr><th>
                     CORRECTIVE ACTIONS</th>
                   </tr>
              
               <tr>
                <td>
                    <asp:HyperLink ID="hlCorrectivePolicy" runat="server" Text="HACCP Corrective Actions Policy"
                        NavigateUrl="~/StaticContent/Files/haccp builder corrective actions policy.pdf"
                        Target="_blank"></asp:HyperLink>
                </td></tr>
                <tr><td><asp:HyperLink ID="hlCorrectiveAction" runat="server" Text="HACCP Corrective Actions"
                        NavigateUrl="~/StaticContent/Files/haccp builder haccp corrective actions.pdf"
                        Target="_blank"></asp:HyperLink></td></tr>
                </table>
                <table class="table table-striped table-hover">
                <tbody>
                <tr><th>
                     MANAGERS CHECKLIST</th>
                </tr>               
                <tr><td><asp:HyperLink ID="HyperLink1" runat="server" Text="HACCP Review Policy" NavigateUrl="~/StaticContent/Files/haccp builder haccp review policy.pdf"
                        Target="_blank"></asp:HyperLink></td></tr>
                <tr><td><asp:HyperLink ID="HyperLink2" runat="server" Text="HACCP Monitoring Policy" NavigateUrl="~/StaticContent/Files/haccp builder monitoring policy.pdf"
                        Target="_blank"></asp:HyperLink></td></tr>
                </tbody>
               </table>
               
            </div>
       
        
        <div class="col-lg-8 col-md-8 portfolio-item pull-left">
            
            <asp:Repeater ID="rptSop" runat="server" >
                   <HeaderTemplate>
                   <table class="table table-striped table-hover"><tbody><tr><th>Standard Operating Procedures - SOP Detailed Index:</th></tr>
                   </HeaderTemplate>
                   <ItemTemplate> 
                   <tr>                
                    <td>
                        <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                           NavigateUrl='<%# "~/ControlPanel/Location/ViewSOP.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "KitchenSOPId") %>'
                            runat="server" Target="_blank"></asp:HyperLink>
                    </td>
                    </tr> 
                   </ItemTemplate>
                   <FooterTemplate>
                    </tbody></table>
                   </FooterTemplate>
             </asp:Repeater>
             <asp:Repeater ID="rptCtpat" runat="server">
                   <HeaderTemplate>
                   <table class="table table-striped table-hover"><tbody><tr><th></th></tr>
                   </HeaderTemplate>
                   <ItemTemplate>                  
                   <tr>                
                    <td>
                        <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                           NavigateUrl='<%# "~/ControlPanel/Location/ViewCtpat.aspx?CtpatId=" + DataBinder.Eval(Container.DataItem, "KitchenCtpatId") %>'
                            runat="server" Target="_blank"></asp:HyperLink>
                      </td>
                    </tr> 
                   </ItemTemplate>
                   <FooterTemplate>
                     </tbody></table>
                   </FooterTemplate>
             </asp:Repeater>
         </div> 
            
            <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
            <%-- <asp:CommandField HeaderText="Corrective Action" SelectText="" 
                        ShowSelectButton="True" />--%>
       
    </div>
    <asp:SqlDataSource ID="sqlDSMenu" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetMenuItemsNewDistinctByKitchenId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:SessionParameter DefaultValue="1" Name="KitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
            SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>  
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDailyReportsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
                </SelectParameters>
     </asp:ObjectDataSource>
     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetWeeklyReportsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
                </SelectParameters>
      </asp:ObjectDataSource>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
                    SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure">
      </asp:SqlDataSource>
       <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetOtherReportsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                    PropertyName="Text" Type="DateTime" />
                <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetchecklistSectionsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
            <SelectParameters>                       
                <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="sqlDSSOP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetSOPsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource> 
        <asp:SqlDataSource ID="sqlDsCtpat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetCtpatsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource> 
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetchecklistSectionsByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
            <SelectParameters>                       
                <asp:SessionParameter Name="nMobileId" SessionField="MobileId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>
