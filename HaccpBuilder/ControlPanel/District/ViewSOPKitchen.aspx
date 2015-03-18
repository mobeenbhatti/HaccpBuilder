<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_ViewSOPKitchen" Title="HACCP Builder | View Kitchens in SOP Group" Codebehind="ViewSOPKitchen.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               VIEW KITCHENS
               <span style="font-size:10px; margin-left:370px;">
               <asp:ImageButton ID="btnBack" runat="server"   
                   ImageUrl="~/images/buttons/ButtonBackToMain.jpg" onclick="btnBack_Click" />            
               </span>
     </div>               
    </div> 
    <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
                 <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Select Kithen Group</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlKitchen" Width="200px" runat="server" DataSourceID="ObjectDataSource2"
	                             DataTextField="GroupName" DataValueField="KitchenGroupId" AppendDataBoundItems="true"
                            CssClass="DropDown" AutoPostBack="true">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>                           
                    </div>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOPGroup">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>     
                                          
                </div>
                <div class="Clearer"></div>                
   </div>
    <div class="ContentRight" >                     
            <ucl:Advs id="adv1" runat="server"></ucl:Advs>
    </div>
    <div class="Clearer"></div>
    <div class="ViewPlanClearer"></div>
    <div class="GirdDiv">
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetKitchensBySOPGroup" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlKitchen" Name="nGroupId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
      <asp:GridView ID="grdhKitchenGroup" runat="server" AutoGenerateColumns="False"  
            SkinID="gridviewSkin" DataSourceID="ObjectDataSource3" AllowPaging="True">                
                <Columns>
                    <%--<asp:TemplateField >
	                        <ItemTemplate>
	                            <asp:HiddenField ID="hfKitchenId" Value='<%# DataBinder.Eval(Container.DataItem, "KitchenId")  %>' runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >  --%>                  
                    <asp:TemplateField HeaderText="Kitchen Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                                        
	                    <asp:BoundField DataField="Manager" HeaderText="Manager" 
                            HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="150px" >	                    
                            <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
	                     <asp:TemplateField HeaderText="Email Address">
                             <ItemTemplate>
                                 <asp:HyperLink ID="hlEmail" runat="server" NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId")%>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress")  %>'>
	                            </asp:HyperLink>
                             </ItemTemplate>
                             <ItemStyle Width="100px" />
                             <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
	                    <asp:BoundField DataField="Phone" HeaderText="Phone" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
	                     <asp:BoundField DataField="SOPGroup" HeaderText="SOP Group" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
	                    <%--<asp:TemplateField HeaderText="SOP's">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlSOP" runat="server" NavigateUrl='<%#"~/ControlPanel/District/CustomSOP.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "KitchenGroupId")%>' 
	                             Text="View">
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>  --%> 
                </Columns>                
            </asp:GridView>      
    </div>
    <div class="Clearer"></div>
    <div class="ViewPlanClearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>    
</asp:Content>

