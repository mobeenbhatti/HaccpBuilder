<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuItemsReview" Title="HACCP Plan | Menu  Review" Codebehind="MenuItemsReview.aspx.cs" %>


<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
        <div >
            <div class="MainHeading">
               BUILD HAACP PLAN - MENU REVIEW
               <span style="font-size:10px; margin-left:190px">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
              </span>
            </div>            
        </div>        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="InventoryButtons">
                   <%-- <div >
                        <asp:Button ID="cmdContinue" Text="Continue >>" runat="server" 
                            CssClass="InventoryButton" onclick="cmdContinue_Click" />
                    </div>    --%>                
                              
                    <div style="margin-top:15px;">
                    <asp:ImageButton ID="btnAddItem" runat="server" onclick="btnAddItem_Click"  ImageUrl="~/images/buttons/ButtonAddCustomMenuItem.jpg" /> 
                      <%-- <asp:Button ID="btnAddItem"  Text="Add Custom Inventory Item" runat="server" 
                            CssClass="InventoryButton" onclick="btnAddItem_Click" />--%>    
                    </div>                                   
                </div>  
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div>
        
       
       <div class="Clearer"></div>
        <div class="GirdDiv">
            <asp:GridView ID="grdMenuItems" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin">                
                <Columns>
                    <asp:BoundField DataField="MenuItem" HeaderText="Menu Item" 
                        ItemStyle-Width="200px" HeaderStyle-CssClass="gridheaderline" >                    
<HeaderStyle CssClass="gridheaderline">
</HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ItemId" HeaderText="Item ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="FoodGroup" HeaderText="Food Group" 
                        ItemStyle-Width="200px" HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="250px"></ItemStyle>
                  </asp:BoundField>
	                <asp:BoundField DataField="PreparationType" HeaderText="Prepration" 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="CustomItem" HeaderText="Custom Item" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >	                   
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="Process" HeaderText="Process" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
	                <asp:TemplateField HeaderText="Recipe">
                            <ItemTemplate>
                            <asp:HyperLink ID="hlFileName" Text="View"
                                NavigateUrl='<%#Eval("CustomItem").ToString() == "No"?int.Parse(Eval("FoodGroupId").ToString()) <= 9? "~/StaticContent/Files/" + DataBinder.Eval(Container.DataItem, "FileName"):"":"~/ControlPanel/Kitchen/CustomMenuRecipe.aspx?Id=" + Eval("Id")  %>'
                                 runat="server" Target="_blank" ></asp:HyperLink>
                               <%--<asp:HyperLink ID="hlFileName" Text='<%# Eval("CustomItem").ToString() == "No"? "View":"" %>'
                                NavigateUrl='<%#int.Parse(Eval("FoodGroupId").ToString()) <= 9? "~/StaticContent/Files/" + DataBinder.Eval(Container.DataItem, "FileName"):""  %>'
                                 runat="server" Target="_blank" ></asp:HyperLink>--%>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="100px" HeaderText="Menu Item" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEdit" runat="server" Text="Edit"
                             NavigateUrl='<%# Eval("CustomItem").ToString() == "Yes"? "~/ControlPanel/Kitchen/CustomMenuItems.aspx?Id=" + Eval("Id"):"~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx?foodgroup=" + Eval("FoodGroupId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>           
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetfoodGroupsDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
            </asp:ObjectDataSource>
        
        </div>
        <div class="Clearer"></div>
        <div style="margin-left:860px; margin-top:10px; margin-bottom:10px;">
        <asp:ImageButton ID="cmdContinue" runat="server" onclick="cmdContinue_Click"  ImageUrl="~/images/buttons/ButtonContinue.gif" /> 
           <%--<asp:Button ID="Button1" Text="Continue >>" runat="server" 
          CssClass="Button" onclick="cmdContinue_Click" />--%>
        </div>   
        <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div> 
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
         
    <%--<asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                        <asp:CheckBox ID="chkSelectInventoryItem"  runat="server" />
                        </ItemTemplate>
                         <ItemStyle Width="50px" />
	                     <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>--%>
</asp:Content>

