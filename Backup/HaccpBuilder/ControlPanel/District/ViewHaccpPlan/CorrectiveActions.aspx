<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_corrective_actions" Codebehind="CorrectiveActions.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div id="container">
    <div style="overflow:visible; height:50%;">
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
    </div>
    </div>
    </form>
</body>
</html>
