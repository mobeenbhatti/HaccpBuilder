<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_District_HaccpPlan2" Codebehind="HaccpPlan2.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<title>Food Safety Management System Overview </title>--%>
    <title><%=pgTitle%></title>
    <link href="../../App_Themes/Default/Default3.css" type="text/css" />
    <link href="../../App_Themes/Default/Print.css" type="text/css" media="print" />
</head>
<body  style="margin:0px; background:#999999;">
    <form id="form1" runat="server">    
    <div class="haccpInner1">
         <div style="width:100%" >
         <div class="BackGround1">Output/Menu Detail All Recipes</div>  
         <h3><%= ProcessName %></h3>   <br />
         <%= ProcessText %>   <br /> 
        <%-- <table runat="server" id="tblHazardHeader" Width="100%">--%>
        <div runat="server" id="tblHazardHeader">
            <p style="page-break-before :always;">&nbsp;</p>
         <h3><%= HazardTitle %> </h3>   
        </div>
       <%-- <tr class="table-header">       
            <th width="120px">                       
                <%= header != null ? header[0].ColValue: ""%></th>
            <th width="150px">
                <%= header != null ? header[1].ColValue : ""%></th>
            <th width="150px">
                <%= header != null ? header[2].ColValue : ""%></th>
            <th width="120px">
                <%= header != null ? header[3].ColValue : ""%></th>
            <th width="120px">
                <%= header != null ? header[4].ColValue : ""%></th>
            <th width="120px">
                <%= header != null ? header[5].ColValue : ""%></th>    
        </tr>--%>
        <%--</table>--%>
       
         <asp:GridView ID="grdHazardAnalysis" runat="server" AutoGenerateColumns="false" 
                 ShowHeader="false" DataKeyNames="GroupId" Width="100%" 
                 onrowdatabound="grdHazardAnalysis_RowDataBound">
        <Columns>                                       
        <asp:TemplateField HeaderText="Process Step">
            <ItemTemplate>
                <asp:Label ID="lblProcessStep" runat="server" Text='<%# Eval("ProcessStep")  %>'></asp:Label>
                <asp:HiddenField ID="hfGroupId" runat="server" Value='<%# Eval("GroupId")  %>' />
            </ItemTemplate>
            <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>                    
        <asp:TemplateField HeaderText="Food Safety Hazard">
            <ItemTemplate>
                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryID").ToString() == "1"? "Biological - ": Eval("CategoryID").ToString() == "2"? "Chemical - " : "Physical - " %>'></asp:Label>
                <asp:Label ID="lblHazard" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FoodSafetyHazard") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="150px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Reasonably Likely To Occur?">
            <ItemTemplate>
                <asp:Label ID="lblReason" runat="server" Text='<%# Eval("Reason") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="150px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>                   
        <asp:TemplateField HeaderText="Basis">
            <ItemTemplate>
                <asp:Label ID="lblBasis" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Basis")  %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="If Yes in Column 3, What Measure Could be Applied to Prevent, Eliminate, or Reduce the Hazard to an Acceptable Level?">
            <ItemTemplate>
                <asp:Label ID="lblMeasures" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Measures")  %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Critical Control Point">
            <ItemTemplate>
                <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
            <HeaderStyle CssClass="gridheaderline" />
        </asp:TemplateField>    
        </Columns>
        </asp:GridView>  
            
         <div runat="server" id="tblHaccpCategoryHeader">
            <p style="page-break-before :always;">&nbsp;</p>
         <h3><%= HaccpCategoryTitle %> </h3>  
         </div>
        <%--<tr class="table-header">        
            <th width="120px">                       
                <%= HaccpCategoryHeader != null? HaccpCategoryHeader[0].ColValue : ""%></th>
            <th width="150px">
                <%= HaccpCategoryHeader != null ? HaccpCategoryHeader[1].ColValue : ""%></th>
            <th width="150px">
                <%= HaccpCategoryHeader != null ? HaccpCategoryHeader[2].ColValue : ""%></th>
            <th width="120px">
                <%= HaccpCategoryHeader != null ? HaccpCategoryHeader[3].ColValue : ""%></th>
            <th width="120px">
                <%= HaccpCategoryHeader != null ? HaccpCategoryHeader[4].ColValue : ""%></th>
            <th width="120px">
                <%= HaccpCategoryHeader != null ? HaccpCategoryHeader[5].ColValue : ""%></th>    
        </tr>--%>
        
         <asp:GridView ID="grdHaccpCategory" runat="server" AutoGenerateColumns="false" ShowHeader="false"
       DataKeyNames="HaccpCategoryID" Width="100%"  
                 onrowdatabound="grdHaccpCategory_RowDataBound">
