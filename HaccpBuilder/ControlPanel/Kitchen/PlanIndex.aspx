<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_PlanIndex" Title="HACCP Builder | Your HACCP Plan" Codebehind="PlanIndex.aspx.cs" %>
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
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>' Visible='<%# !Convert.ToBoolean(Eval("Field1")==null) %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ffcc" height="18"  align="center">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22" valign="top" align="center">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>' Visible='<%# !Convert.ToBoolean(Eval("Field9")==null) %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr visible = '<%# !Convert.ToBoolean(Eval("Field10")==null) %>' >
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>' Visible='<%# !Convert.ToBoolean(Eval("Field10")==null) %>'></asp:Label>
                   </td>
                   </tr>
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
            <%--<div class="popUpStyle" id="divPlans" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panel1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>              
                <br />
                <asp:Label ID="lblActionName" runat="server" Text="Name"></asp:Label>
                 <FCKeditorV2:FCKeditor ID="txtPlan" ToolbarCanCollapse="False" ToolbarStartExpanded="false" BasePath="~/fckeditor/" runat="server" ToolbarSet="Basic" Height="40px" Width="600px">
                </FCKeditorV2:FCKeditor>
                <asp:HiddenField ID="hfPlanId" runat="server" />
                <br />                       
                <asp:Button ID="cmdPlanClose" runat="server" ValidationGroup="CA" Text="OK" OnClick="cmdPlanClose_Click" />
                 <asp:Button ID="cmdCancel" runat="server" Text="Close" />
               <br />
            </div>--%>
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
	       { Plan Index }
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
								    
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">HACCP FOOD SAFETY PROGRAM</div> 
										<li>
										<asp:LinkButton ID="lkbPlanOverView" runat="server" Text="Description of Program Overview and Facility" 
                                                oncommand="lkbPlanOverView_Command"></asp:LinkButton>
										<%--<a href="javascript:;" onmousedown="toggleDiv('PlanOverview');">Description of Program Overview and Facility</a>--%> </li>
                                    </div>
                                    
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">HACCP PLAN PURPOSE AND SCOPE</div> 
										<li><a href="PurposeAndScope.aspx" target="_blank" >Purpose and Scope</a> </li>
										<li><a href="FoodSafetyIndustry.aspx" target="_blank">Background and Definition of Food Service Industry</a> </li>
										<li><a href="HACCPManagement.aspx" target="_blank">Use of HACCP as a Food Safety Management System</a> </li>
										<li><a href="../../StaticContent/Files/HACCP Food Safety Summary.pdf" target="_blank">HACCP Food Safety Program Summary</a> </li>
                                    </div>
                                    
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">THE PROCESS APPROACH</div> 
										<li><a href="HACCPPrinciples.aspx" target="_blank">Applying HACCP Principles to Retail and Food Service</a> </li>
                                    </div>
                                    
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">THE HAZARD ANALYSIS</div> 
										<li><a href="../../StaticContent/Files/The Hazard Analysis.pdf" target="_blank">Conducting a Proper HACCP Hazard Analysis</a> </li>
                                    </div>
                                    
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">DETERMINING RISK FACTORS</div> 
										<li><a href="../../StaticContent/Files/Determining Risk Factors.pdf"  target="_blank">Determining HACCP Risk Factors</a> </li>
                                    </div>
 
                                    <div class="PlanIndexLabel">
                                        <div class="plan_heading">SELECTED PRODUCT/MENU ITEM AND FOOD PREPARATION ACTION PLAN</div> 
										<li>
										<asp:LinkButton ID="lkbControlMeasure" runat="server" Text="Identification Control Measures and CCP's" 
                                                oncommand="lkbControlMeasure_Command"></asp:LinkButton>
										<%--<a href="javascript:;" onmousedown="toggleDiv('ControlMeasures');">Identification Control Measures and CCP's</a>--%></li>
                                    </div>
 
                                    <div class="PlanIndexLabel">
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
                                        <%--<asp:HyperLink ID="hlSOP" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessName").ToString():Eval("ProcessName").ToString() %>'
                                           NavigateUrl="javascript:;" onmousedown=toggleDiv("Process0") runat="server"></asp:HyperLink>--%>
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
                                        
									</div>
 
                                    <div class="PlanIndexLabel">
                                        <a name="detail" /><div class="plan_heading">PRODUCT/MENU ITEM BASED PROCESS CATEGORIES AND ASSOCIATED CCPs</div> 
                                        <%--<li><a href="javascript:;" onmousedown="toggleDiv('MenuItems');">Selected Menu Items Categorized by Process</a> </li>--%>
                                        <asp:Repeater ID="rptProcessMenu" runat="server" DataSourceID="odsProcess" 
                                            onitemcommand="rptProcessMenu_ItemCommand" >
                                           <HeaderTemplate>
                                           <table>
                                           </HeaderTemplate>
                                           <ItemTemplate>
                                           <tr>
                                            <td>
                                                <li>
                                                <asp:LinkButton ID="lkbProces" CommandName='<%# Eval("ProcessId")%>'  Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessName").ToString():Eval("ProcessName").ToString() %>' runat="server" ></asp:LinkButton>
                                                <%--<asp:HyperLink ID="hlSOP" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessName").ToString():Eval("ProcessName").ToString() %>'
                                                   NavigateUrl="javascript:;" onmousedown=toggleDiv("Process0") runat="server"></asp:HyperLink>--%>
                                                </li>
                                             </td>
                                           </tr>
                                           </ItemTemplate>
                                           <FooterTemplate>                                   
                                            </table>
                                           </FooterTemplate>
                                       </asp:Repeater>
                                        
                                        
                                    </div>

                                    <div class="PlanIndexLabel">
										
                                        <div class="plan_heading">Standard Operating Procedures -
                                        SOP Detailed Index:</div>
                                    
                                   <asp:Repeater ID="Repeater2" runat="server" DataSourceID="sqlDSSOP">
                                   <HeaderTemplate>
                                   <table>
                                   </HeaderTemplate>
                                   <ItemTemplate>
                                   <tr>
                                    <td>
                                        <li><asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                                           NavigateUrl='<%# "~/ControlPanel/Kitchen/ViewSOP.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "SOPId") %>'
                                            runat="server" Target="_blank"></asp:HyperLink></li>
                                     </td>
                                   </tr>
                                   </ItemTemplate>
                                   <FooterTemplate>
                                    </table>
                                   </FooterTemplate>
                                   </asp:Repeater>
                                        <%--<asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" 
                    DataSourceID="sqlDSSOP" Height="50px" Width="100%">    
                    <Fields>
                         <asp:TemplateField >
                                <ItemTemplate>                                    
                                        <div>
                                          <asp:HyperLink ID="hlSOP" Text='<%# DataBinder.Eval(Container.DataItem, "Title")%>'
                                           NavigateUrl='<%# "~/ControlPanel/Kitchen/ViewSOP.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "SOPId") %>'
                                            runat="server" Target="_blank"></asp:HyperLink>
                                         </div>                                         
                               </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>--%>
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
									 	
										<%--<li><a href="ViewSOP.aspx?SOPId=1" target="_blank">** Elementary ** PPP Cleaning and Sanitizing Food Contact Surfaces</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=2" target="_blank">Controlling Time and Temperature During Preparation</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=3" target="_blank">Cooking Potentially Hazardous Foods</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=4" target="_blank">Cooling Potentially Hazardous Foods</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=5" target="_blank">Date Marking Ready-to-Eat, Potentially Hazardous Food</a>&nbsp;</li>

										
										<li><a href="ViewSOP.aspx?SOPId=6" target="_blank">Handling A Food Recall</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=7" target="_blank">Holding Hot and Cold Potentially Hazardous Foods</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=8" target="_blank">Personal Hygiene</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=9" target="_blank">Preventing Contamination at Food Bars</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=10" target="_blank">Preventing Cross-Contamination During Storage and Preparation</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=11" target="_blank">Receiving Deliveries</a>&nbsp;</li>

										
										<li><a href="ViewSOP.aspx?SOPId=12" target="_blank">Reheating Potentially Hazardous Foods</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=13" target="_blank">Serving Food</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=14" target="_blank">Storing and Using Poisonous or Toxic Chemicals</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=15" target="_blank">Transporting Food to Remote Sites (Satellite Kitchens)</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=16" target="_blank">Using and Calibrating Thermometers</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=17" target="_blank">Using Suitable Utensils When Handling Ready-to-Eat Foods</a>&nbsp;</li>

										
										<li><a href="ViewSOP.aspx?SOPId=18" target="_blank">Using Time Alone as a Public Health Control to Limit Bacteria Growth in Potentially Hazardous Foods</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=19" target="_blank">Washing Fruits and Vegetables</a>&nbsp;</li>
										
										<li><a href="ViewSOP.aspx?SOPId=20" target="_blank">Washing Hands</a>&nbsp;</li>--%>
                                    </div>
                         </div>
                    </td>
               </tr>
       </table> 
    </div>
    <div class="log_plan_right">
        <div id="MainHeading" class="red_heading" style="margin-top:10px;">
	       { Daily-Weekly Tasks, Policy and Procedures }
	    </div>
	    <div id="DailyTask" style="width:400px; display:block; margin-top:15px;" runat="server">
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
                        </div>
                        
                        <div class="PlanIndexLabel">
                            <div class="plan_heading">VALIDATION OF HACCP PLAN</div> 
							<li><a href="ValidationPrint.aspx" target="_blank">Validation Worksheet</a> </li>
							
                        </div>
                        
                        <div class="PlanIndexLabel">
                            <div class="plan_heading">CORRECTIVE ACTIONS</div> 
							<li><a href="../../StaticContent/Files/haccp builder corrective actions policy.pdf" target="_blank">Corrective Actions Policy</a> </li>
							<li><a href="../../StaticContent/Files/haccp builder haccp corrective actions.pdf" target="_blank">Corrective Actions Library</a> </li>
							
                        </div>
                        
                        <div class="PlanIndexLabel">
                            <div class="plan_heading">MANAGERS CHECKLIST</div> 
                            <li><a href="ViewHACCPPlanNew.aspx" target="_blank">Review of HACCP Plan</a> 	
		                    <asp:DetailsView ID="dtvDailyParticipation" runat="server" AutoGenerateRows="False" 
                    DataSourceID="sqlDSDailyParticipation" Height="50px" Width="125px">    
                    <Fields>
                         <asp:TemplateField >
                                <ItemTemplate>
                                    <table >
                                    <tr>
                                        <td >
                                            <b>Average Daily Participation  </b>:
                                        </td>
                                    </tr>
                                        <tr>                                               
                                            <td width="80%">
                                                <asp:Label ID="lblDistrict" Text='<%# "Breakfasts: " + DataBinder.Eval(Container.DataItem,"AMServe") + " Meals" %>' runat="server"></asp:Label>                
                                            </td>
                                        </tr>
                                        <tr>                       
                                            <td>
                                                <asp:Label ID="lblKitchenCity" Text='<%# "Lunches: "  + DataBinder.Eval(Container.DataItem,"PMServe")+ " Meals" %>' runat="server"></asp:Label>
                                            </td>  
                                        </tr>
                                        <tr>
                                            <td >
                                                <b>School Foodservice Staff  </b>:
                                            </td>
                                         </tr>
                                        <tr>                    
                                             <td>
                                                 <asp:Label ID="lblManager" Text='<%# "Manager(s)  " + DataBinder.Eval(Container.DataItem,"Managers") %>' runat="server"></asp:Label>
                                             </td> 
                                        </tr>
                                        <tr>                       
                                            <td>
                                                <asp:Label ID="lblMail2" Text='<%# "Staff  " + DataBinder.Eval(Container.DataItem,"Staff") %>' runat="server"></asp:Label>
                                            </td>                            
                                        </tr>
                                        <tr>
                                            <td >
                                                <b>Product/Menu Cycle</b>:
                                            </td>
                                         </tr>
                                         <tr>
                                            <td>
                                                <asp:Label ID="Label3" Text='<%# "Cycle Measure By:  " + DataBinder.Eval(Container.DataItem,"CycleMeasuredBy") %>' runat="server"></asp:Label>
                                            </td>  
                                        </tr> 
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblKitchenAddress" Text='<%# "Units In Cycle: " + DataBinder.Eval(Container.DataItem,"UnitsInCycle") %>' runat="server"></asp:Label>
                                            </td>  
                                        </tr>                  
                                        
                                    </table>
                               </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                            </li>
                            <li>
                             <asp:LinkButton ID="lkbSenitazation" CommandName="Sanitization"  Text="Sanitization Plan" 
                                    runat="server" onclick="lkbSenitazation_Click" 
                                    oncommand="lkbSenitazation_Command" ></asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lkbPestControl" CommandName="PestControl"  Text="Pest Control Plan" 
                                runat="server" oncommand="lkbSenitazation_Command"></asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lkbEquipment" CommandName="Equipment"  Text="Equipment Maintanence Plan" 
                                runat="server" oncommand="lkbSenitazation_Command"></asp:LinkButton></li>                         
                            <li><a href="../../StaticContent/Files/HACCP_BUILDER_REVIEW_POLICY.pdf" target="_blank">Review Policy</a> </li>
                            <li><a href="../../StaticContent/Files/haccp builder monitoring policy.pdf" target="_blank">Monitoring Policy</a> </li>										
                        </div>
                        
                        <div class="PlanIndexLabel">
                            <div class="plan_heading">HACCP BUILDER PROCEDURAL STEPS</div> 
							<li><a href="../../StaticContent/Files/Procedure One.pdf" target="_blank">One-Develop Prerequisite Programs</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Two.pdf" target="_blank">Two-Group Your Products/Menu Items</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Three.pdf" target="_blank">Three-Conduct a Hazard Analysis</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Four.pdf" target="_blank">Four-Implement Control Measures and Establish Critical Limits</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Five.pdf" target="_blank">Five-Establish Monitoring Procedures</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Six.pdf" target="_blank">Six-Develop Corrective Actions</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Seven.pdf" target="_blank">Seven-Conduct Ongoing Verification</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Eight.pdf" target="_blank">Eight-Keep Records</a> </li>
							<li><a href="../../StaticContent/Files/Procedure Nine.pdf" target="_blank">Nine-Conduct Periodic Validation</a> </li>
							<li><a href="../../StaticContent/Files/Seafood Reference Tables.pdf" target="_blank">Seafood Reference Tables</a> </li>
							<li><a href="../../StaticContent/Files/Glossary.pdf" target="_blank">Glossary</a> </li>
                        </div>
                        
                        <div class="PlanIndexLabel">
                            <div class="plan_heading">TRAINING</div> 
                            <li>Training Logs </li>
                            <li>HACCP e-training</li>										
                        </div>
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
		        <tr>
		            <td>
		                <div class="red_heading">Product/Menu Items</div>
		                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="odsMenuItem">
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
                       <asp:ObjectDataSource ID="odsMenuItem" runat="server" 
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
				        <asp:Repeater ID="rptInventory" runat="server" DataSourceID="ObjectDataSource2">
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
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		        </tr>
		    </table>
        </div>

        <%-- Control Measures --%>	
        <div id="ControlMeasures" style="width:400px; display:none; margin-top:30px;" >
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
                            </tr></table>
       </div>
        <%-- Process 0 --%>	
        <div id="Process0" style="width:400px; display:none; margin-top:15px;" visible="false">
        
        <%--<table>
        <tr>
		    <td>
		        <h4>Process 0 - No Cook - No Process</h4>	
			    <table>
				    <tr>
					    <td height="352" valign="top">
						    <table border="0" cellpadding="0" cellspacing="0" >
							    <tr>
							  	    <td height="21" width="51">									    
									 </td>
								    <td bgcolor="#99ccff" rowspan="3" valign="top">
									    <div align="center">
										    <div class="plan_heading">RECEIVE</div><br>
										    Control Measures: Known and Approved Source, Confirm Expiration Dates</div>
								    </td>
								    <td width="40">

								    </td>
								    <td width="3">
								    </td>
							    </tr>
							    <tr>
								    <td height="3">
								    </td>
								    <td rowspan="5" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td rowspan="3" valign="top">
									    <img height="42" src="../../StaticContent/Images/cal_51x42.gif" width="51"></td>
								    <td height="19">
								    </td>
							    </tr>

							    <tr>
								    <td height="10">
								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td bgcolor="#99ffcc" rowspan="3" valign="top">
									    <div align="center">

										    <div class="plan_heading">CCP: EXPIRATION DATE STAMP</div><br>
										    Check and Record Expiration Dates</div>
								    </td>
								    <td height="13">
								    </td>
							    </tr>
							    <tr>
								    <td height="5">

								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td height="21">
								    </td>
								    <td>
								    </td>

							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="52">
								    </td>

								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <div class="plan_heading">STORE</div><br>
										    Control Measures: Proper Storage, Prevention of Cross-Contamination, Store Away
										    from Chemicals</div>
								    </td>
								    <td>
								    </td>
								    <td>

								    </td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="39">

								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <div class="plan_heading">PREPARE</div><br>
										    Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>
								    </td>
								    <td>
									    &nbsp;</td>

								    <td>
									    &nbsp;</td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="42" valign="top">
									    <img height="42" src="../../StaticContent/Images/cal_51x42.gif" width="51"></td>
								    <td bgcolor="#99ffcc" rowspan="2" valign="top">
									    <div align="center">
										    <div>
											    <div class="plan_heading">CCP: EXPIRATION DATE STAMP</div><br>
											    Check and Record Expiration Dates</div>
									    </div>

								    </td>
								    <td rowspan="2" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td height="8">
								    </td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <div class="plan_heading">SERVE</div><br>
										    Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										    Restrict Ill Employees</div>
								    </td>
								    <td>

								    </td>
								    <td>
								    </td>
							    </tr>
						    </table>
						</td>
					</tr>
			</table>
		    <div>

			    <b>Example: </b>No Process - No Cook (Vendor supplied bread, cookies, etc.)</div>
		    <div>
			    <img height="30" src="../../StaticContent/Images/cal_36x30.gif" width="36">
			    = Calendar Icon means that checking for an expiration date is required.
		    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
		    means that recording data (reporting) is required.</div>
		    <div>
			    * From the 2005 FDA Food Code</div>

		    <div>
			    &nbsp;</div>&nbsp;
			  </td>
		</tr>
		</table>--%>
		</div>
        <%-- Process 1 --%>	
       <div id="Process1" style="width:400px; display:none; margin-top:15px;" >
            <table>
            <tr>
			    <td>
			        <h4>Process 1 - No Cook</h4>			
				    <table>
							    <tr>
								    <td height="21" width="20">
								    </td>
								    <td bgcolor="#99ccff" height="22" rowspan="2" valign="top">
									    <div align="center">
										    <div class="plan_heading">RECEIVE</div><br>
										    Control Measures: Known and Approved Source, Receiving Temperatures</div>

								    </td>
								    <td width="40">
								    </td>
							    </tr>
							    <tr>
								    <td rowspan="3" valign="top">
									    <img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								    <td rowspan="3" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

							    </tr>
							    <tr>
								    <td height="10">
								    </td>
							    </tr>
							    <tr>
								    <td bgcolor="#99ffcc" height="18" rowspan="2" valign="top">
									    <div align="center">
										    <div class="plan_heading">CCP: COLD RECIEPT</div><br>

										    Critical Limit: Hold at 41&deg; F or Below*<br>
										    Check and Record Temperatures</div>
								    </td>
							    </tr>
							    <tr>
								    <td height="21">
								    </td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="1">
								    </td>
								    <td bgcolor="#99ccff" rowspan="3" valign="top">
									    <div align="center">
										    <div class="plan_heading">STORE</div><br>
										    Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										    Store Away from Chemicals</div>
								    </td>
								    <td>

								    </td>
							    </tr>
							    <tr>
								    <td height="50">
								    </td>
								    <td valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							    </tr>
							    <tr>

								    <td height="1">
								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>

							    </tr>
							    <tr>
								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <div class="plan_heading">PREPARE</div><br>
										    Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>

								    </td>
								    <td>
									    &nbsp;</td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>

							    <tr>
								    <td height="50" valign="top">
									    <img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								    <td bgcolor="#99ffcc" valign="top">
									    <div align="center">
										    <div>
											    <div class="plan_heading">CCP: COLD HOLDING</div><br>
											    Critical Limit: Hold at 41&deg; F or Below*<div class="plan_heading"></div><br>

											    Check and Record Temperatures</div>
									    </div>
								    </td>
								    <td valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">

									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <div class="plan_heading">SERVE</div><br>

										    Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										    Restrict Ill Employees</div>
								    </td>
								    <td>
								    </td>
							    </tr>
						    </table>
				    <div>
					    <b>Example: </b>Process 1 - No Cook (Milk, yogurt, etc.)</div>

				    <div>
					    <img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
					    = Thermometer Icon means that taking a temperature is required.<br>
					    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
					    means that recording data (reporting) is required.</div>
				    <div>
					    * From the 2005 FDA Food Code </div>
				    <div class="breakhere">

					    &nbsp;</div>&nbsp;
			    </td>
		    </tr>
		    </table>
	    </div>
        <%-- Process 2 --%>
         <div id="Process2" style="width:400px; display:none; margin-top:15px;" >
            <table>  
            <tr>
			<td>
						<h4>
							Process 2 - Same Day Service</h4>

						<table>
							<tr>
								<td height="21" width="20">
								</td>
								<td bgcolor="#99ccff" height="22" rowspan="2" valign="top">
									<div align="center">
										<div class="plan_heading">RECEIVE</div><br>
										Control Measures: Known and Approved Source, Receiving Temperatures</div>

								</td>
								<td width="40">
								</td>
							</tr>
							<tr>
								<td rowspan="3" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td rowspan="3" valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

							</tr>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td bgcolor="#99ffcc" height="18" rowspan="2" valign="top">
									<div align="center">
										<div class="plan_heading">CCP: COLD RECIEPT</div><br>

										Critical Limit: Hold at 41&deg; F or Below*<br>
										Check and Record Temperatures</div>
								</td>
							</tr>
							<tr>
								<td height="21">
								</td>

								<td>
								</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>
							<tr>

								<td height="1">
								</td>
								<td bgcolor="#99ccff" rowspan="3" valign="top">
									<div align="center">
										<div class="plan_heading">STORE</div><br>
										Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										Store Away from Chemicals</div>
								</td>
								<td>

								</td>
							</tr>
							<tr>
								<td height="50">
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>
							<tr>

								<td height="1">
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>

							</tr>
							<tr>
								<td height="39">
								</td>
								<td bgcolor="#99ccff" valign="top">
									<div align="center">
										<div class="plan_heading">PREPARE</div><br>
										Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>

								</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>

							<tr>
								<td height="50" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td bgcolor="#99ffcc" valign="top">
									<div align="center">
										<div class="plan_heading">CCP: COOK</div><br>
										Critical Limit: Internal Temperature of 165&deg; F or greater for no less than 15 seconds*<br>

										Check and Record Temperatures</div>
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>

								</td>
							</tr>
							<tr>
								<td height="50" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td bgcolor="#99ffcc" valign="top">
									<div align="center">
										<div>
											<div class="plan_heading">CCP: HOT HOLDING</div><br>

											Critical Limit: Hold at no less than 135&deg; F*<br>
											Check and Record Temperatures</div>
									</div>
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>

							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>
							<tr>
								<td height="39">
								</td>
								<td bgcolor="#99ccff" valign="top">

									<div align="center">
										<div class="plan_heading">SERVE</div><br>
										Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										Restrict Ill Employees</div>
								</td>
								<td>
								</td>
							</tr>
						</table>

						<div>
							<b>Example: </b>Process 2 - Same Day Service (Mac and Cheeze, burgers, etc.)</div>
						<div>
							<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
							= Thermometer Icon means that taking a temperature is required.<br>
							<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
							means that recording data (reporting) is required.</div>
						<div>

							* From the 2005 FDA Food Code</div>
						<div class="breakhere">
							&nbsp;</div>
			</td>
		</tr>
		</table>
		</div>	
        <%-- Process 3 --%>
        <div id="Process3" style="width:400px; display:none; margin-top:15px;" >
            <table>    
            <tr>
			<td>
				<h4>Process 3 - Complex Food Preparation	</h4>		
							<table>
								<tr>
									<td height="50" valign="top" width="20">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">RECEIVE</div><br>
											Control Measures: Known and Approved Source, Receiving Temperatures</div>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="50" valign="top" width="20">
									&nbsp;
									</td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">STORE</div>
											Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
											Store Away from Chemicals</div><br/>
									</td>
									<td width="70">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top" >
										<hr />
									</td>
								</tr>
								<tr>
									<td height="39">
                                        &nbsp;
									</td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">PREPARE</div><br>
											Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div><br/>
									</td>
									<td>
										&nbsp;</td>

								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>
									<td height="52" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>

									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">CCP: COOK</div><br>
											Critical Limit: Cook to 165&deg; F or greater for no less than 15 seconds*<br/>
											Check and Record Temperatures</div>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="50" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" rowspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">CCP: COOL</div><br>
											Critical Limit: Cool to 70&deg; F within 2 hours and from 70&deg; F to 41&deg; F
											or lower within an additional 4 hours*<br/>
											Check and Record Temperatures</div>
									</td>
									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr><td colspan="4">&nbsp;</td></tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>

									</td>
								</tr>
								<tr>
									<td height="52" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">CCP: REHEAT</div><br>

											Critical Limit: Heat to 165&deg; F or greater for no less than 15 seconds*<br>
											Check and Record Temperatures</div>
									</td>
									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>

									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>
									<td height="50" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">

											<div>
												<div class="plan_heading">CCP: HOT HOLDING</div><br>
												Critical Limit: Hold at no less than 135&deg; F*<br>
												Check and Record Temperatures</div>
										</div>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="39">
									</td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<div class="plan_heading">SERVE</div><br>
											Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
											Restrict Ill Employees</div>
									</td>
									<td>

									</td>
								</tr>
							</table>
							<div>
								<b>Example: </b>Process 3 - Complex Food Prep (Scratch materials used in recipe
								and made at the school)</div>
							<div>
								<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
								= Thermometer Icon means that taking a temperature is required.<br>

								<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
								means that recording data (reporting) is required.</div>
							<div>
								* From the 2005 FDA Food Code</div>
							<div class="breakhere">
								&nbsp;</div>
					</td>
		</tr>
		</table>
		</div>	
        <%-- Menu Items --%>
        <div id="MenuItems" style="width:400px; display:none; margin-top:15px;" >
            <table>
                <tr>
                    <td valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                 <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Product/Menu
                                Items&nbsp;
                            </td> 
                        </tr>   
                <tr>
                    <td>       
                        <asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="odsMenuItem1">
                     <HeaderTemplate>
                        <table> 
                            <tr>             
                                <td width="50px" align="center" ></td>
                                <td width = "150px" align="center" ></td>                                
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >                            
                            <td ><%#Eval("MenuItemId")%></td>
                            <td ><%#Eval("Name")%></td>                            
                        </tr>                        
                     </ItemTemplate>
                     <FooterTemplate>
                     </table>
                     </FooterTemplate>
                </asp:Repeater>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="odsMenuItem1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
        </div>
        	
        <%-- Process 0 Items --%>
        <div id="DataProcess0" style="width:400px; display:none; margin-top:15px;" >
            <table>
                <tr>
                    <td style="padding-left: 15px" valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                <tr>
                    <td>
                        <div>                                 
                        <table cellspacing="3" cellpadding="0" border="0">
                        <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Product/Menu
                                Items&nbsp;
                            </td> 
                        </tr>        
		                <tr>
			        <td colspan="2" style="white-space: nowrap;">
				        <table border="0" cellpadding="0" cellspacing="0" width="100%">
					        <tr>
						        <td rowspan="2">
							        <img alt="" border="0" src="../../StaticContent/Images/ProcessImage1.gif" /> &nbsp;&nbsp;</td>
						        <td>
							        <span style="font-size: 14pt; font-weight: 600; color: #56895E">No Process - No Cook</span>&nbsp;</td> 
					        </tr>
					        <tr>
						        <td>
							        Document and Check Date Marking&nbsp;
						        </td>
					        </tr>
				        </table>
			        </td>
		        </tr>   
                        <tr>
			        <td>
				        
                        <asp:ObjectDataSource ID="OdsProcess0" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		       </tr>
		                <tr>
			        <td colspan="2" style="padding-left:10px;">
				        <div><div class="plan_heading">CONTROL MEASURES (CCP):</div></div>
				        
					        <li>Personal Hygiene SOP:&quot;Personal Hygiene&quot;</li>
					        <li>Washing Fresh Fruits and Vegetables SOP: &quot;Washing Fruits and Vegetables&quot;</li>
					        <li>Verifying receiving Date Markings of food SOP:&quot;Receiving 
					        Deliveries&quot;</li>

					        <li>Date marking of ready-to-eat food SOP:&quot;Date Marking and Ready-to-Eat, 
					        Potentially Hazardous Food&quot;</li>
				        &nbsp;
				     </td> 
		        </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		 </div>	
		 
        <%-- Process 1 Items --%>
        <div id="DataProcess1" style="width:400px; display:none; margin-top:15px;" >
            <table>
                <tr>
                    <td style="padding-left: 15px" valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                 <tr>
                    <td>
                        <div>                                 
                        <table cellspacing="3" cellpadding="0" border="0">
                        <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Product/Menu
                                Items&nbsp;
                            </td> 
                        </tr>        
		                <tr>
			                <td colspan="2" style="white-space: nowrap;">
				                <table border="0" cellpadding="0" cellspacing="0" width="100%">
					            <tr>
						        <td rowspan="2">
							        <img alt="" border="0" src="../../StaticContent/Images/ProcessImage2.gif" /> &nbsp;&nbsp;</td>
						        <td>
							        <span style="font-size: 14pt; font-weight: 600; color: #56895E">Process 1 - No Cook</span>&nbsp;</td> 
					        </tr>
					            <tr>
						            <td>
							            ALWAYS Keep Food Below 41° F &nbsp;
						            </td>
					            </tr>
				            </table>
			                </td>
		                </tr>   
                        <tr>
			                <td>
				        <asp:Repeater ID="rptProcess1" runat="server" DataSourceID="OdsProcess1">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <td width="50px" align="center" ></td>
                                        <td width = "150px" align="center" ></td>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td ><%#Eval("MenuItemId")%></td>
                                    <td ><%#Eval("Name")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="2" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2" style="padding-left:10px;">
				        <div><div class="plan_heading">CONTROL MEASURES (CCP):</div></div>
				        
					        <li>Cold holding - Critical limit is 41&deg; F or below SOP:&quot;Holding 
					Hot and Cold Potentially Hazardous Foods&quot;</li>

					<li>Personal Hygiene SOP: &quot;Personal Hygiene&quot;</li>
					<li>Washing Fresh Fruits and Vegetables SOP:&quot;Washing Fruits and Vegetables&quot;</li>
					<li>Limiting time in the danger zone to inhibit bacterial growth and 
					toxin production (e.g., holding at room temperature for 4 hours 
					and then discarding) SOP:&quot;Using 
					Time Alone as a Public Health Control to Limit Bacteria Growth in 
					Potentially Hazardous Foods&quot;</li>
					<li>Verifying receiving temperatures of food SOP:&quot;Receiving Deliveries&quot;</li>
					<li>Date marking of ready-to-eat food SOP: &quot;Date Marking and Ready-to-Eat, Potentially Hazardous Food&quot;</li>

				       &nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
        <%-- Process 2 Items --%>
        <div id="DataProcess2" style="width:400px; display:none; margin-top:15px;" >
            <table>
                <tr>
                    <td style="padding-left: 15px" valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                 <tr>
                    <td>
                        <div>                                 
                        <table cellspacing="3" cellpadding="0" border="0" width="80%">
                        <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Product/Menu
                                Items&nbsp;
                            </td> 
                        </tr>        
		                <tr>
			                <td colspan="2" >
				                <table border="0" cellpadding="0" cellspacing="0" >
					            <tr>
						            <td rowspan="2">
							            <img alt="" border="0" src="../../StaticContent/Images/ProcessImage3.gif" /> &nbsp;&nbsp;</td>
						            <td>
							            <span style="font-size: 14pt; font-weight: 600; color: #56895E">Process 2 - Cook and Same Day Serve </span>&nbsp;
							         </td> 
					            </tr>
					            <tr>
						            <td colspan="2">
							            Cook to 165° F for No Less than 15 Seconds
                                        Serve at 135° F or Above  &nbsp;
						            </td>
					            </tr>
				            </table>
			                </td>
		                </tr>   
                        <tr>
			                <td>
				        <asp:Repeater ID="rptProcess2" runat="server" DataSourceID="OdsProcess2">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <td width="50px" align="center" ></td>
                                        <td width = "150px" align="center" ></td>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td ><%#Eval("MenuItemId")%></td>
                                    <td ><%#Eval("Name")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess2" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2" style="padding-left:10px;">
				        <div><div class="plan_heading">CONTROL MEASURES (CCP):</div></div>
				        
					        <li>Cooking to destroy bacteria and other pathogens (Critical limits 
					        are outlined above)</li>
					        <li>Hot and cold holding or limiting time in the danger zone to inhibit 
					        bacterial growth and toxin formation SOP: &quot;Holding 
					        Hot and Cold Potentially Hazardous Foods&quot;</li>
				        &nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
        <%-- Process 3 Items --%>
        <div id="DataProcess3" style="width:400px; display:none; margin-top:15px;" >
            <table>
                <tr>
                    <td style="padding-left: 15px" valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                 <tr>
                    <td>
                        <div>                                 
                        <table cellspacing="3" cellpadding="0" border="0">
                        <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Product/Menu
                                Items&nbsp;
                            </td> 
                        </tr>        
		                <tr>
			                <td colspan="2" >
				                <table border="0" cellpadding="0" cellspacing="0" width="100%">
					            <tr>
						        <td rowspan="2">
							        <img alt="" border="0" src="../../StaticContent/Images/ProcessImage4.gif" /> &nbsp;&nbsp;</td>
						        <td>
							        <span style="font-size: 14pt; font-weight: 600; color: #56895E">Process 3 - Cook, Cool, Reheat, Serve</span>&nbsp;</td> 
					        </tr>
					            <tr>
						            <td>
							            Limit Time in Danger Zone (41° F - 135° F) &nbsp;
						            </td>
					            </tr>
				            </table>
			                </td>
		                </tr>   
                        <tr>
			                <td>
				        <asp:Repeater ID="rptProcess3" runat="server" DataSourceID="OdsProcess3">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <td width="50px" align="center" ></td>
                                        <td width = "150px" align="center" ></td>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr >
                                    <td ><%#Eval("MenuItemId")%></td>
                                    <td ><%#Eval("Name")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess3" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="4" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2" style="padding-left:10px;">
				        <div><div class="plan_heading">CONTROL MEASURES (CCP):</div></div>
				        
					        <li>Cooking to destroy bacteria and other pathogens (Critical limits 
					are outlined above)</li>
					<li>Reheating for hot holding, if applicable SOP: &quot;Reheating 
					Potentially Hazardous Foods&quot;</li>
					<li>Cooling to prevent the outgrowth of spore-forming bacteria SOP: &quot;Cooling 
					Potentially Hazardous Foods&quot;</li>
					<li>Hot and cold holding or limiting time in the danger zone to inhibit 
					bacterial growth and toxin formation SOP: &quot;Holding Hot and Cold Potentially Hazardous Foods&quot;</li>
				        &nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
		<asp:HiddenField ID="hfProcessId" runat="server" />
        <%-- Plan OverView --%>		
    </div>        
</div>

</asp:Content>

