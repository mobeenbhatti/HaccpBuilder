<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_ViewKitchen" Title="HACCP Builder | View Kitchen" Codebehind="ViewKitchen.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <div id="titlediv"><!----HEADER-TITLE-START----->
      <div class="container">
        <div class="page-title">
          <h1>VIEW YOUR INDIVIDUAL KITCHENS</h1>
        </div>
      </div>
    </div>
<div class="container">
    <div class="ph-top"></div>
    <div class="form3">
        <div class="left">
           Search Location: <asp:TextBox ID="txtKitchen" runat="server" CssClass="district_TextBox"></asp:TextBox>  
            <asp:Button ID="cmdSearch"  runat="server" Text="Search"  onclick="cmdSearch_Click"/>
        </div>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">SITES/LOCATIONS IN THE CORPORATION</h4>
    </div>
     <asp:GridView ID="grdKitchenDetails" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="zebra">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Site Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%# Eval("TypeId").ToString() == "3"?"~/ControlPanel/District/CreateHBFlex.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen"):Eval("TypeId").ToString() == "5"?"~/ControlPanel/District/CreateHBFlexR.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen"):"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                    <asp:BoundField DataField="Manager" HeaderText="Manager Name"  />	
	                    <asp:BoundField DataField="EmailAddress" HeaderText="Manager Email"  />	
	                    <asp:BoundField DataField="Phone" HeaderText="Manager Phone"  />
	                    <asp:TemplateField HeaderText="User Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlUserName" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId")%>'
	                             Text='<%#DataBinder.Eval(Container.DataItem, "UserName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >                    
	                     <asp:BoundField DataField="Password" HeaderText="Password"  />	                                        
	                    <asp:TemplateField HeaderText="E-Alert ON/OFF" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>	                            
	                            <asp:Label ID="lblEAlert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EAlerts").ToString() == "1" ? "ON":"OFF" %>'></asp:Label>	                            
	                        </ItemTemplate>
	                    </asp:TemplateField>  
                </Columns>
            </asp:GridView>
      <asp:GridView ID="grdSearchKitchen" runat="server" AutoGenerateColumns="False" CssClass="zebra" Visible="false">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Site Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                    <asp:BoundField DataField="Manager" HeaderText="Manager Name"  />	
	                    <asp:BoundField DataField="EmailAddress" HeaderText="Manager Email"  />	
	                    <asp:BoundField DataField="Phone" HeaderText="Manager Phone"  />
	                    <asp:TemplateField HeaderText="User Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlUserName" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId")%>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "UserName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                    </asp:TemplateField >  
	                    <asp:TemplateField HeaderText="E-Alert ON/OFF" >
	                        <ItemTemplate>
	                            <%--<asp:CheckBox ID="chkAlert" runat="server" Checked='<%# Eval("EAlerts").ToString() == "1"? true:false %>' />--%>
	                            <asp:Label ID="lblEAlert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EAlerts").ToString() == "1" ? "ON":"OFF" %>'></asp:Label>	                            
	                        </ItemTemplate>
	                    </asp:TemplateField>  
                </Columns>
            </asp:GridView>
           
      
    </div>
 </div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetKitchenDetailsByDistrictId" 
        SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                 Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>
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

