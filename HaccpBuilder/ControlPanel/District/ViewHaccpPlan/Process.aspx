<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_Process" Codebehind="Process.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div id="container">
    <div style="overflow:visible; height:50%;">
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetProcessesByKitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource>  
        
    <asp:Repeater ID="rptProcess" runat="server" 
                DataSourceID="SqlDataSource2" onitemdatabound="rptProcess_ItemDataBound">
               <%--<HeaderTemplate>
                  <table border="1">           
                    
               </HeaderTemplate>--%>
                <ItemTemplate>
                   
                  <%--  <tr>        
                    <td >
                 --%>
                    
                    <asp:DetailsView ID="dtvProcess" runat="server" AutoGenerateRows="False" Height="50px" Width="100%">    
                  <HeaderTemplate>
            
                        <table width="100%"> 
                        <tr> 
                            <td>                    
                            </td>            
                            <td></td>             
                        </tr> 
                       </HeaderTemplate>  
                            <Fields>
                            
                                 <asp:TemplateField >
                                       <ItemTemplate>

                                   
                           
                                                                  
                   <tr id="Tr1" runat="server" visible='<%# string.IsNullOrEmpty(Eval("ProcessName").ToString()) ? false : true%>'>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>   
                   <tr>
                    <td>
                        <%# Eval("ProcessText") %>
                    </td>
                   </tr>                 
                   <%--<tr id="Tr2" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field1").ToString()) ? false : true%>'>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr3" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field1").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr4" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field2").ToString()) ? false : true%>'>
                   <td bgcolor="#99ffcc" height="18"  align="center">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr5" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field2").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr6" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field3").ToString()) ? false : true%>'>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr7" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field3").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr8" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field4").ToString()) ? false : true%>'>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr9" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field4").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr10" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field5").ToString()) ? false : true%>'>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr11" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field5").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr12" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field6").ToString()) ? false : true%>'>
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr13" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field6").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr14" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field7").ToString()) ? false : true%>'>
                   <td bgcolor="#99ccff" height="22" valign="top" align="center">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr15" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field7").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr16" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field8").ToString()) ? false : true%>'>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr17" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field8").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr18" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field9").ToString()) ? false : true%>'>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr19" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field9").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr id="Tr20" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field10").ToString()) ? false : true%>'>
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr id="Tr21" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Field10").ToString()) ? false : true%>'>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>--%>
                            
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                       <FooterTemplate>
                            </table>
                               <div style="page-break-after:always"></div>
                            </FooterTemplate>
                        </asp:DetailsView>
                   <%-- </td>--%>
                   <%-- <td>--%>
                    <asp:HiddenField ID="hfProcessId" Value='<%# Eval("ProcessId") %>' runat="server" />
                  <%--  </td>
                    </tr> --%>
                    <%--<tr>
			<td>						
--%>
				<h2 style="color: #000;"><asp:Label ID="lblProcess" runat="server" Text='<%# "Selected Recipes for " + Eval("ProcessName") %>'></asp:Label></h2>
				<asp:GridView ID="grdMenuProcess1" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    onrowdatabound="grdMenuProcess1_RowDataBound" >                
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
	                    <%-- <asp:TemplateField HeaderText="CCP Requirement">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCP" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>	
	                     <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                                       
                </Columns>
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
			<%--</td>
		</tr>
		--%>
                    
                </ItemTemplate>
           <%-- <FooterTemplate>
           </table>
       </FooterTemplate>--%>
       </asp:Repeater>
    </div>
    </div>
    </form>
</body>
</html>
