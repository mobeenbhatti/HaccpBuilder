<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_PlanIndexNew" Title="HACCP Builder | Your HACCP Plan" Codebehind="PlanIndexNewOld.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script type="text/javascript" language="javascript">
  function toggleDiv(divid){

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp1"
                BackgroundCssClass="popUpStyle"
                PopupDragHandleControlID="panelDragHandle1"
                DropShadow="true"
                />
            <br />
             
             <div class="popUpStyle" id="divPopUp1" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:Repeater ID="rptShowProcess" runat="server" >
                   <HeaderTemplate>
                   <table>
                   </HeaderTemplate>
                   <ItemTemplate>
                   <tr>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProcessShortName") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>'></asp:Label>
                   </td>
                   </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                    </table>
                   </FooterTemplate>
               </asp:Repeater> 
               <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%" >    
                       <HeaderTemplate>
                        <table> 
                        <tr > 
                            <td>                    
                            </td>            
                            <td></td>             
                        </tr> 
                       </HeaderTemplate>     
                            <Fields>
                                 <asp:TemplateField >
                                  <ItemTemplate>
                   <tr>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>      
                    <tr><td>
                    <%# Eval("ProcessText") %>
                   </td></tr> 
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterTemplate>
                            </table>
                            </FooterTemplate>
                        </asp:DetailsView>
                                     
                <asp:Button ID="btnClose" runat="server" Text="Close" />
               <br />
            </div>
             <div class="popUpStyle1" id="divPopUp" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:Repeater ID="rptMenuProcess" runat="server"  onitemdatabound="rptMenuProcess_ItemDataBound">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <th width="100px" >Product/Menu Item Id</th>
                                        <th width ="250px" align="left" >Name</th>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td ><asp:Label ID="lblId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MenuItemId")%>'></asp:Label></td>
                                    <td ><asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater> 
                <br />                       
                <asp:Button ID="Button1" runat="server" Text="Close" />
               <br />
            </div>
             <%-- Plan OverView --%>	
            <div id="dvPlanOverView" class="popUpStyle" style="display:none;" runat="server" >
             <asp:Panel runat="Server" ID="panelPlanOverView" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
            <table>
                <tr>
		            <td>
		         <%--<div class="red_heading" visible="false">Daily Tasks</div>	--%>	
		        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetKitchenDetailsByKitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
		        </tr>
		        <tr>
		            <td>
		                <div class="red_heading">Product/Menu Items</div>
		                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsMenuItem">
                             <HeaderTemplate>
                                <table> 
                                    <tr style="background-color:Silver;">
                                    </tr> 
                             </HeaderTemplate>
                             <ItemTemplate>
                                 <tr >                                    
                                    <td style="font-weight:bold;" ><%#Eval("MenuItemId")%></td>
                                    <td ><%#Eval("Name")%></td>
                                </tr>
                             </ItemTemplate>
                             <FooterTemplate>
                             </table>
                             </FooterTemplate>
                         </asp:Repeater>
                       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
		            </td>
		        </tr>
		        <tr>
			        <td>						
				        <div class="red_heading">Inventory Items</div>
				        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="ObjectDataSource2">
                    <HeaderTemplate>
                        <table> 
                            <tr >  
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >        
                            <td ><%#Eval("Quantity")%></td>
                            <td ><%#Eval("Name")%></td>        
                        </tr>     
                     </ItemTemplate>
                     <FooterTemplate>
                     </table>
                     </FooterTemplate>
                </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		        </tr>
		        <tr>
		        <td>	                          
                <asp:Button ID="Button2" runat="server" Text="Close" /></td>	
		        </tr>
		    </table>
        </div>
             <%-- Control Measures --%>	
            <div id="dvControlMeasures" style="display:none;" class="popUpStyle1" runat="server" >
                <asp:Panel runat="Server" ID="panelControlMeasure" CssClass="drag">Hold here to Drag this Box</asp:Panel> 
                <table >
                                  <tr>
                                    <td style="PADDING-LEFT: 15px" valign="top" align="left" width="50%">
									<div>

										The product/menu cycle is posted in the kitchen. Each product/menu item available for service is
										listed in this food safety program in the table: 
										<a href="ViewHACCPPlanNew.aspx" target="_blank">Selected Product/Menu Items - Categorized by Process with associated CCPs - Detailed Index</a>.
									</div>
									<div>
										When new product/menu items are added, the list is updated. Each item is evaluated to determine
										which of the four processes is applicable and to identify the appropriate control
										measures and critical control points (CCPs) using the Process 
										Approach (<a href="ViewHACCPPlanNew.aspx" target="_blank">Food Processes - Detailed Index</a>).</div>
									<div>
										Once the determination is made for each product/menu item, the food service manager will
										make the rest of the food service staff aware of the product/menu items and applicable process
										and control measures by posting the Process Charts (<a href="ViewHACCPPlanNew.aspx" target="_blank">Food Processes - Detailed Index</a>) in the kitchen. In addition, the product/menu cycle,
										product/menus, recipes, product directions, and charts are kept in a digital record online
										and are accessible via the World Wide Web.
									</div>

									<div>
										<b>STAFF</b></div>
									<ul>
										<li>All food service personnel will be given an overview of the Process Approach (<a
											href="ViewHACCPPlanNew.aspx" target="_blank">Food Processes - Detailed Index</a>) to HACCP
											after being hired and before handling food.</li>
										<li>Any substitute food service staff will be given instructions on the Process Approach
											(<a href="ViewHACCPPlanNew.aspx" target="_blank">Food Processes - Detailed Index</a>) and a
											list of necessary procedures relevant to the tasks they will be performing and the
											corresponding records to be kept.</li>

										<li>Periodic refresher training for employees will be provided on a quarterly basis.</li>
										<li>An easily accessible copy of an explanation of the Process Approach (<a href="#detail">Food Processes - Detailed Index</a>) taken from 
											the <a href="HACCPPrinciples.aspx" target="_blank">Applying HACCP Principles to Retail and Food Service</a> will be available online via the World Wide
											Web.</li>
									</ul>&nbsp;</td>
                                   </tr>
                                    <tr>
                                        <td>
                                        <asp:Button ID="Button3" runat="server" Text="Close" /></td>
                                    </tr> 
                            </table>
            </div>
            <%-- DYNAMIC KITCHEN PLAN TEXT --%>
            <div class="popUpStyle" id="divPlans" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelPlans" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>              
                <br />
                 <div id="dvKitchenPlanText" runat="server" style="padding:25px;"></div>
                 <asp:Button ID="cmdCancel" runat="server" Text="Close" />
               <br />
            </div>           
