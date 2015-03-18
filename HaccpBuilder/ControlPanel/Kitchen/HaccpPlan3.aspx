<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_HaccpPlan3" Codebehind="HaccpPlan3.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Safety Management System Overview </title>
    <link href="../../App_Themes/Default/Default3.css" type="text/css" />
</head>
<body style="margin:0px; background:#999999;">
    <form id="form1" runat="server" >  
         <div class="haccpInner">
         <div width="100%" >
         <b class="BackGround1">LOG BASED CORRECTIVE ACTIONS</b>
         <br /><br />
         <b class="BackGround1">Cleaning And Sanitization Log</b>
         <div id="Div1" visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptCleaningLog" runat="server" DataSourceID="ObjectDataSource1">
                     <HeaderTemplate>
                        <table> 
                            <tr >  
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >        
                           
                            <td class="haccpText"><%#Eval("Name")%></td>        
                        </tr>     
                     </ItemTemplate>
                     <FooterTemplate>
                     </table>
                     </FooterTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                    <SelectParameters>
                        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                        <asp:Parameter DefaultValue="12" Name="nLogTypeId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
         </div>
         </div>
         <br /><br />
         <div width="100%" >        
         <b class="BackGround1">Cold Holding Log</b>
         <div id="dvColdHoldingLog" visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptColdHoldingLog" runat="server" DataSourceID="ObjectDataSource8">
                     <HeaderTemplate>
                        <table> 
                            <tr >  
                            </tr> 
                     </HeaderTemplate>
                     <ItemTemplate>
                         <tr >        
                           
                            <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Cooling Temperature Log</b>
         <div id="dvCoolingLog" visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptCoolingLog" runat="server" DataSourceID="ObjectDataSource9">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText" ><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Freezer Log	</b>
         <div id="dvFreezerLog"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="rptFreezerLog" runat="server" DataSourceID="ObjectDataSource11">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >  
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Hot Holding Log</b>
         <div id="dvHotHoldingLog"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="rptHotHlodingLog" runat="server" DataSourceID="ObjectDataSource12">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
          <div width="100%" >
         <b class="BackGround1">Maintenance Log</b>
         <div id="Div2"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
                    </tr>     
                 </ItemTemplate>
                 <FooterTemplate>
                 </table>
                 </FooterTemplate>
                 </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="11" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
         </div>
         </div>
         <br /><br />
          <div width="100%" >
         <b class="BackGround1">Pest Control Log</b>
         <div id="Div3"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource3">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
                    </tr>     
                 </ItemTemplate>
                 <FooterTemplate>
                 </table>
                 </FooterTemplate>
                 </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="10" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
         </div>
         </div>
         <br /><br />
          <div width="100%" >
         <b class="BackGround1">PH Log</b>
         <div id="Div4"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource4">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
                    </tr>     
                 </ItemTemplate>
                 <FooterTemplate>
                 </table>
                 </FooterTemplate>
                 </asp:Repeater>
                 <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                            <asp:Parameter DefaultValue="9" Name="nLogTypeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Receiving Log</b>
         <div id="dvReceivingLog"  visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptReceivingLog" runat="server" DataSourceID="ObjectDataSource13">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Refrigeration Log</b>
         <div id="dvRefrigrationLog"  visible="false" runat="server">Inactive</div>
         <div>
           <asp:Repeater ID="rptRefrigrationLog" runat="server" DataSourceID="ObjectDataSource14">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Shipping Log</b>
         <div id="dvShippingLog"  visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptShippingLog" runat="server" DataSourceID="ObjectDataSource15">
                 <HeaderTemplate>
                    <table> 
                        <tr >  
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                       
                        <td class="haccpText"><%#Eval("Name")%></td>        
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
         </div>
         </div>  
         <br /><br />
         <div width="100%" >
         <b class="BackGround1">Temperature Log (corrective actions with respect to food category)</b>
         <div id="dvTemperatureLog"  visible="false" runat="server">Inactive</div>
         <div>
            <asp:Repeater ID="rptFoodcategory" DataSourceID="SqlDataSource3" runat="server" OnItemDataBound="rptFoodCatogary_ItemDataBound">
            <HeaderTemplate>
            <table>
            </HeaderTemplate>
            <ItemTemplate>
            <tr>
            <td>           
            <b class="BackGround1"> <%#Eval("FoodCategory")%> </b>            
            <tr>
            </tr>           
                <asp:HiddenField ID="hfFoodCategoryId" Value='<%# Eval("FoodCategoryId") %>' runat="server" />
                <asp:Repeater ID="rptFoodcategoryCorectiveAction" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="haccpText">
                                <%#Eval("Name")%>
                                
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
            <tr id="trFoodCategoryCorrectiveActions" runat="server" visible="false">
            <td>
            <asp:Label ID="lblFoodCategoryCorrectiveActions" Text="No Requirement" runat="server"></asp:Label>
            </td>
            </tr>           
        </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>   
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetFoodCategoriesByKitchenIngredients" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource> 
         </div>
         </div>
            
         </div>  
    </form>
</body>
</html>
