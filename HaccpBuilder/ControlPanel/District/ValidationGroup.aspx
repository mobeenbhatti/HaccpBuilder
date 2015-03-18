<%@ Page Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_ValidationGroup" Title="HACCP Bilder | Validation Group" Codebehind="ValidationGroup.aspx.cs" %>

<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> CREATE VALIDATION WORKSHEET GROUP</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            <h2>{ CREATING A CUSTOM VALIDATION WORKSHEET (VW) GROUP:  }</h2>
            <br />
            <h1>Type in the name you want to call the Custom VW Group you wish to create and then click GO</h1>
                <h1>{ TO EDIT AND CUSTOMIZE VW QUESTIONS IN GROUP:  }</h1>
                <h1>Now to change the VW Questions in the group, simply click on the Add/Edit hotlink to the right of the GROUP name you created below to customize your individual Quesitons</h1>          
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Add/Create New Validation Group: <asp:TextBox ID="txtCheckListGroup" runat="server" ></asp:TextBox>  
        <asp:Button ID="cmdSearch"  runat="server" Text="Search"  onclick="cmdSearch_Click"/>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdChecklistGroup" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1" CssClass="zebra" AllowPaging="True" 
                PageSize="20" >                
                <Columns>                 
                    <asp:BoundField DataField="GroupName" HeaderText="Validation Group Name">
                    </asp:BoundField>
	                <asp:TemplateField  HeaderText="Add/Edit Questions" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditQuestion" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/ValidationCustomQuestion.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "ValidationGroupId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Kitchens in Group"   >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server"  Text="View" NavigateUrl='<%# "~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "ValidationGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View Questions"   >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="View Questions" NavigateUrl='<%# "~/ControlPanel/District/ValidationQuestionReview.aspx?GroupId=" + DataBinder.Eval(Container.DataItem,"ValidationGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationGroup">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nDistrictId" 
                SessionField="DistrictId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</div>
</div>  
   
</asp:Content>

