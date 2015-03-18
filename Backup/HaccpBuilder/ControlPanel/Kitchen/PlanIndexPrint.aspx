<%@ Page Title="HACCP Builder | Haccp Plan" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="PlanIndexPrint.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexPrintNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>    $("#pnlPrintPlan").addClass('selected');</script>
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1> Haccp Plan</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
    <div class="ph-top"></div>
    <h2>FEATURED  IN HACCP PLAN DOCUMENTS</h2>
    <div class="table">
       <div id="pnlSection1" runat="server">
            <div class="box-header">
              <h4 class="left"><%= Category1 %></h4>
            </div>
             <asp:Repeater ID="rptSectionOne" runat="server" DataSourceID="ObjectDataSource1" onitemdatabound="rptSectionOne_ItemDataBound"  > 
                 <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
                <ItemTemplate>
                        <tr>
                        <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label></td>
                        <td class="right"><a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" class="button right" >PRINT</a></td>
                        </tr>                                                                                                  
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>                                               
            </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- VENDORS  -->
         <div id="pnlSection2" runat="server">
             <div class="box-header">
              <h4 class="left">All Vendor & Customer Identification, Facility & Inventory Review</h4>
            </div>
            <table class="zebra">
                        <tr>
                        <td>Food Stuff</td>
                        <td class="right">  <a href='PlanIndexPrintVendor.aspx' target="_blank" class="button">PRINT</a></td>
                        </tr>                                                                                                  
             </table>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- PROCESSES -->
        <div id="pnlSection3" runat="server">
             <div class="box-header">
              <h4 class="left">HACCP Process Tables</h4>
            </div>
            <asp:Repeater ID="rptProcess" runat="server"  DataSourceID="SqlDataSource2" onitemdatabound="rptProcess_ItemDataBound" > 
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                        <td rowspan="5" colspan="2"> <asp:Label ID="lblProcess" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></td>
                        <td>  
                            <tr>
                                <td colspan="3"><a href='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId")  %>' target="_blank" class="button">PRINT</a></td>
                            </tr>
                            <tr>
                                <td colspan="2">Process Flow Chart </td>
                                <td class="right"><a href='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=1" %>' target="_blank" class="button">PRINT</a></td>
                            </tr>
                            <tr>
                                <td>FSIS TABLES</td>
                                <td> <asp:CheckBox ID="chkFsActive" runat="server" Text= '<%# Eval("ProcessId") %>' CssClass="HiddenCheckBoxText" oncheckedchanged="chkFsActive_CheckedChanged" Checked='<%# Eval("FsActive").ToString() == "1"? true:false %>' AutoPostBack="true" /></td>
                                <td class="right"><asp:HyperLink ID="hlFsIs" runat="server" NavigateUrl='<%# "HaccpPlanReports.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=2" %>' target="_blank" CssClass="button" Text="PRINT"></asp:HyperLink></td>
                            </tr>
                            <tr>
                                <td>MENU HACCP TABLES -</td>
                                <td> <asp:CheckBox ID="chkHaccpActive" runat="server" Text= '<%# Eval("ProcessId") %>' CssClass="HiddenCheckBoxText" oncheckedchanged="chkHaccpActive_CheckedChanged" Checked='<%# Eval("HAccpActive").ToString() == "1"? true:false %>' AutoPostBack="true" /> </td>
                                <td class="right"><asp:HyperLink ID="hlHaccp" runat="server" NavigateUrl='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=3" %>' target="_blank" CssClass="button" Text="PRINT"></asp:HyperLink></td>
                            </tr>
                           
                        </td>
                    </tr>                                                                                                                                            
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- FACILITY SUB PLANS -->
        <div id="pnlSection4" runat="server">
             <div class="box-header">
             <h4 class="left"><%= Category2 %></h4>
              <%--<h4 class="left">Facility Sub Plans</h4>--%>
            </div>
            <asp:Repeater ID="rptSectionTwo" runat="server" DataSourceID="sqlDsFacilityPlan" onitemdatabound="rptSectionTwo_ItemDataBound" > 
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                    <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                    <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label></td>
                    <td class="right"><a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" class="button" >PRINT</a></td>                   
                    </tr>                                                                                                  
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
    </div>
    <div class="clear tenpx"></div>   
    <div class="table">
        <!-- Pathogen Sub Plans -->
        <div id="pnlSection5" runat="server">
                <div class="box-header">
                <h4 class="left"><%= Category3 %></h4>
                  <%--<h4 class="left">Pathogen Sub Plans</h4>--%>
                </div>
                <asp:Repeater ID="rptSectionThree" runat="server" DataSourceID="sqlDsPathogens" onitemdatabound="rptSectionThree_ItemDataBound"  >   
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                    <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                    <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label></td>
                    <td class="right"><a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" class="button" >PRINT</a></td>
                    </tr>                                                                                                  
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
                <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- Logs & Check Lists, Corrective Actions -->
        <div id="pnlSection6" runat="server">
            <div class="box-header">
              <h4 class="left">Logs & Check Lists, Corrective Actions</h4>
            </div>
            <asp:Repeater ID="rptDailyLogs" runat="server" DataSourceID="ObjectDataSource5">  
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                    <td><%# Eval("TableName")  %>  </td>
                    <td class="right"><a href='PlanIndexPrintLogs.aspx?Log= <%# Eval("TableName")  %>'  target="_blank" class="button">PRINT LOGS</a></td>
                    </tr>                                                                                                  
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
            <asp:Repeater ID="rptChecklist" runat="server" DataSourceID="odsChecklist"> 
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                    <td><%# Eval("Name")  %>  </td>
                    <td class="right"><a href='ChecklistPrint.aspx?SectionId= <%# Eval("CheckListSectionId")  %>'  target="_blank" class="button">PRINT CHECKLISTS</a></td>
                    </tr>                                                                                                  
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- SOPs -->
        <div id="pnlSection7" runat="server">
            <div class="box-header">
              <h4 class="left">SOP's, SSOP's, CGMP's, GAPs Review</h4>
            </div>
            <table class="zebra">  
            <tr>
            <td>SOP's, SSOP's, CGMP's, GAPs Review</td>
            <td class="right"><a href='PlanIndexPrintSop.aspx' target="_blank" class="button">PRINT</a></td>
            </tr> 
             <tr id="pnlSectionRecipe" runat="server">
            <td>Mix / Recipe Review</td>
            <td class="right"><a href='HaccpPlan5.aspx' target="_blank" class="button">PRINT</a></td>
            </tr>                                                                                                  
        </table>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
         <h2>REFERENCE DOCUMENTS</h2>
        <!-- POLICIES AND ACTIONS -->
        <div id="pnlSection8" runat="server">
            <div class="box-header">
            <h4 class="left"><%= Category4 %></h4>
              <%--<h4 class="left">POLICIES & ACTIONS (you can turn on off documents)</h4>--%>
            </div>
            <asp:Repeater ID="rptSectionFour" runat="server" DataSourceID="sqlDsPolicies" onitemdatabound="rptSectionFour_ItemDataBound"  > 
             <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
            <ItemTemplate>
                    <tr>
                    <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                    </td>
                    <td class="right"><a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" class="button" >PRINT</a></td>
                    </tr>                                                                                                  
            </ItemTemplate>
            <FooterTemplate></table></FooterTemplate>                                               
        </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
        <!-- PROCEDURAL STEPS -->
        <div id="pnlSection9" runat="server">
            <div class="box-header">
                <h4 class="left"><%= Category5 %></h4>
              <%--<h4 class="left">BASIC PROCEDURAL STEPS (you can turn on/off documents)</h4>--%>
            </div>
              <asp:Repeater ID="rptSectionFive" runat="server" DataSourceID="sqlDsProcedural" onitemdatabound="rptSectionFive_ItemDataBound"  >
                 <HeaderTemplate><table class="zebra"></HeaderTemplate>                                                         
                <ItemTemplate>
                        <tr>
                        <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                            <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                        </td>
                        <td class="right"><a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" class="button" >PRINT</a></td>
                        </tr>                                                                                                  
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>                                               
            </asp:Repeater>
            <div class="box-bottom"> </div>
        </div>
         <div class="clear tenpx"></div>
    </div>
