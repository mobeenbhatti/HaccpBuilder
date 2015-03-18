<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_ViewHAccpPlan" Title="HACCP Builder | VIEW PLAN" Codebehind="ViewHaccpPlan.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
        <div class="Clearer"></div>
        <div class="ContentLeft" >
        <table style="margin-left:10px;">
        <tr>
			<td valign="top">						
				<span style="font-size: 20pt; color:#ff9900; padding-bottom: 20px; padding-top: 20px; font-weight: bold;">HACCP Plan</span>
				<br/>		
			</td>
		</tr>
		<%--<tr>
		    <td>
		        <asp:ImageButton ID="cmdPrint" runat="server" ImageUrl="~/images/buttons/ButtonPrint-Test.GIF" OnClientClick="PrintPage();" />
		    </td>
		</tr>--%>
		<%-- Kitchen Details --%>
		<tr>
		    <td>		
		        <asp:DetailsView ID="dtvKitchenDetails" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDSKitchenDetails" Height="50px" Width="125px">    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate>
                    <table >
                    <tr>
                        <td >
                            <b>UPDATED & POSTED</b>:
                        </td>
                    </tr>
                        <tr>                                               
                            <td width="80%">
                                <asp:Label ID="lblDistrict" Text='<%# "School District: " + DataBinder.Eval(Container.DataItem,"DistrictName") %>' runat="server"></asp:Label>                
                            </td>                    
                            
                        </tr>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblKitchenCity" Text='<%# "Kitchen Details: " + DataBinder.Eval(Container.DataItem,"KitchenName") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>                    
                             <td>
                                 <asp:Label ID="lblManager" Text='<%# "Manager: " + DataBinder.Eval(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                             </td> 
                        </tr>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblMail2" Text='<%# "Email: " + DataBinder.Eval(Container.DataItem,"EmailAddress") %>' runat="server"></asp:Label>
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblKitchenAddress" Text='<%#  DataBinder.Eval(Container.DataItem,"Address") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" Text='<%#  DataBinder.Eval(Container.DataItem,"County") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text='<%#  DataBinder.Eval(Container.DataItem,"City") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                        </tr>
                        <tr>                    
                            <td>
                                <asp:Label ID="lblPhone2" Text='<%# "Phone: " +   DataBinder.Eval(Container.DataItem,"Phone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                        
                        <tr>                  
                            <td>
                                <asp:Label ID="lblAltPhone" Text='<%# "Alternate Phone: " + DataBinder.Eval(Container.DataItem,"AltPhone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>                  
                            <td>
                                <asp:Label ID="lblFax" Text='<%# "Fax: " + DataBinder.Eval(Container.DataItem,"Fax") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
               </ItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
                <asp:SqlDataSource ID="SqlDSKitchenDetails" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetKitchenDetailsByUserId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="&quot;&quot;" Name="vchEmail" 
            SessionField="Username" Type="String" />
        <asp:SessionParameter DefaultValue="" Name="vchPassword" 
            SessionField="Password" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
            </td>
		</tr>
		<%-- Daily Participation --%>
        <tr>
		    <td>
		        <h2 style="color: #000; padding-top: 30px;">Description of Program Overview and Facility</h2>		
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
            SessionField="KitchenId" Type="String" />
    </SelectParameters>
                </asp:SqlDataSource>
            </td>
		</tr>
        <%-- Inventory Items Repeater --%>
        <tr>
			<td>						
				<h2 style="color: #000;">Inventory Items Review</h2>
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
		<%-- Categorizing Item Description --%>
        <tr>
			<td>
						<h2 style="color: #000; padding-top: 30px;">Categorizing Menu Items and Identification of 
						Control Measures and CCP's</h2>

						<p> The menu cycle is posted in the kitchen. Each menu item available for service 
						is listed in this food safety program in the table:Selected Menu Items - Categorized 
						by Process with associated CCPs - Detailed Index.</p>

						<p> When new menu items are added, the list is updated. Each item is evaluated 
						to determine which of the four processes is applicable and to identify the appropriate 
						control measures and critical control points (CCPs) using the Process Approach 
						(School Food Processes - Detailed Index).</p>

						<p> Once the determination is made for each menu item, the food service manager 
						will make the rest of the food service staff aware of the menu items and applicable 
						process and control measures by posting the Process Charts (School Food Processes 
						- Detailed Index) in the kitchen. In addition, the menu cycle, menus, recipes, 
						product directions, and charts are kept in a digital record online and are accessible 
						via the World Wide Web.</p>

						<p> <b>STAFF</b></p>

						<p> * All food service personnel will be given an overview of the Process Approach 
						(School Food Processes - Detailed Index) to HACCP after being hired and before 
						handling food.</p>

						<p> * Any substitute food service staff will be given instructions on the Process 
						Approach (School Food Processes - Detailed Index) and a list of necessary procedures 
						relevant to the tasks they will be performing and the corresponding records 
						to be kept.</p>

						<p> * Periodic refresher training for employees will be provided on a quarterly 
						basis.</p>

						<p> * An easily accessible copy of an explanation of the Process Approach (School 
						Food Processes - Detailed Index) taken from the USDA HACCP guidance document 
						will be available online via the World Wide Web.</p>

						<p class="breakhere">
							&nbsp;</p>&nbsp;</td>
	    </tr>
	    <%-- Menu Items Repeater --%>
	    <tr>
            <td>
                <h2>Menu Detail All Recipes </h2>            
                <asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1">
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;">             
            <td width="100px" align="center" ><b>Item ID</b></td>
            <td width = "150px" align="center" ><b>Item Name</b></td>
            <td width="100px" align="center" ><b>Preparation</b></td>
            <td width="150px" align="center"  ><b>Food Group</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
    </tr>
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
            </td>
        </tr>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <%-- Process 0 --%>
        <tr>
		    <td>
						<h3>Menu Detail Recipes by Process</h3>
						<h4>
							Process 0 - No Cook - No Process</h4>
						<table>
							<tr>
								<td height="352" valign="top">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tr>

											<td height="21" width="51">
												&nbsp;</td>
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

						<p class="breakhere">
							&nbsp;</p>&nbsp;</td>
		</tr>
		<%-- Process 0 Data --%>
		<tr>
			<td>						
				<h2 style="color: #000;">Selected Recipes for Process 0 No Cook - No Process</h2>
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="OdsProcess0">
                    <HeaderTemplate>
                        <table> 
                            <tr style="background-color:Silver;">             
                                <td width="100px" align="center" ><b>Item ID</b></td>
                                <td width = "150px" align="center" ><b>Item Name</b></td>
                                <td width="100px" align="center" ><b>Preparation</b></td>
                                <td width="150px" align="center"  ><b>Food Group</b></td>
                            </tr> 
                    </HeaderTemplate>
                    <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
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
		<%-- Process 1 --%>
        <tr>
			<td>
						<h4>
							Process 1 - No Cook</h4>

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

							&nbsp;</p>&nbsp;</td>
		</tr>
		<%-- Process 1 Data --%>
		<tr>
			<td>						
				<h2 style="color: #000;">Selected Recipes for Process 1 No Cook</h2>
				<asp:Repeater ID="rptProcess1" runat="server" DataSourceID="OdsProcess1">
                    <HeaderTemplate>
                        <table> 
                            <tr style="background-color:Silver;">             
                                <td width="100px" align="center" ><b>Item ID</b></td>
                                <td width = "150px" align="center" ><b>Item Name</b></td>
                                <td width="100px" align="center" ><b>Preparation</b></td>
                                <td width="150px" align="center"  ><b>Food Group</b></td>
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
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
		<%-- Process 2 --%>
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
		<%-- Process 2 Data --%>
		<tr>
			<td>						
				<h2 style="color: #000;">Selected Recipes for Process 2 Same Day Service</h2>
				<asp:Repeater ID="rptProcess2" runat="server" DataSourceID="OdsProcess2">
                    <HeaderTemplate>
                        <table> 
                            <tr style="background-color:Silver;">             
                                <td width="100px" align="center" ><b>Item ID</b></td>
                                <td width = "150px" align="center" ><b>Item Name</b></td>
                                <td width="100px" align="center" ><b>Preparation</b></td>
                                <td width="150px" align="center"  ><b>Food Group</b></td>
                            </tr> 
                    </HeaderTemplate>
                     <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
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
		<%-- Process 3 --%>
        <tr>
			<td>
							<h4>
								Process 3 - Complex Food Preparation</h4>
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
		<%-- Process 3 Data --%>
		<tr>
			<td>						
				<h2 style="color: #000;">Selected Recipes for Process 3 Complex food Preparation</h2>
				<asp:Repeater ID="rptProcess3" runat="server" DataSourceID="OdsProcess3">
                    <HeaderTemplate>
                        <table> 
                            <tr style="background-color:Silver;">             
                                <td width="100px" align="center" ><b>Item ID</b></td>
                                <td width = "150px" align="center" ><b>Item Name</b></td>
                                <td width="100px" align="center" ><b>Preparation</b></td>
                                <td width="150px" align="center"  ><b>Food Group</b></td>
                            </tr> 
                    </HeaderTemplate>
                    <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
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
		<%-- SOP's --%>
        <tr>
		    <td>
				    <b>MONITORING</b>

				    <br>
				    <br>
				    <b>Manager Responsibilities:</b>
				    <p>
					    &raquo; The foodservice manager at each site will be responsible for ensuring assigned
					    foodservice staff are properly monitoring control measures and CCPs at the required
					    frequency and are documenting required records.
				    </p>
				    <p>
					    &raquo; The manager will also be responsible for monitoring the overall performance
					    of standard operating procedures. (Specific details regarding monitoring are addressed
					    in each SOP.)
				    </p>

				    <p>
					    &raquo; Monitoring will be a constant consideration. However, the manager will use
					    the Food Safety Checklist to formally monitor foodservice staff at least once per
					    week. This list MUST be submitted via the www.schoolHACCP.com website and is recorded
					    in a digital database for later review. Corrective Actions as well as review consistency
					    will be tracked and trended electronically and emails will alert the Foodservice
					    Director and Site Managers to any problems or issues that must be addressed.</p>
				    <p>
					    <b>Foodservice Staff Responsibilities: </b>
				    </p>
				    <p>
					    &raquo; Foodservice staff is responsible for monitoring individual critical control
					    points (CCPs) in the handling and preparation of food.
				    </p>

				    <p>
					    &raquo; Foodservice staff is responsible for monitoring control points as defined
					    in the standard operating procedures (SOPs).</p>
				    <p class="breakhere">
					    &nbsp;</p>
				    <p>
					    <b>CORRECTIVE ACTIONS </b>
				    </p>

				    <p>
					    <b>Documenting Corrective Actions: </b>
				    </p>
				    <p>
					    &raquo; The foodservice director or manager* will be responsible for developing
					    predetermined corrective actions for the most common deviations from control measures
					    including critical control points (CCPs) and standard operating procedures (SOPs).
				    </p>
				    <p>
					    &raquo; The foodservice director or manager will review and update corrective actions
					    at least annually. Corrective actions for all SOPs are outlined in the written SOPs.
				    </p>

				    <p>
					    &raquo; Foodservice staff will be responsible for documenting any corrective actions
					    taken while handling and preparing food as well as any actions taken while performing
					    SOPs.</p>
				    <p>
					    &raquo; The Foodservice District Manager or Site Manager, or a responsible person
					    apppointed by such a manager, will digitally submit a Weekly Food Safety Checklist
					    via www.schoolHACCP.com which will log any Corrective Actions taken during the reporting
					    week and as within the scope of such the Checklist.</p>
				    <p>
					    <b>Training: </b>

				    </p>
				    <p>
					    &raquo; In addition to the corrective actions outlined in the SOPs, foodservice
					    staff will be trained on a continuous basis to take corrective actions when necessary.
				    </p>
				    <p>
					    &raquo; Guidance on most common specific corrective actions will be listed in this
					    food safety program and will be posted in an accessible location in the kitchen.
				    </p>
				    <p>
					    Corrective actions for common problems are included with this Plan.</p>

				    <p>
					    * Person responsible for foodservice management and operations in the school district.
				    </p>
				    <p class="breakhere">
					    &nbsp;</p>
				    <p>
					    <b>REVIEW OF THE SCHOOL FOOD SAFETY PROGRAM<br>
					    </b>The school food service manager will review the school food safety program at
					    the beginning of each school year and when any significant changes occur in the
					    operation. Additionally, the online HACCP record for each kitchen will be updated
					    as soon as any such changes occur (e.g., a new menu item is added or the HACCP process
					    for a menu item changes due to the source of such an item or means of preparation).</p>

				    <p>
					    The checklist below will be used for the review and will be submitted electronically
					    via the www.schoolHACCP.com website.
				    </p>
				    <p>
					    <b>Food Safety Program Review Checklist<br>
					    </b>1. Documents to review<br>
					    ___ Standard Operating Procedures
					    <br>
					    ___ Food Preparation Process Charts
					    <br>

					    ___ Control Measures in the Process Approach (CCPs and SOPs)
					    <br>
					    ___ Corrective Actions
				    </p>
				    <p>
					    2. Monitoring recordkeeping.
					    <br>
					    Choose at random one week from the previous four.</p>
				    <ul>
					    <li>Type of Record (SOP, CCP, Corrective Action, etc.) </li>

					    <li>Monitoring Frequency and Procedure (How often? Initiated and dated? Etc.) </li>
					    <li>Record Location (Where is record kept?) </li>
				    </ul>
				    <p>
					    3. Describe the strengths or weaknesses with the current monitoring or recordkeeping
					    methods.
				    </p>
				    <p>
					    4. Who is responsible for verifying that the required records are being completed
					    and properly maintained?
				    </p>

				    <p>
					    5. Describe the training that has been provided to support the food safety program.
				    </p>
				    <p>
					    6. Do the managers and staff demonstrate knowledge of the plan?
				    </p>
				    <p>
					    7. Have there been any changes to the menu or operation (new equipment, etc.)?
				    </p>
				    <p>

					    8. Was the plan modified because of these changes?</p>
			    </td>
	    </tr>
		<tr>
			<td>
		    &nbsp;</td>
		</tr>
        <tr>
            <td>
        	<h1><font face="Arial">HACCP-Based SOPs</font></h1>
            <hr color="red"/>
            <div align="center">
	        <h1><font face="Arial">** Elementary ** PPP Cleaning and Sanitizing Food Contact Surfaces</font></h1>
            </div>
            <p>&nbsp;</p>


            <p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all food contact surfaces are properly cleaned and sanitized.</p>


            <p><strong>SCOPE:</strong> This procedure applies to foodservice employees involved in cleaning and sanitizing food contact surfaces.</p>


            <p><strong>KEY WORDS:</strong> Food Contact Surface, Cleaning, Sanitizing</p>

            <p><strong>INSTRUCTIONS:</strong> </p>
            1. Train foodservice employees on using the procedures in this SOP.<br>
            <br>

            2. Follow State or local health department requirements.<br>
            <br>

            3. Follow manufacturer’s instructions regarding the use and maintenance of equipment and use of chemicals for cleaning and sanitizing food contact surfaces.  Refer to Storing and Using Poisonous or Toxic Chemicals SOP.<br>
            <br>

            4. If State or local requirements are based on the 2001 FDA Food Code, wash, rinse, and sanitize food contact surfaces of sinks, tables, equipment, utensils, thermometers, carts, and equipment:

            <br />•	Before each use 
            <br />•	Between uses when preparing different types of raw animal foods, such as eggs, fish, meat, and poultry 
            <br />•	Between uses when preparing ready-to-eat foods and raw animal foods, such as eggs, fish, meat, and poultry 
            <br />•	Any time contamination occurs or is suspected
            <br /><br>
            <br>

            5. Wash, rinse, and sanitize food contact surfaces of sinks, tables, equipment, utensils, thermometers, carts, and equipment using the following procedure:
            <br />•	Wash surface with detergent solution.
            <br />•	Rinse surface with clean water.
            <br />•	Sanitize surface using a sanitizing solution mixed at a concentration specified on the manufacturer’s label.  
            <br />•	Place wet items in a manner to allow air drying.
            <br /><br>
            <br>

            6. If a 3-compartment sink is used, setup and use the sink in the following manner:  
            <br />•	In the first compartment, wash with a clean detergent solution at or above 110  oF or at the temperature specified by the detergent manufacturer.

            <br />•	In the second compartment, rinse with clean water.
            <br />•	In the third compartment, sanitize with a sanitizing solution mixed at a concentration specified on the manufacturer’s label or by immersing in hot water at or above 171 oF for 30 seconds.  Test the chemical sanitizer concentration by using an appropriate test kit.<br>
            <br>

            7. If a dishmachine is used:
            <br />•	Check with the dishmachine manufacturer to verify that the information on the data plate is correct. 
            <br />•	Refer to the information on the data plate for determining wash, rinse, and sanitization (final) rinse temperatures; sanitizing solution concentrations; and water pressures, if applicable.
            <br />•	Follow manufacturer’s instructions for use.
            <br />•	Ensure that food contact surfaces reach a surface temperature of 160 oF or above if using hot water to sanitize.  <br>
            <br>














            <p><strong>MONITORING:</strong></p>
            1. Foodservice employees will:
            <br />During all hours of operation, visually and physically inspect food contact surfaces of equipment and utensils to ensure that the surfaces are clean. 
            <br /><br>
            <br>

            2. In a 3-compartment sink, on a daily basis:
            <br />•	Visually monitor that the water in each compartment is clean.
            <br />•	Take the water temperature in the first compartment of the sink by using a calibrated thermometer.  
            <br />•	If using chemicals to sanitize, test the sanitizer concentration by using the appropriate test kit for the chemical.
            <br />•	If using hot water to sanitize, use a calibrated thermometer to measure the water temperature.  Refer to Using and Calibrating Thermometers SOPs.
            <br /><br>
            <br>

            3. In a dishmachine, on a daily basis:
            <br />•	Visually monitor that the water and the interior parts of the machine are clean and free of debris. 
            <br />•	Continually monitor the temperature and pressure gauges, if applicable, to ensure that the machine is operating according to the data plate. 
            <br />•	For hot water sanitizing dishmachine, ensure that food contact surfaces are reaching the appropriate temperature by placing a piece of heat sensitive tape on a smallware item or a maximum registering thermometer on a rack and running the item or rack through the dishmachine. 
            <br />•	For chemical sanitizing dishmachine, check the sanitizer concentration on a recently washed food-contact surface using an appropriate test kit. <br>
            <br>





            <p><strong>CORRECTIVE ACTIONS:</strong></p>
            1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
            <br>

            2. Wash, rinse, and sanitize dirty food contact surfaces.  Sanitize food contact surfaces if it is discovered that the surfaces were not properly sanitized.  Discard food that comes in contact with food contact surfaces that have not been sanitized properly.<br>
            <br>

            3. In a 3-compartment sink:   
            <br />•	Drain and refill compartments periodically and as needed to keep the water clean.
            <br />•	Adjust the water temperature by adding hot water until the desired temperature is reached.

            <br />•	Add more sanitizer or water, as appropriate, until the proper concentration is achieved.  <br>
            <br>

            4. In a dishmachine:
            <br />•	Drain and refill the machine periodically and as needed to keep the water clean.  
            <br />•	Contact the appropriate individual(s) to have the machine repaired if the machine is not reaching the proper wash temperature indicated on the data plate.
            <br />•	For a hot water sanitizing dishmachine, retest by running the machine again.  If the appropriate surface temperature is still not achieved on the second run, contact the appropriate individual(s) to have the machine repaired.  Wash, rinse, and sanitize in the 3-compartment sink until the machine is repaired or use disposable single service/single-use items if a 3-compartment sink is not available.
            <br />•	For a chemical sanitizing dishmachine, check the level of sanitizer remaining in bulk container.  Fill, if needed.  “Prime” the machine according to the manufacturer’s instructions to ensure that the sanitizer is being pumped through the machine.  Retest.  If the proper sanitizer concentration level is not achieved, stop using the machine and contact the appropriate individual(s) to have it repaired.  Use a 3-compartment sink to wash, rinse, and sanitize until the machine is repaired.
            <br /><br>
            <br>



            <p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
            Foodservice employees will record monitoring activities and any corrective action taken on the Food Contact Surfaces Cleaning and Sanitizing Log.  The foodservice manager will verify that foodservice employees have taken the required temperatures and tested the sanitizer concentration by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Food Contact Surfaces Cleaning and Sanitizing Log.  The log will be kept on file for at least 1 year.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.  

            <p>&nbsp;</p>
            <table align="center">
	            <tr>
		            <td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	            </tr>
	            <tr>
		            <td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	            </tr>
	            <tr>
		            <td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	            </tr>
            </table>
            &nbsp;

