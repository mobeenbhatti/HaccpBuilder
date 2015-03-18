<%@ Page Title="HACCP Builder | Your HACCP Plan" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="PlanIndexNew.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexNew1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    function GetURLParameter(sParam) {        
        var sPageURL = window.location.search.substring(1);        
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) {
                return sParameterName[1];
            }
        }
    }
    function SetPage() {       
        $('.ui-tooltip').hide();
    }
    $(document).ready(function () {
        $Id = GetURLParameter("Id");       
        if ($Id == "Facility") {
            $("#pnlFacilitySubPlan").addClass('selected');
        }
        else if ($Id == "Pathogens") {
            $("#pnlPathogens").addClass('selected');
        }
        else {
            $("#pnlPlanIndex").addClass('selected');
        }

    });   
    </script>

<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Plan Index</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
<!--- POP-UP CODE -->
<%--<asp:ScriptManager  ID="ScriptManager1" runat="server">
</asp:ScriptManager> --%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
</cc1:ToolkitScriptManager>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>  
    <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp1"
                BackgroundCssClass="overlay"
                PopupDragHandleControlID="panelDragHandle1" 
                
                />          
             <div class="popUpStyle" id="divPopUp1" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:Repeater ID="rptShowProcess" runat="server" >
                   <HeaderTemplate>
                   <table>
                   </HeaderTemplate>
                   <ItemTemplate>
                   <tr>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProcessShortName") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   <td align="center">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>'></asp:Label>
                   </td>
                   </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                    </table>
                   </FooterTemplate>
               </asp:Repeater> 
               <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%" >    
                       <HeaderTemplate>
                        <table> 
                        <tr > 
                            <td>                    
                            </td>            
                            <td></td>             
                        </tr> 
                       </HeaderTemplate>     
                            <Fields>
                                 <asp:TemplateField >
                                  <ItemTemplate>
                   <tr>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>      
                    <tr><td>
                    <%# Eval("ProcessText") %>
                   </td></tr> 
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterTemplate>
                            </table>
                            </FooterTemplate>
                        </asp:DetailsView>
                                     
                <asp:Button ID="btnClose" runat="server" Text="Close" />
               <br />
            </div>
             <div class="popUpStyle1" id="divPopUp" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:Repeater ID="rptMenuProcess" runat="server"  onitemdatabound="rptMenuProcess_ItemDataBound">
                            <HeaderTemplate>
                                <table> 
                                    <tr>             
                                        <th width="100px" >Product/Menu Item Id</th>
                                        <th width ="250px" align="left" >Name</th>                                        
                                    </tr> 
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td ><asp:Label ID="lblId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MenuItemId")%>'></asp:Label></td>
                                    <td ><asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label></td>                                    
                                </tr>                                 
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                             </FooterTemplate>
                        </asp:Repeater> 
                <br />                       
                <asp:Button ID="Button1" runat="server" Text="Close" />
               <br />
            </div> 
            <%-- DYNAMIC KITCHEN PLAN TEXT --%>
            <div class="popUpStyle" id="divPlans" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelPlans" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>              
                <br />
                 <div id="dvKitchenPlanText" runat="server" style="padding:25px;"></div>
                 <asp:Button ID="cmdCancel" runat="server" Text="Close" />
               <br />
            </div>           
            <%-- Plan Category Title  --%>
            <div class="popUpStyle" id="dvPlanCategoryTitle" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelCategoryTitle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>              
                <br />
                 <asp:TextBox ID="txtCategoryTitle" runat="server" Width="500px"></asp:TextBox>
                 <asp:Button ID="cmdCategoryTitle" Text="Submit" runat="server" 
                    onclick="cmdCategoryTitle_Click" />
                 <asp:Button ID="Button2" runat="server" Text="Close" />
                 <asp:HiddenField ID="hfPlanCategoryId" runat="server"  />
                 <asp:HiddenField ID="hfKitchenPlanCategoryId" runat="server" />
                 <asp:HiddenField ID="hfCustomPlanCategory" runat="server"  />
                 <asp:HiddenField ID="hfPlanCategorySortId" runat="server"  />
                 <asp:HiddenField ID="hfPlanCategorySubId" runat="server"  />
               <br />
            </div>    
   
