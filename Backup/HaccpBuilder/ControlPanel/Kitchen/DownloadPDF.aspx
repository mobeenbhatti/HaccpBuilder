<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"
    AutoEventWireup="true" Inherits="ControlPanel_Kitchen_DowloadPDF" Codebehind="DownloadPDF.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content1" ContentPlaceHolderID="PlaceHolder" runat="server">
  <script type="text/javascript">  
             function openWindow(strURL){
                 window.open(strURL); //,'','toolbar=no','location=no','directories=no','status=yes','menubar=yes','scrollbars=yes','resizable=yes','width=800','height=600'
                
                
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
                                                { MAIN CONTROL PANEL }
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Contact:Detail ID="cd" runat="server" />
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>--%>
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
                                                <asp:HyperLink ImageUrl="~/images/District Images/ButtonUserGuide.png" Width="180"
                                                    Height="30" NavigateUrl="~/StaticContent/Files/Free Trial Instruction Guide.pdf"
                                                    runat="server" ID="hlUserGuide" Target="_blank"></asp:HyperLink>
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
        <div class="buttons_bg" align="center">
           <%-- <asp:ImageButton ID="btnEditPlan" runat="server" Height="37" OnClick="btnEditPlan_Click"
                ImageUrl="~/images/buttons/ButtonEditPlan.png" />--%>
            <asp:HyperLink ID="btnEditPlan" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/ProceduralQuestion.aspx" ImageUrl="~/images/buttons/ButtonEditPlan.png"></asp:HyperLink>
           <%-- <asp:ImageButton ID="btnInventoryManager" Height="37" OnClick="btnInventoryManager_Click"
                runat="server" ImageUrl="~/images/buttons/ButtonInventory.png" />--%>
             <asp:HyperLink ID="HyperLink1" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/InventoryItemManager.aspx" ImageUrl="~/images/buttons/ButtonInventory.png"></asp:HyperLink>
            <%--<asp:ImageButton ID="btnMenuManager" Height="37" OnClick="btnMenuManager_Click" runat="server"
                ImageUrl="~/images/buttons/ButtonMenu.png" />--%>
             <asp:HyperLink ID="HyperLink2" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/MenuItems.aspx" ImageUrl="~/images/buttons/ButtonMenu.png"></asp:HyperLink>
           <%-- <asp:ImageButton ID="btnIngredient" Height="37" ImageUrl="~/images/buttons/ButtonIngredient.png"
                runat="server" OnClick="btnIngredient_Click" />--%>
             <asp:HyperLink ID="HyperLink3" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/Ingredients.aspx" ImageUrl="~/images/buttons/ButtonIngredient.png"></asp:HyperLink>
            <%--<asp:ImageButton ID="btnVendors" runat="server" Height="37" ImageUrl="~/images/buttons/ButtonVendor.png"
                runat="server" OnClick="btnVendors_Click" />--%>
            <asp:HyperLink ID="HyperLink4" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/Vendors.aspx" ImageUrl="~/images/buttons/ButtonVendor.png"></asp:HyperLink>
           <%-- <asp:ImageButton ID="btnViewSop" runat="server" Height="37" ImageUrl="~/images/buttons/ButtonSOP.png"
                OnClick="btnViewSop_Click" />--%>
             <asp:HyperLink ID="HyperLink5" runat="server" Height="37" NavigateUrl="~/ControlPanel/Kitchen/SOPList.aspx" ImageUrl="~/images/buttons/ButtonSOP.png"></asp:HyperLink>
        </div>
        <table>
            <tr>
                <td align="center">
                    <div class="grey_bg_dis">
                        <table>
                            <tr style="background-color: Silver;">
                                <td width="800px" height="25px" align="center">
                                    <b>PLEASE SELECT PDF TO DOWNLOAD</b>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td align="center">
                                  
                                    <asp:DropDownList ID="ddlPDFFiles" Height="25px" Width="300px" Font-Names="Verdana"
                                        AutoPostBack="true" runat="server" OnSelectedIndexChanged="PDFFiles_SelectedIndexChanged">
                                        <asp:ListItem Text="Please Select PDF" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Procedural Steps" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Procedural Question" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Vendors" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Customers" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Inventory Items" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="INGREDIENTS BY FOOD CATEGORY, HAZARDS (BIOLOGICAL, CHEMICAL, PHYSICAL)" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="INGREDIENTS BY FOOD CATEGORY,CCP AND CP" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Product/Menu Detail All Recipes" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Processes" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="SOPs" Value="10"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