<div align="center">
	<h2><font face="Arial">Controlling Time and Temperature During Preparation</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by limiting the amount of time that potentially hazardous foods are held in the temperature danger zone during preparation.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Time and Temperature Control, Food Preparation, Temperature Danger Zone</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP. <br>
<br>

2. Follow State or local health department requirements. <br>
<br>

3. Wash hands prior to preparing foods.  Refer to the Washing Hands SOP.<br>
<br>

4. Use clean and sanitized equipment and utensils while preparing food.<br>
<br>

5. Separate raw foods from ready-to-eat foods by keeping them in separate containers until ready to use and by using separate dispensing utensils.  Refer to the Preventing Cross-Contamination During Storage and Preparation SOP.<br>
<br>

6. Pre-chill ingredients for cold foods, such as sandwiches, salads, and cut melons, to 41 ºF or below before combining with other ingredients.
<br /><br>
<br>

7. Prepare foods as close to serving times as the menu will allow.<br>
<br>

8. Prepare food in small batches.<br>

<br>

9. Limit the time for preparation of any batches of food so that ingredients are not at room temperature for more than 30 minutes before cooking, serving, or being returned to the refrigerator. <br>
<br>

10. If potentially hazardous foods are not cooked or served immediately after preparation, quickly chill.  Refer to the Cooling Potentially Hazardous Foods SOP.<br>
<br>











