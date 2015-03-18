<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_DistrictReports" Title="HACCP Builder | Reports" Codebehind="DistrictReports.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <div id="titlediv"><!----HEADER-TITLE-START----->
      <div class="container">
        <div class="page-title">
          <h1>REPORTS</h1>
        </div>
      </div>
    </div>
<div class="container">
    <div class="ph-top"></div>
    <div class="form3">
        <div class="left">
          <div class="clear"></div>
            <h1 class="left h1margin-r">Search By User Location:</h1>
            <div class="input left">
                <asp:DropDownList ID="ddlKitchenName" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Name" DataValueField="KitchenId"></asp:DropDownList>
                <asp:Button ID="cmdSearchByKitchen" Text="Search"  runat="server" />
             </div>
            <div class="clear"></div>
            <h1 class="left h1margin-r">Search By Manager Name:</h1>
            <div class="input left">
               <asp:TextBox ID="txtUserName" runat="server" Width="200px" ></asp:TextBox>
                <asp:Button ID="cmdSearchByManagerName"  runat="server" Text="Search"/>
            </div>
            <div class="clear"></div>
            <h1 class="left h2margin-r">Search By Email Address:</h1>
            <div class="input left">
                <asp:TextBox ID="txtEmailAddress" runat="server" Width="200px"></asp:TextBox>
                 <asp:Button ID="cmdSearchByEmail"  runat="server" Text="Search" />
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Locations</h4>
    </div>
     <asp:GridView ID="grdKitchenDetails" runat="server" AutoGenerateColumns="False"  DataSourceID="ObjectDataSource1" CssClass="zebra" AllowPaging="True" onrowcommand="grdKitchenDetails_RowCommand">                
                <Columns> 
                    <asp:TemplateField>
	                        <ItemTemplate>
	                            <asp:HiddenField ID="hfKitchenId" Value='<% DataBinder.Eval(Container.DataItem, "KitchenId") %>' runat="server" />
	                        </ItemTemplate> 
	                    </asp:TemplateField >                                       
                    <asp:TemplateField HeaderText="Location Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >	                                
	                    <asp:BoundField DataField="Manager" HeaderText="Manager">	
                    </asp:BoundField>
	                    <asp:TemplateField HeaderText="Managers Email">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId") %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress")  %>'>
	                            </asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>
	                    <asp:BoundField DataField="Phone" HeaderText="Phone" >   
                        </asp:BoundField>                    
	                    <asp:TemplateField HeaderText="HACCP PLan">
                             <ItemTemplate>                             
                                <%-- <asp:LinkButton ID="hlPlan" runat="server" CommandName="View Plan"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "KitchenId")%>' Text="View Plan" >
	                             </asp:LinkButton>--%>
                                 <asp:HyperLink ID="hlPlan" runat="server" NavigateUrl='<%# "~/ControlPanel/District/PlanIndexPrint.aspx?KitchenId=" + DataBinder.Eval(Container.DataItem, "KitchenId") + "&Name=" + DataBinder.Eval(Container.DataItem, "Kitchen") %>'
	                             Text="View Plan">
	                            </asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reports">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlDailyReport" runat="server" NavigateUrl='<%# "~/ControlPanel/District/KitchenReportsNew.aspx?KitchenId=" + DataBinder.Eval(Container.DataItem, "KitchenId") + "&Name=" + DataBinder.Eval(Container.DataItem, "Kitchen") %>'
	                             Text="View Reports">
	                            </asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>	
                        <asp:TemplateField HeaderText="Corrective Actions Reports">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlCorrectiveReport" runat="server" NavigateUrl='<%# "~/ControlPanel/District/CorrectiveActionReport.aspx?KitchenId=" + DataBinder.Eval(Container.DataItem, "KitchenId") + "&Name=" + DataBinder.Eval(Container.DataItem, "Kitchen") %>'
	                             Text="View Reports">
	                            </asp:HyperLink>
                             </ItemTemplate>
                        </asp:TemplateField>	                   
                </Columns>
            </asp:GridView>                
    </div>
 </div>
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetKitchenByDistrictId" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>  
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