<!-- PAGE CODE -->
    <div class="ph-top"></div>
    <h2>FEATURED  IN HACCP PLAN DOCUMENTS</h2>           
    	
        <!-- PROCESSES -->
			<asp:Repeater ID="Repeater5" runat="server"  
                onitemdatabound="rptKitchenPlanCategory_ItemDataBound" 
                DataSourceID="odsKitchenPlanCtegory2" onitemcommand="Repeater5_ItemCommand">
                    <HeaderTemplate>                         
                    </HeaderTemplate>
                    <ItemTemplate>
                         <div class="box-header" id="dvPlanCategory" runat="server">
                            <h4 class="left" ><asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Name")%>'></asp:Label></h4>
                            <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value='<%#Eval("PlanCategoryId")%>' />
                            <asp:HiddenField ID="hfKitchenPlanCategoryId" runat="server" Value='<%#Eval("KitchenPlanCategoryId")%>' />
                            <asp:HiddenField ID="hfCustom" runat="server" Value='<%# Eval("CustomPlanCategory") %>' />
                            <asp:HiddenField ID="hfSortId" runat="server" Value='<%# Eval("SortOrder") %>' />
                            <asp:HiddenField ID="hfSubId" runat="server" Value='<%# Eval("SubId") %>' />
                            <span class="right"><asp:LinkButton Text="Edit" runat="server" ID="cmdTitle" CommandName="CategoryTitle" CommandArgument='<%# Eval("KitchenPlanCategoryId")%>' CssClass="button" OnClientClick="SetPage();" />
                                <asp:LinkButton Text="Revert to Default" runat="server" ID="cmdDeleteTitle" Visible="false" CommandName="DeleteCategoryTitle" CommandArgument='<%# Eval("KitchenPlanCategoryId")%>' CssClass="button" OnClientClick="SetPage();" />
                            </span>
                        </div>                        
                        
                        <table class="zebra">
                            <asp:Repeater ID="rptKitchenPlan" runat="server"  onitemcommand="rptKitchenPlan_ItemCommand" onitemdatabound="rptKitchenPlan_ItemDataBound">                                               
                                <ItemTemplate>
                                    <tr>
                                    <td>
                                    <a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>'  ID="lkbKitchenPlan" runat="server" ><%# Eval("PlanTitle") %></a>
                                    <%--<asp:LinkButton ID="lkbKitchenPlan" CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:LinkButton>--%>
                                    </td>
                                    <td class="right">
                                     <asp:CheckBox ID="chkActive" runat="server" Text="Active" Checked= '<%# Eval("Active").ToString() == "1"? true:false %>' Enabled="false" />
                                     <asp:LinkButton Text="Example" runat="server" ID="cmdExample" CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' CssClass="button" OnClientClick="SetPage();" />
                                   </td>
                                    <%--<td class="right"><a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' class="button" >Edit</a></td>--%>
                                    </tr> 
                                     <asp:HiddenField ID="hfCustomPlan" runat="server" Value ='<%# Eval("CustomPlan")%>' />
                                     <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value ='<%# Eval("PlanCategoryId")%>' />
                                     <asp:HiddenField ID="hfPlanActive" runat="server" Value ='<%# Eval("Active")%>' />                              
                                </ItemTemplate>                                                
                           </asp:Repeater>   
                           <tr><td><a href='<%# "PlanIndexDetail.aspx?Mode=New&PlanCategoryId=" +  Eval("PlanCategoryId")%>' >Add New Document</a></td></tr>
                            
                        </table>   
                        <div class="box-bottom"> </div>  
                         <div class="clear tenpx"></div>                         
                    </ItemTemplate>
                    <FooterTemplate>                   
                    </FooterTemplate>
                    </asp:Repeater>
             <div class="clear tenpx"></div>
             <h2>REFERENCE DOCUMENTS</h2>
            <asp:Repeater ID="rptKitchenPlanCategory" runat="server"  onitemdatabound="rptKitchenPlanCategory_ItemDataBound" DataSourceID="odsKitchenPlanCtegory">
                    <HeaderTemplate>
                            <div class="PlanIndexLabel">
                    </HeaderTemplate>
                    <ItemTemplate>
                         <div class="box-header" id="dvPlanCategory" runat="server">
                            <h4 class="left"><%#Eval("Name") %></h4>
                            <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value='<%#Eval("PlanCategoryId")%>' />
                            <asp:HiddenField ID="hfKitchenPlanCategoryId" runat="server" Value='<%#Eval("KitchenPlanCategoryId")%>' />
                            <asp:HiddenField ID="hfCustom" runat="server" Value='<%# Eval("CustomPlanCategory") %>' />
                            <asp:HiddenField ID="hfSortId" runat="server" Value='<%# Eval("SortOrder") %>' />
                            <asp:HiddenField ID="hfSubId" runat="server" Value='<%# Eval("SubId") %>' /> <span class="right"><asp:LinkButton Text="Edit" runat="server" ID="cmdTitle" CommandName="CategoryTitle" CommandArgument='<%# Eval("KitchenPlanCategoryId")%>' CssClass="button" OnClientClick="SetPage();" />
                                <asp:LinkButton Text="Revert to Default" runat="server" ID="cmdDeleteTitle" Visible="false" CommandName="DeleteCategoryTitle" CommandArgument='<%# Eval("KitchenPlanCategoryId")%>' CssClass="button" OnClientClick="SetPage();" />
                            </span>
                        </div>                                                
                        <table class="zebra">
                            <asp:Repeater ID="rptKitchenPlan" runat="server"  onitemcommand="rptKitchenPlan_ItemCommand" onitemdatabound="rptKitchenPlan_ItemDataBound">                                                
                                <ItemTemplate>
                                    <tr>
                                    <td><asp:HiddenField ID="hfKitchenPlanCategoryId" Value='<%# Eval("KitchenPlanCategoryId") %>' runat="server" />
                                    <a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>' ID="lkbKitchenPlan" runat="server" ><%# Eval("PlanTitle") %></a>
                                    <%--<asp:LinkButton ID="lkbKitchenPlan" CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' Text='<%# Eval("PlanTitle") %>' runat="server" ></asp:LinkButton>--%>
                                    </td>
                                    <td class="right">
                                    <asp:CheckBox ID="chkActive" runat="server" Text="Active" Checked= '<%# Eval("Active").ToString() == "1"? true:false %>' Enabled="false" />
                                    <asp:LinkButton Text="Example" runat="server" ID="cmdExample" CommandName="View" CommandArgument='<%# Eval("KitchenPlanId")%>' CssClass="button" OnClientClick="SetPage();" />
                                    </td>
                                   <%-- <td class="right"><a href='<%# "PlanIndexDetail.aspx?PlanId=" + Eval("KitchenPlanId")%>'  class="button" >Edit</a></td>--%>
                                    </tr> 
                                    <asp:HiddenField ID="hfCustomPlan" runat="server" Value ='<%# Eval("CustomPlan")%>' />
                                     <asp:HiddenField ID="hfPlanCategoryId" runat="server" Value ='<%# Eval("PlanCategoryId")%>' />
                                     <asp:HiddenField ID="hfPlanActive" runat="server" Value ='<%# Eval("Active")%>' />                              
                                </ItemTemplate>                                                
                           </asp:Repeater> <tr><td><a href='<%# "PlanIndexDetail.aspx?Mode=New&PlanCategoryId=" +  Eval("PlanCategoryId")%>' >Add New Document</a></td></tr>   
                        </table>   
                        <div class="box-bottom"> </div> 
                         <div class="clear tenpx"></div>                          
                    </ItemTemplate>
                    <FooterTemplate>
                   
                    </FooterTemplate>
                    </asp:Repeater>                    
                <!-- DAILY TASKS  -->
         <div id="pnlSection2" runat="server">
             <div class="box-header">
              <h4 class="left">DAILY TASKS</h4>
            </div>
            <table class="zebra">
                        <tr>
                        <td><a href="../../StaticContent/Files/Cold Holding Log.pdf" target="_blank">Cold Holding Time and Temperature Log PDF</a>							
						</td></tr>
						<tr><td><a href="../../StaticContent/Files/Cooling_temp_log.pdf" target="_blank">Cooling Temperature Log PDF</a>												
						</td></tr>
						<tr><td><a href="../../StaticContent/Files/Cook_&_heat_Temp_log.pdf" target="_blank">End Point Cooking Temperature PDF</a></td></tr>
						<tr><td><a href="FoodSafetyChecklistPrint.aspx" target="_blank">Food Safety Checklist</a> 							
						</td></tr>
						<tr><td><a href="../../StaticContent/Files/Freezer Log.pdf" target="_blank">Freezer Log PDF</a> 							
						</td>	</tr>
						<tr><td><a href="../../StaticContent/Files/Hot Holding Log.pdf" target="_blank">Hot Holding Time and Temperature Log PDF</a>
						</td>	</tr>						
						<tr><td><a href="../../StaticContent/Files/Receiving_log.pdf" target="_blank">Receiving Log PDF PDF</a>							
						</td></tr>
						<tr><td><a href="../../StaticContent/Files/Refrigeration_log.pdf" target="_blank">Refrigeration Log PDF</a>							
						</td></tr>
						<tr><td><a href="../../StaticContent/Files/Shipping Log.pdf" target="_blank">Shipping Log PDF</a>													
						</td>	</tr>
						<tr><td><a href="../../StaticContent/Files/Thermometer_calib_log.pdf" target="_blank">Thermometer Calibration PDF</a>	                            						
						</td></tr>
                       <tr> <td><a href="ValidationPrint.aspx" target="_blank">Validation Worksheet</a> </td>
                        </tr>                                                                                                  
             </table>
            <div class="box-bottom"> </div>
        </div>
        
              </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true" AssociatedUpdatePanelID="UpdatePanel1" >
                <ProgressTemplate>                     
                <div id="progress">
                    <img src="../../images/buttons/ajax-loader1.gif" alt="" />
                </div>                    
                </ProgressTemplate>
                </asp:UpdateProgress>        
         <div class="clear tenpx"></div>      
</div>
<asp:ObjectDataSource ID="odsKitchenPlanCtegory" runat="server" 
OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanCategoryBySideId" 
TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
<SelectParameters>
    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
        SessionField="KitchenId" Type="Int32" />
    <asp:Parameter DefaultValue="1" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>	
<asp:ObjectDataSource ID="odsKitchenPlanCtegory2" runat="server" 
OldValuesParameterFormatString="original_{0}" SelectMethod="GetKitchenPlanCategoryBySideId" 
TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
<SelectParameters>
    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
        SessionField="KitchenId" Type="Int32" />
    <asp:Parameter DefaultValue="0" Name="nSideId" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>				 	
 <asp:SqlDataSource ID="sqlDSDailyParticipation" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetKitchenDetailsByKitchenId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
        SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>           
        <asp:ObjectDataSource ID="odsMenuItem" runat="server" 
OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewDataSet" 
TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
<SelectParameters>
    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
        SessionField="KitchenId" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource> 
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
<SelectParameters>
    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
        SessionField="KitchenId" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>		
<asp:HiddenField ID="hfProcessId" runat="server" />
</asp:Content>
