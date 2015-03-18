<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan4" Codebehind="HaccpPlan4.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Safety Management System Overview </title>
    <link href="../../App_Themes/Default/Default3.css" type="text/css" />
</head>
<body style="margin:0px; background:#999999;">
    <form id="form1" runat="server">    
         <div class="haccpInner">      
    <!-- PEST CONTROL PLAN -->
    <table width="100%">
        <tr>		
		<td >
		    <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="odsPestControlPlan">       
             <ItemTemplate>
                 <div runat="server" id="dvProgram" class="haccpText" ><%#Eval("PlanText")%></div> 
            </ItemTemplate>   
            </asp:Repeater> 	
	         <asp:ObjectDataSource ID="odsPestControlPlan" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanByCategorySortId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                <SelectParameters>            
                    <asp:Parameter DefaultValue="9" Name="nCategoryId" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                     <asp:Parameter DefaultValue="3" Name="nPlanSortId" Type="Int32" />
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
    <!-- CLEANING AND SANITIZATION PLAN -->
    <table width="100%">
        <tr>		
		<td>
		    <asp:Repeater ID="rptKitchenPlan" runat="server"  DataSourceID="odsSenitizationPlan">       
             <ItemTemplate>
                 <div runat="server" id="dvProgram" class="haccpText"><%#Eval("PlanText")%></div> 
            </ItemTemplate>   
            </asp:Repeater> 	
	         <asp:ObjectDataSource ID="odsSenitizationPlan" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanByCategorySortId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                <SelectParameters>            
                    <asp:Parameter DefaultValue="9" Name="nCategoryId" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                     <asp:Parameter DefaultValue="2" Name="nPlanSortId" Type="Int32" />
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
    <!-- FACILITY AND EQUIPMENT PLAN -->
    <table width="100%">
        <tr>		
		<td>
		    <asp:Repeater ID="Repeater3" runat="server"  DataSourceID="odsMaintainencePlan">       
             <ItemTemplate>
                 <div runat="server" id="dvProgram" class="haccpText" ><%#Eval("PlanText")%></div> 
            </ItemTemplate>   
            </asp:Repeater> 	
	         <asp:ObjectDataSource ID="odsMaintainencePlan" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanByCategorySortId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlan">
                <SelectParameters>            
                    <asp:Parameter DefaultValue="9" Name="nCategoryId" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                     <asp:Parameter DefaultValue="4" Name="nPlanSortId" Type="Int32" />
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
    <!-- PLACE SOP DETAILVIEW HERE -->    
    <div style="page-break-after:always"></div>
	<div width="100%">
    <div class="BackGround1"> 
      <b>HACCP-Based SOPs</b>       
    </div>                                         
            <asp:Repeater ID="Repeater2" runat="server" 
                DataSourceID="sqlDSSOP" onitemdatabound="Repeater2_ItemDataBound">  
                <ItemTemplate>               
             <div>   
                <asp:Repeater ID="rptSOP" runat="server">
                <ItemTemplate>
                    <div style="font-family:Verdana; font-size:large; text-align:center;" >
                       <strong><%# DataBinder.Eval(Container.DataItem, "Title")%></strong>
                    </div>
                    <div>
                        <%# DataBinder.Eval(Container.DataItem, "SOPText")%>
                    
                     <div>			
                        <hr />		
                    </div>  
                    </div>                  
                    <div style="page-break-after:always"></div>
                </ItemTemplate>
                </asp:Repeater>              
                <asp:HiddenField ID="hfSOPId" Value='<%# Eval("KitchenSOPId") %>' runat="server" />
             </div>
        </ItemTemplate>           
        </asp:Repeater>
          <asp:SqlDataSource ID="sqlDSSOP" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
            SelectCommand="uspAdm_GetSOPsBykitchenId" SelectCommandType="StoredProcedure">
            <SelectParameters>
            <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>  
		
		</div>
    <%-- Procedural Steps --%>
	<div style="page-break-after:always"></div>
	<table width="100%">
		<tr >
			<td class="BackGround1">HACCP BUILDER PROCEDURAL STEPS									
			</td>		
		</tr>
	</table>
	<div style="width:100%;">        			
		    <asp:Repeater ID="rptProceduralSteps" runat="server"  DataSourceID="sdsProceduralQuestion">       
             <ItemTemplate>
                 <div runat="server" id="dvProgram" class="haccpText" ><%#Eval("PlanText")%> 
                 <div>		        
		            <hr />	        
		        </div>			  
		        </div>     
		        <div style="page-break-after:always"></div>	        
            </ItemTemplate>   
            </asp:Repeater> 	
	         <asp:SqlDataSource ID="sdsProceduralQuestion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetKitchenPlan1ByCategoryId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:Parameter DefaultValue="10" Name="nKitchenPlanCategoryId" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />                     
                    </SelectParameters>
                    
                </asp:SqlDataSource>				
    </div>	
    <div style="page-break-after:always"></div>
	
	
         </div>     
    </form>
</body>
</html>
