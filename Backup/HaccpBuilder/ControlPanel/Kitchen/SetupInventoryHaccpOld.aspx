<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" 
    AutoEventWireup="true" Inherits="ControlPanel_SetupInventoryHaccp"
    Title="HACCP Plan- Setup Inventory" Codebehind="SetupInventoryHaccpOld.aspx.cs" %>

<%--<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" CodeFile="test.aspx.cs" Inherits="ControlPanel_test" %>
--%>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">

    <script language="javascript" type="text/javascript">
        function check(txtobj, chkObj) {

            if (chkObj.checked == true) {
                txtobj.disabled = false;
            }
            else {
                txtobj.value = "";
                txtobj.disabled = true;
            }
            //    if(enable == false)
            //    {
            //   
            //     ValidatorEnable(vldObj, false); 
            //     txtobj.disabled=true;
            //     txtobj.value = "";
            //    }
            //    else
            //    { 
            //   
            //     ValidatorEnable(vldObj, true);  
            //     txtobj.disabled=false;
            //    }

        }
    </script>

    <div class="bdy_contents">
        <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                            <tr>
                                <td height="165" valign="top">
                                    <table width="690" border="0" cellspacing="5">
                                        <tr>
                                            <td class="red_heading">
                                                { EQUIPMENT INVENTORY: <span class="SecondaryHeading">STEP <span style="color: Black;">
                                                    SIX</span> OF NINE BUILDING YOUR HACCP PLAN </span>}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Contact:Detail ID="Detail1" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="54" background="../../images/District Images/bg_btns_strip.gif">
                        <table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="12" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="690" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                                <asp:HyperLink ImageUrl="~/images/District Images/ButtonGoToMain.png" Width="180"
                                                    Height="30" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx" runat="server"
                                                    ID="hlUserGuide"></asp:HyperLink>
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons_bg">
        </div>
        <div class="grey_bg_dis">
            <div class="red_heading">
                <asp:Label ID="lblError" Text="" CssClass="ValidateLabel" runat="server"></asp:Label></div>
        </div>
        <div class="table_view">
            <asp:GridView ID="grdInventoryDetails" runat="server" AutoGenerateColumns="False"
                DataSourceID="ObjectDataSource1" SkinID="gridviewSkin" DataKeyNames="Id" OnDataBound="grdInventoryDetails_DataBound">
                <Columns>
                    <asp:BoundField HeaderText="Inventory Item" DataField="Name" HeaderStyle-CssClass="gridheaderline"
                        ItemStyle-Width="150px">
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelectInventoryItem" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity")%>'
                                runat="server"></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity"
                                Display="Dynamic" MaximumValue="99" MinimumValue="0" Type="Integer" ErrorMessage="Please enter value in range 1-99."></asp:RangeValidator>
                            <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtQuantity"
                                Font-Names="Verdana" Font-Size="10px" Display="Dynamic" EnableClientScript="true"
                                ErrorMessage="Please enter a valid integer." ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblValidateQuantity" Font-Names="Verdana" Font-Size="10px" ForeColor="Red"
                                Text="" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>
                    <%--<asp:BoundField HeaderText="Quantity" DataField="Quantity" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >

                    </asp:BoundField>--%>
                    <%--<asp:TemplateField HeaderText="SOP">
	                     <ItemTemplate>
	                        <asp:HyperLink ID="hlSOP" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "SOP")  %>'
	                         Text='<%# DataBinder.Eval(Container.DataItem, "SOP")  %>'>
	                        </asp:HyperLink>
	                     </ItemTemplate>	                            
	                     <ItemStyle Width="350px" />
	                     <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField>--%>
                    <asp:BoundField HeaderText="Custom Item" DataField="IsCustom" HeaderStyle-CssClass="gridheaderline"
                        ItemStyle-Width="50px">
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetInventoryItemsDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div class="grey_bg_form">
            <asp:ImageButton ID="btnGoTInventory" OnClick="btnGoTInventory_Click" align="right"
                ImageUrl="~/images/buttons/ButtonFisnishContinue.png" runat="server" />
            <%--<asp:Button ID="btnGoTInventory" Text="Continue >>" runat="server" 
           CssClass="Button" onclick="btnGoTInventory_Click" />--%>
        </div>
        <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    </div>
</asp:Content>