<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer, preferably a thermocouple.<br>
<br>

2. Take at least two internal temperatures from each pan of food at various stages of preparation.<br>
<br>

3. Monitor the amount of time that food is in the temperature danger zone.  It should not exceed 4 hours.<br>
<br>






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Begin the cooking process immediately after preparation is complete for any foods that will be served hot.<br>
<br>

3. Rapidly cool ready-to-eat foods or foods that will be cooked at a later time.<br>

<br>

4. Immediately return ingredients to the refrigerator if the anticipated preparation completion time is expected to exceed 30 minutes.<br>
<br>

5. Discard food held in the temperature danger zone for more than 4 hours.<br>
<br>


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the date, product name, start and end times of production, the two temperature measurements taken, any corrective actions taken, and the amount of food prepared on the Production Log.  The foodservice manager will verify that foodservice employees are taking the required temperatures and following the proper preparation procedure by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Production Log daily.  Maintain the Production Log as directed by your State agency.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Cooking Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are cooked to the appropriate internal temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Cooking</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

2. Follow State or local health department requirements. <br>
<br>

3. If a recipe contains a combination of meat products, cook the product to the highest required temperature.<br>
<br>

4. If State or local health department requirements are based on the 2001 FDA Food Code, cook products to the following temperatures:
<br />a.	145 ºF for 15 seconds 
<br />•	Seafood, beef, and pork
<br />•	Eggs cooked to order that are placed onto a plate and immediately served  
<br />b.	155 ºF for 15 seconds
<br />•	Ground products containing beef, pork, or fish 
<br />•	Fish nuggets or sticks
<br />•	Eggs held on a steam table
<br />•	Cubed or Salisbury steaks
<br />c. 165 ºF for 15 seconds
<br />•	Poultry 
<br />•	Stuffed fish, pork, or beef  
<br />•	Pasta stuffed with eggs, fish, pork, or beef (such as lasagna or manicotti)
<br />d. 135 ºF for 15 seconds
<br />•	Fresh, frozen, or canned fruits and vegetables that are going to be held on a steam table or in a hot box
<br /><br>
<br>

















<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer, preferably a thermocouple.<br>
<br>

2. Avoid inserting the thermometer into pockets of fat or near bones when taking internal cooking temperatures.<br>
<br>

3. Take at least two internal temperatures from each batch of food by inserting the thermometer into the thickest part of the product which usually is in the center. <br>
<br>

4. Take at least two internal temperatures of each large food item, such as a turkey, to ensure that all parts of the product reach the required cooking temperature.<br>

<br>





<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Continue cooking food until the internal temperature reaches the required temperature.<br>
<br>




<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record product name, time, the two temperatures/times, and any corrective action taken on the Cooking and Reheating Temperature Log. 
<br />Foodservice manager will verify that foodservice employees has taken the required cooking temperatures by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating the temperature log at the close of each day.  The Cooking and Reheating Temperature Log is to be kept on file for a minimum of 1 year.
<br />
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
</table>
<div align="center">
	<h2><font face="Arial">Date Marking Ready-to-Eat, Potentially Hazardous Food</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To ensure appropriate rotation of ready-to-eat food to prevent or reduce foodborne illness from Listeria monocytogenes.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, store, or serve food.</p>


