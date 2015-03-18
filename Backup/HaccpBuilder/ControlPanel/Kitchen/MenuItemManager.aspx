<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" 
    AutoEventWireup="true" Inherits="ControlPanel_MenuItemManager"
    Title="Product/Menu Item Manager" Codebehind="MenuItemManager.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <div class="bdy_contents">
    <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ Output MANAGER }</td>
                            </tr>
                            <tr>
                              <td><Contact:Detail ID="Detail1" runat="server" /></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="54" background="../../images/District Images/bg_btns_strip.gif"><table width="690" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" width="10" height="12" /></td>
                        </tr>
                        <tr>
                          <td><table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"><asp:HyperLink ImageUrl="~/images/District Images/ButtonGoToMain.png" Width="180" Height="30"
                              NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" runat="server" ID="hlUserGuide"></asp:HyperLink></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" /></td>
                        </tr>
                      </table></td>
              </tr>
                  </table>
   		  </div>
    <div class="buttons_bg" align="center">
    <asp:ImageButton ID="btnEditPlan" runat="server" onclick="btnEditPlan_Click" Height="37" ImageUrl="~/images/buttons/ButtonEditPlan.png" /> 
    <asp:ImageButton ID="btnInventoryManager" onclick="btnInventoryManager_Click" 
                   Height="37" runat="server"  ImageUrl="~/images/buttons/ButtonInventory.png" /> 
    <%-- <asp:ImageButton ID="btnMenuManager" Height="37" OnClick="btnMenuManager_Click" runat="server"
                ImageUrl="~/images/buttons/ButtonMenu.png" /> --%>
            <asp:ImageButton ID="btnMenuManager" Height="37"  Width="225" OnClick="btnMenuManager_Click" runat="server"
                ImageUrl="~/images/buttons/outputs.png" />
    <asp:ImageButton ID="cmdAddIngredient"  Height="37"  Width="225"  ImageUrl="~/images/buttons/Inputs.png" runat="server" 
                           onclick="cmdAddIngredient_Click" />
    <asp:ImageButton ID="cmdAddVendor" runat="server" 
                    Height="37" ImageUrl="~/images/buttons/ButtonVendor.png" runat="server" 
                           onclick="cmdAddVendor_Click" />
    <asp:ImageButton ID="btnViewSop"  runat="server"  
                     Height="37" ImageUrl="~/images/buttons/ButtonSOP.png" onclick="btnViewSop_Click" />  
    </div> 
    
    <div class="table_view">
    
    <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp1"
                BackgroundCssClass="popUpStyle"
                PopupDragHandleControlID="panelDragHandle1"
                DropShadow="true"
                />
    <br />
    <div class="popUpStyle" id="divPopUp" style="display:none;" runat="server">
        <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
            Hold here to Drag this Box</asp:Panel>                
       <asp:DetailsView ID="dtvFoodCategory" runat="server" AutoGenerateRows="False" 
          Height="50px" Width="100%">
        <Fields>
        <asp:TemplateField>
        <ItemTemplate>
        <div class="LogHeading">FoodCategory</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "FoodCategory")%>
        </div>
        <div class="Clearer"></div>
        <div class="LogHeading">Biological Hazard</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "BiologicalHazard")%>
        </div>
        <div class="Clearer"></div>
        <div class="LogHeading">Chemical Hazard</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "ChemicalHazard")%>
        </div>
        <div class="Clearer"></div>
        <div class="LogHeading">Physical Hazard</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "PhysicalHazard")%>
        </div>
        <div class="Clearer"></div>
        <div class="LogHeading">Associated CCP</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "CCP")%>
        </div>
        <div class="Clearer"></div>
        <div class="LogHeading">Associated CP</div>
        <div class="FloatLeft">
        <%# DataBinder.Eval(Container.DataItem, "CP")%>
        </div>
        </ItemTemplate>
        </asp:TemplateField>
        </Fields>
        </asp:DetailsView> 
        <br />                       
        <asp:Button ID="Button1" runat="server" Text="Close" />
       <br />
    </div>
        <asp:GridView ID="grdMenuItems" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
            SkinID="gridviewSkin" onrowdatabound="grdMenuItems_RowDataBound" 
            onrowcommand="grdMenuItems_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Output">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>                        	                           
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                    <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField >
                <asp:TemplateField HeaderText="Prepration">
                    <ItemTemplate>
                        <asp:Label ID="lblPreparation" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PreparationType") %>'></asp:Label>	                           
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                    <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField >
                <asp:TemplateField HeaderText="Process">
                    <ItemTemplate>
                        <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                    <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField >
                
                <%--<asp:BoundField DataField="Name" HeaderText="Menu Item" ItemStyle-Width="200px" HeaderStyle-CssClass="gridheaderline">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PreparationType" HeaderText="Prepration" ItemStyle-Width="200px"
                    HeaderStyle-CssClass="gridheaderline">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Process" HeaderText="Process" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>--%>
                <asp:BoundField DataField="Ingredient" HeaderText="Ingredient" ItemStyle-Width="50px"
                    HeaderStyle-CssClass="gridheaderline">
                <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
               <asp:TemplateField HeaderText="Food Category">
                    <ItemTemplate>
                         <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                    <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField >	               
                <asp:BoundField DataField="VendorName" HeaderText="Vendor" ItemStyle-Width="50px"
                    HeaderStyle-CssClass="gridheaderline">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Hazards & CCP/CP">
                    <ItemTemplate>
                     <asp:LinkButton ID="lkbHazard" Text="View" Enabled='<%# Eval("FoodCategory").ToString()== ""? false: true%>' CommandName="Hazard" CommandArgument='<%# Eval("FoodCategoryId") %>'  runat="server" 
                               ></asp:LinkButton>
                       <%-- <asp:HyperLink ID="hlFileName" Text="View Hazard" NavigateUrl='<%#"~/ControlPanel/Kitchen/Hazards.aspx?FoodId=" + DataBinder.Eval(Container.DataItem, "FoodCategoryID") %>'
                            runat="server" Target="_blank"></asp:HyperLink>--%>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                    <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField>
                <%--<asp:CommandField ButtonType="Link" HeaderText="Menu Item" EditText="Edit" 
                        ShowEditButton="true" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:CommandField>--%>
            </Columns>
            <PagerSettings Mode="Numeric" />
            <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
        </asp:GridView>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetMenuItemNewByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetfoodGroupsDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        </asp:ObjectDataSource>
    </div>   
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
</asp:Content>
