<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan2" Codebehind="HaccpPlan2.aspx.cs" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=pgTitle%></title>   
    <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
    <script src="../../JScript/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
    $(window).load(function () {
        try {
            var ControlName = 'rptHazard';
            var innerScript = '<scr' + 'ipt type="text/javascript">document.getElementById("' + ControlName + '_print").Controller = new ReportViewerHoverButton("' + ControlName + '_print", false, "", "", "", "#ECE9D8", "#DDEEF7", "#99BBE2", "1px #ECE9D8 Solid", "1px #336699 Solid", "1px #336699 Solid");</scr' + 'ipt>';
            var innerTbody = '<tbody><tr><td><input type="image" style="border-width: 0px; padding: 2px; height: 16px; width: 16px;" alt="Print" src="/Reserved.ReportViewerWebControl.axd?OpType=Resource&amp;Version=9.0.30729.1&amp;Name=Microsoft.Reporting.WebForms.Icons.Print.gif" title="Print"></td></tr></tbody>';
            var innerTable = '<table title="Print" onmouseout="this.Controller.OnNormal();" onmouseover="this.Controller.OnHover();" onclick="PrintFunc(\'' + ControlName + '\'); return false;" id="' + ControlName + '_print" style="border: 1px solid rgb(236, 233, 216); background-color: rgb(236, 233, 216); cursor: default;">' + innerScript + innerTbody + '</table>'
            var outerScript = '<scr' + 'ipt type="text/javascript">document.getElementById("' + ControlName + '_print").Controller.OnNormal();</scr' + 'ipt>';
            var outerDiv = '<div style="display: inline; font-size: 8pt; height: 30px;" class=" "><table cellspacing="0" cellpadding="0" style="display: inline;"><tbody><tr><td height="28px">' + innerTable + outerScript + '</td></tr></tbody></table></div>';

            $("#" + ControlName + " > div > div").append(outerDiv);

        }
        catch (e) { alert(e); }
    });
    function PrintFunc(ControlName) {
        setTimeout('ReportFrame' + ControlName + '.print();', 100);
    }
</script>
   </head>
<body>
    <form id="form1" runat="server">   
 
    
    <div class="container">
         
         <div class="form3 ph-top"><h2>Output/Menu Detail All Recipes</h2></div>   
          <h1><%= ProcessName %> </h1>  <br />
          <!-- Flow Chart -->
          <div id="pnlFlowChart" runat="server">  <%= ProcessText %>   <br />
          <p style="page-break-after :always;">&nbsp;</p>
          </div>
<%-- <table runat="server" id="tblHazardHeader" Width="100%">--%>
        <!-- FSIS SECTION -->
        <div id="pnlFsis" runat="server">
        <div runat="server" id="tblHazardHeader">            
         <h3><%= HazardTitle %> </h3>   
        </div>
           
         <asp:GridView ID="grdHazardAnalysis" runat="server" AutoGenerateColumns="false"  ShowHeader="false" DataKeyNames="GroupId" CssClass="zebra"  onrowdatabound="grdHazardAnalysis_RowDataBound">
        <Columns>                                       
        <asp:TemplateField HeaderText="Process Step" ItemStyle-Width="5%">
            <ItemTemplate>
                <asp:Label ID="lblProcessStep" runat="server" Text='<%# Eval("ProcessStep")  %>'></asp:Label>
                <asp:HiddenField ID="hfGroupId" runat="server" Value='<%# Eval("GroupId")  %>' />
            </ItemTemplate>            
        </asp:TemplateField>                    
        <asp:TemplateField HeaderText="Food Safety Hazard" ItemStyle-Width="5%">
            <ItemTemplate>
                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryID").ToString() == "1"? "Biological - ": Eval("CategoryID").ToString() == "2"? "Chemical - " : "Physical - " %>'></asp:Label>
                <asp:Label ID="lblHazard" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FoodSafetyHazard") %>'></asp:Label>
            </ItemTemplate>           
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Reasonably Likely To Occur?" ItemStyle-Width="5%">
            <ItemTemplate>
                <asp:Label ID="lblReason" runat="server" Text='<%# Eval("Reason") %>'></asp:Label>
            </ItemTemplate>           
        </asp:TemplateField>                   
        <asp:TemplateField HeaderText="Basis" ItemStyle-Width="30%">
            <ItemTemplate>
                <asp:Label ID="lblBasis" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Basis")  %>'></asp:Label>
            </ItemTemplate>                      
        </asp:TemplateField>
        <asp:TemplateField HeaderText="If Yes in Column 3, What Measure Could be Applied to Prevent, Eliminate, or Reduce the Hazard to an Acceptable Level?" ItemStyle-Width="30%">
            <ItemTemplate>
                <asp:Label ID="lblMeasures" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Measures")  %>'></asp:Label>
            </ItemTemplate>          
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Critical Control Point" ItemStyle-Width="10%">
            <ItemTemplate>
                <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>
            </ItemTemplate>           
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
        
         <asp:GridView ID="grdHaccpCategory" runat="server" AutoGenerateColumns="false" ShowHeader="false" CssClass="zebra" DataKeyNames="HaccpCategoryID" Width="100%"  
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
        </div>
        <!-- Menu Haccp Section -->
        <div id="pnlMenuHaccp" runat="server">
<asp:HiddenField ID="hfProcessId" Value='<%# Eval("ProcessId") %>' runat="server" />                  
				<b class="haccpHeading"><asp:Label ID="lblProcess" runat="server" Text='<%# "Selected Recipes for " + Eval("ProcessName") %>'></asp:Label></b>
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
        </div>
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
 			<div style="page-break-after:always">
     </div>
        
    </div>
    </form>
</body>
</html>