<p><strong>KEY WORDS:</strong> Ready-to-Eat Food, Potentially Hazardous Food, Date Marking, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.  The best practice for a date marking system would be to include a label with the product name, the day or date, and time it is prepared or opened.  Examples of how to indicate when the food is prepared or opened include:  
<br />•	Labeling food with a calendar date, such as “cut cantaloupe, 5/26/05, 8:00 a.m.,”
<br />•	Identifying the day of the week, such as “cut cantaloupe, Monday, 8:00 a.m.,” or 
<br />•	Using color-coded marks or tags, such as cut cantaloupe, blue dot, 8:00 a.m. means “cut on Monday at 8:00 a.m.” 
<br /><br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Label ready-to-eat, potentially hazardous foods that are prepared on-site and held for more than 24 hours.<br>
<br>

4. Label any processed, ready-to-eat, potentially hazardous foods when opened, if they are to be held for more than 24 hours.<br>

<br>

5. Refrigerate all ready-to-eat, potentially hazardous foods at 41 �F or below.<br>
<br>

6. Serve or discard refrigerated, ready-to-eat, potentially hazardous foods within 7 days.<br>
<br>

7. Indicate with a separate label the date prepared, the date frozen, and the date thawed of any refrigerated, ready-to-eat, potentially hazardous foods.<br>
<br>

8. Calculate the 7-day time period by counting only the days that the food is under refrigeration. For example:
<br />� On Monday, 8/1/05, lasagna is cooked, properly cooled, and refrigerated with a label that reads, �Lasagna, Cooked, 8/1/05.�
<br />� On Tuesday, 8/2/05, the lasagna is frozen with a second label that reads, �Frozen, 8/2/05.� Two labels now appear on the lasagna. Since the lasagna was held under refrigeration from Monday, 8/1/05 � Tuesday, 8/2/05, only 1 day is counted towards the 7-day time period.

<br />� On Tuesday 8/16/05 the lasagna is pulled out of the freezer. A third label is placed on the lasagna that reads, �Thawed, 8/16/05.� All three labels now appear on the lasagna. The lasagna must be served or discarded within 6 days.<br>
<br>














<p><strong>MONITORING:</strong></p>
1. A designated employee will check refrigerators daily to verify that foods are date marked and that foods exceeding the 7-day time period are not being used or stored.<br>
<br>








<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>

<br>

2. Foods that are not date marked or that exceed the 7-day time period will be discarded.<br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily. The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Handling A Food Recall</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness in the event of a product recall.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Food Recalls</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Review the food recall notice and specific instructions that have been identified in the notice.<br>
<br>

4. Communicate the food recall notice to feeding sites.<br>
<br>

5. Hold the recalled product using the following steps:
<br />•	Physically segregate the product, including any open containers, leftover product, and food items in current production that items contain the recalled product.
<br />•	If an item is suspected to contain the recalled product, but label information is not available, follow the district’s procedure for disposal.
<br /><br>
<br>

6. Mark recalled product “Do Not Use” and “Do Not Discard.” Inform the entire staff not to use the product.<br>
<br>

7. Do not destroy any USDA commodity food without official written notification from the State Distributing Agency, USDA Food Safety Inspection Services (FSIS), or State or local health department.<br>
<br>

8. Inform the school district’s public relations coordinator of the recalled product.<br>
<br>

9. Identify and record whether any of the product was received in the district, locate the food recall product by feeding site, and verify that the food items bear the product identification code(s) and production date(s) listed in the recall notice.<br>
<br>

10. Obtain accurate inventory counts of the recalled products from every feeding site, including the amount in inventory and amount used.<br>
<br>

11. Account for all recalled product by verifying inventory counts against records of food received at the feeding site.<br>
<br>










<p><strong>MONITORING:</strong></p>
1. Foodservice employees and foodservice manager will visually observe that school sites have segregated and secured all recalled products.<br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Determine if the recalled product is to be returned and to whom, or destroyed and by whom.<br>
<br>

3. Notify feeding site staff of procedures, dates, and other specific directions to be followed for the collection or destruction of the recalled product.<br>

<br>

4. Consolidate the recall product as quickly as possible, but no later than 30 days after the recall notification.<br>
<br>

5. Conform to the recall notice using the following steps:
<br />•	Report quantity and site where product is located to manufacturer, distributor, or State agency for collection.  The quantity and location of the affected USDA commodity food must be submitted to the State Distributing Agency within 10 calendars days of the recall.
<br />•	Obtain the necessary documents from the State Distributing Agency for USDA commodity foods.  Submit necessary documentation for reimbursement of food costs.
<br />•	Complete and maintain all required documentation related to the recall including:
<br />•	Recall notice
<br />•	Records of how food product was returned or destroyed
<br />•	Reimbursable costs
<br />•	Public notice and media communications
<br />•	Correspondence to and from the public health department and State agency
<br /><br>
<br>


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the name of the contaminated food, date, time, and the reason why the food was discarded on the Damaged or Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged or Discarded Product Log each day.  Maintain the Damaged or Discarded Product Logs for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>

&nbsp;

<div align="center">
	<h2><font face="Arial">Holding Hot and Cold Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all potentially hazardous foods are held under the proper temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food. </p>


<p><strong>KEY WORDS:</strong> CCross-Contamination, Temperatures, Holding, Hot Holding, Cold Holding, Storage</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

2. Follow State or local health department requirements.<br>

<br>

3. If State or local health department requirements are based on the 2001 FDA Food Code:
<br />•	Hold hot foods at 135 ºF or above 
<br />•	Hold cold foods at 41 ºF or below
<br /><br>
<br>


















<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer to measure the temperature of the food.<br>
<br>

2. Take temperatures of foods by inserting the thermometer near the surface of the product, at the thickest part, and at other various locations.<br>

<br>

3. Take temperatures of holding units by placing a calibrated thermometer in the coolest part of a hot holding unit or warmest part of a cold holding unit.<br>
<br>

4. For hot foods held for service:  
<br />•	Verify that the air/water temperature of any unit is at 135 ºF or above before use.
<br />•	Reheat foods in accordance with the Reheating for Hot Holding SOP.
<br />•	All hot potentially hazardous foods should be 135 ºF or above before placing the food out for display or service.  
<br />•	Take the internal temperature of food before placing it on a steam table or in a hot holding unit and at least every 2 hours thereafter.<br>
<br>

5. For cold foods held for service:
<br />•	Verify that the air/water temperature of any unit is at 41 ºF or below before use.
<br />•	Chill foods, if applicable, in accordance with the Cooling Potentially Hazardous Foods SOP.

<br />•	All cold potentially hazardous foods should be 41 ºF or below before placing the food out for display or service.  
<br />•	Take the internal temperature of the food before placing it onto any salad bar, display cooler, or cold serving line and at least every 2 hours thereafter.
<br /><br>
<br>

6. For cold foods in storage:  
<br />•	Take the internal temperature of the food before placing it into any walk-in cooler or reach-in cold holding unit. 
<br />•	Chill food in accordance with the Cooling Potentially Hazardous Foods SOP if the food is not 41 ºF or below.
<br />•	Verify that the air temperature of any cold holding unit is at 41 ºF or below before use and at least every 4 hours thereafter during all hours of operation.   
<br /><br>
<br>



<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>

<br>

2. For hot foods: 
<br />•	Reheat the food to 165 ºF for 15 seconds if the temperature is found to be below 135 ºF and the last temperature measurement was 135 ºF or higher and taken within the last 2 hours.  Repair or reset holding equipment before returning the food to the unit, if applicable.
<br />•	Discard the food if it cannot be determined how long the food temperature was below 135 ºF.<br>
<br>

3. For cold foods: 
<br />•	Rapidly chill the food using an appropriate cooling method if the temperature is found to be above 41 ºF and the last temperature measurement was 41 ºF or below and taken within the last 2 hours:  
<br />•	Place food in shallow containers (no more than 4 inches deep) and  uncovered on the top shelf in the back of the walk-in or reach-in cooler. 
<br />•	Use a quick-chill unit like a blast chiller. 
<br />•	Stir the food in a container placed in an ice water bath.
<br />•	Add ice as an ingredient.
<br />•	Separate food into smaller or thinner portions.<br>
<br>

4. Repair or reset holding equipment before returning the food to the unit, if applicable.<br>
<br>

