<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" CodeBehind="PlanIndexPrintOld.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexPrint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script type="text/javascript" language="javascript">
    function toggleDiv(divid) {

        //document.getElementById('MainHeading').style.display = 'none';


        document.getElementById('ControlMeasures').style.display = 'none';
        document.getElementById('Process0').style.display = 'none';
        document.getElementById('Process1').style.display = 'none';
        document.getElementById('Process2').style.display = 'none';
        document.getElementById('Process3').style.display = 'none';
        document.getElementById('MenuItems').style.display = 'none';
        document.getElementById('DataProcess0').style.display = 'none';
        document.getElementById('DataProcess1').style.display = 'none';
        document.getElementById('DataProcess2').style.display = 'none';
        document.getElementById('DataProcess3').style.display = 'none';

        if (divid == 'ControlMeasures') {
            document.getElementById('ControlMeasures').style.display = 'block';
        }
        if (divid == 'PlanOverview') {
            document.getElementById('PlanOverview').style.display = 'block';
        }
        document.getElementById(divid).style.display = 'block';

        //    if(document.getElementById(divid).style.display == 'none'){
        //      document.getElementById(divid).style.display = 'block';
        //    }else{
        //      document.getElementById(divid).style.display = 'none';
        //    }
    }
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>   
<div class="bdy_contents">
    <div class="grey_bg_dis">
    <div class="red_heading">
   { PLAN INDEX PAGE }
    </div>
    </div>
    <div class="log_plan_view">
    <table cellspacing="0" cellpadding="0" border="0" class="table_form_view" >
        <tr><td>&nbsp;</td></tr>
        <tr>
        <td class="red_heading">
	       { REFERENCE DOCUMENTS }
	   </td></tr>
	        <tr>
	            <td valign="top" colspan="2">&nbsp;</td>
		    </tr>
			<tr >
				<td style="padding-right: 35px" valign="top" width="50%" colspan="2">               
                     <div align="left">
                <div class="PlanIndexLabel" id="pnlSection1" runat="server">  		            
                    <div class="plan_heading" runat="server" id="dvPlanCategory">Table of Contents, Facility Overview</div>    
                    <a href='PlanIndexPrintDetail.aspx?CategoryID=<%= KitchenPlanId1 %>' target="_blank">PRINT SECTION</a>                                                       
                    <asp:Repeater ID="rptSectionOne" runat="server" DataSourceID="ObjectDataSource1" onitemdatabound="rptSectionOne_ItemDataBound"  >                                                          
                   <ItemTemplate>
                         <asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                         <li>
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                        &nbsp;<a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" >PRINT</a>
                        </li>                                                                                    
                    </ItemTemplate>                                               
                </asp:Repeater>
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
               </div> 
               <!-- VENDORS -->
               <div class="PlanIndexLabel" id="pnlSection2" runat="server">
               <div class="plan_heading" runat="server" id="Div1">All Vendor & Customer Identification, Facility & Inventory Review</div>
               <a href='PlanIndexPrintVendor.aspx' target="_blank">PRINT SECTION</a> 
               <li>Food Stuff   <a href='PlanIndexPrintVendor.aspx' target="_blank">PRINT</a>  </li>
               </div>
               <!-- PROCESSES -->
               <div class="PlanIndexLabel" id="pnlSection3" runat="server">
               <div class="plan_heading" runat="server" id="Div2">HACCP Process Tables</div>
               <a href='PlanIndexPrintProcess.aspx' target="_blank">PRINT SECTION</a> 
                <asp:Repeater ID="rptProcess" runat="server"  DataSourceID="SqlDataSource2" onitemdatabound="rptProcess_ItemDataBound" >             
                    <ItemTemplate>
                    <li><asp:Label ID="lblProcess" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label>  <a href='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId")  %>' target="_blank" class="BlueHeading1">PRINT</a> </li>
                    <table style="margin:10px 0px 10px 10px;"><tr><td>Process Flow Chart </td><td>&nbsp;</td><td> - <a href='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=1" %>' target="_blank" class="BlueHeading1">PRINT</a></td></tr>
                        <tr><td>FSIS TABLES -</td><td> <asp:CheckBox ID="chkFsActive" runat="server" Text= '<%# Eval("ProcessId") %>' CssClass="HiddenCheckBoxText" oncheckedchanged="chkFsActive_CheckedChanged" Checked='<%# Eval("FsActive").ToString() == "1"? true:false %>' AutoPostBack="true" /></td>
                        <td><asp:HyperLink ID="hlFsIs" runat="server" NavigateUrl='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=2" %>' target="_blank" CssClass="BlueHeading1" Text="PRINT"></asp:HyperLink></td></tr>
                        <tr><td>MENU HACCP TABLES -</td><td> <asp:CheckBox ID="chkHaccpActive" runat="server" Text= '<%# Eval("ProcessId") %>' CssClass="HiddenCheckBoxText" oncheckedchanged="chkHaccpActive_CheckedChanged" Checked='<%# Eval("HAccpActive").ToString() == "1"? true:false %>' AutoPostBack="true" /> </td>
                        <td><asp:HyperLink ID="hlHaccp" runat="server" NavigateUrl='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId") + "&SectionId=3" %>' target="_blank" CssClass="BlueHeading1" Text="PRINT"></asp:HyperLink></td></tr>
                    </table>                   
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetProcessesByKitchenMenuId" SelectCommandType="StoredProcedure" >
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
               </asp:SqlDataSource> 
               </div>
               <!-- FACILITY SUB PLANS -->
               <div class="PlanIndexLabel" id="pnlSection4" runat="server">  		            
                    <div class="plan_heading" runat="server" id="Div3">Facility Sub Plans</div>
                     <a href='PlanIndexPrintDetail.aspx?CategoryID=<%= KitchenPlanId2 %>' target="_blank">PRINT SECTION</a>                                          
                    <asp:Repeater ID="rptSectionTwo" runat="server" DataSourceID="ObjectDataSource2" onitemdatabound="rptSectionTwo_ItemDataBound" > 
                    <ItemTemplate>
                            <asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                            <li>
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                        &nbsp;<a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" >PRINT</a>
                        </li>                                                                                    
                    </ItemTemplate>                                                
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlanByCategorySortId" 
                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                    <SelectParameters>   
                         <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                            SessionField="KitchenId" Type="Int32" />       
                        <asp:Parameter DefaultValue="2" Name="nSortId" Type="Int32" />                       
                         <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                    </SelectParameters>
                 </asp:ObjectDataSource>
               </div> 

                                          
            </div>
                </td>
            </tr>
        </table>   
    </div>          
    <div class="log_plan_right">
       <div id="MainHeading" class="red_heading" style="margin-top:10px;">
	       { FEATURED  IN HACCP PLAN DOCUMENTS }
	    </div>
	    <div id="DailyTask" style="width:450px; display:block; margin-top:15px;" runat="server">
            <!-- PATHOGENS -->								    
			 <div class="PlanIndexLabel" id="pnlSection5" runat="server">  		            
                <div class="plan_heading" runat="server" id="Div4">Pathogen Sub Plans</div>    
                <a href='PlanIndexPrintDetail.aspx?CategoryID=<%= KitchenPlanId3 %>' target="_blank">PRINT SECTION</a>                                                       
                <asp:Repeater ID="rptSectionThree" runat="server" DataSourceID="ObjectDataSource3" onitemdatabound="rptSectionThree_ItemDataBound"  >                                                          
                <ItemTemplate>
                        <asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                        <li>
                    <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                    &nbsp;<a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" >PRINT</a>
                    </li>                                                                                    
                </ItemTemplate>                                               
            </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlanByCategorySortId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                <SelectParameters>   
                        <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />       
                    <asp:Parameter DefaultValue="3" Name="nSortId" Type="Int32" />                       
                        <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>
            </div>   
            <!-- LOGS and CORRECTIVE ACTIONS -->
            <div class="PlanIndexLabel" id="pnlSection6" runat="server">
            <div class="plan_heading" runat="server" id="Div7">Logs & Check Lists, Corrective Actions</div>            
            <a href='PlanIndexPrintVendor.aspx' target="_blank">PRINT SECTION</a> 
                <asp:Repeater ID="rptDailyLogs" runat="server" DataSourceID="ObjectDataSource5">
                    <ItemTemplate>
                        <li><%# Eval("TableName")  %>  <a href='PlanIndexPrintLogs.aspx?Log= <%# Eval("TableName")  %>'  target="_blank">PRINT LOGS</a>  </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
                        PropertyName="Text" Type="DateTime" />
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
             <asp:Repeater ID="rptChecklist" runat="server" DataSourceID="odsChecklist">
                    <ItemTemplate>
                        <li><%# Eval("Name")  %>  <a href='ChecklistPrint.aspx?SectionId= <%# Eval("CheckListSectionId")  %>'  target="_blank">PRINT CHECKLISTS</a>  </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                    <SelectParameters>                       
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>               
               
            </div>  
            <!-- SOPs -->
            <div class="PlanIndexLabel">
            <div class="plan_heading" id="pnlSection7" runat="server">Procedures and Mix/Recipes</div>            
            <a href='PlanIndexPrintSop.aspx' target="_blank">PRINT SECTION</a> 
               <li>SOP's, SSOP's, CGMP's, GAPs Review  <a href='PlanIndexPrintSop.aspx' target="_blank">PRINT</a>  </li>
               <li id="pnlSectionRecipe" runat="server">Mix / Recipe Review <a href='HaccpPlan5.aspx' target="_blank">PRINT</a>  </li>
            </div>                
            <!-- POLICIES AND ACTIONS -->
            <div class="PlanIndexLabel" id="pnlSection8" runat="server">  		            
                    <div class="plan_heading" runat="server" id="Div5">POLICIES & ACTIONS (you can turn on off documents)</div>    
                    <a href='PlanIndexPrintDetail.aspx?CategoryID=<%= KitchenPlanId4 %>' target="_blank">PRINT SECTION</a>                                                       
                    <asp:Repeater ID="rptSectionFour" runat="server" DataSourceID="ObjectDataSource4" onitemdatabound="rptSectionFour_ItemDataBound"  >                                                          
                   <ItemTemplate>
                         <asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                         <li>
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                        &nbsp;<a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" >PRINT</a>
                        </li>                                                                                    
                    </ItemTemplate>                                               
                </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlanByCategorySortId" 
                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                    <SelectParameters>   
                         <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                            SessionField="KitchenId" Type="Int32" />       
                        <asp:Parameter DefaultValue="4" Name="nSortId" Type="Int32" />                       
                         <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                    </SelectParameters>
                 </asp:ObjectDataSource>
               </div>                 
            <!-- PROCEDURAL STEPS -->
            <div class="PlanIndexLabel" id="pnlSection9" runat="server">  		            
                    <div class="plan_heading" runat="server" id="Div6">BASIC PROCEDURAL STEPS (you can turn on/off documents)</div>    
                    <a href='PlanIndexPrintDetail.aspx?CategoryID=<%= KitchenPlanId5 %>' target="_blank">PRINT SECTION</a>                                                       
                    <asp:Repeater ID="rptSectionFive" runat="server" DataSourceID="ObjectDataSource6" onitemdatabound="rptSectionFive_ItemDataBound"  >                                                          
                   <ItemTemplate>
                         <asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                         <li>
                        <asp:Label ID="lkbKitchenPlan" CommandName="View"  Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:Label>
                        &nbsp;<a href='<%# "PlanIndexPrintDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' target="_blank" >PRINT</a>
                        </li>                                                                                    
                    </ItemTemplate>                                               
                </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetPlanByCategorySortId" 
                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                    <SelectParameters>   
                         <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                            SessionField="KitchenId" Type="Int32" />       
                        <asp:Parameter DefaultValue="5" Name="nSortId" Type="Int32" />                       
                         <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                    </SelectParameters>
                 </asp:ObjectDataSource>
               </div>                                                        
                
                                                               
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
		     <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>						
      </div>                         
</div>
</div>
</asp:Content>