<Columns>                                       
    <asp:TemplateField HeaderText="CCP" >
        <ItemTemplate>
            <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>           
        </ItemTemplate>
        <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline3" />
    </asp:TemplateField>                    
    <asp:TemplateField HeaderText="CriticalLimits">
        <ItemTemplate>
            <asp:Label ID="lblcriticalLimits" runat="server" Text='<%# Eval("CriticalLimits") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="150px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline3" />
    </asp:TemplateField>       
    <asp:TemplateField HeaderText="Monitoring">
        <ItemTemplate>
            <asp:Label ID="lblMonitoring" runat="server" Text='<%# Eval("Monitoring") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="150px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline3" />
    </asp:TemplateField>                   
    <asp:TemplateField HeaderText="Haccp Records" >
        <ItemTemplate>
            <asp:Label ID="lblHaccpRecords" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "HaccpRecords")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Verification">
        <ItemTemplate>
            <asp:Label ID="lblVerification" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Verification")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Corrective Actions" >
        <ItemTemplate>
            <asp:Label ID="lbCorrectiveActions" runat="server" Text='<%# Eval("CorrectiveActions")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" CssClass="gridheaderline3" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>     
</Columns>
</asp:GridView>   
<asp:HiddenField ID="hfProcessId" Value='<%# Eval("ProcessId") %>' runat="server" />                  
<b class="haccpHeading" ><asp:Label ID="lblProcess" runat="server" Text='<%# "Selected Recipes for " + Eval("ProcessName") %>' ></asp:Label></b>                
<p style="page-break-before :always;">&nbsp;</p>
                <asp:GridView ID="grdMenuProcess1" runat="server" Width="100%" SkinID="gridviewHaccpSkin" CellPadding="5" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Left" RowStyle-VerticalAlign="Top"
                    onrowdatabound="grdMenuProcess1_RowDataBound" >  
                    <Columns>                    	                    
	                    <asp:TemplateField HeaderText="Output/ Menu Item" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Left" >
	                        <ItemTemplate>	                        
	                        <%--<td id="dvPageBreak" runat="server" style="page-break-before:always" visible="false"></td>--%>
	                        
	                        <%--<div id="dvPageBreak" runat="server" style="page-break-before:always" visible="false"></div>--%>	                            	                            
	                        <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                                                        	                           
	                        </ItemTemplate>
	                        <ItemStyle  />	                        
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%--<asp:TemplateField HeaderText="Process Type" ItemStyle-Width="50px">
	                        <ItemTemplate>
	                                                     
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
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
	                    <asp:TemplateField HeaderText="Input" >
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
	                    <asp:TemplateField HeaderText="Food Category" >
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="CCL Low Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLLow" runat="server"  Text='<%# Eval("CCLTempLow").ToString()== ""? "NA": Eval("CCLTempLow")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="CCL High Temp">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCLHigh" runat="server"  Text='<%# Eval("CCLTempHigh").ToString()== ""? "NA": Eval("CCLTempHigh")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Control Point">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCP" runat="server"  Text='<%# Eval("CP")%>'></asp:Label>	
                                  <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>' Visible="false"></asp:Label>	
                                  <p style="margin-bottom:20px;"><br />&nbsp;</p>                             
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
