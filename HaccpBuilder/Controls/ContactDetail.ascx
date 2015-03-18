<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_ContactDetail" Codebehind="ContactDetail.ascx.cs" %>
<asp:DetailsView ID="DetailsView1" BorderWidth="0px" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDataSource1" Height="50px" Width="125px">    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate>
                
                    <%------------------ NEW LAYOUT --------------------%>
                    
                    <table width="680" border="0" cellspacing="0" cellpadding="0">                     
                        <tr>
                            <td width="120" height="20" align="right" class="text_bold" >
                               <asp:Label ID="Label1" Text="Location:" runat="server"></asp:Label>                
                            </td> 
                            <td width="5" height="20" >&nbsp;</td>                   
                            <td width="120" height="20" >
                               <asp:Label ID="lblDistrictName" Text='<%#  Bind(Container.DataItem,"KitchenName") %>' runat="server"></asp:Label>
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                             <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label2" Text="Street Address:" runat="server"></asp:Label>                
                            </td>   
                            <td width="5" height="20">&nbsp;</td>                 
                            <td width="120" height="20">
                               <asp:Label ID="lblDistrictAddress" Text='<%# Bind(Container.DataItem,"KitchenAddress") %>' runat="server"></asp:Label>
                            </td>
                            <td width="40" height="20">&nbsp;</td>                                                   
                        </tr>
                         <tr>                                              
                             <td width="120" height="20" align="right" class="text_bold" >
                                <asp:Label ID="Label3" Text="Corporation:" runat="server"></asp:Label>                                                
                            </td> 
                            <td width="5" height="20" >&nbsp;</td>                      
                            <td  width="120" height="20">
                                 <asp:Label ID="Label5" Text='<%#  Bind(Container.DataItem,"DistrictName") %>' runat="server"></asp:Label>
                                
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                            <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label4" Text="Manager:" runat="server"></asp:Label>              
                            </td>   
                            <td width="5" height="20" >&nbsp;</td>                    
                            <td >
                                <asp:Label ID="lblManager" Text='<%#  Bind(Container.DataItem,"Manager")  %>' runat="server"></asp:Label>  
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                        </tr>
                        <tr> 
                             <td width="120" height="20" align="right" class="text_bold">                           
                               <asp:Label ID="Label15" Text="Country:" runat="server"></asp:Label> 
                            </td>   
                            <td width="5" height="20" >&nbsp;</td>                    
                            <td width="120" height="20">
                               <asp:Label ID="lblCountry" Text='<%#   Bind(Container.DataItem,"Country") %>' runat="server"></asp:Label> 
                             </td>
                             <td width="40" height="20" >&nbsp;</td>
                             <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label17" Text="State:" runat="server"></asp:Label>                
                            </td>          
                            <td width="5" height="20" >&nbsp;</td>             
                            <td >
                                <asp:Label ID="lblState" Text='<%#  Bind(Container.DataItem,"State")  %>' runat="server"></asp:Label>
                            </td> 
                            <td width="40" height="20" >&nbsp;</td>
                        </tr>
                        <tr> 
                             <td width="120" height="20" align="right" class="text_bold">                           
                               <asp:Label ID="Label6" Text="City:" runat="server"></asp:Label> 
                            </td>   
                            <td width="5" height="20" >&nbsp;</td>                    
                            <td width="120" height="20">
                               <asp:Label ID="lblcity" Text='<%#   Bind(Container.DataItem,"KitchenCity") %>' runat="server"></asp:Label> 
                             </td>
                             <td width="40" height="20" >&nbsp;</td>
                             <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label7" Text="Email:" runat="server"></asp:Label>                
                            </td>          
                            <td width="5" height="20" >&nbsp;</td>             
                            <td >
                                <asp:Label ID="lblEmail" Text='<%#  Bind(Container.DataItem,"Email")  %>' runat="server"></asp:Label>
                            </td> 
                            <td width="40" height="20" >&nbsp;</td>
                        </tr>
                        <tr>                                              
                           <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label8" Text="Zip Code:" runat="server"></asp:Label>
                            </td>      
                            <td width="5" height="20" >&nbsp;</td>                 
                            <td width="120" height="20">
                                <asp:Label ID="Label9" Text='<%#  Bind(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                           <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label10" Text="Phone:" runat="server"></asp:Label>                
                            </td>   
                            <td width="5" height="20" >&nbsp;</td>                    
                            <td >
                                <asp:Label ID="Label11" Text='<%#  Bind(Container.DataItem,"Phone")  %>' runat="server"></asp:Label>
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                        </tr>
                        <%--<tr>                                              
                           <td width="120" height="20" align="right" class="text_bold">
                                <asp:Label ID="Label12" Text="Fax:" runat="server"></asp:Label>
                            </td>      
                            <td width="5" height="20" >&nbsp;</td>                 
                            <td width="120" height="20">
                                <asp:Label ID="Label13" Text='<%#  Bind(Container.DataItem,"Fax")  %>' runat="server"></asp:Label>
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                           <td width="120" height="20" align="right" class="text_bold">
                                             
                            </td>   
                            <td width="5" height="20" >&nbsp;</td>                    
                            <td >
                                
                            </td>
                            <td width="40" height="20" >&nbsp;</td>
                        </tr>--%>
                        <%--<tr>                                              
                            <td style="font-weight:bold;">
                                
                            </td>                    
                            <td>
                              
                            </td>
                             <td style="font-weight:bold;">
                                <asp:Label ID="Label33" Text="FAX:" runat="server"></asp:Label>
                            </td>                    
                            <td>
                                <asp:Label ID="Label34" Text='<%# Bind(Container.DataItem,"Fax") %>' runat="server"></asp:Label>
                            </td>
                        </tr> --%>  
                    </table>
               </ItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetContactDetailsByUserId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="vchUserId" 
            SessionField="Username" Type="String" />
        <asp:SessionParameter Name="vchPassword" SessionField="Password" 
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
