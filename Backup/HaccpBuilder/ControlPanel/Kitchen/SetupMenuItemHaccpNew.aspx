<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="SetupMenuItemHaccpNew.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.SetupMenuItemHaccpNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
function openFile(strPath)
{
window.open(strPath);
}
</script>

<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblError" Text="" CssClass="msg-error" runat="server"></asp:Label>
    </div>
        <div class="table">
    <div class="box-header">
      <h4 class="left">Equipment Inventory</h4>
    </div>
    <asp:GridView ID="grdKitchenMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
        SkinID="gridviewSkin" onrowdatabound="grdKitchenMenu_RowDataBound" >                
        <Columns>  
            <asp:BoundField DataField="ItemName" HeaderText="Menu Item" />
            <asp:BoundField DataField="ItemId"  HeaderText="Item Id"  />
            <asp:TemplateField HeaderText="USDA Recipe">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlFileName" Text="View"
                        NavigateUrl='<%#"~/StaticContent/Files/" + DataBinder.Eval(Container.DataItem, "FileName")  %>'
                            runat="server" Target="_blank" ></asp:HyperLink>
                    </ItemTemplate>                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" Checked='<%# Eval("Selected").ToString() == "1"? true:false%>' />
                        <asp:Label ID="lblValidateProcess" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pre-Made Vendor Supplied">
                    <ItemTemplate>
                        <asp:RadioButton ID="rdbVendorSupplied" runat="server" GroupName="Preparationtype"  Checked='<%# Eval("PreparationType").ToString() == "1"? true:false%>'  />
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prepared on Site By Recipe">
                    <ItemTemplate>
                        <asp:RadioButton ID="rdbOnSite" runat="server" GroupName="Preparationtype"  Checked='<%# Eval("PreparationType").ToString() == "2"? true:false%>'  />
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:BoundField DataField="CustomItem" HeaderText="Custom Item" />
                <asp:BoundField DataField="Process" HeaderText="Process" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetInventoryItemsDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
      <div class="form3">
          <div class="right button-margin">
                <asp:ImageButton ID="cmdContinue" runat="server" OnClick="cmdContinue_Click" AlternateText="FINISHED AND CONTINUE" CssClass="blue button" />
                <asp:ImageButton ID="cmdBack" OnClick="cmdBack_Click" runat="server" AlternateText="BACK" CssClass="button" /> 
                 <asp:Label ID="lblFoodGroupId" Text="1" Visible="false" runat="server"></asp:Label> 
                <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>  
                 <asp:Label ID="lblFoodGroup" runat="server" CssClass="FoodGroupLabel" ></asp:Label>          
            </div>
        <div class="clear"></div>
      </div>
    </div>
</asp:Content>
