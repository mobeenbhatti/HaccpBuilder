<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_SOPList" Title="HACCP Builder | SOP List" Codebehind="SOPList.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>SOP's / SSOP's / GMP's</h1>
    </div>
  </div>
</div>
<div class="container">
    <div class="ph-top"></div>
    <div class="table" > 
        <div class="box-header">
            <h4 class="left">Standard Operating Procedures - SOP Detailed Index</h4>
        </div>               
        <asp:Repeater ID="rptSOP" runat="server">
        <HeaderTemplate>
        <table class="zebra">
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
        <td style="padding-left:15px;" >
            <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ViewSOP.aspx?SOPId=" + DataBinder.Eval(Container.DataItem, "KitchenSOPId") %>'
                runat="server" Target="_blank"></asp:HyperLink>
            </td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:Repeater>
        <!---- C-TPAT ---->
        <asp:Repeater ID="rptCtpat" runat="server">
        <HeaderTemplate>
        <table class="zebra">
        </HeaderTemplate>
        <ItemTemplate>
        <tr>
        <td style="padding-left:15px;" >
            <asp:HyperLink ID="hlSOP" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ViewCtpat.aspx?CtpatId=" + DataBinder.Eval(Container.DataItem, "KitchenCtpatId") %>'
                runat="server" Target="_blank"></asp:HyperLink>
            </td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        </asp:Repeater>
        <div class="box-bottom"> </div>
     </div>
</div>
   
       <asp:SqlDataSource ID="sqlDSSOP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetSOPsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
     <asp:SqlDataSource ID="sqlDsCtpat" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                    SelectCommand="uspAdm_GetCtpatsBykitchenId" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                    <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource> 
   
</asp:Content>