5. Discard the food if it cannot be determined how long the food temperature was above 41 ºF. <br>
<br>


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record temperatures of food items and document corrective actions taken on the Hot and Cold Holding Temperature Log.  A designated foodservice employee will record air temperatures of coolers and cold holding units on the Refrigeration Logs.  The foodservice manager will verify that foodservice employees have taken the required holding temperatures by visually monitoring foodservice employees during the shift and reviewing the temperature logs at the close of each day.  The temperature logs are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Personal Hygiene</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent contamination of food by foodservice employees.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who handle, prepare, or serve food.</p>


<p><strong>KEY WORDS:</strong> Personal Hygiene, Cross-Contamination, Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Follow the Employee Health Policy.  (Employee health policy is not included in this resource.) <br>
<br>

4. Report to work in good health, clean, and dressed in clean attire.<br>
<br>

5. Change apron when it becomes soiled.  <br>
<br>

6. Wash hands properly, frequently, and at the appropriate times.<br>
<br>

7. Keep fingernails trimmed, filed, and maintained so that the edges are cleanable and not rough.<br>
<br>

8. Avoid wearing artificial fingernails and fingernail polish.<br>

<br>

9. Wear single-use gloves if artificial fingernails or fingernail polish are worn.<br>
<br>

10. Do not wear any jewelry except for a plain ring such as a wedding band.<br>
<br>

11. Treat and bandage wounds and sores immediately.  When hands are bandaged, single-use gloves must be worn.<br>
<br>

12. Cover a lesion containing pus with a bandage.  If the lesion is on a hand or wrist, cover with an impermeable cover such as a finger cot or stall and a single-use glove.<br>
<br>

13. Eat, drink, use tobacco, or chew gum only in designated break areas where food or food contact surfaces may not become contaminated.<br>
<br>

14. Taste food the correct way:
<br />•	Place a small amount of food into a separate container. 
<br />•	Step away from exposed food and food contact surfaces. 
<br />•	Use a teaspoon to taste the food.  Remove the used teaspoon and container to the dish room.  Never reuse a spoon that has already been used for tasting. 
<br />•	Wash hands immediately.
<br /><br>
<br>

15. Wear suitable and effective hair restraints while in the kitchen. <br>
<br>






<p><strong>MONITORING:</strong></p>
1. •	A designated foodservice employee will inspect employees when they report to work to be sure that each employee is following this SOP.  
<br />•	The designated foodservice employee will monitor that all foodservice employees are adhering to the personal hygiene policy during all hours of operation.
<br /><br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Discard affected food.<br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will verify that foodservice employees are following this SOP by visually observing the employees during all hours of operation.  The foodservice manager will complete the Food Safety Checklist daily.  Foodservice employees will record any discarded food on the Damaged or Discarded Product Log.  The Food Safety Checklist and Damaged or Discarded Product Logs are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Preventing Contamination at Food Bars</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all items held on food bars are protected from contamination.</p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who is responsible for maintaining and monitoring the self-service food bars. </p>


<p><strong>KEY WORDS:</strong> Contamination, Self-Service, Salad Bars, Food Bars</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements. <br>
<br>

3. Follow Employee Health Policy, Personal Hygiene, and Washing Hands SOPs. (Employee health policy is not included in this resource.)  <br>
<br>

4. Follow manufacturer’s instructions for pre-heating and pre-chilling food bar equipment before use.<br>
<br>

5. Place all exposed food under sneeze guards.<br>
<br>

6. Provide an appropriate clean and sanitized utensil for each container on the food bar.<br>
<br>

7. Replace existing containers of food with new containers when replenishing the food bar. <br>
<br>

8. Assist customers who are unable to properly use utensils.<br>

<br>

9. Ensure that customers use a clean dish when returning to the food bar.<br>
<br>

10. Store eating utensils with the handles up or in a manner to prevent customers from touching the food contact surfaces.<br>
<br>

11. Avoid using spray chemicals to clean food bars when in use.<br>
<br>










<p><strong>MONITORING:</strong></p>
1. Monitor and record temperatures of food in accordance with the Holding Hot and Cold Potentially Hazardous Foods SOP<br>
<br>

2. Continually monitor food containers to ensure that utensils are stored on a clean and sanitized surface or in the containers with the handles out of the food.<br>
<br>

3. 3.	Continually monitor customers’ use of the food bar to ensure that customers are not:
<br />•	Touching food with their bare hands
<br />•	Coughing, spitting, or sneezing on the food
<br />•	Placing foreign objects in the food
<br />•	Using the same plate for subsequent trips<br>
<br>






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>

<br>

2. Remove and discard contaminated food.<br>
<br>

3. Demonstrate to customers how to properly use utensils.<br>
<br>

4. Discard the food if it cannot be determined how long the food temperature was above 41 ºF or below 135 ºF.<br>
<br>



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

The foodservice manager will verify that foodservice employees are assigned to maintain food bars during all hours of operation.  Foodservice employees will record temperatures of food items and document corrective actions taken on the Hot and Cold Holding Temperature Log.  The foodservice manager will complete the Food Safety Checklist daily.  This form is to be kept on file for a minimum of 1 year.  Foodservice employees will document any discarded food on the Damaged or Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged or Discarded Product Log each day.  The Hot and Cold Holding Temperature Log and the Damaged or Discarded Product Log are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Preventing Cross-Contamination During Storage and Preparation</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To reduce foodborne illness by preventing unintentional contamination of food. </p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who is responsible for receiving, storing, preparing, and serving food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Preparation, Contamination, Storage, Receiving</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements. <br>
<br>

3. Wash hands properly.  Refer to the Washing Hands SOP.<br>
<br>

4. Avoid touching ready-to-eat food with bare hands.  Refer to Using Suitable Utensils When Handling Ready-To-Eat Foods SOP.<br>
<br>

5. Separate raw animal foods, such as eggs, fish, meat, and poultry, from ready-to-eat foods, such as lettuce, cut melons, and lunch meats during receiving, storage, and preparation.<br>
<br>

6. Separate different types of raw animal foods, such as eggs, fish, meat, and poultry, from each other, except when combined in recipes.<br>
<br>

7. Store raw animal foods in refrigerators or walk-in coolers by placing the raw animal foods on shelves in order of cooking temperatures with the raw animal food requiring the highest cooking temperature, such as chicken, on the lowest shelf.<br>
<br>

8. Separate unwashed fruits and vegetables from washed fruits and vegetables and other ready-to-eat foods.<br>

<br>

9. Use only dry, cleaned, and sanitized equipment and utensils.  Refer to Cleaning and Sanitizing Food Contact Surfaces SOP for proper cleaning and sanitizing procedure.<br>
<br>

10. Touch only those surfaces of equipment and utensils that will not come in direct contact with food.<br>
<br>

11. Place food in covered containers or packages, except during cooling, and store in the walk-in refrigerator or cooler.<br>
<br>

12. Designate an upper shelf of a refrigerator or walk-in cooler as the “cooling” shelf.  Uncover containers of food during the initial quick cool-down phase to facilitate cooling.<br>
<br>

13. Clean the exterior surfaces of food containers, such as cans and jars, of visible soil before opening. <br>
<br>

14. Store damaged goods in a separate location.  Refer to Segregating Damaged Goods SOP.<br>
<br>








<p><strong>MONITORING:</strong></p>

1. A designated foodservice employee will continually monitor food storage and preparation to ensure that food is not cross-contaminated.<br>
<br>








<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Separate foods found improperly stored.<br>
<br>

3. Discard ready-to-eat foods that are contaminated by raw eggs, raw fish, raw meat, or raw poultry.<br>
<br>




<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will visually observe that employees are following these procedures and taking all necessary corrective actions during all hours of operation.  The foodservice manager will periodically check the storage of foods during hours of operation and complete the Food Safety Checklist daily.  The Food Safety Checklist will be kept on file for a minimum of 1 year.  Foodservice employees will document any discarded food on the Damaged and Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged and Discarded Product Log each day.  The Damaged and Discarded Product Log is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Receiving Deliveries</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To ensure that all food is received fresh and safe when it enters the foodservice operation and to transfer food to proper storage as quickly as possible.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who handle, prepare, or serve food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Receiving, Holding, Frozen Goods, Delivery</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Schedule deliveries to arrive at designated times during operational hours.<br>
<br>

4. Post the delivery schedule, including the names of vendors, days and times of deliveries, and drivers’ names.<br>
<br>

5. Establish a rejection policy to ensure accurate, timely, consistent, and effective refusal and return of rejected goods.<br>
<br>

