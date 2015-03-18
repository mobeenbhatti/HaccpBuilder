<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_I_BY_FC_HAZARDS__BIOLOGICAL__CHEMICAL__PHYSICAL_" Codebehind="I_BY_FC_HAZARDS (BIOLOGICAL, CHEMICAL, PHYSICAL).aspx.cs" %>

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
		<%-- HAZARDS --%>
		<tr>
		<td style="background-color:#99ccff; color: #000;">

		   <b> INGREDIENTS BY FOOD CATEGORY, HAZARDS (BIOLOGICAL, CHEMICAL, PHYSICAL) </b>
		</td>
		</tr>
		<tr>
		</tr>
		<tr>
		<td>
		     <asp:GridView ID="grdHazards" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource10" >                
                <Columns> 
                        <asp:TemplateField HeaderText="Ingredient">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                                      
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Biological Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BiologicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Chemical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ChemicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Physical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PhysicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <%--    <asp:TemplateField HeaderText="Associated CCP">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CCP") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Associated CP">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CP") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetIngredientByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient"> 
            <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>                 
              </asp:ObjectDataSource>
		</td>
		</tr>
		<%-- CCP's --%>
		<%--<tr>
		<td style="background-color:#99ccff; color: #000;">
		   <div class="PageBreak"></div>
		   <h1> Critical Control Points (CCP's) and Time and Temperature Requirements</h1>
		</td>
		</tr>
		<tr>
		<td>
		     <asp:GridView ID="GridView1" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource11" >                
                <Columns>                                       
	                    <asp:TemplateField HeaderText="Food/Process Item (CP and CCP Relationship)">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCCP" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Control Point (CP) Requirement">
	                        <ItemTemplate>
	                            <asp:Label ID="lblRequirement" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CPRequirement") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                        
	                    <asp:TemplateField HeaderText="Critical Control Point Requirement">
	                        <ItemTemplate>
	                            <asp:Label ID="lblRequirement" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Requirement") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >                
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPsByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP"> 
            <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
             </SelectParameters>                 
            </asp:ObjectDataSource>
		</td>
		</tr>--%>
		<%-- SOP's --%>
		</table>
    </div>
    </div>
    </form>
</body>
</html>
