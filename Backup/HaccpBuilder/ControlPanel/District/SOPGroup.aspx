<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_Default2" Title="HACCP Builder | Create SOP Group" Codebehind="SOPGroup.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> CREATE SOP, SSOP & GMP GROUP</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            <h2>{ CREATING A CUSTOM GROUP:  }</h2>
            <br />
            <h1>Type in the name you want to call the Custom Group you wish to create and then click GO</h1>
                <h1>{ TO EDIT AND CUSTOMIZE SOP, SSOP & GMP's IN GROUP:  }</h1>
                <h1>Now to change the SOP, SSOP & GMP's in the group, simply click on the Add/Edit hotlink to the right of the GROUP name you created below to<br /> 
                          customize your individual SOPs</h1>          
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Add/Create New Group: <asp:TextBox ID="txtSOPGroup" runat="server" CssClass="district_TextBox"></asp:TextBox>  
        <asp:Button ID="cmdSearch"  runat="server" Text="Go"  onclick="cmdSearch_Click"/>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdSOPGroup"  runat="server" AutoGenerateColumns="False"
                DataSourceID="ObjectDataSource1" CssClass="zebra" AllowPaging="True" 
                PageSize="20">      
                                    
                <Columns>                 
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name"  
                        >
                    </asp:BoundField>
	                <asp:TemplateField   HeaderText="Add/Edit">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/CustomSOP.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "KitchenGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Locations in Group" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server"  Text="View" NavigateUrl='<%# "~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "KitchenGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="View SOP, SSOP & GMP's" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="View SOP's" NavigateUrl='<%# "~/ControlPanel/District/SOPReview.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "KitchenGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOPGroup">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nDistrictId" 
                SessionField="DistrictId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</div>
</div>                 
</asp:Content>