6. Organize freezer and refrigeration space, loading docks, and store rooms before deliveries.<br>
<br>

7. Gather product specification lists and purchase orders, temperature logs, calibrated thermometers, pens, flashlights, and clean loading carts before deliveries.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

8. Keep receiving area clean and well lighted.<br>

<br>

9. Do not touch ready-to-eat foods with bare hands.<br>
<br>

10. Determine whether foods will be marked with the date arrival or the “use by” date  and mark accordingly upon receipt.<br>
<br>

11. Compare delivery invoice against products ordered and products delivered.<br>
<br>

12. Transfer foods to their appropriate locations as quickly as possible.<br>
<br>










<p><strong>MONITORING:</strong></p>
1. Inspect the delivery truck when it arrives to ensure that it is clean, free of putrid odors, and organized to prevent cross-contamination.  Be sure refrigerated foods are delivered on a refrigerated truck.<br>
<br>

2. Check the interior temperature of refrigerated trucks.<br>

<br>

3. Confirm vendor name, day and time of delivery, as well as driver’s identification before accepting delivery.  If driver’s name is different from what is indicated on the delivery schedule, contact the vendor immediately. <br>
<br>

4. Check frozen foods to ensure that they are all frozen solid and show no signs of thawing and refreezing, such as the presence of large ice crystals or liquids on the bottom of cartons.<br>
<br>

5. Check the temperature of refrigerated foods.
<br />a.	For fresh meat, fish, and poultry products, insert a clean and sanitized thermometer into the center of the product to ensure a temperature of 41 ºF or below.  The temperature of milk should be 45 ºF or below. 
<br />b.	For packaged products, insert a food thermometer between two packages being careful not to puncture the wrapper.  If the temperature exceeds 41 ºF, it may be necessary to take the internal temperature before accepting the product.
<br />c.	For eggs, the interior temperature of the truck should be 45 ºF or below.  
<br /><br>
<br>

6. Check dates of milk, eggs, and other perishable goods to ensure safety and quality.<br>
<br>

7. Check the integrity of food packaging.<br>
<br>


<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Reject the following:
<br />•	Frozen foods with signs of previous thawing

<br />•	Cans that have signs of deterioration, such as swollen sides or ends, flawed seals or seams, dents, or rust
<br />•	Punctured packages  
<br />•	Foods with out-dated expiration dates
<br />•	Foods that are out of safe temperature zone or deemed unacceptable by the established rejection policy
<br /><br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Record the temperature and the corrective action on the delivery invoice or on the Receiving Log.  The foodservice manager will verify that foodservice employees are receiving products using the proper procedure by visually monitoring receiving practices during the shift and reviewing the Receiving Log at the close of each day.  Receiving Logs are kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Reheating Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are reheated to the appropriate internal temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Reheating, Holding, Hot Holding</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

2. Follow State or local health department requirements. <br>
<br>

3. If State or local requirements are based on the 2001 FDA Food Code, heat processed, ready-to-eat foods from a package or can, such as canned green beans or prepackaged breakfast burritos, to an internal temperature of at least 135 ºF for 15 seconds for hot holding.  <br>
<br>

4. Reheat the following products to 165 ºF for 15 seconds:
<br />•	Any food that is cooked, cooled, and reheated for hot holding 
<br />•	Leftovers reheated for hot holding
<br />•	Products made from leftovers, such as soup
<br />•	Precooked, processed foods that have been previously cooled
<br /><br>
<br>

5. Reheat food for hot holding in the following manner if using a microwave oven: 
<br />•	Heat processed, ready-to-eat foods from a package or can to at least 135 ºF for 15 seconds
<br />•	Heat leftovers to 165 ºF for 15 seconds
<br />•	Rotate (or stir) and cover foods while heating 
<br />•	Allow to sit for 2 minutes after heating 
<br /><br>
<br>

6. Reheat all foods rapidly.  The total time the temperature of the food is between 41 ºF and 165 ºF may not exceed 2 hours. <br>

<br>

7. Serve reheated food immediately or transfer to an appropriate hot holding unit.<br>
<br>














<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer.<br>
<br>

2. Take at least two internal temperatures from each pan of food.  <br>
<br>






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Continue reheating and heating food if the internal temperature does not reach the required temperature.<br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

Foodservice employees will record product name, time, the two temperatures/times, and any corrective action taken on the Cooking and Reheating Temperature Log.  Foodservice manager will verify that foodservice employees have taken the required reheating temperatures by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Cooking and Reheating Temperature Log at the close of each day.  The temperature logs are kept on file for a minimum of 1 year.  
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Serving Food</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are served in a sanitary manner.
<br />
<br /></p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who serve food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Service</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Follow the employee health policy.  (Employee health policy is not included in this resource.)  <br>
<br>

4. Wash hands before putting on gloves, each time the gloves are changed, when changing tasks, and before serving food with utensils.  Refer to the Washing Hands SOP.<br>
<br>

5. Avoid touching ready-to-eat foods with bare hands.  Refer to the Using Suitable Utensils when Handling Ready-To-Eat Foods SOP.<br>
<br>

6. Handle plates by the edge or bottom; cups by the handle or bottom; and utensils by the handles.<br>
<br>

7. Store utensils with the handles up or by other means to prevent contamination.<br>

<br>

8. Hold potentially hazardous food at the proper temperature.  Refer to the Holding Hot and Cold Potentially Hazardous Foods SOP.<br>
<br>

9. Serve food with clean and sanitized utensils.<br>
<br>

10. Store in-use utensils properly.  Refer to the Storing In-Use Utensils SOP.<br>
<br>

11. Date mark and cool potentially hazardous foods or discard leftovers.  Refer to the Date Marking Ready-to-Eat, Potentially Hazardous Foods, and Cooling Potentially Hazardous Foods SOPs. <br>
<br>











<p><strong>MONITORING:</strong></p>
1. A designated foodservice employee will visually observe that food is being served in a manner that prevents contamination during all hours of service.<br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Replace improperly handled plates, cups, or utensils.<br>
<br>

3. Discard ready-to-eat food that has been touched with bare hands.<br>
<br>

4. Follow the corrective actions identified in the Washing Hands; Using Suitable Utensils When Handling Ready-To-Eat Foods; Date Marking Ready-to-Eat, Potentially Hazardous Foods; Cooling Potentially Hazardous Foods; and Holding Hot and Cold Potentially Hazardous Foods SOPs.<br>
<br>



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will periodically check the storage and use of utensils during service.  In addition, the foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>

		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Storing and Using Poisonous or Toxic Chemicals</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by chemical contamination.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who use chemicals in the kitchen.</p>


<p><strong>KEY WORDS:</strong> Chemicals, Cross-Contamination, Contamination, Material Safety Data Sheet</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Designate a location for storing the Material Safety Data Sheets (MSDS).<br>
<br>

4. Follow manufacturer’s directions for specific mixing, storing, and first aid instructions on the chemical containers in the MSDS. <br>
<br>

5. Label and date all poisonous or toxic chemicals with the common name of the substance. <br>
<br>

6. Store all chemicals in a designated secured area away from food and food contact surfaces using spacing or partitioning. <br>
<br>

7. Limit access to chemicals by use of locks, seals, or key cards.<br>
<br>

8. Maintain an inventory of chemicals.<br>

<br>

9. Store only chemicals that are necessary to the operation and maintenance of the kitchen.<br>
<br>

10. Mix, test, and use sanitizing solutions as recommended by the manufacturer and the  State or local health department.<br>
<br>

11. Use the appropriate chemical test kit to measure the concentration of sanitizer each time a new batch of sanitizer is mixed. <br>
<br>

12. Do not use chemical containers for storing food or water.<br>
<br>

13. Use only hand sanitizers that comply with the 2001 FDA Food Code.  Confirm with the manufacturer that the hand sanitizers used meet the requirements of the 2001 FDA Food Code.<br>
<br>

14. Label and store first aid supplies in a container that is located away from food or food contact surfaces. <br>
<br>

15. Label and store medicines for employee use in a designated area and away from food contact surfaces.  Do not store medicines in food storage areas.<br>
<br>

16. Store refrigerated medicines in a covered, leak proof container where they are not accessible to children and cannot contaminate food. <br>
<br>





<p><strong>MONITORING:</strong></p>
1. Foodservice employees and foodservice manager will visually observe that chemicals are being stored, labeled, and used properly during all hours of operation. <br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Discard any food contaminated by chemicals.<br>
<br>

