<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CtpatReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CtpatReview" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> C-TPAT REVIEW  </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblMeassage" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
             Select Group : <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2"
	                             DataTextField="GroupName" DataValueField="GroupId" AppendDataBoundItems="true"
                            Height="30px" Width="250px" Font-Names="Verdana"
                            onselectedindexchanged="ddlKitchen_SelectedIndexChanged" 
                            AutoPostBack="True">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>                        
           
        </div>
         <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdCtpat" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" 
                PageSize="20" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:TemplateField  HeaderText="Standard  C-TPAT's" >
                        <ItemTemplate>
                        <asp:HiddenField ID="hfCtpatId" runat="server" Value='<%# Eval("CtpatId") %>' />
                        <asp:HyperLink ID="hlTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>'
                         NavigateUrl='<%# "~/ControlPanel/District/ViewCtpat.aspx?CtpatId=" + Eval("KitchenCtpatId") %>' Target="_blank" runat="server"></asp:HyperLink>                        
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField    HeaderText="Additional Custom" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("IsAdditional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField    HeaderText="TYPE" >
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("CustomCtpat").ToString() == "0"? "Default":"Custom" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    </asp:TemplateField>   
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>

</div>  
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedCtpatByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCtpat">
        <SelectParameters>               
               <asp:ControlParameter ControlID="ddlKitchen" Name="nCtpatGroupId" 
                PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        </asp:ObjectDataSource>   
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCtpatGroup">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>    
</asp:Content>