</ContentTemplate>
</asp:UpdatePanel>
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
								<%--<div style="font-weight: 600; font-size: 12px; color: #56895E; padding-bottom: 7px;">
								    Plan Index
								</div>--%>
								<div align="left">
								     <%--<div class="PlanIndexLabel">
                                        <div class="plan_heading">HACCP FOOD SAFETY PROGRAM</div> 
										<li>
										<asp:LinkButton ID="lkbPlanOverView" runat="server" Text="Description of Program Overview and Facility" 
                                                oncommand="lkbPlanOverView_Command"></asp:LinkButton>
										 </li>
                                    </div>--%>
								    <!-- PLAN DOCS -->
								     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
								            <asp:Repeater ID="rptKitchenPlanCategory" runat="server"  onitemdatabound="rptKitchenPlanCategory_ItemDataBound" DataSourceID="odsKitchenPlanCtegory">
                                            <HeaderTemplate>
                                                 <div class="PlanIndexLabel">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                             <div class="plan_heading" runat="server" id="dvPlanCategory"><%#Eval("Name")%></div> 
                                             <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value='<%#Eval("KitchenPlanCategoryId")%>' />
                                             <asp:Repeater ID="rptKitchenPlan" runat="server"  onitemcommand="rptKitchenPlan_ItemCommand" >                                                
                                                <ItemTemplate>
                                                     <li>
                                                    <asp:LinkButton ID="lkbKitchenPlan" 
                                                    CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:LinkButton>
                                                    &nbsp;<a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' >Edit</a>                                                   
                                                    </li>                                
                                                </ItemTemplate>                                                
                                            </asp:Repeater>                                 
                                        </ItemTemplate>
                                            <FooterTemplate>
                                            </div>
                                         </FooterTemplate>
                                            </asp:Repeater> 
                                             <asp:ObjectDataSource ID="odsKitchenPlanCtegory" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanCategoryBySideId" 
                                            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                                                    SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="nSideId" Type="Int32" />
                                            </SelectParameters>
                                            </asp:ObjectDataSource>	
                                        </ContentTemplate>
                                     </asp:UpdatePanel>
                                     <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true" AssociatedUpdatePanelID="UpdatePanel2" >
                                     <ProgressTemplate>                     
                                     <div id="progress">
                                         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
                                     </div>                    
                                     </ProgressTemplate>
                                     </asp:UpdateProgress> 
                                    <!-- DAILY TASKS -->
                                    <div class="PlanIndexLabel">
                            <div class="plan_heading">DAILY TASKS</div> 
							<li><a href="../../StaticContent/Files/Cold Holding Log.pdf" target="_blank">Cold Holding Time and Temperature Log PDF</a>							
							</li>
							<li><a href="../../StaticContent/Files/Cooling_temp_log.pdf" target="_blank">Cooling Temperature Log PDF</a>													
							</li>
							<li><a href="../../StaticContent/Files/Cook_&_heat_Temp_log.pdf" target="_blank">End Point Cooking Temperature PDF</a>
							<li><a href="FoodSafetyChecklistPrint.aspx" target="_blank">Food Safety Checklist</a> 							
							</li>
							<li><a href="../../StaticContent/Files/Freezer Log.pdf" target="_blank">Freezer Log PDF</a> 							
							</li>	
							<li><a href="../../StaticContent/Files/Hot Holding Log.pdf" target="_blank">Hot Holding Time and Temperature Log PDF</a>
							</li>							
							<li><a href="../../StaticContent/Files/Receiving_log.pdf" target="_blank">Receiving Log PDF PDF</a>							
							</li>
							<li><a href="../../StaticContent/Files/Refrigeration_log.pdf" target="_blank">Refrigeration Log PDF</a>							
							</li>
							<li><a href="../../StaticContent/Files/Shipping Log.pdf" target="_blank">Shipping Log PDF</a>													
							</li>	
							<li><a href="../../StaticContent/Files/Thermometer_calib_log.pdf" target="_blank">Thermometer Calibration PDF</a>	                            						
							</li>
                            <li><a href="ValidationPrint.aspx" target="_blank">Validation Worksheet</a> </li>
                        </div> 
                                    <!-- PROCESSES -->
                                    <%--<div class="PlanIndexLabel">
                                        <div class="plan_heading">HACCP Food Processes - Master
                                        Flow Charts</div> 
                                        <asp:Repeater ID="rptProcess" runat="server" DataSourceID="odsProcess" 
                                            onitemcommand="rptProcess_ItemCommand" 
                                            onitemdatabound="rptProcess_ItemDataBound">
                                   <HeaderTemplate>
                                   <table>
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                   <tr>
                                    <td>
                                        <li>
                                        <asp:LinkButton ID="lkbProces" CommandName='<%# Eval("ProcessId")%>' Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessName").ToString():Eval("ProcessName").ToString() %>' runat="server" ></asp:LinkButton>
                                       
                                        </li>
                                     </td>
                                   </tr>
                                   </ItemTemplate>
                                   <FooterTemplate>
                                   <tr>
                                   <td>
                                    <li><a href="../../StaticContent/Files/Danger Zone Diagram.pdf" target="_blank">Danger Zone Diagram</a> </li>
                                   </td>
                                   </tr>
                                    </table>
                                   </FooterTemplate>
                                   </asp:Repeater>
                                        
									 </div> --%>
                                    <!-- PROCESSES WITH MENU ITEMS-->
                                    <%--<div class="PlanIndexLabel">
                                        <a name="detail" /><div class="plan_heading">PRODUCT/MENU ITEM BASED PROCESS CATEGORIES AND ASSOCIATED CCPs</div> 
                                        <%--<li><a href="javascript:;" onmousedown="toggleDiv('MenuItems');">Selected Menu Items Categorized by Process</a> </li>--%>
                                        <%-- <asp:Repeater ID="rptProcessMenu" runat="server" DataSourceID="odsProcess" 
                                            onitemcommand="rptProcessMenu_ItemCommand" >
                                           <HeaderTemplate>
                                           <table>
                                           </HeaderTemplate>
                                           <ItemTemplate>
                                           <tr>
                                            <td>
                                                <li>
                                                <asp:LinkButton ID="lkbProces" CommandName='<%# Eval("ProcessId")%>'  Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessName").ToString():Eval("ProcessName").ToString() %>' runat="server" ></asp:LinkButton>
                                               
                                                </li>
                                             </td>
                                           </tr>
                                           </ItemTemplate>
                                           <FooterTemplate>                                   
                                            </table>
                                           </FooterTemplate>
                                       </asp:Repeater>
                                        
                                        
                                    </div> --%>
                                    <!-- SOPs -->
                                    <div class="PlanIndexLabel">
										
                                       <%-- <div class="plan_heading">SOP, SSOP & GMPs:</div>
                                    
                                   <asp:Repeater ID="Repeater2" runat="server" DataSourceID="sqlDSSOP">
                                   <HeaderTemplate>
                                   <table>
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                   <tr>
                                    <td>
                                        <li><asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                                           NavigateUrl='<%# "~/ControlPanel/Kitchen/ViewSOP.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "KitchenSOPId") %>'
                                            runat="server" Target="_blank"></asp:HyperLink></li>
                                     </td>
                                   </tr>
                                   </ItemTemplate>
                                   <FooterTemplate>
                                    </table>
                                   </FooterTemplate>
                                   </asp:Repeater>         --%>                               
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
	                    <!--DAILY TASKS -->
                        
                        <!-- VALIDATION -->
                        <!--<div class="PlanIndexLabel">
                            <div class="plan_heading">VALIDATION OF HACCP PLAN</div> 
							
							
                        </div>   -->      
                        <!-- PLAN DOCS -->               
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
								            <asp:Repeater ID="Repeater5" runat="server"  onitemdatabound="rptKitchenPlanCategory_ItemDataBound" DataSourceID="odsKitchenPlanCtegory2">
                                            <HeaderTemplate>
                                                 <div class="PlanIndexLabel">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                             <div class="plan_heading" runat="server" id="dvPlanCategory"><%#Eval("Name")%></div> 
                                             <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value='<%#Eval("KitchenPlanCategoryId")%>' />
                                             <asp:Repeater ID="rptKitchenPlan" runat="server"  onitemcommand="rptKitchenPlan_ItemCommand" onitemdatabound="rptKitchenPlan_ItemDataBound">                                                
                                                <ItemTemplate>
                                                     <li>
                                                     <asp:HiddenField ID="hfCustomPlan" runat="server" Value ='<%# Eval("CustomPlan")%>' />
                                                      <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value ='<%# Eval("PlanCategoryId")%>' />
                                                       <asp:HiddenField ID="hfPlanActive" runat="server" Value ='<%# Eval("Active")%>' />
                                                    <asp:LinkButton ID="lkbKitchenPlan" 
                                                    CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:LinkButton>
                                                    &nbsp;<a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' >Edit</a>
                                                    <asp:HyperLink ID="hlManagerChecklist" runat="server" Visible="false" Text="View Sample" Target="_blank"  NavigateUrl='<%#  Eval("SortOrder").ToString()== "2"?"ManagersChecklist.aspx?PlanId=1":Eval("SortOrder").ToString()=="3"?"ManagersChecklist.aspx?PlanId=2":"ManagersChecklist.aspx?PlanId=3" %>'></asp:HyperLink>
                                                   <%-- <asp:Label ID="lblMessage" runat="server" Text="View Example Plan - Plan Required" ForeColor="Red" Visible="false"></asp:Label>--%>
                                                     <%--<asp:LinkButton ID="lkbPlanExample" Visible="false" 
                                                    CommandName="Example" CommandArgument='<%# Eval("KitchenPlanId")%>' Text="Example" runat="server" ></asp:LinkButton>--%>
                                                    </li>                                                                                    
                                                </ItemTemplate>                                                
                                            </asp:Repeater>
                                                 <a href='<%# "PlanIndexDetail.aspx?Mode=New&PlanCategoryId=" +  Eval("PlanCategoryId")%>' >Add New Document</a>                            
                                        </ItemTemplate>
                                            <FooterTemplate>
                                            </div>
                                         </FooterTemplate>
                                            </asp:Repeater> 
                                             <asp:ObjectDataSource ID="odsKitchenPlanCtegory2" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanCategoryBySideId" 
                                            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                                                    SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
                                            </SelectParameters>
                                            </asp:ObjectDataSource>	
                                        </ContentTemplate>
                                     </asp:UpdatePanel>
                                     <asp:UpdateProgress ID="UpdateProgress1" runat="server"  Visible="true" AssociatedUpdatePanelID="UpdatePanel3" >
                                     <ProgressTemplate>                     
                                     <div id="progress">
                                         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
                                     </div>                    
                                     </ProgressTemplate>
                                     </asp:UpdateProgress>
                                </div>
        <%-- Plan OverView --%>	
            <div id="PlanOverview" style="width:400px; display:block; margin-top:15px;" runat="server" >
            <table>
                <tr>
		            <td>
		         <%--<div class="red_heading" visible="false">Daily Tasks</div>	--%>	
		        <asp:SqlDataSource ID="sqlDSDailyParticipation" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetKitchenDetailsByKitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
		        </tr>
		       
                       <asp:ObjectDataSource ID="odsMenuItem" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
		            
		       
				        
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        
		    </table>
        </div>

        <%-- Control Measures --%>	
       
		<asp:HiddenField ID="hfProcessId" runat="server" />
        <%-- Plan OverView --%>		
    </div>        
</div>

</asp:Content>

