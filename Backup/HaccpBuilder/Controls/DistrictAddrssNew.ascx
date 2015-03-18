<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_DistrictAddrssNew" Codebehind="DistrictAddrssNew.ascx.cs" %>  
    <asp:Repeater ID="rptContact" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <div class="form">
                      <div class="left spacing">
                        <div class="clear">
                          <div class="label">Corporate Name:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "DistrictName")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Street Address:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "DistrictAddress")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Manager:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem,"Manager") %></div>
                        </div>
                        <div class="clear">
                          <div class="label">Country:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "Country")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">City:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "City")%></div>
                        </div> 
                        <div class="clear">
                          <div class="label">State:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "State")%></div>
                        </div>        
                      </div>
                      <div class="left spacing">
                        <div class="clear">
                          <div class="label">Email:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "EmailAddress")%></div>
                        </div> 
                        <div class="clear">
                          <div class="label">Zip Code:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "PostalCode")%></div>
                        </div>        
                        <div class="clear">
                          <div class="label">Fax:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "Fax")%></div>
                        </div>                       
                      </div>
                      <div class="clear"></div>
                </div>                                               
    </ItemTemplate>
</asp:Repeater>
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
