<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan2" Codebehind="HaccpPlan2Old.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Safety Management System Overview </title>
    <link href="../../App_Themes/Default/Default3.css" type="text/css" />
</head>
<body  style="margin:0px; background:#999999;">
    <form id="form1" runat="server">    
    <div class="haccpInner1">
         <div style="width:100%" >
         <div class="BackGround1">Output/Menu Detail All Recipes</div>  
          <asp:Repeater ID="rptProcess" runat="server" 
                DataSourceID="SqlDataSource2" onitemdatabound="rptProcess_ItemDataBound">             
                <ItemTemplate>                 
                  <asp:DetailsView ID="dtvProcess" runat="server" AutoGenerateRows="False" Height="50px">    
                  <HeaderTemplate>            
                    <table width="100%"> 
                    <tr> 
                        <td>                    
                        </td>            
                        <td></td>             
                    </tr> 
                   </HeaderTemplate>  
                   <Fields>
                          <asp:TemplateField ItemStyle-Width="650px" >
                              <ItemTemplate> 
                           <tr> 
                           <td>      
                           <tr id="Tr1" runat="server" visible='<%# string.IsNullOrEmpty(Eval("ProcessName").ToString()) ? false : true%>'>
                            <td class="BackGround1">
                                <asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label>                	
                             </td>             
                           </tr>      
                           <tr id="Tr2" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field1").ToString()) ? false : true%>'>
                           <td  height="22"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr3" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field1").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr4" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field2").ToString()) ? false : true%>'>
                           <td  height="18"  align="center" class="haccpText">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr5" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field2").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr6" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field3").ToString()) ? false : true%>'>
                           <td  height="22"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr7" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field3").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr8" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field4").ToString()) ? false : true%>'>
                          <td  height="18"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr9" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field4").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr10" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field5").ToString()) ? false : true%>'>
                           <td  height="22"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr11" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field5").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr12" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field6").ToString()) ? false : true%>'>
                           <td  height="18"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr13" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field6").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr14" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field7").ToString()) ? false : true%>'>
                           <td  height="22" valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr15" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field7").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr16" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field8").ToString()) ? false : true%>'>
                          <td  height="18"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr17" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field8").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr18" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field9").ToString()) ? false : true%>'>
                           <td  height="22"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr19" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field9").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr>
                           <tr id="Tr20" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field10").ToString()) ? false : true%>'>
                           <td  height="18"  valign="top" align="center" class="haccpText">
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>'></asp:Label>
                           </td>
                           </tr>
                           <tr id="Tr21" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field10").ToString()) ? false : true%>'>
                   		        <td colspan="3" height="20" valign="top">
							        <hr>
						        </td>
				            </tr> 
				            </td>
				          </tr>                            
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                       <FooterTemplate>
                            </table>
                               <div style="page-break-after:always"></div>
                            </FooterTemplate>
                        </asp:DetailsView>                  
                    <asp:HiddenField ID="hfProcessId" Value='<%# Eval("ProcessId") %>' runat="server" />                  
				<b class="haccpHeading"><asp:Label ID="lblProcess" runat="server" Text='<%# "Selected Recipes for " + Eval("ProcessName") %>'></asp:Label></b>
				<asp:GridView ID="grdMenuProcess1" runat="server" Width="100%" SkinID="gridviewHaccpSkin" AutoGenerateColumns="False" 
                    onrowdatabound="grdMenuProcess1_RowDataBound" >  
                    <Columns>                    	                    
	                    <asp:TemplateField HeaderText="Output/ Menu Item" ItemStyle-Width="30px" >
	                        <ItemTemplate>	                        
	                        <%--<td id="dvPageBreak" runat="server" style="page-break-before:always" visible="false"></td>--%>
	                        
	                        <%--<div id="dvPageBreak" runat="server" style="page-break-before:always" visible="false"></div>--%>	                            	                            
	                        <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />	                        
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Process Type" ItemStyle-Width="50px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Prep Type" ItemStyle-Width="50px" >
	                        <ItemTemplate>
	                            <asp:Label ID="lblPreperation" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PreparationType") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="RTE" ItemStyle-Width="50px" >
	                        <ItemTemplate>
	                            <asp:Label ID="lblRte" runat="server" Text='<%# Eval("Ready").ToString()== "1"? "Yes": "No"%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Input/Ingredient" ItemStyle-Width="70px" >
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Vendor" >
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="CCL Low Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLLow" runat="server"  Text='<%# Eval("CCLTempLow")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="CCL High Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLHigh" runat="server"  Text='<%# Eval("CCLTempHigh")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Control Point">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCP" runat="server"  Text='<%# Eval("CP")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                     <asp:TemplateField HeaderText="Biological Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblBioHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BiologicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Chemical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblChemHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ChemicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Physical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhysHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PhysicalHazard") %>'></asp:Label>	                           
	                            
	                        </ItemTemplate>
	                        <ItemStyle />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                                       
                </Columns>              
                <%--<Columns>              
	                    <asp:TemplateField HeaderText="Item Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Process Type">
	                        <ItemTemplate>
	                            <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Ingredient">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                     <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
                </Columns>--%>
            </asp:GridView>            
                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="nProcessId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
            <strong> <asp:Label ID="lblProcessMenu" runat="server"></asp:Label>	</strong>
 			<div style="page-break-after:always"></div>
                </ItemTemplate>
       </asp:Repeater>    
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetProcessesByKitchenMenuId" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
           </asp:SqlDataSource>    
          <%-- OLD CODE --%> 
         <%-- <asp:GridView ID="grdMenuAll" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" onrowdatabound="grdMenuAll_RowDataBound" >                
                <Columns>                    	                    
	                    <asp:TemplateField HeaderText="Product/Menu Item" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />	                        
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Process Type" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Preparation Type" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPreperation" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PreparationType") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="RTE" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblRte" runat="server" Text='<%# Eval("Ready").ToString()== "1"? "Yes": "No"%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Ingredient" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Vendor" ItemStyle-Width="80px">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="CCL Low Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLLow" runat="server"  Text='<%# Eval("CCLTempLow")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="CCL High Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLHigh" runat="server"  Text='<%# Eval("CCLTempHigh")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                     <asp:TemplateField HeaderText="Biological Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblBioHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BiologicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Chemical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblChemHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ChemicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Physical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhysHazards" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PhysicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                                       
                </Columns>
            </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspAdm_GetMenuItemsNewDetailsByKitchenId" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource> --%>
         </div>     
    </div>
    </form>
</body>
</html>