</div>
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlanByCategorySortId" 
                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                    <SelectParameters>   
                         <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                            SessionField="KitchenId" Type="Int32" />       
                        <asp:Parameter DefaultValue="1" Name="nSortId" Type="Int32" />                       
                         <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                    </SelectParameters>
                 </asp:ObjectDataSource>
 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetProcessesByKitchenMenuId" SelectCommandType="StoredProcedure" >
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
               </asp:SqlDataSource> 
 <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
  <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                    <SelectParameters>                       
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
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
<asp:ObjectDataSource ID="odsProcess" runat="server" 
OldValuesParameterFormatString="original_{0}" SelectMethod="GetProcessesByKitchenId" 
TypeName="SchoolHaccp.BusinessLogic.ProcessGetProcess">
<SelectParameters>
    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource> 
<asp:SqlDataSource ID="sqlDsFacilityPlan" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
    SelectCommand="uspAdm_GetKitchenPlanActiveByCategorySortId" SelectCommandType="StoredProcedure">
        <SelectParameters>   
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId"  SessionField="KitchenId" Type="Int32" />       
        <asp:Parameter DefaultValue="2" Name="nSortOrder" Type="Int32" />                       
        <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>    	
<asp:SqlDataSource ID="sqlDsPathogens" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
    SelectCommand="uspAdm_GetKitchenPlanActiveByCategorySortId" SelectCommandType="StoredProcedure">
        <SelectParameters>   
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId"  SessionField="KitchenId" Type="Int32" />       
        <asp:Parameter DefaultValue="3" Name="nSortOrder" Type="Int32" />                       
        <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>   
<asp:SqlDataSource ID="sqlDsPolicies" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
    SelectCommand="uspAdm_GetKitchenPlanActiveByCategorySortId" SelectCommandType="StoredProcedure">
        <SelectParameters>   
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId"  SessionField="KitchenId" Type="Int32" />       
        <asp:Parameter DefaultValue="4" Name="nSortOrder" Type="Int32" />                       
        <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource> 
<asp:SqlDataSource ID="sqlDsProcedural" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
    SelectCommand="uspAdm_GetKitchenPlanActiveByCategorySortId" SelectCommandType="StoredProcedure">
        <SelectParameters>   
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId"  SessionField="KitchenId" Type="Int32" />       
        <asp:Parameter DefaultValue="5" Name="nSortOrder" Type="Int32" />                       
        <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>    				 	
<asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>	
</asp:Content>
