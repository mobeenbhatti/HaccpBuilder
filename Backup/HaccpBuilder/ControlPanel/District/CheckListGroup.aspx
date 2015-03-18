<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CheckListGroup" Title="HACCP Builder | Check List Groups" Codebehind="CheckListGroup.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> CREATE FOOD SAFETY CHECK LIST GROUP</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            <h2>{ CREATING A CUSTOM FOOD SAFETY CHECK LIST (FSCL) GROUP:  }</h2>
            <br />
            <h1>Type in the name you want to call the Custom FSCL Group you wish to create and then click GO</h1>
                <h1>{ TO EDIT AND CUSTOMIZE FSCL QUESTIONS IN GROUP:  }</h1>
                <h1>Now to change the FSCL Questions in the group, simply click on the Add/Edit hotlink to the right of the GROUP name you created below to customize your individual FSCL<br /> </h1>          
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
     <asp:GridView ID="grdChecklistGroup" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1" CssClass="zebra" AllowPaging="True" 
                PageSize="20" >                
                <Columns>                 
                    <asp:BoundField DataField="GroupName" HeaderText="Checklist Group Name"  >
                    </asp:BoundField>
	                <asp:TemplateField HeaderText="Add/Edit Questions" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditQuestion" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/CustomQuestion.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "ChecklistGroupId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Locations in Group"  >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server"  Text="View" NavigateUrl='<%# "~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "ChecklistGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View Questions"  >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="View Questions" NavigateUrl='<%# "~/ControlPanel/District/QuestionsReview.aspx?GroupId=" + DataBinder.Eval(Container.DataItem,"ChecklistGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
           <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCheckListGroup">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nDistrictId" 
                SessionField="DistrictId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</div>
</div>  
    
</asp:Content>
