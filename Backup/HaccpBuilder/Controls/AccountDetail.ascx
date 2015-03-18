<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountDetail.ascx.cs" Inherits="HaccpBuilder.Controls.AccountDetail" %>
<asp:Repeater ID="rptContact" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
                    <%------------------ NEW LAYOUT --------------------%>
                   <div class="form">
                      <div class="left spacing">
                        <div class="clear">
                          <div class="label">Facility Name:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem,"KitchenName")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Corporation:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem,"DistrictName") %></div>
                        </div>
                        <div class="clear">
                          <div class="label">Manager:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem,"Manager") %></div>
                        </div>
                        <div class="clear">
                          <div class="label">Email:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "Email")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Phone:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "Phone")%></div>
                        </div> 
                        <div class="clear">
                          <div class="label">Alternate Phone:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "AltPhone")%></div>
                        </div>        
                      </div>
                      <div class="left spacing">
                        <div class="clear">
                          <div class="label">Street Address One:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "KitchenAddress")%></div>
                        </div> 
                        <div class="clear">
                          <div class="label">Street Address Two:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "KitchenAddress")%></div>
                        </div>        
                        <div class="clear">
                          <div class="label">City:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "KitchenCity")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Country:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "Country")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">State:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "State")%></div>
                        </div>
                        <div class="clear">
                          <div class="label">Zip Code:</div>
                          <div class="field"><%#  DataBinder.Eval(Container.DataItem, "PostalCode")%></div>
                        </div>
                      </div>
                      <div class="clear"></div>
                </div>                    
    </ItemTemplate>
</asp:Repeater>
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
