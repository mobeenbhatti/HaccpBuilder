<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_ProductMenuItemsDetail_AllRecipes" Codebehind="ProductMenuItemsDetail_AllRecipes.aspx.cs" %>

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
		<%-- Categorizing Item Description --%>
        <tr>
			<td>
			   
						<h2 style="color: #000; padding-top: 30px; background-color:#99ccff;">Categorizing Product/Menu Items and Identification of 
						Control Measures and CCP&rsquo;</h2>

						<p> The product/menu cycle is posted in the location. Each product/menu item available for service 
						is listed in this food safety program in the table:  Selected  Product/Menu Items &#45; Categorized 
						by Process with associated CCPs &#45; Detailed Index.</p>

						<p> When new product/menu items are added, the list is updated. Each item is evaluated 
						to determine which of the four processes is applicable and to identify the appropriate 
						control measures and critical control points (CCPs) using the Process Approach 
						(Food Processes &#45; Detailed Index).</p>

						<p> Once the determination is made for each product/menu item, the food service manager 
						will make the rest of the food service staff aware of the product/menu items and applicable 
						process and control measures by posting the Process Charts (Food Processes 
						&#45; Detailed Index) in the location. In addition, the product/menu cycle, product/menu, recipes, 
						product directions, and charts are kept in a digital record online and are accessible 
						via the World Wide Web.</p>

						<p> 
						<div class="PageBreak"></div>
						<b>STAFF</b></p>

						<p> * All food service personnel will be given an overview of the Process Approach 
						(Food Processes &#45; Detailed Index) to HACCP after being hired and before 
						handling food.</p>

						<p> * Any substitute food service staff will be given instructions on the Process 
						Approach (Food Processes &#45; Detailed Index) and a list of necessary procedures 
						relevant to the tasks they will be performing and the corresponding records 
						to be kept.</p>

						<p> * Periodic refresher training for employees will be provided on a quarterly 
						basis.</p>

						<p> * An easily accessible copy of an explanation of the Process Approach (Food Processes &#45; Detailed Index) taken from the USDA HACCP guidance document 
						will be available online via the World Wide Web.</p>

						<p>
							&nbsp;</p>&nbsp;</td>
	    </tr>
	    </table>
		<div style="page-break-after:always"></div>
		<table>	
	    <%-- product/menu Items Repeater --%>
	    <tr>
	    <td>
	   <tr>
	   <td style="background-color:#99ccff; color: #000;">
	    <h2 > Product/Menu Detail All Recipes </h2>  
	   </td>
	   </tr>
	             
                <%--<asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1">
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
 </asp:Repeater>--%>
 <tr>
 <td>
                 <asp:GridView ID="grdMenuAll" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource5" onrowdatabound="grdMenuAll_RowDataBound" >                
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
	                     <%--<asp:TemplateField HeaderText="CCP Requirement">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCP" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	--%>
	                     <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                                       
                </Columns>
            </asp:GridView>
            </td>
 </tr>
 
                 
 
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
            </td>
        </tr>
        </table>
    </div>
    </div>
    </form>
</body>
</html>