3. Label and properly store any unlabeled or misplaced chemicals. <br>
<br>



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is completed.  Foodservice employees will record the name of the contaminated food, date, time, and the reason why the food was discarded on the Damaged and Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged and Discarded Product Log each day.  The Food Safety Checklist and Damaged and Discarded Product Logs are kept on file for a minimum of 1 year. 
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>

&nbsp;

<div align="center">
	<h2><font face="Arial">Transporting Food to Remote Sites (Satellite Kitchens)</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that food temperatures are maintained during transportation and contamination is prevented.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who transport food from a central kitchen to remote sites (satellite kitchens).</p>


<p><strong>KEY WORDS:</strong> Hot Holding, Cold Holding, Reheating, Cooling, Transporting Food</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  <br>
<br>

2. Follow State or local health department requirements. <br>

<br>

3. If State or local health department requirements are based on the 2001 FDA Food Code:
<br />•	Keep frozen foods frozen during transportation.
<br />•	Maintain the temperature of refrigerated, potentially hazardous foods at 41 ºF or below and cooked foods that are transported hot at 135 ºF or above.
<br /><br>
<br>

4. Use only food carriers for transporting food approved by the National Sanitation Foundation International or that have otherwise been approved by the state or local health department.<br>
<br>

5. Prepare the food carrier before use:
<br />•	Ensure that all surfaces of the food carrier are clean.
<br />•	Wash, rinse, and sanitize the interior surfaces.
<br />•	Ensure that the food carrier is designed to maintain cold food temperatures at 
<br />41 ºF and hot food temperatures at 135 ºF or above.

<br />•	Place a calibrated stem thermometer in the warmest part of the carrier if used for transporting cold food, or the coolest part of the carrier if used for transporting hot food.  Refer to the Using and Calibrating Thermometers SOP.
<br />•	Pre-heat or pre-chill the food carrier according to the manufacturer’s recommendations.
<br /><br>
<br>

6. Store food in containers suitable for transportation.  Containers should be:
<br />•	Rigid and sectioned so that foods do not mix
<br />•	Tightly closed to retain the proper food temperature
<br />•	Nonporous to avoid leakage
<br />•	Easy-to-clean or disposable
<br />•	Approved to hold food
<br /><br>
<br>

7. Place food containers in food carriers and transport the food in clean trucks, if applicable, to remote sites as quickly as possible.<br>
<br>

8. Follow Receiving Deliveries SOP when food arrives at remote site.<br>
<br>













<p><strong>MONITORING:</strong></p>
1. Check the air temperature of the food carrier to ensure that the temperature suggested by the manufacturer is reached prior to placing food into it.<br>
<br>

2. Check the internal temperatures of food using a calibrated thermometer before placing it into the food carrier.  Refer to the Holding Hot and Cold Potentially Hazardous Foods SOP for the proper procedures to follow when taking holding temperatures.<br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br>
<br>

2. Continue heating or chilling food carrier if the proper air temperature is not reached.<br>
<br>

3. Reheat food to 165 ºF for 15 seconds if the internal temperature of hot food is less than 135 ºF.  Refer to the Reheating Potentially Hazardous Foods SOP.<br>
<br>

4. Cool food to 41 ºF or below using a proper cooling procedure if the internal temperature of cold food is greater than 41 ºF.  Refer to the Cooling Potentially Hazardous Foods SOP for the proper procedures to follow when cooling food.<br>
<br>

5. Discard foods held in the danger zone for greater than 4 hours.<br>
<br>


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Before transporting food to remote sites, foodservice employees will record food carrier temperature, food product name, time, internal temperatures, and any corrective action taken on the Hot and Cold Holding Temperature Log.  Upon receipt of food at remote sites, foodservice employees will record receiving temperatures and corrective action taken on the Receiving Log.  The foodservice manager at central kitchens will verify that foodservice employees are following this SOP by visually observing employees and reviewing and initialing the Hot and Cold Holding Temperature Log daily.  The foodservice manager at the remote site(s) will verify that foodservice employees are receiving foods at the proper temperature and following the proper receiving procedures by visually observing receiving practices during the shift and reviewing and initialing the Receiving Log daily.  All logs are kept on file for a minimum of 1 year.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Using and Calibrating Thermometers</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that the appropriate type of thermometer is used to measure internal product temperatures and that thermometers used are correctly calibrated for accuracy.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, cook, and cool food.</p>


<p><strong>KEY WORDS:</strong> Thermometers, Calibration</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Follow the food thermometer manufacturer’s instructions for use.  Use a food thermometer that measures temperatures from 0 ºF (-18 ºC) to 220 ºF (104 ºC) and is appropriate for the temperature being taken.  For example:
<br />•	Temperatures of thin products, such as hamburgers, chicken breasts, pizza, filets, nuggets, hot dogs, and sausage patties, must be taken using a thermistor or thermocouple with a thin probe.
<br />•	Bimetallic, dial-faced stem thermometers are accurate only when measuring temperatures of thick foods.  They may not be used to measure temperatures of thin foods.  A dimple mark located on the stem of the thermometer indicates the maximum food thickness that can be accurately measured.
<br />•	Use only oven-safe, bimetallic thermometers when measuring temperatures of food while cooking in an oven.
<br /><br>
<br>

4. Have food thermometers easily-accessible to foodservice employees during all hours of operation.<br>

<br>

5. Clean and sanitize food thermometers before each use.  Refer to the Cleaning and Sanitizing Food Contact Surfaces SOP for the proper procedure to follow. <br>
<br>

6. Store food thermometers in an area that is clean and where they are not subject to contamination.<br>
<br>















<p><strong>MONITORING:</strong></p>
1. Foodservice employees will use either the ice-point method or boiling-point method to verify the accuracy of food thermometers.  This is known as calibration of the thermometer.<br>
<br>

2. To use ice-point method:
<br />•	Insert the thermometer probe into a cup of crushed ice.
<br />•	Add enough cold water to remove any air pockets that might remain.

<br />•	Allow the temperature reading to stabilize before reading temperature.  
<br />•	Temperature measurement should be 32 ºF (+ 2 ºF) [or 0 ºC (+ 1 ºC)].  If not, adjust according to manufacturer’s instructions.
<br /><br>
<br>

3. To use boiling-point method:
<br />•	Immerse at least the first two inches of the probe into boiling water.
<br />•	Allow the temperature reading to stabilize before reading temperature.
<br />•	Reading should be 212 ºF (+ 2 ºF) [or 100 ºC (+ 1 ºC)].  This reading may vary at higher altitudes.  If adjustment is required, follow manufacturer’s instructions.
<br /><br>
<br>

4. Foodservice employees will check the accuracy of the food thermometers:
<br />•	At regular intervals (at least once per week)
<br />•	If dropped
<br />•	If used to measure extreme temperatures, such as in an oven
<br />•	Whenever accuracy is in question

<br /><br>
<br>





<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. For an inaccurate, bimetallic, dial-faced thermometer, adjust the temperature by turning the dial while securing the calibration nut (located just under or below the dial) with pliers or a wrench.<br>
<br>

3. For an inaccurate, digital thermometer with a reset button, adjust the thermometer according to manufacturer’s instructions.<br>
<br>

4. If an inaccurate thermometer cannot be adjusted on-site, discontinue using it, and follow manufacturer’s instructions for having the thermometer calibrated.<br>
<br>

5. Retrain employees who are using or calibrating food thermometers improperly.<br>
<br>


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the calibration temperature and any corrective action taken, if applicable, on the Thermometer Calibration Log each time a thermometer is calibrated.  The foodservice manager will verify that foodservice employees are using and calibrating thermometers properly by making visual observations of the employees during the calibration process and all operating hours.  The foodservice manager will review and initial the Calibration Log daily.  The Calibration Log will be kept on file a minimum of 1 year. The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>

<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Using Suitable Utensils When Handling Ready-to-Eat Foods</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness due to hand-to-food cross-contamination.   </p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, handle, or serve food.</p>


<p><strong>KEY WORDS:</strong> Ready-to-Eat Food, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Use proper handwashing procedures to wash hands and exposed arms prior to preparing or handling food or at anytime when the hands may have become contaminated.<br>
<br>

4. Do not use bare hands to handle ready-to-eat foods at any time unless washing fruits and vegetables. <br>
<br>

5. Use suitable utensils when working with ready-to-eat food.  Suitable utensils may include:
<br />•	Single-use gloves
<br />•	Deli tissue
<br />•	Foil wrap
<br />•	Tongs, spoodles, spoons, and spatulas 
<br /><br>
<br>

