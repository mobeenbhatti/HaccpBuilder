<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_DistrictAddress" Codebehind="DistrictAddress.ascx.cs" %>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDataSource1" Height="50px" Width="125px">    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate>
                    <table width="100%">
                        <%--<tr>
                            <td width="30%">
                                <asp:Label ID="Label1" Text='<%#  Bind(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>   
                        </tr>
                        <tr>
                            <td>
                                
                            </td>                
                        </tr>                        
                        <tr>
                            <td>
                               
                            </td>
                        </tr>
                        <tr>                                                
                             <td>
                                 
                             </td>
                        </tr>
                        <tr>                                                
                             <td>
                                 
                             </td>
                        </tr>
                        <tr>                                                
                             <td>
                                 
                             </td>
                        </tr>
                        <tr>                                                
                             <td>
                                 
                             </td>
                        </tr>--%>
                        
                        
                        <tr>
                            <td width="20%" style="font-weight:bold;">
                               <asp:Label ID="Label19" Text="Company:" runat="server"></asp:Label>                
                            </td>                    
                            <td width="30%">
                               <asp:Label ID="lblDistrictName" Text='<%#  Bind(Container.DataItem,"DistrictName") %>' runat="server"></asp:Label>
                            </td>
                             <td width="20%" style="font-weight:bold;">
                                <asp:Label ID="Label21" Text="Street Address:" runat="server"></asp:Label>                
                            </td>                    
                            <td width="30%">
                               <asp:Label ID="lblDistrictAddress" Text='<%# Bind(Container.DataItem,"DistrictAddress") %>' runat="server"></asp:Label>
                            </td>
                                                   
                        </tr>
                        <tr>                                              
                             <td style="font-weight:bold;">
                                <asp:Label ID="Label15" Text="Manager:" runat="server"></asp:Label>                                                
                            </td>                    
                            <td >
                                 <asp:Label ID="Label5" Text='<%#  Bind(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                                
                            </td>
                            <td style="font-weight:bold;">
                                <asp:Label ID="Label31" Text="Phone:" runat="server"></asp:Label>              
                            </td>                    
                            <td >
                                <asp:Label ID="Label4" Text='<%#  Bind(Container.DataItem,"Phone")  %>' runat="server"></asp:Label>  
                            </td>
                        </tr>
                        <tr> 
                             <td style="font-weight:bold;">                            
                               <asp:Label ID="Label35" Text="City:" runat="server"></asp:Label> 
                            </td>                    
                            <td>
                               <asp:Label ID="lblDistrictCity" Text='<%#   Bind(Container.DataItem,"City") %>' runat="server"></asp:Label> 
                             </td>
                             <td style="font-weight:bold;">
                                <asp:Label ID="Label25" Text="State:" runat="server"></asp:Label>                
                            </td>                    
                            <td >
                                <asp:Label ID="lblCounty" Text='<%#  Bind(Container.DataItem,"State")  %>' runat="server"></asp:Label>
                            </td> 
                        </tr>
                        <tr>                                              
                           <td style="font-weight:bold;">
                                <asp:Label ID="Label29" Text="Email:" runat="server"></asp:Label>
                            </td>                    
                            <td>
                                <asp:Label ID="Label3" Text='<%#  Bind(Container.DataItem,"EmailAddress")  %>' runat="server"></asp:Label>
                            </td>
                            <td style="font-weight:bold;">
                                <asp:Label ID="Label27" Text="Zip Code:" runat="server"></asp:Label>                
                            </td>                    
                            <td >
                                <asp:Label ID="Label2" Text='<%#  Bind(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>
                        </tr>
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
    SelectCommand="uspAdm_GetDistrictAddressByUserName" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="&quot;&quot;" Name="vchEmail" 
            SessionField="Username" Type="String" />
        <asp:SessionParameter DefaultValue="" Name="vchPassword" 
            SessionField="Password" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>