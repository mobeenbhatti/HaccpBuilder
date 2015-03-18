<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_InventoryItemManager" Title="Inventory Item Manager" Codebehind="InventoryItemManager.aspx.cs" %>


<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="bdy_contents">
    <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ INVENTORY ITEM MANAGER }</td>
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
    <asp:ImageButton ID="btnInventoryManager" onclick="btnInventoryManager_Click" Height="37" 
                           runat="server"  ImageUrl="~/images/buttons/ButtonInventory.png" /> 
    <asp:ImageButton ID="btnMenuManager" onclick="btnMenuManager_Click" runat="server" Height="37"  
                        ImageUrl="~/images/buttons/bt-Outputs-Menu-Items.png"  />
    <asp:ImageButton ID="cmdAddIngredient" ImageUrl="~/images/buttons/BT-Inouts-Ingredients.png" runat="server" 
                    Height="37"  onclick="cmdAddIngredient_Click" />
    <asp:ImageButton ID="cmdAddVendor" runat="server" 
                  Height="37" ImageUrl="~/images/buttons/ButtonVendor.png" runat="server" 
                           onclick="cmdAddVendor_Click" />
    <asp:ImageButton ID="btnViewSop"  runat="server"  
                    Height="37" ImageUrl="~/images/buttons/ButtonSOP.png" onclick="btnViewSop_Click" />  
    </div> 
    <div class="grey_bg_dis">
    <asp:ImageButton ID="btnAddItem" runat="server" onclick="btnAddItem_Click"  ImageUrl="~/images/buttons/ButtonCustomInventory.png" />
    </div>
    <div class="table_view">
    <asp:GridView ID="grdInventoryItems" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin" >                
                <Columns>
                    <asp:BoundField HeaderText="Inventory Item" DataField="Name" 
                        HeaderStyle-CssClass="gridheaderline" > 
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Quantity" DataField="Quantity" 
                        HeaderStyle-CssClass="gridheaderline"  >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                       
                    </asp:BoundField>
                    <%--<asp:TemplateField HeaderText="SOP">
	                     <ItemTemplate>
	                        <asp:HyperLink ID="hlSOP" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "SOP")  %>'
	                         Text='<%# DataBinder.Eval(Container.DataItem, "SOP")  %>'>
	                        </asp:HyperLink>
	                     </ItemTemplate>	                            
	                     <ItemStyle Width="350px" />
	                     <HeaderStyle CssClass="gridheaderline" />
	               </asp:TemplateField>--%>
	               <asp:BoundField HeaderText="Custom Item" DataField="IsCustom" 
                        HeaderStyle-CssClass="gridheaderline" >                  
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                       
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
      <%--                  --%>
                            <asp:HyperLink ID="hlEdit"  NavigateUrl='<%# Eval("IsCustom").ToString() == "No"? "~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx":"~/ControlPanel/Kitchen/CustomInventory.aspx?Id=" +  DataBinder.Eval(Container.DataItem,"Id") %>' Text="Edit" runat="server"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>

    </div>   
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
</asp:Content>

