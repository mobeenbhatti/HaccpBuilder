<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlanNew3" Codebehind="ViewHaccpPlanNew3.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         
		<table>
        <tr>
		    <td style="background-color:#99ccff;">
			   
				   <b> MONITORING </b>
		    </td>
		</tr>
		<tr>
		<td style=" background-color:#c0c0c0;">

				   <%-- <br />
				    <br />--%>
				    <b >Manager Responsibilities:</b>
        </td>
        </tr>
        <tr>
		<td>
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
					    week. This list MUST be submitted via the www.haccpbuilder.com website and is recorded
					    in a digital database for later review. Corrective Actions as well as review consistency
					    will be tracked and trended electronically and emails will alert the Foodservice
					    Director and Site Managers to any problems or issues that must be addressed.</p>
		</td>
		</tr>
		<tr>
		<td>			    
				    <p style=" background-color:#c0c0c0;">
					    <b >Foodservice Staff Responsibilities: </b>
				    </p>
	    </td>
	    </tr>
	    <tr>
	    <td>
				    <p>
					    &raquo; Foodservice staff is responsible for monitoring individual critical control
					    points (CCPs) in the handling and preparation of food.
				    </p>

				    <p>
					    &raquo; Foodservice staff is responsible for monitoring control points as defined
					    in the standard operating procedures (SOPs).</p>
					    
					    </td>
					    </tr>
					    </table>
					      <div style="page-break-after:always"></div>
					    <table>
					    <tr>
					    <td>
					    
				    <p class="breakhere">
					    &nbsp;</p>
				    <p style="background-color:#99ccff;">
					  
					    <b >CORRECTIVE ACTIONS </b>
				    </p>

				    <p style=" background-color:#c0c0c0;">
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
					    &raquo; The Foodservice Manager or Site Manager, or a responsible person
					    appointed by such a manager, will digitally submit a Weekly Food Safety Checklist
					    via www.haccpbuilder.com which will log any Corrective Actions taken during the reporting
					    week and as within the scope of such the Checklist.</p>
				    <p style=" background-color:#c0c0c0;">
					    <b>Training: </b>

				    </p>
				    <p>
					    &raquo; In addition to the corrective actions outlined in the SOPs, foodservice
					    staff will be trained on a continuous basis to take corrective actions when necessary.
				    </p>
				    <p>
					    &raquo; Guidance on most common specific corrective actions will be listed in this
					    food safety program and will be posted in an accessible location in the location.
				    </p>
				    <p>
					    Corrective actions for common problems are included with this Plan.</p>

				    <p>
					    * Person responsible for foodservice management and operations in the location/site.
				    </p>
				    </td>
				    </tr>
				  <tr>
		</tr> 
				    
			<tr>
			<td style="background-color:#c0c0c0;">
			Cold Holding Log
			</td>
			</tr>
		
        <tr>
			
			<td>						
												
			
				<asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource8">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>	