6. Wash hands and change gloves: 
<br />•	Before beginning food preparation
<br />•	Before beginning a new task
<br />•	After touching equipment such as refrigerator doors or utensils that have not been cleaned and sanitized
<br />•	After contacting chemicals

<br />•	When interruptions in food preparation occur, such as when answering the telephone or checking in a delivery
<br />•	When handling money
<br />•	Anytime a glove is torn, damaged, or soiled
<br />•	Anytime contamination of a glove might have occurred
<br /><br>
<br>















<p><strong>MONITORING:</strong></p>
1. A designated foodservice employee will visually observe that gloves or suitable utensils are used and changed at the appropriate times during all hours of operation.<br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Discard ready-to-eat food touched with bare hands. <br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

The foodservice manager will verify that foodservice workers are using suitable utensils by visually monitoring foodservice employees during all hours of operation.  The foodservice manager will complete the Food Safety Checklist daily.  The designated foodservice employee responsible for monitoring will record any discarded food on the Damaged and Discarded Product Log.  The Food Safety Checklist and Damaged and Discarded Food Log are kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Using Time Alone as a Public Health Control to Limit Bacteria Growth in Potentially Hazardous Foods</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that potentially hazardous foods are not held in the temperature danger zone for more than 4 hours before being cooked or served.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees that handle, prepare, cook, and serve food.</p>


<p><strong>KEY WORDS:</strong> Temperatures, Holding, Time As a Public Health Control</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. If State or local health department requirements are based on the 2001 FDA Food Code, establish written procedures that clearly identify the:
<br />•	Specific foods for which time rather than temperature will be used to limit bacteria growth.
<br />•	Corrective procedures that are followed to ensure that foods are cooled properly.  Refer to the Cooling Potentially Hazardous Foods SOP.
<br />•	Marking procedures used to indicate the time that is 4 hours past the point when the food is removed from temperature control, such as an oven or refrigerator.

<br />•	Procedures that are followed when food is in the danger zone for greater than 4 hours.
<br /><br>
<br>

4. Cook raw potentially hazardous food within 4 hours past the point when the food is removed from temperature control.<br>
<br>

5. Serve or discard cooked or ready-to-eat food within 4 hours past the time when the food is removed from temperature control.<br>
<br>

6. Avoid mixing different batches of food together in the same container.  If different batches of food are mixed together in the same container, use the time associated with the first batch of food as the time by which to cook, serve, or discard all the food in the container.<br>
<br>















<p><strong>MONITORING:</strong></p>
1. Foodservice employees will continually monitor that foods are properly marked or identified with the time that is 4 hours past the point when the food is removed from temperature control. <br>

<br>

2. Foodservice employees will continually monitor that foods are cooked, served, or discarded by the indicated time.<br>
<br>







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Discard unmarked or unidentified food or food that is noted to exceed the 4-hour limit.<br>
<br>





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will mark or otherwise identify food as specified in the Instructions Section of this SOP.  The foodservice manager will verify that foodservice employees are following this procedure by visually monitoring foodservice employees and food handling during the shift.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Washing Fruits and Vegetables</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent or reduce risk of foodborne illness or injury by contaminated fruits and vegetables.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Fruits, Vegetables, Cross-Contamination, Washing</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Wash hands using the proper procedure.<br>
<br>

4. Wash, rinse, sanitize, and air-dry all food-contact surfaces, equipment, and utensils that will be in contact with produce, such as cutting boards, knives, and sinks.<br>
<br>

5. Follow manufacturer’s instructions for proper use of chemicals.<br>

<br>

6. Wash all raw fruits and vegetables thoroughly before combining with other ingredients, including:
<br />•	Unpeeled fresh fruit and vegetables that are served whole or cut into pieces.
<br />•	Fruits and vegetables that are peeled and cut to use in cooking or served ready-to-eat.  
<br /><br>
<br>

7. Wash fresh produce vigorously under cold running water or by using chemicals that comply with the 2001 FDA Food Code.  Packaged fruits and vegetables labeled as being previously washed and ready-to-eat are not required to be washed.  <br>
<br>

8. Scrub the surface of firm fruits or vegetables such as apples or potatoes using a clean and sanitized brush designated for this purpose. <br>
<br>

9. Remove any damaged or bruised areas.<br>

<br>

10. Label, date, and refrigerate fresh-cut items.<br>
<br>

11. Serve cut melons within 7 days if held at 41 ºF or below.  Refer to the Date Marking Ready-to-Eat, Potentially Hazardous Food SOP.  <br>
<br>

12. Do not serve raw seed sprouts to highly susceptible populations such as preschool-age children.<br>
<br>









<p><strong>MONITORING:</strong></p>
1. The foodservice manager will visually monitor that fruits and vegetables are being properly washed, labeled, and dated during all hours of operation.  <br>
<br>

2. Foodservice employees will check daily the quality of fruits and vegetables in cold storage.<br>
<br>






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Remove unwashed fruits and vegetables service and washed immediately before being served.<br>
<br>

3. Label and date fresh cut fruits and vegetables.<br>

<br>

4. Discard cut melons held after 7 days.<br>
<br>



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is being conducted as specified in this SOP.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
	<tr>
		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

	</tr>
</table>
&nbsp;

<div align="center">
	<h2><font face="Arial">Washing Hands</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by contaminated hands.</p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who handle, prepare, and serve food.</p>


<p><strong>KEY WORDS:</strong> Handwashing, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br>
<br>

2. Follow State or local health department requirements.<br>
<br>

3. Post handwashing signs or posters in a language understood by all foodservice staff near all handwashing sinks, in food preparation areas, and restrooms.<br>
<br>

4. Use designated handwashing sinks for handwashing only.  Do not use food preparation, utility, and dishwashing sinks for handwashing.<br>
<br>

5. Provide warm running water, soap, and a means to dry hands.  Provide a waste container at each handwashing sink or near the door in restrooms.<br>

<br>

6. Keep handwashing sinks accessible anytime employees are present.<br>
<br>

7. Wash hands:
<br />•	Before starting work
<br />•	During food preparation
<br />•	When moving from one food preparation area to another
<br />•	Before putting on or changing gloves
<br />•	After using the toilet
<br />•	After sneezing, coughing, or using a handkerchief or tissue
<br />•	After touching hair, face, or body
<br />•	After smoking, eating, drinking, or chewing gum or tobacco
<br />•	After handling raw meats, poultry, or fish
<br />•	After any clean up activity such as sweeping, mopping, or wiping counters

<br />•	After touching dirty dishes, equipment, or utensils
<br />•	After handling trash
<br />•	After handling money
<br />•	After any time the hands may become contaminated
<br /><br>
<br>

8. Follow proper handwashing procedures as indicated below:
<br />•	Wet hands and forearms with warm, running water at least 100 ºF and apply soap.
<br />•	Scrub lathered hands and forearms, under fingernails, and between fingers for at least 10-15 seconds.  Rinse thoroughly under warm running water for 5-10 seconds.
<br />•	Dry hands and forearms thoroughly with single-use paper towels.
<br />•	Dry hands for at least 30 seconds if using a warm air hand dryer.
<br />•	Turn off water using paper towels.
<br />•	Use paper towel to open door when exiting the restroom.
<br /><br>
<br>

9. Follow FDA recommendations when using hand sanitizers.  These recommendations are as follows:
<br />•	Use hand sanitizers only after hands have been properly washed and dried. 
<br />•	Use only hand sanitizers that comply with the 2001 FDA Food Code.  Confirm with the manufacturers that the hand sanitizers used meet these requirements. 
<br />•	Use hand sanitizers in the manner specified by the manufacturer.
<br /><br>
<br>












<p><strong>MONITORING:</strong></p>
1. A designated employee will visually observe the handwashing practices of the foodservice staff during all hours of operation. <br>
<br>

2. The designated employee will visually observe that handwashing sinks are properly supplied during all hours of operation.<br>
<br>






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br>
<br>

2. Ask employees that are observed not washing their hands at the appropriate times or using the proper procedure to wash their hands immediately. <br>
<br>

3. Retrain employee to ensure proper handwashing procedure.<br>
<br>



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is being conducted as specified.  The Food Safety Checklist is to be kept on file for a minimum of 1 year. 
<p>&nbsp;</p>
<table align="center">
	<tr>
		<td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>

		<td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
	<tr>
		<td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
	</tr>
</table>

&nbsp;
<br/>
&nbsp;</td>
		</tr>
	</table>
	</div>
</asp:Content>

