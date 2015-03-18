<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="ChecklistAddOnGroup.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.ChecklistAddOnGroup" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> CREATING A CUSTOM CHECK LIST GROUP</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            <h2>{ CREATING A CUSTOM CHECK LIST GROUP:  }</h2>
            <br />
            <h1>Type in the name you want to call the Custom Check List Group you wish to create and then click GO (you can create multiple check lists within a group)</h1>
                <h1>{ YOU CAN CREATE MULTIPLE CHECK LISTS IN A GROUP: }</h1>
                <h1>To create another check list in group, simply create the name of the second group and submit (then, go back and click on Create Custom Check List In Group on the dashboard page.</h1>          
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Add/Create New Checklist Group: <asp:TextBox ID="txtCheckListGroup" runat="server" ></asp:TextBox>  
        <asp:Button ID="cmdSearch"  runat="server" Text="Go"  onclick="cmdSearch_Click"/>
        <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdChecklistAddOnGroup" runat="server" AutoGenerateColumns="False" 
                DataSourceID="EntityDataSource1" CssClass="zebra" AllowPaging="True" 
                PageSize="20" >                
                <Columns>                 
                    <asp:BoundField DataField="GroupName" HeaderText="Checklist Add On Group Name" >
                    </asp:BoundField>
	                <asp:TemplateField HeaderText="Add/Edit Checklist Sections" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditQuestion" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/ChecklistSections.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "CheckListAddonGroupId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Locations in Group"  >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server"  Text="View" NavigateUrl='<%# "~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "CheckListAddonGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
             <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                ConnectionString="name=Entities" ContextTypeName="DataModel.Entities"
                DefaultContainerName="Entities" EnableFlattening="False" 
                EntitySetName="CheckListAddonGroups"
                Select="it.[CheckListAddonGroupId], it.[GroupName], it.[DistrictId]" OrderBy="it.[CheckListAddonGroupId]" Where="it.[DistrictId] = @DistrictId"
                >
                <WhereParameters>
                <asp:SessionParameter DbType="Int32" Name="DistrictId" SessionField="DistrictId" />
                </WhereParameters>
            </asp:EntityDataSource>
</div>
</div>  
        
</asp:Content>
