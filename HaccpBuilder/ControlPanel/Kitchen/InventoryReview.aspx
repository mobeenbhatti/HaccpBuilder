<%@ Page Title="HACCP Plan | Inventory Review" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="InventoryReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.InventoryReviewNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Inventory Review</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblError" Text="" CssClass="msg-error" runat="server" Visible="false"></asp:Label>
    </div>
     <div class="form3">
          <div class="right button-margin">
                <asp:Button ID="cmdContinue" runat="server" OnClick="cmdContinue_Click"  Text="FINISHED AND CONTINUE" CssClass="blue button" />               
                <asp:Button ID="btnAddItem" runat="server" onclick="btnAddItem_Click" Text="ADD CUSTOM INVENTORY" CssClass="button" />
                 <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>                  
            </div>
        <div class="clear"></div>
      </div>
   <div class="table">
    <div class="box-header">
      <h4 class="left">Equipment Inventory</h4>
    </div>
  <asp:GridView ID="grdInventoryDetails" runat="server"  AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="zebra" DataKeyNames="Id" >                
        <Columns>                                 
            <asp:BoundField HeaderText="Inventory Item" DataField="Name" />
            <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
	        <asp:BoundField HeaderText="Custom Item" DataField="IsCustom" />
            <asp:TemplateField ItemStyle-Width="100px" HeaderText="Inventory Item">
                <ItemTemplate>
                    <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" NavigateUrl='<%# Eval("IsCustom").ToString() == "Yes"? "~/ControlPanel/Kitchen/CustomInventory.aspx?Id=" + Eval("Id"):"~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx" %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>       
    </asp:GridView>
           
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"  OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
            SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
    </asp:ObjectDataSource>
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
     
    </div>
</asp:Content>
