<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_PlanIndex" Title="HACCP Builder | Your HACCP Plan" Codebehind="PlanIndexOld.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script type="text/javascript" language="javascript">
  function toggleDiv(divid){

    document.getElementById('PlanOverview').style.display = 'none';
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
    
    document.getElementById(divid).style.display = 'block';

//    if(document.getElementById(divid).style.display == 'none'){
//      document.getElementById(divid).style.display = 'block';
//    }else{
//      document.getElementById(divid).style.display = 'none';
//    }
  }
</script>
<div>
    <div class="ContentLeft">
     <table cellspacing="0" style="margin-left:20px; margin-top:20px;" cellpadding="0" border="0" >
	                            <tr>
	                                <td valign="top" colspan="2">&nbsp;</td>
		                        </tr>
								<tr>

									<td style="padding-right: 35px" valign="top" width="50%">
																		<div style="font-weight: 600; font-size: 12px; color: #56895E; padding-bottom: 7px;">
								    Plan Index
								</div>
								<div align="left">
                                    <p>
                                        <strong>SCHOOL FOOD SAFETY PROGRAM</strong> 
										<li><a href="javascript:;" onmousedown="toggleDiv('PlanOverview');">Description of Program Overview and Facility</a> </li>

                                    </p>
 
                                    <p>
                                        <strong>Selected Menu Food Preparation
                                        Action Plan:</strong> 
										<li><a href="javascript:;" onmousedown="toggleDiv('ControlMeasures');">Identification Control Measures and CCP's</a></li>
                                    </p>
 
                                    <p>
                                        <strong>School Food Processes - Master
                                        Flow Charts</strong> 
                                        <li><a href="javascript:;" onmousedown="toggleDiv('Process0');">No Process - No Cook</a> </li>

                                        <li><a href="javascript:;" onmousedown="toggleDiv('Process1');">Process 1 - No Cook</a> </li>
                                        <li><a href="javascript:;" onmousedown="toggleDiv('Process2');">Process 2 - Same Day Service</a> </li>
                                        <li><a href="javascript:;" onmousedown="toggleDiv('Process3');">Process 3 - Complex Food Preparation</a> </li>
									</p>
 
                                    <p>
                                        <a name="detail" /><strong>Menu Based Process
                                        Categories and Associated CCPs:</strong> 
                                        <li><a href="javascript:;" onmousedown="toggleDiv('MenuItems');">Selected Menu Items Categorized by Process</a> </li>

                                        <li><a href="javascript:;" onmousedown="toggleDiv('DataProcess0');">No Process - No Cook (Specific CCP)</a> </li>
                                        <li><a href="javascript:;" onmousedown="toggleDiv('DataProcess1');">Process 1 - No Cook (Specific CCP)</a> </li>
                                        <li><a href="javascript:;" onmousedown="toggleDiv('DataProcess2');">Process 2 - Same Day Service (Specific CCP)</a> </li>
                                        <li><a href="javascript:;" onmousedown="toggleDiv('DataProcess3');">Process 3 - Complex Food Preparation (Specific CCP)</a> </li>
                                    </p>

                                    <p>
										
                                        <strong>Standard Operating Procedures -
                                        SOP Detailed Index:</strong>
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
										
										
										
                                    </p>
                         </div>
                    </td>
               </tr>
       </table> 
    </div>
    <div class="ContentRight">        

        <%-- Plan OverView --%>	
            <div id="PlanOverview" style="width:400px; display:block; margin-top:30px;" >
            <table>
                <tr>
		            <td>
		        <h2 style="color: #000;">Plan Overview</h2>		
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
                                                <b>Menu Cycle</b>:
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
		                <h2 style="color: #000;">Menu Items</h2>
		                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1">
                             <HeaderTemplate>
                                <table> 
                                    <tr style="background-color:Silver;">
                                    </tr> 
                             </HeaderTemplate>
                             <ItemTemplate>
                                 <tr >                                    
                                    <td style="font-weight:bold;" ><%#Eval("ItemId")%></td>
                                    <td ><%#Eval("MenuItem")%></td>
                                </tr>
                             </ItemTemplate>
                             <FooterTemplate>
                             </table>
                             </FooterTemplate>
                         </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
		            </td>
		        </tr>
		        <tr>
			        <td>						
				        <h2 style="color: #000;">Inventory Items</h2>
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
									<p>

										The menu cycle is posted in the kitchen. Each menu item available for service is
										listed in this food safety program in the table: 
										<a href="HaccpPlan.php?p=menu">Selected Menu Items - Categorized by Process with associated CCPs - Detailed Index</a>.
									</p>
									<p>
										When new menu items are added, the list is updated. Each item is evaluated to determine
										which of the four processes is applicable and to identify the appropriate control
										measures and critical control points (CCPs) using the Process 
										Approach (<a href="#detail">School Food Processes - Detailed Index</a>).</p>
									<p>
										Once the determination is made for each menu item, the food service manager will
										make the rest of the food service staff aware of the menu items and applicable process
										and control measures by posting the Process Charts (<a href="#detail">School
											Food Processes - Detailed Index</a>) in the kitchen. In addition, the menu cycle,
										menus, recipes, product directions, and charts are kept in a digital record online
										and are accessible via the World Wide Web.
									</p>

									<p>
										<b>STAFF</b></p>
									<ul>
										<li>All food service personnel will be given an overview of the Process Approach (<a
											href="#detail">School Food Processes - Detailed Index</a>) to HACCP
											after being hired and before handling food.</li>
										<li>Any substitute food service staff will be given instructions on the Process Approach
											(<a href="#detail">School Food Processes - Detailed Index</a>) and a
											list of necessary procedures relevant to the tasks they will be performing and the
											corresponding records to be kept.</li>

										<li>Periodic refresher training for employees will be provided on a quarterly basis.</li>
										<li>An easily accessible copy of an explanation of the Process Approach (<a href="#detail">School
											Food Processes - Detailed Index</a>) taken from 
											the <a href="../regulations/USDA_HACCP_Guidance.pdf" target="_blank">USDA HACCP guidance document</a> will be available online via the World Wide
											Web.</li>
									</ul>&nbsp;</td>
                            </tr></table>
       </div>
        <%-- Process 0 --%>	
        <div id="Process0" style="width:400px; display:none; margin-top:30px;" visible="false">
        <table>
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
									    <p align="center">
										    <strong>RECIEVE</strong><br>
										    Control Measures: Known and Approved Source, Confirm Expiration Dates</p>
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
									    <p align="center">

										    <strong>CCP: EXPIRATION DATE STAMP</strong><br>
										    Check and Record Expiration Dates</p>
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
									    <p align="center">
										    <strong>STORE</strong><br>
										    Control Measures: Proper Storage, Prevention of Cross-Contamination, Store Away
										    from Chemicals</p>
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
										    <strong>PREPARE</strong><br>
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
										    <p>
											    <strong>CCP: EXPIRATION DATE STAMP</strong><br>
											    Check and Record Expiration Dates</p>
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
										    <strong>SERVE</strong><br>
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
		    <p>

			    <b>Example: </b>No Process - No Cook (Vendor supplied bread, cookies, etc.)</p>
		    <p>
			    <img height="30" src="../../StaticContent/Images/cal_36x30.gif" width="36">
			    = Calendar Icon means that checking for an expiration date is required.
		    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
		    means that recording data (reporting) is required.</p>
		    <p>
			    * From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
			    Food Code)</p>

		    <p>
			    &nbsp;</p>&nbsp;
			  </td>
		</tr>
		</table>
		</div>
        <%-- Process 1 --%>	
       <div id="Process1" style="width:400px; display:none; margin-top:30px;" >
            <table>
            <tr>
			    <td>
			        <h4>Process 1 - No Cook</h4>			
				    <table>
							    <tr>
								    <td height="21" width="20">
								    </td>
								    <td bgcolor="#99ccff" height="22" rowspan="2" valign="top">
									    <p align="center">
										    <strong>RECIEVE</strong><br>
										    Control Measures: Known and Approved Source, Receiving Temperatures</p>

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
									    <p align="center">
										    <strong>CCP: COLD RECIEPT</strong><br>

										    Critical Limit: Hold at 41&deg; F or Below*<br>
										    Check and Record Temperatures</p>
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
									    <p align="center">
										    <strong>STORE</strong><br>
										    Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										    Store Away from Chemicals</p>
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
										    <strong>PREPARE</strong><br>
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
										    <p>
											    <strong>CCP: COLD HOLDING</strong><br>
											    Critical Limit: Hold at 41&deg; F or Below*<strong></strong><br>

											    Check and Record Temperatures</p>
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
										    <strong>SERVE</strong><br>

										    Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										    Restrict Ill Employees</div>
								    </td>
								    <td>
								    </td>
							    </tr>
						    </table>
				    <p>
					    <b>Example: </b>Process 1 - No Cook (Milk, yogurt, etc.)</p>

				    <p>
					    <img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
					    = Thermometer Icon means that taking a temperature is required.<br>
					    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
					    means that recording data (reporting) is required.</p>
				    <p>
					    * From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
					    Food Code)</p>
				    <p class="breakhere">

					    &nbsp;</p>&nbsp;
			    </td>
		    </tr>
		    </table>
	    </div>
        <%-- Process 2 --%>
         <div id="Process2" style="width:400px; display:none; margin-top:30px;" >
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
									<p align="center">
										<strong>RECIEVE</strong><br>
										Control Measures: Known and Approved Source, Receiving Temperatures</p>

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
									<p align="center">
										<strong>CCP: COLD RECIEPT</strong><br>

										Critical Limit: Hold at 41&deg; F or Below*<br>
										Check and Record Temperatures</p>
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
									<p align="center">
										<strong>STORE</strong><br>
										Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										Store Away from Chemicals</p>
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
										<strong>PREPARE</strong><br>
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
										<strong>CCP: COOK</strong><br>
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
										<p>
											<strong>CCP: HOT HOLDING</strong><br>

											Critical Limit: Hold at no less than 135&deg; F*<br>
											Check and Record Temperatures</p>
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
										<strong>SERVE</strong><br>
										Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										Restrict Ill Employees</div>
								</td>
								<td>
								</td>
							</tr>
						</table>

						<p>
							<b>Example: </b>Process 2 - Same Day Service (Mac and Cheeze, burgers, etc.)</p>
						<p>
							<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
							= Thermometer Icon means that taking a temperature is required.<br>
							<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
							means that recording data (reporting) is required.</p>
						<p>

							* From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
							Food Code)</p>
						<p class="breakhere">
							&nbsp;</p>
			</td>
		</tr>
		</table>
		</div>	
        <%-- Process 3 --%>
        <div id="Process3" style="width:400px; display:none; margin-top:30px;" >
            <table>    
            <tr>
			<td>
				<h4>Process 3 - Complex Food Preparation	</h4>		
							<table>

								<tr>
									<td height="50" valign="top" width="20">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<p align="center">
											<strong>RECIEVE</strong><br>
											Control Measures: Known and Approved Source, Receiving Temperatures</p>
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

									<td height="50">
									</td>
									<td bgcolor="#99ccff" colspan="2" rowspan="2" valign="top">
										<p align="center">
											<strong>STORE</strong><br>
											Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
											Store Away from Chemicals</p>
									</td>
									<td width="70">

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
											<strong>PREPARE</strong><br>
											Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>
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
											<strong>CCP: COOK</strong><br>
											Critical Limit: Cook to 165&deg; F or greater for no less than 15 seconds*<br>
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
											<strong>CCP: COOL</strong><br>
											Critical Limit: Cool to 70&deg; F within 2 hours and from 70&deg; F to 41&deg; F
											or lower within an additional 4 hours*<br>

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
									<td height="52" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">
											<strong>CCP: REHEAT</strong><br>

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

											<p>
												<strong>CCP: HOT HOLDING</strong><br>
												Critical Limit: Hold at no less than 135&deg; F*<br>
												Check and Record Temperatures</p>
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
											<strong>SERVE</strong><br>
											Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
											Restrict Ill Employees</div>
									</td>
									<td>

									</td>
								</tr>
							</table>
							<p>
								<b>Example: </b>Process 3 - Complex Food Prep (Scratch materials used in recipe
								and made at the school)</p>
							<p>
								<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
								= Thermometer Icon means that taking a temperature is required.<br>

								<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
								means that recording data (reporting) is required.</p>
							<p>
								* From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
								Food Code)</p>
							<p class="breakhere">
								&nbsp;</p>
					</td>
		</tr>
		</table>
		</div>	
        <%-- Menu Items --%>
        <div id="MenuItems" style="width:400px; display:none; margin-top:30px;" >
            <table>
                <tr>
                    <td valign="top" align="left" width="50%">
						<div style="FONT-WEIGHT: 600; FONT-SIZE: 12px; PADDING-BOTTOM: 7px">
                            Plan Overview
                         </div>
                     </td>
                 </tr>
                 <tr>
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Menu
                                Items&nbsp;
                            </td> 
                        </tr>   
                <tr>
                    <td>       
                        <asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1">
                     <HeaderTemplate>
                        <table> 
                            <tr>             
                                <td width="50px" align="center" ></td>
                                <td width = "150px" align="center" ></td>                                
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >                            
                            <td ><%#Eval("ItemId")%></td>
                            <td ><%#Eval("MenuItem")%></td>                            
                        </tr>                        
                     </ItemTemplate>
                     <FooterTemplate>
                     </table>
                     </FooterTemplate>
                </asp:Repeater>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        </div>
        	
        <%-- Process 0 Items --%>
        <div id="DataProcess0" style="width:400px; display:none; margin-top:30px;" >
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
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Menu
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
				        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="OdsProcess0">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <td width="50px" align="center" ></td>
                                        <td width ="150px" align="center" ></td>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td ><%#Eval("ItemId")%></td>
                                    <td ><%#Eval("MenuItem")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess0" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		       </tr>
		                <tr>
			        <td colspan="2">
				        <p><strong>CONTROL MEASURES (CCP):</strong></p>
				        <ul>
					        <li>Personal Hygiene SOP: <a href="ViewSOP.aspx?p=menu&amp;process=1&amp;SOPKey=8" target="_blank">&quot;Personal Hygiene&quot;</a></li>
					        <li>Washing Fresh Fruits and Vegetables SOP: <a href="ViewSOP.aspx?p=menu&amp;process=1&amp;SOPKey=19" target="_blank">&quot;Washing Fruits and Vegetables&quot;</a></li>
					        <li>Verifying receiving Date Markings of food SOP: <a href="ViewSOP.aspx?p=menu&amp;process=1&amp;SOPKey=11" target="_blank">&quot;Receiving 
					        Deliveries&quot;</a></li>

					        <li>Date marking of ready-to-eat food SOP: <a href="ViewSOP.aspx?p=menu&amp;process=1&amp;SOPKey=5" target="_blank">&quot;Date Marking and Ready-to-Eat, 
					        Potentially Hazardous Food&quot;</a></li>
				        </ul>&nbsp;
				     </td> 
		        </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		 </div>	
		 
        <%-- Process 1 Items --%>
        <div id="DataProcess1" style="width:400px; display:none; margin-top:30px;" >
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
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Menu
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
                                    <td ><%#Eval("ItemId")%></td>
                                    <td ><%#Eval("MenuItem")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="2" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2">
				        <p><strong>CONTROL MEASURES (CCP):</strong></p>
				        <ul>
					        <li>Cold holding - Critical limit is 41&deg; F or below SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=7" target="_blank">&quot;Holding 
					Hot and Cold Potentially Hazardous Foods&quot;</a></li>

					<li>Personal Hygiene SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=8" target="_blank">&quot;Personal Hygiene&quot;</a></li>
					<li>Washing Fresh Fruits and Vegetables SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=19" target="_blank">&quot;Washing Fruits and Vegetables&quot;</a></li>
					<li>Limiting time in the danger zone to inhibit bacterial growth and 
					toxin production (e.g., holding at room temperature for 4 hours 
					and then discarding) SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=18" target="_blank">&quot;Using 
					Time Alone as a Public Health Control to Limit Bacteria Growth in 
					Potentially Hazardous Foods&quot;</a></li>
					<li>Verifying receiving temperatures of food SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=11" target="_blank">&quot;Receiving Deliveries&quot;</a></li>
					<li>Date marking of ready-to-eat food SOP: <a href="ViewSOP.aspx?p=menu&amp;process=2&amp;SOPKey=5" target="_blank">&quot;Date Marking and Ready-to-Eat, Potentially Hazardous Food&quot;</a></li>

				        </ul>&nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
        <%-- Process 2 Items --%>
        <div id="DataProcess2" style="width:400px; display:none; margin-top:30px;" >
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
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Menu
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
                                    <td ><%#Eval("ItemId")%></td>
                                    <td ><%#Eval("MenuItem")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess2" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2">
				        <p><strong>CONTROL MEASURES (CCP):</strong></p>
				        <ul>
					        <li>Cooking to destroy bacteria and other pathogens (Critical limits 
					        are outlined above)</li>
					        <li>Hot and cold holding or limiting time in the danger zone to inhibit 
					        bacterial growth and toxin formation SOP: <a href="ViewSOP.aspx?p=menu&amp;process=3&amp;SOPKey=7" target="_blank">&quot;Holding 
					        Hot and Cold Potentially Hazardous Foods&quot;</a></li>
				        </ul>&nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
        <%-- Process 3 Items --%>
        <div id="DataProcess3" style="width:400px; display:none; margin-top:30px;" >
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
                            <td style="FONT-WEIGHT: 600; COLOR: #56895E" colspan="2">Menu
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
                                    <td ><%#Eval("ItemId")%></td>
                                    <td ><%#Eval("MenuItem")%></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="OdsProcess3" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSetByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="4" Name="nProcessId" Type="Int32" />
                </SelectParameters>
                </asp:ObjectDataSource>					
			        </td>
		                </tr>
		                <tr>
			                <td colspan="2">
				        <p><strong>CONTROL MEASURES (CCP):</strong></p>
				        <ul>
					        <li>Cooking to destroy bacteria and other pathogens (Critical limits 
					are outlined above)</li>
					<li>Reheating for hot holding, if applicable SOP: <a href="ViewSOP.aspx?p=menu&amp;process=4&amp;SOPKey=12" target="_blank">&quot;Reheating 
					Potentially Hazardous Foods&quot;</a></li>
					<li>Cooling to prevent the outgrowth of spore-forming bacteria SOP: <a href="ViewSOP.aspx?p=menu&amp;process=4&amp;SOPKey=4" target="_blank">&quot;Cooling 
					Potentially Hazardous Foods&quot;</a></li>
					<li>Hot and cold holding or limiting time in the danger zone to inhibit 
					bacterial growth and toxin formation SOP: <a href="ViewSOP.aspx?p=menu&amp;process=4&amp;SOPKey=7" target="_blank">&quot;Holding Hot and Cold Potentially Hazardous Foods&quot;</a></li>
				        </ul>&nbsp;
				     </td> 
		                </tr>
		            </table>
		            </div>
		            </td>
		         </tr>
		    </table>
		</div>	
        <%-- Plan OverView --%>		
    </div>
    <div class="Clearer"></div>    
</div>
<div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="Label1" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>

</asp:Content>

