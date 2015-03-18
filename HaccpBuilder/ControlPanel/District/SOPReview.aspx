<%@ Page Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_SOPReview" Title="HACCP Builder | SOP Review" Codebehind="SOPReview.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> SOP, SSOP & GMP REVIEW</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
             Select Group:  <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2" DataTextField="GroupName" DataValueField="KitchenGroupId" AppendDataBoundItems="true"
                            Height="30px" Width="250px" Font-Names="Verdana" onselectedindexchanged="ddlKitchen_SelectedIndexChanged"  AutoPostBack="True">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>
            <asp:Label ID="lblGroupName" runat="server" Text=""></asp:Label> 
        </div>
         <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">
             <asp:Button ID="cmdContinue" Text="Continue" OnClick="cmdContinue_Click" runat="server" />
        </div>
         <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdSOP" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" 
                PageSize="20" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="hfSOPId" runat="server" Value='<%# Eval("SOPId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Standard USDA SOP, SSOP & GMP's" >
                        <ItemTemplate>
                        <asp:HyperLink ID="hlTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                         NavigateUrl='<%# "~/ControlPanel/District/ViewSOP.aspx?SOPId=" + Eval("KitchenSOPId") %>' Target="_blank" runat="server"></asp:HyperLink>
                        <%--<asp:Label ID="lblTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' runat="server"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Additional Custom" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("IsAdditional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="TYPE">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("CustomSOP").ToString() == "0"? "USDA Default":"Custom" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    </asp:TemplateField>   
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>
</div>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedSOPByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOP">
        <SelectParameters>               
               <asp:ControlParameter ControlID="ddlKitchen" Name="nSOPGroupId" 
                PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        </asp:ObjectDataSource>
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"   OldValuesParameterFormatString="original_{0}" SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOPGroup">
    <SelectParameters>
        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>      
</asp:Content>

