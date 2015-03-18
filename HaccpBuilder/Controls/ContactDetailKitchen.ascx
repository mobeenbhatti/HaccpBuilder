<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_ContactDetailKitchenl" Codebehind="ContactDetailKitchen.ascx.cs" %>
<asp:Repeater ID="rptLocationDetails" runat="server" DataSourceID="SqlDataSource1"  >
   <ItemTemplate>
    <div class="col-lg-4 col-md-4">
        <ul class="list-group">
            <li class="list-group-item">Location: <%#  DataBinder.Eval(Container.DataItem,"KitchenName") %></li>
            <li class="list-group-item">Street Address: <%#  DataBinder.Eval(Container.DataItem, "KitchenAddress")%></li>
            <li class="list-group-item">Corporation: <%#  DataBinder.Eval(Container.DataItem, "DistrictName")%></li>
            <li class="list-group-item">Manager: <%#  DataBinder.Eval(Container.DataItem, "Manager")%></li>
            <li class="list-group-item">Country: <%#  DataBinder.Eval(Container.DataItem, "Country")%></li>
        </ul>
    </div>
    <div class="col-lg-4 col-md-4">
            <ul class="list-group">
            <li class="list-group-item">State: <%#  DataBinder.Eval(Container.DataItem, "State")%></li>
            <li class="list-group-item">City: <%#  DataBinder.Eval(Container.DataItem, "KitchenCity")%></li>
            <li class="list-group-item">Email: <%#  DataBinder.Eval(Container.DataItem, "Email")%></li>
            <li class="list-group-item">Zip Code: <%#  DataBinder.Eval(Container.DataItem, "PostalCode")%></li>
                <li class="list-group-item">Phone: <%#  DataBinder.Eval(Container.DataItem, "Phone")%></li>
        </ul>
    </div>
                    
    </ItemTemplate>
</asp:Repeater> 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetContactDetailsByKitchenId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="nKitchenId" 
            SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
