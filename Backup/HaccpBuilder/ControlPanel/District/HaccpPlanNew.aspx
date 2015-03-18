<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_HaccpPlanNew" Codebehind="HaccpPlanNew.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

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
                                                <uc1:DistrictAddrssNew ID="DistrictAddrssNew1" runat="server" />
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
                                                <asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/District/LayoutTest.aspx"></asp:HyperLink>
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
        </div>
        <div class="grey_bg_dis">
        <div class="red_heading">{ <b>Location: </b><asp:Label ID="lblKitchen" runat="server"></asp:Label> }</div>
        </div>
        <table>
            <tr>
                <td align="center">
                    <div class="grey_bg_dis">
                        <table>
                            <tr style="background-color: Silver;">
                                <td width="800px" height="25px" align="center">
                                    <b>PLEASE SELECT SECTION OF FOOD SAFETY MANAGEMENT SYSTEM</b>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>                            
                            </tr>
                            <tr>
                                <td align="left">
                                   <a href="HaccpPlan1.aspx" target="_blank" class="BlueHeading">Section One:</a>
                                   <p>Description of Program Overview and Facility, Food Safety Program Overview, 
                                   Table of Contents, HACCP Procedural Questions and Answers, Vendor Detail, 
                                   Customer Detail, Inventory Review</p><br />
                                   <p ><span style="font-size:13px; font-weight:bold;"> Section Two: </span>End Product/Menu Items HACCP Process Tables <b>(MUST PRINT IN LANDSCAPE)</b></p>
                                  <asp:Repeater ID="rptProcess" runat="server"  
                                    DataSourceID="SqlDataSource2">             
                                    <ItemTemplate>
                                    <a href='<%# "HaccpPlan2.aspx?ProcessId=" + Eval("ProcessId")  %>' target="_blank" class="BlueHeading1"> <%# Eval("ProcessName")%> </a><br />
                                    </ItemTemplate>
                                    </asp:Repeater><br />                                  
                                   <asp:HyperLink ID="hlHaccpPlan3" Text="Section Three" NavigateUrl="~/ControlPanel/District/HaccpPlan3.aspx" Target="_blank" CssClass="BlueHeading" runat="server"></asp:HyperLink>                                
                                   <%--<a href="HaccpPlan3.aspx"  class="BlueHeading" target="_blank" >Section Three:</a>--%>
                                   <p>Responsibilities and Corrective Action Detail; Log Driven and Food Category Driven</p><br />
                                   <asp:HyperLink ID="hlHaccpPlan4" runat="server" NavigateUrl="~/ControlPanel/District/HaccpPlan4.aspx" Target="_blank" CssClass="BlueHeading" Text="Section Four:"></asp:HyperLink>
                                   <p>Pest Control Plan, Cleaning and Sanitization Plan, Facility and Equipment Maintenance Plan, SOP’s, 
                                   Reference Documents;  HACCP Procedural Steps, Seafood Reference Table, HACCP Terms Glossary</p> <br />
                                   <asp:HyperLink ID="hlHaccpPlan5" runat="server" NavigateUrl="~/ControlPanel/District/HaccpPlan5.aspx" Target="_blank" CssClass="BlueHeading" Text="Section Five:"></asp:HyperLink>
                                   <p>Menu Items Recipes Details</p> <br />
                                   <asp:HyperLink ID="hlHaccpPlan6" runat="server" NavigateUrl="~/ControlPanel/District/HaccpPlan6.aspx" Target="_blank" CssClass="BlueHeading" Text="Section Six:"></asp:HyperLink>
                                   <p>C-TPAT</p> <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetProcessesByKitchenMenuId" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
           </asp:SqlDataSource> 
</asp:Content>
