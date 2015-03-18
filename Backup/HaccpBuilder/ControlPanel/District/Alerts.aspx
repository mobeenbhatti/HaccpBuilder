<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_Alerts" Title="HACCP Builder | Alerts" Codebehind="Alerts.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <div id="titlediv"><!----HEADER-TITLE-START----->
      <div class="container">
        <div class="page-title">
          <h1>ACTIVE ALERTS</h1>
        </div>
      </div>
    </div>
<div class="container">
    <div class="ph-top"></div>
    <div class="form3">
        <div class="left">
           Search Location: <asp:TextBox ID="txtKitchen" runat="server" Width="240px"></asp:TextBox>
           <asp:Button ID="cmdSearchByKitchen"  runat="server" Text="Search" />
        </div>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Locations</h4>
    </div>
     <asp:GridView ID="grdKitchenDetails" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="zebra"
            onrowcommand="grdKitchenDetails_RowCommand" 
            onrowdatabound="grdKitchenDetails_RowDataBound">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Locaion Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="User Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlUserName" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId")%>'
	                             Text='<%#DataBinder.Eval(Container.DataItem, "UserName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >                    
	                    <asp:BoundField DataField="Manager" HeaderText="Manager" />	                    
	                    <asp:BoundField DataField="Phone" HeaderText="Phone" />                    
	                    <asp:TemplateField HeaderText="Alerts" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                            <%--<asp:CheckBox ID="chkAlert" runat="server" Checked='<%# Eval("EAlerts").ToString() == "1"? true:false %>' />--%>
	                            <asp:Label ID="lblEAlert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EAlerts").ToString() == "1" ? "ON":"OFF" %>'></asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Managers Email">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId") %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress")  %>'>
	                            </asp:HyperLink>
                             </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Active Alerts" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                            <%--<asp:CheckBox ID="chkAlert" runat="server" Checked='<%# Eval("EAlerts").ToString() == "1"? true:false %>' />--%>
	                           <%-- <asp:Label ID="lblEAlert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EAlerts").ToString() == "1" ? "ON":"OFF" %>'></asp:Label>--%>	                            
	                            <asp:HyperLink ID="hlAlerts" runat="server" Text="NO" NavigateUrl='<%# "~/ControlPanel/District/KitchenAlerts.aspx?KitchenId=" + DataBinder.Eval(Container.DataItem, "KitchenId") + "&Kitchen=" + DataBinder.Eval(Container.DataItem, "Kitchen")  %>'></asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField>		                   
                </Columns>
            </asp:GridView>
           
      <asp:GridView ID="grdSearchKitchen" runat="server" AutoGenerateColumns="False" CssClass="zebra" Visible="false"  onrowcommand="grdSearchKitchen_RowCommand"  onrowdatabound="grdSearchKitchen_RowDataBound">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Kitchen Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="User Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlUserName" runat="server"  NavigateUrl="~/ControlPanel/Kitchen/Default.aspx"
	                             Text='<%# DataBinder.Eval(Container.DataItem, "UserName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >                    
	                    <asp:BoundField DataField="Manager" HeaderText="Manager" />	                    
	                    <asp:BoundField DataField="Phone" HeaderText="Phone"  />                    
	                    <asp:TemplateField HeaderText="Alerts" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                            <%--<asp:CheckBox ID="chkAlert" runat="server" Checked='<%# Eval("EAlerts").ToString() == "1"? true:false %>' />--%>
	                            <asp:HyperLink ID="hlEAlert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EAlerts").ToString() == "1" ? "ON":"OFF" %>' NavigateUrl=""></asp:HyperLink>	                            
	                        </ItemTemplate>
	                    </asp:TemplateField>   
                         <asp:TemplateField HeaderText="Managers Email">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl="~/ControlPanel/District/DistrictUsers.aspx" 
	                             Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress")  %>'>
	                            </asp:HyperLink>
                             </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active Alerts" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                            <%--<asp:CheckBox ID="chkAlert" runat="server" Checked='<%# Eval("EAlerts").ToString() == "1"? true:false %>' />--%>
	                            <asp:HyperLink ID="hlAlerts" runat="server" Text="NO" NavigateUrl='<%# "~/ControlPanel/District/KitchenAlerts.aspx?KitchenId=" + DataBinder.Eval(Container.DataItem, "KitchenId") + "&Kitchen=" + DataBinder.Eval(Container.DataItem, "Kitchen")  %>'></asp:HyperLink>	                            
	                        </ItemTemplate>
	                    </asp:TemplateField>	                   
                </Columns>
            </asp:GridView>
    </div>
 </div> 
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetKitchenDetailsByDistrictId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenDetail">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>                 
</asp:Content>