<tr>
		</tr>
				  <tr>
			<td style="background-color:#c0c0c0;">
			Cooling Temperature Log
			</td>
			</tr>
				  
				    <tr>
			
			<td>						
												
			
				<asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource9">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="2" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>
		<tr>
		</tr>
			  <tr>
			<td style="background-color:#c0c0c0;">
		Freezer Log	
			</td>
			</tr>	
  
   <tr>
			
			<td>						
												
			
				<asp:Repeater ID="Repeater4" runat="server" DataSourceID="ObjectDataSource11">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="7" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>
		<tr>
		</tr>	
		 <tr>
			<td style="background-color:#c0c0c0;">
		HotHolding Log
			</td>
			</tr>	
		<tr>
			
			<td>						
											
			
				<asp:Repeater ID="Repeater5" runat="server" DataSourceID="ObjectDataSource12">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="3" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>	
		<tr>
		</tr>
				 <tr>
			<td style="background-color:#c0c0c0;">
		Recieving Log
			</td>
			</tr>	
				 
				    
						<tr>
			
			<td>						
											
			
				<asp:Repeater ID="Repeater6" runat="server" DataSourceID="ObjectDataSource13">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                    <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="4" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>	
		<tr>
		</tr>    
		<tr>
			<td style="background-color:#c0c0c0;">
		Refrigeration Log
			</td>
			</tr>	
			<tr>
			
			<td>						
													
			
				<asp:Repeater ID="Repeater7" runat="server" DataSourceID="ObjectDataSource14">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                   <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="5" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>	
		<tr>
		</tr>
				<tr>
			<td style="background-color:#c0c0c0;">
		Shipping Log
			</td>
			</tr>
		<tr>
			
			<td>						
											
			
				<asp:Repeater ID="Repeater8" runat="server" DataSourceID="ObjectDataSource15">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
       
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                     <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="8" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
			</td>
		</tr>	
		
		<tr>
		</tr>
		</table>
		<table>
		<tr>
			<td style="background-color:#c0c0c0;">
		Temperature Log (corrective actions with respect to food category)
			</td>
			</tr>
			<tr>
			
			<td>						
										
			
		
				<asp:Repeater ID="rptFoodcategory" DataSourceID="SqlDataSource3" runat="server" OnItemDataBound="rptFoodCatogary_ItemDataBound">
    <ItemTemplate>
        <tr>
            <td>
           
            &raquo; <b> <%#Eval("FoodCategory")%> </b>
            
            <tr>
            </tr>
           
                <asp:HiddenField ID="hfFoodCategoryId" Value='<%# Eval("FoodCategoryId") %>' runat="server" />
                <asp:Repeater ID="rptFoodcategoryCorectiveAction" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("Name")%>
                                
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                
                
                
               
            </td>
            <tr id="trFoodCategoryCorrectiveActions" runat="server" visible="false">
            <td>
            <asp:Label ID="lblFoodCategoryCorrectiveActions" Text="No Data Found" runat="server"></asp:Label>
            </td>
            </tr>
            <tr>
            </tr>
        </tr>
    </ItemTemplate>
   
  
    
   
 <%--
    <AlternatingItemTemplate>
             <tr>
            <td >
           
                &raquo; <b> <%#Eval("FoodCategory")%> </b>
            </td>
            </tr>
            <tr>
            <td>
               <asp:Label ID="lblFoodCategoryCorrectiveActions" runat="server"></asp:Label>
            </td>
            </tr>
            <tr>
                <asp:HiddenField ID="hfFoodCategoryId" Value='<%# Eval("FoodCategoryId") %>' runat="server" />
                <asp:Repeater ID="rptFoodcategoryCorectiveAction" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("Name")%>
                             
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                
            </td>
        </tr>
    </AlternatingItemTemplate>--%>
