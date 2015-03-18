<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_KitchenCCP" Title="HACCP Builder | Kitchen CCP Group" Codebehind="KitchenCCP.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               ADD/EDIT VIEW KITCHENS IN GROUP
               <span style="font-size:10px; margin-left:150px;">
              <a href="DistrictControl.aspx"><img src="../../images/buttons/ButtonBackToMain.jpg" alt="" /></a>            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
                <%--<div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Select Group:</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlKitchen" Width="200px" runat="server" CssClass="DropDown"></asp:DropDownList>
                    </div>                    
                </div>   --%>          
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="btnEditCCPGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateSOPGroup.jpg" 
                           onclick="btnEditCCPGroup_Click"/>  
                   </div>                  
                   <div class="Clearer" style="margin-top:15px"></div>
                   <%--<div class="ViewPlanClearer"></div>--%>
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnCreateCustomCCP"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateCustomSOP.jpg" 
                           onclick="btnCreateCustomCCP_Click"/>
                   </div>                   
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <%--<div class="FloatLeft">
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>--%>
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>             
        <div class="Clearer"></div>
        <%--<div class="ViewPlanClearer"></div>--%>            
    </div>
    <div class="GirdDiv">     
        
      <asp:GridView ID="grdhKitchenGroup" runat="server" AutoGenerateColumns="False"  
            SkinID="gridviewSkin" DataSourceID="SqlDataSource1" 
            onrowdatabound="grdhKitchenGroup_RowDataBound" AllowPaging="True">                
                <Columns>
                    <asp:TemplateField >
	                        <ItemTemplate>
	                            <asp:HiddenField ID="hfKitchenId" Value='<%# DataBinder.Eval(Container.DataItem, "KitchenId")  %>' runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >                    
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
	                    <asp:TemplateField HeaderText="CCP Group">
	                        <ItemTemplate>
	                            <asp:DropDownList ID="ddlCCPGroup" runat="server" DataSourceID="ObjectDataSource1"
	                             DataTextField="GroupName" DataValueField="CCPGroupId" CssClass="DropDown"></asp:DropDownList>
	                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCPGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="CCP's">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlCCP" runat="server" NavigateUrl='<%#"~/ControlPanel/District/CustomCCP.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "KitchenCCPGroupId")%>' 
	                             Text="View">
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>   
                </Columns>                
            </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetKitchenDetailsByDistrictId" 
        SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                 Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>     
    </div>
    <div style="clear:both; margin-top:10px;"></div>
    <div style="margin-left:750px;">              
        <div class="FloatLeft" >
         <asp:ImageButton ID="cmdContinue" 
                ImageUrl="~/images/District Images/btnSaveAndContinue.jpg" 
                OnClick="cmdContinue_Click" runat="server" />
         </div>                        
        <div class="Clearer"></div>
    </div>
    <div class="Clearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>               
</asp:Content>

