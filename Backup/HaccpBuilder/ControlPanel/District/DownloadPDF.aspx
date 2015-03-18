<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master"
    AutoEventWireup="true" Inherits="ControlPanel_District_DownloadPDF" Codebehind="DownloadPDF.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">
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
                                                { ACTIVE ALERTS }
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <uc1:districtaddrssnew id="DistrictAddrssNew1" runat="server" />
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
                                                <asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png"
                                                    NavigateUrl="~/ControlPanel/District/LayoutTest.aspx"></asp:HyperLink>
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="300" align="left">
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
      
        <div style="clear: both;">
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
                                        <asp:ListItem Text="INGREDIENTS BY FOOD CATEGORY, HAZARDS (BIOLOGICAL, CHEMICAL, PHYSICAL)"
                                            Value="6"></asp:ListItem>
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
