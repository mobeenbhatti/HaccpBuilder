<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_InventoryReview" Title="HACCP Plan | Inventory Review" Codebehind="InventoryReviewOld.aspx.cs" %>

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
                              <td class="red_heading">{  EQUIPMENT INVENTORY CONT: <span class="SecondaryHeading"> STEP <span style="color:Black;" >SIX</span> OF NINE BUILDING YOUR HACCP PLAN </span> }</td>
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
    <div class="buttons_bg"></div>
    <div class="grey_bg_dis">
    <asp:ImageButton ID="btnAddItem" runat="server" onclick="btnAddItem_Click"  ImageUrl="~/images/buttons/ButtonCustomInventory.png" />
    </div>     
        <div class="table_view">
            <asp:GridView ID="grdInventoryDetails" runat="server" 
                AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"   
                SkinID="gridviewSkin" DataKeyNames="Id" 
                >                
                <Columns>                                 
                    <asp:BoundField HeaderText="Inventory Item" DataField="Name" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="150px" > 
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="350px"></ItemStyle>
                    </asp:BoundField>                    
                    <%--<asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                        <asp:CheckBox ID="chkSelectInventoryItem"  runat="server" />
                        </ItemTemplate>
                         <ItemStyle Width="50px" />
	                     <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity")%>' runat="server"></asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:TemplateField>--%>
                    <asp:BoundField HeaderText="Quantity" DataField="Quantity" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >

<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>

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
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Inventory Item" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" NavigateUrl='<%# Eval("IsCustom").ToString() == "Yes"? "~/ControlPanel/Kitchen/CustomInventory.aspx?Id=" + Eval("Id"):"~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx" %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:CommandField ButtonType="Link" EditText="Edit" HeaderText="Inventory Item" 
                        ShowEditButton="true" HeaderStyle-CssClass="gridheaderline" 
                        ItemStyle-Width="50px" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:CommandField>--%>	               
                </Columns>
                <PagerSettings Mode="Numeric" FirstPageText="" />
                <PagerStyle CssClass="gridPager" />
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
        <div class="grey_bg_form">
        <asp:ImageButton ID="cmdContinue" runat="server" onclick="cmdContinue_Click" align="right"  
                ImageUrl="~/images/buttons/ButtonFisnishContinue.png" /> 
           <%--<asp:Button ID="Button1" Text="Continue >>" runat="server" 
          CssClass="Button" onclick="cmdContinue_Click" />--%>
        </div>    
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>       
</asp:Content>