</asp:Repeater>
             
    
             
			          
			</td>
		</tr>	

				    </table>
			<%--	  <div style="page-break-after:always"></div>--%>
				    <table>
				    <tr>
				    <td>
			
				    <p style=" background-color:#99ccff;">
					    
					    <b>REVIEW OF THE FOOD SAFETY PROGRAM<br />
					</p>
					<p>
					    </b>The food service manager will review the food safety program at
					    the beginning of each year and when any significant changes occur in the
					    operation. Additionally, the online HACCP record for each location will be updated
					    as soon as any such changes occur (e.g., a new product/menu item is added or the HACCP process
					    for a product/menu item changes due to the source of such an item or means of preparation).</p>

				    <p>
					    The checklist below will be used for the review and will be submitted electronically
					    via the www.haccpbuilder.com website.
				    </p>
				    <p style=" background-color:#c0c0c0;">
					    <b>Food Safety Program Review Checklist
					</p>
					<p><br />
					    </b>1. Documents to review<br />
					    ___ Standard Operating Procedures
					    <br />
					    ___ Food Preparation Process Charts
					    <br />

					    ___ Control Measures in the Process Approach (CCPs and SOPs)
					    <br />
					    ___ Corrective Actions
				    </p>
				    <p>
					    2. Monitoring recordkeeping.
					    <br />
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
					    7. Have there been any changes to the product/menu or operation (new equipment, etc.)?
				    </p>
				    <p>

					    8. Was the plan modified because of these changes?</p>
			    </td>
	    </tr>
		<tr>
			<td>
		        &nbsp;</td>
		</tr>
		</table>
		<div style="page-break-after:always"></div>
	<table>
        <tr>
            <!-- PLACE SOP DETAILVIEW HERE -->
            <td style="background-color:#99ccff;">
                <h2><font face="Arial">HACCP-Based SOPs</font></h2>
            </td>
        </tr>
        <tr>
            <td>
            
           <%-- <hr color="red"/>--%>
            <asp:Repeater ID="Repeater2" runat="server" 
                DataSourceID="SqlDataSource1" onitemdatabound="Repeater2_ItemDataBound">
  
                <ItemTemplate>
               
             <tr>        
                <td>
             
             
                
                    <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%">    
                            <Fields>
                                 <asp:TemplateField >
                                        <ItemTemplate>
                                            <table>
                                            <tr>
                                            <td class="SOPHeading2" style="font-size:larger">
                                            <b>  <%# DataBinder.Eval(Container.DataItem, "Title")%> </b>
                                            </td>
                                            </tr>
                                            <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> PURPOSE: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "Purpose")%>
                                            
                                            </td>
                                            </tr>
                                             <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> SCOPE: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "Scope")%>
                                            
                                            </td>
                                            </tr>
                                             <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> KEYWORDS: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "KeyWords")%>
                                            
                                            </td>
                                            </tr>
                                            
                                            
                                            
                                                <%--<div class="SOPHeading2">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                                 </div>
                                                 <div class="SOPHeading1"> <b> PURPOSE: </b> </div>
                                                   <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Purpose")%>
                                                  </div>
                                                  <div class="SOPHeading1"><b> SCOPE: </b> </div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Scope")%>
                                                  </div>
                                                  <div class="SOPHeading1"><b> KEYWORDS: </b></div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "KeyWords")%>
                                                  </div>
                                                  --%>
                                                  
                                                  <tr>
                                                  <td class="SOPHeading1">
                                                <b> INSTRUCTIONS: </b>
                                                  </td>
                                                  </tr >
                                                  <tr id="Tr1" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr2"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions2")%>
                                                  </td>
                                                  </tr>
                                                  
                                                   
                                                    <tr id="Tr3"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions3")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr4"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions3").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions4")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr5"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions5")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr6"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions6").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions6")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr7"   runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions7").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions7")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr8"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions8").ToString()) ? false : true%> '>
                                                  <td class="SOPList">
                                                 <%# (Eval("Instructions9").ToString() != "" ? "8. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions8")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr9"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions9").ToString() != "" ? "9. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions9")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr10"  runat="server"  visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions10").ToString() != "" ? "10. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions10")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr11"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions11").ToString() != "" ? "11. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions11")%>
                                                  </td>
                                                  </tr>
                                                   <tr visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions12").ToString() != "" ? "12. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions12")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr12"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions13").ToString() != "" ? "13. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions13")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr13"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions14").ToString() != "" ? "14. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions14")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr14"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions15").ToString() != "" ? "15. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions15")%>
                                                  </td>
                                                  </tr>
                                                     <tr visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions16").ToString() != "" ? "16. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions16")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr15"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions17").ToString() != "" ? "17. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions17")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr16"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions18").ToString() != "" ? "18. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions18")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr17"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions19").ToString() != "" ? "19. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions19")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr18"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions20").ToString() != "" ? "20. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions20")%>
                                                  </td>
                                                  </tr>
                                                
                                                  
                                                  
                                                 <%-- <div class="SOPHeading1"> <b> INSTRUCTIONS: </b></div>
                                                    <div class="SOPList"  visible='<%# string.IsNullOrEmpty(Eval("Instructions1").ToString()) ? false : true%>' ><%# (Eval("Instructions1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions1")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions2").ToString()) ? false : true%>'><%# (Eval("Instructions2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions2")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions3").ToString()) ? false : true%>'><%# (Eval("Instructions3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions3")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions4").ToString()) ? false : true%>'><%# (Eval("Instructions4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions4")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions5").ToString()) ? false : true%>'><%# (Eval("Instructions5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions5")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions6").ToString()) ? false : true%>'><%# (Eval("Instructions6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions6")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions7").ToString()) ? false : true%>'><%# (Eval("Instructions7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions7")%></div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions8").ToString()) ? false : true%>'>
                                                    <div class="SOPList"><%# (Eval("Instructions8").ToString() != "" ? "8. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions8")%></div>
                                                    </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'>
                                                  
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'><%# (Eval("Instructions9").ToString() != "" ? "9. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions9")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'><%# (Eval("Instructions10").ToString() != "" ? "10. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions10")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'><%# (Eval("Instructions11").ToString() != "" ? "11. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions11")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'>
                                                    
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'><%# (Eval("Instructions12").ToString() != "" ? "12. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions12")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'><%# (Eval("Instructions13").ToString() != "" ? "13. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions13")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'><%# (Eval("Instructions14").ToString() != "" ? "14. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions14")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'><%# (Eval("Instructions15").ToString() != "" ? "15. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions15")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'><%# (Eval("Instructions16").ToString() != "" ? "16. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions16")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'><%# (Eval("Instructions17").ToString() != "" ? "17. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions17")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'><%# (Eval("Instructions18").ToString() != "" ? "18. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions18")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'><%# (Eval("Instructions19").ToString() != "" ? "19. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions19")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'><%# (Eval("Instructions20").ToString() != "" ? "20. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions20")%></div>
                                                  </div>--%>
                                                 
                                                    <tr>
                                                  <td class="SOPHeading1">
                                                 <b> MONITORING:</b>
                                                 </td>
                                                  </tr>
                                                    <tr id="Tr19"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr20"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring2")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr21"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring3")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr22"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring4")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr23"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring5")%>
                                                  </td>
                                                  </tr>
                                                      <tr id="Tr24"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring6").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring6")%>
                                                  </td>
                                                  </tr>
                                                  <tr id="Tr25"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring7").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring7")%>
                                                  </td>
                                                  </tr>
                                                  
                                                     <tr>
                                                  <td class="SOPHeading1">
                                                 <b> CORRECTIVE ACTIONS:</b>
                                                 </td>
                                                  </tr>
                                                    <tr id="Tr26"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr27"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction2")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr28"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction3")%>
                                                  </td>
                                                  </tr>
                                                    <tr visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction4")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr29"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction5")%>
                                                  </td>
                                                  </tr>
                                                  
                                                  
                                                 <%-- <div class="SOPHeading1"><b> MONITORING: </b></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring1")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring2")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring3")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring4")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring5")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring6")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring7")%></div>                                            
                                                  
                                                  <div class="SOPHeading1"> <b> CORRECTIVE ACTIONS: </b> </div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction1")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction2")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction3")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction4")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction5")%></div>                                        --%>    
                                                      <tr>
                                                  <td class="SOPHeading1">
                                                 <b> VERIFICATION AND RECORD KEEPING:</b>
                                                 </td>
                                                  </tr>
                                                     <tr>
                                                  <td class="SOPList">
                                                <%# "" + DataBinder.Eval(Container.DataItem, "Verification")%>
                                                  </td>
                                                  </tr>
                                                    </table>
                                                <%--  <div class="SOPHeading1"> <b> VERIFICATION AND RECORD KEEPING: </b></div>
                                                    <div class="SOPList"><%# "" + DataBinder.Eval(Container.DataItem, "Verification")%>
                                                  </div>
                                                  <div class="SOPHeading1"></div>--%>
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
                                                <table>
                                                <tr>
                                                <td>
                                                 <div style="page-break-after:always"></div>
                                                </td>
                                                </tr>
                                                </table>
                                       </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                     
           
                 
                </td>
                

                <td><asp:HiddenField ID="hfSOPId" Value='<%# Eval("SOPId") %>' runat="server" />
                <%--<asp:Label ID="lblSOPId" Text='<%# Eval("SOPId") %>' runat="server"></asp:Label>--%>
                </td>
            </tr>


        </ItemTemplate>
           
            </asp:Repeater>
             </td>
		</tr>
		</table>
		   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetSOPsBykitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource> 
                    
                    <div style="page-break-after:always"></div>

	<%--<div style="page-break-after:always"></div>--%>
	<table>
        
        <tr>
            <td align="center" style="background-color:#99ccff; >
               <span style="font-size:larger;"> HACCP Plan Built by HACCP BUILDER </span>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
		    <td>		
		        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDSKitchenDetails" Height="50px" Width="125px">    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate>
                    <table >                    
                        <%--<tr>                                               
                            <td width="80%">
                                <asp:Label ID="lblDistrict" Text='<%# "School District: " + DataBinder.Eval(Container.DataItem,"DistrictName") %>' runat="server"></asp:Label>                
                            </td>                    
                            
                        </tr>--%>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblKitchenCity" Text='<%# "Site Location Name: " + DataBinder.Eval(Container.DataItem,"KitchenName") %>' runat="server"></asp:Label>
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
                                <asp:Label ID="lblKitchenAddress" Text='<%# "Address: " + DataBinder.Eval(Container.DataItem,"Address").ToString().Trim() %>' runat="server"></asp:Label>
                            </td>  
                       </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" Text='<%# "County: " + DataBinder.Eval(Container.DataItem,"County") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text='<%# "City: " +  DataBinder.Eval(Container.DataItem,"City") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>  
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
 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetFoodCategoriesByKitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource>
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
		<tr>
		</tr>
        <tr>
            <td align="center">
                HACCP BUILDER * 186 Washington Street * Saint Paul, MN * 55102 * Phone 612 296 2486 * Email 
                s.schany@haccpbuilder.com * Website www.haccpbuilder.com <br />
                Creators of HBflex, HBflex with Reporting and Command Central<br />
                Application Service Provider as well as Software Solutions
            </td>
        </tr> 
	</table> 
    </div>
    </form>
</body>
</html>
