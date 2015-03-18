<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan1" Codebehind="HaccpPlan1.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Safety Management System Overview </title>
    <link href="../../App_Themes/Default/Default3.css" type="text/css" />
</head>
<body style="margin:0px; background:#999999;">
    <form id="form1" runat="server">   
     <div class="haccpInner">
        <%-- Kitchen Details --%>
        <table width="100%" >
        <tr>
			<td valign="top" align="center" >						
				<span style=" padding-bottom: 20px; padding-top: 20px; font-weight: bold;" class="haccpHeading1">
			    Food Safety Management System Overview and HACCP Plan<br />
                HACCP Builder Online Real-Time Solution
			    </span>
				<br/>		
			</td>
			<td class="haccpText">
			</td>
			<td class="haccpText">
			</td>
		</tr>	
		<tr>	
		<td >
		    <hr />
		</td>
		</tr>			
		<tr>		    
             <td align="center"  class="BackGround1">		             
                   <b>DESCRIPTION OF PROGRAM OVERVIEW AND FACILITY:</b>                      
             </td>		    
		</tr>		
		<tr>
		    <td class="haccpText" align="center" >	
		        <asp:Repeater ID="rptKitchenDetails" runat="server" DataSourceID="SqlDSKitchenDetails"	>
		        <ItemTemplate>
		            <table  > 
                        <tr>                      
                            <td class="haccpText" align="left">
                                <asp:Label ID="lblKitchenCity" Text='<%# "Site Location Name: " + DataBinder.Eval(Container.DataItem,"KitchenName") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                        </tr>
                        <tr>                    
                             <td class="haccpText" align="left">
                                 <asp:Label ID="lblManager" Text='<%# "Manager: " + DataBinder.Eval(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                             </td> 
                        </tr>
                         <tr>
                        </tr>
                        <tr>                       
                            <td class="haccpText" align="left">
                                <asp:Label ID="lblMail2" Text='<%# "Email: " + DataBinder.Eval(Container.DataItem,"Email") %>' runat="server"></asp:Label>
                            </td>                            
                        </tr>
                         <tr>
                        </tr>
                        <tr>
                            <td class="haccpText" align="left">
                                <asp:Label ID="lblKitchenAddress" Text='<%# "Address: " + DataBinder.Eval(Container.DataItem,"KitchenAddress").ToString().Trim() %>' runat="server"></asp:Label>
                            </td>  
                       </tr>
                       <tr>
                        </tr>
                      <tr>
                            <td class="haccpText" align="left">
                                <asp:Label ID="Label3" Text='<%# "Country: " + DataBinder.Eval(Container.DataItem,"Country") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                        </tr>
                      <tr>
                            <td class="haccpText" align="left">
                                <asp:Label ID="Label1" Text='<%# "State: " + DataBinder.Eval(Container.DataItem,"State") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                         <tr>
                        </tr>
                        <tr>
                            <td class="haccpText" align="left">
                                <asp:Label ID="Label2" Text='<%# "City: " +  DataBinder.Eval(Container.DataItem,"KitchenCity") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                        </tr>
                        <tr>                    
                            <td class="haccpText" align="left">
                                <asp:Label ID="lblPhone2" Text='<%# "Phone: " +   DataBinder.Eval(Container.DataItem,"Phone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                        </tr>
                        <tr>                  
                            <td class="haccpText" align="left">
                                <asp:Label ID="lblFax" Text='<%# "Fax: " + DataBinder.Eval(Container.DataItem,"Fax") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                        </tr>
                    </table>
		        </ItemTemplate>
		        </asp:Repeater>		        
                  <asp:SqlDataSource ID="SqlDSKitchenDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetContactDetailsByUserId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="&quot;&quot;" Name="vchUserId" 
                            SessionField="Username" Type="String" />
                        <asp:SessionParameter DefaultValue="" Name="vchPassword" 
                            SessionField="Password" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
		</tr>
		<tr>	
		<td >
		    <hr />
		</td>
		</tr></table>
		<div style="page-break-after:always"></div>	
		<table width="100%" >
		<tr>		    
             <td align="left"  class="BackGround1">		             
                   <b>Food Safety Program Overview</b>                      
             </td>		    
		</tr>			
		<tr>		
		<td>
		    <asp:Repeater ID="rptKitchenPlan" runat="server"  DataSourceID="odsKitchenPlan">       
             <ItemTemplate>
                 <div runat="server" id="dvProgram" class="haccpText"><%#Eval("PlanText")%></div> 
            </ItemTemplate>   
            </asp:Repeater> 	
	         <asp:ObjectDataSource ID="odsKitchenPlan" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanByCategorySortId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                <SelectParameters>            
                    <asp:Parameter DefaultValue="1" Name="nCategoryId" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                     <asp:Parameter DefaultValue="1" Name="nPlanSortId" Type="Int32" />
                </SelectParameters>
             </asp:ObjectDataSource>
		</td>
		</tr>
		<tr>	
		<td>
		    <hr />
		</td>
		</tr>		
	</table>	 
        <div style="page-break-after:always"></div>
         <%-- Procedural Question --%>
		<table  width="100%">
       
        <tr>
			<td class="BackGround1" >						
				<b>HACCP PROCEDURAL QUESTIONS AND ANSWERS</b>									
			</td>		
		</tr>	
		<tr><td></td></tr>	
		<%-- Buyes Specs --%>
		<tr>
		    <td class="haccpHeading">
		       <b> HACCP Procedural Questions:  Buyer Specifications</b>
		    </td>
		</tr>
		<tr><td></td></tr> 
		<tr>
		    <td class="haccpText">
		     <b>   Describe Establishment Requirements for Vendor Selection</b>
		    </td>
		</tr>
		<tr>
		    <td class="haccpText">
		        <asp:Label ID="lblQuestion1" Text="" runat="server"></asp:Label>
		    </td>
		</tr>	
		<tr><td></td></tr> 
		<tr><td></td></tr>	
		<%-- Allergen Management --%>
		<tr>
		    <td class="haccpHeading">
		       <b> HACCP Procedural Questions:  Allergen Management</b>
		    </td>
		</tr>
		<tr><td></td></tr> 
		<tr>
		    <td class="haccpText">
		       <p><b> Do any Outputs contain potential allergen Inputs</b></p>
		       <p><asp:RadioButton ID="rdlAllergenYes" Enabled="false" runat="server" Text="Yes" />
		       <asp:RadioButton ID="rdlAllergenNo" Enabled="false" runat="server" Text="No" />
		       <asp:RadioButton ID="rdlAllergenNA" Enabled="false" runat="server" Text="NA" />
		       </p>
		    </td>		   
		</tr>
		<tr>
		    <td class="haccpText">
		       <b> If yes, describe allergen Inputs</b>
		    </td>
		    
		</tr>
		<tr>
		    <td class="haccpText">
		        <asp:Label ID="lblQuestion2" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		    <td class="haccpText">
		       <b> Please describe procedures for allergen control:</b>
		    </td>		    
		</tr>
		<tr>
		    <td class="haccpText">
		        <asp:Label ID="lblQuestion2b" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		<tr><td></td></tr>
		<tr><td></td></tr> 
		</tr>
		<%-- Safety Hazard --%>
		<tr>
		    <td class="haccpHeading">
		       <b> HACCP Procedural Questions:  Safety Hazard Procedures</b>
		    </td>
		</tr>
		<tr><td></td></tr> 
		<tr>
		    <td class="haccpText">
		      <b>Describe basic procedures to eliminate Outputs from contamination  by biological, chemical and physical food safety hazards</b>
		    </td>
		</tr>
		<tr>
		    <td class="haccpText">
		        <asp:Label ID="lblQuestion3" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr><td></td></tr> 
		<%-- Soiled And Unsanitized --%>
		<tr>
		    <td class="haccpHeading">
		       <b> HACCP Procedural Questions:  Soiled and Unsanitized Surfaces</b>
		    </td>
		</tr>
		<tr><td></td></tr> 
		<tr>
		    <td class="haccpText">
		       <b> Do soiled and unsanitized surfaces of equipment and utensils contact raw or cooked food</b>
		       </br>
		        <asp:RadioButton ID="rdbSoilYes" Enabled="false" TextAlign="Right" runat="server" Text="Yes" />
		        <asp:RadioButton ID="rdbSoilNo" Enabled="false" TextAlign="Right"  runat="server" Text="No" />
		   <asp:RadioButton ID="rdbSoilNA" Enabled="false" TextAlign="Right"  runat="server" Text="NA" />
		    </td>		    
		</tr>
		<tr>
		    <td class="haccpText">
		       <b>If yes, describe how the raw or cooked food comes into contact with unclean or unsanitized surfaces</b>
		    </td>		    
		</tr>
		<tr>
		    <td class="haccpText">
		        <asp:Label ID="lblQuestion4" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr><td></td></tr> 		
		<tr>
		    <td  class="haccpHeading">
		       <b> HACCP Procedural Questions:  Daily Requirements (HACCP Builder will fulfill requirements daily)</b>
		    </td>
		</tr>
		<tr>
		    <td class="haccpText">
		     <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="false" DataSourceID="ObjectDataSource3" 
                    SkinID="gridviewHaccpSkin" >
                <Columns>
                    <asp:TemplateField  ItemStyle-Width="10px">
                        <ItemTemplate>
                        <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />                    
                        </ItemTemplate>
                    </asp:TemplateField>               
                    <asp:BoundField DataField="Question" ItemStyle-Width="350px" HeaderText="Question" />                
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate >
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" Enabled="false" GroupName="Answer" runat="server" /> 
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" Enabled="false" GroupName="Answer"  runat="server" /> 
                             <asp:RadioButton ID="rdbAnswerNA" Text="NA" Enabled="false" GroupName="Answer"  runat="server" /> 
                            <asp:Label ID="lblValidateProcess" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>
            </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetQuestionsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetProceduralQuestion">        
        </asp:ObjectDataSource>	
		    </td>
		</tr>
		<td>
		    <hr />
		</td>
	</table>
		<div style="page-break-after:always"></div>
		<%-- Vendors --%>
		<table  width="100%">		
		<tr>
		    <td class="BackGround1">		       
		       <b> VENDORS DETAIL REVIEW </b>
		    </td>
		</tr>
		<tr>
		    <td class="BackGround2">
		        HACCP Procedural Questions: All Vendors
		    </td>
		</tr>
		<tr>
		</tr>
		<tr>		
		    <td class="haccpText">
		         <asp:GridView ID="grdHotHolding" runat="server" SkinID="gridviewHaccpSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource4">                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Vendor Name">
	                        <ItemTemplate>
	                        <asp:Label ID="lblName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "VendorName")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="Training and Certifications">
	                        <ItemTemplate>
	                            <asp:Label ID="lblTraining" runat="server" Text='<%# Eval("Training").ToString() == "1"? "Yes":"No" %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Corrective Actions">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCorrective" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CorrectiveAction") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Training and/or Certifications Details">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCertification" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "TrainingDetail") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified By">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifyBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VerifiedBy") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifiedDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VarifiedDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>                    
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
		    </td>
		</tr>
		<tr>
		<td >
		    <hr />
		</td>
		</tr>
		</table>
		<div style="page-break-after:always"></div>
	    <%-- Customers --%>
		<table  width="100%">			
		<tr>
		    <td class="BackGround1">		       
		       <b> CUSTOMERS DETAIL REVIEW </b>
		    </td>
		</tr>
		<tr>
		    <td class="BackGround2" >
		        HACCP Procedural Questions: All Customers
		    </td>
		</tr>		
		<tr>
		    <td class="haccpText">
		         <asp:GridView ID="grdCustomers"    runat="server" SkinID="gridviewHaccpSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource7">                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Customer Name">
	                        <ItemTemplate>
	                        <asp:Label ID="lblName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="Training and Certifications">
	                        <ItemTemplate>
	                            <asp:Label ID="lblTraining" runat="server" Text='<%# Eval("Training").ToString() == "1"? "Yes":"No" %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Corrective Actions">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCorrective" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CorrectiveAction") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Training and/or Certifications Details">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCertification" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "TrainingDetail") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified By">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifyBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VerifiedBy") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifiedDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VarifiedDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>                    
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
		    </td>
		</tr>
		<tr>
		<td >
		    <hr />
		</td>
		</tr>
		</table>

		<div style="page-break-after:always"></div>
		<table  width="100%">
		
		
        <%-- Inventory Items Repeater --%>
        <tr>
			<td class="haccpText">
			    					
				<b class="BackGround1">Inventory Items Review</b>
				<asp:Repeater ID="rptInventory" runat="server" DataSourceID="ObjectDataSource2">
                 <HeaderTemplate>
                    <table> 
                        <tr > 
                        <th class="haccpHeading">Quantity</td> 
                        <th class="haccpHeading" align="left">Item Description</td>
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                        <td class="haccpText"><%#Eval("Quantity")%></td>
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
		<tr>
		<td >
		    <hr />
		</td>
		</tr>
		</table>
		
     </div>    
    </form>
</body>
</html>
