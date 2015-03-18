<%@ Page Language="C#" MasterPageFile="~/ControlPanel/AdminMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Admin_ViewKitchen" Title="Admin Panel | View Kitchens" Codebehind="ViewKitchen.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
         <div class="MainHeading">
              VIEW KITCHENS AND ADMIN PAGE               
         </div>            
    </div>        
    <div>
        <div class="ContentLeft" >  
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>                          
                <div class="Buttons">                   
                   <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search Kitchen User:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtKitchenUser" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByKitchenUser" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByKitchenUser_Click"  />
                    </div>
                    </div>
                   <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By  Kitchen:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtKitchen" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByKitchen" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByKitchen_Click" />
                    </div>
                    </div>                                                        
                   <div class="Clearer" style="margin-top:15px"></div>
                   <div style="margin-left:10px; margin-right:10px; margin-top:10px; font-family:Verdana; font-size:14px; font-weight:bold; color:Red;">
                    <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
                </div> 
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >              
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>            
    </div> 
    <div class="GirdDiv">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:GridView ID="grdKitchen" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin" 
            onrowcommand="grdKitchen_RowCommand">                
                <Columns>                 
                    <asp:BoundField DataField="Kitchen" HeaderText="Kitchen Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="KitchenId" HeaderText="Kitchen ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DistrictId" HeaderText="District ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Edit Kitchen" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Admin/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen") + "&DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Kitchen Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbChecks" runat="server" Text="Delete" CommandArgument='<%# Eval("KitchenId") %>' CommandName="Remove"></asp:LinkButton>
                       <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbChecks"  ConfirmText="Are you sure about deleting this record" runat="server">
                       </cc1:ConfirmButtonExtender>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                    
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>    
            <asp:GridView ID="grdKitchenSearch" runat="server" AutoGenerateColumns="False"  
            Visible="false" SkinID="gridviewSkin" onrowcommand="grdKitchenSearch_RowCommand">                
                <Columns>                 
                    <asp:BoundField DataField="Kitchen" HeaderText="Kitchen Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="KitchenId" HeaderText="Kitchen ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DistrictId" HeaderText="District ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Edit Kitchen" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Admin/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen") + "&DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Kitchen Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbChecks" runat="server" Text="Delete" CommandArgument='<%# Eval("KitchenId") %>' CommandName="Remove"></asp:LinkButton>
                       <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbChecks"  ConfirmText="Are you sure about deleting this record" runat="server">
                       </cc1:ConfirmButtonExtender>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                    
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>      
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetKitchenDetailsByDistrictId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenDetail">
            <SelectParameters>
                <asp:QueryStringParameter Name="nDistrictId" QueryStringField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

