<%@ Page Title="HACCP Plan- Setup Inventory" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="SetupInventoryHaccp.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.SetupInventoryHaccpNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script language="javascript" type="text/javascript">
    function check(txtobj, chkObj) {

        if (chkObj.checked == true) {
            txtobj.disabled = false;
        }
        else {
            txtobj.value = "";
            txtobj.disabled = true;
        }     
    }
</script>
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Setup Equipment Inventory</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblError" Text="" CssClass="msg-error" runat="server" Visible="false"></asp:Label>
    </div>
        <div class="table">
    <div class="box-header">
      <h4 class="left">Equipment Inventory</h4>
    </div>
   <asp:GridView ID="grdInventoryDetails" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="zebra" DataKeyNames="Id" OnDataBound="grdInventoryDetails_DataBound">
        <Columns>
            <asp:BoundField HeaderText="Inventory Item" DataField="Name" >
            </asp:BoundField>
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelectInventoryItem" runat="server" />
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantity" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity")%>'
                        runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity"
                        Display="Dynamic" MaximumValue="99" MinimumValue="0" Type="Integer" ErrorMessage="Please enter value in range 1-99."></asp:RangeValidator>
                    <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtQuantity"
                        Font-Names="Verdana" Font-Size="10px" Display="Dynamic" EnableClientScript="true"
                        ErrorMessage="Please enter a valid integer." ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblValidateQuantity" Font-Names="Verdana" Font-Size="10px" ForeColor="Red"
                        Text="" runat="server"></asp:Label>
                </ItemTemplate>               
            </asp:TemplateField>
            <asp:BoundField HeaderText="Custom Item" DataField="IsCustom" >
            </asp:BoundField>
        </Columns>
        <PagerSettings Mode="Numeric" FirstPageText="" />
        <PagerStyle CssClass="gridPager" />
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
                <asp:Button ID="btnGoTInventory" runat="server" OnClick="btnGoTInventory_Click" Text="FINISHED AND CONTINUE" CssClass="blue button"/> 
                 <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>                  
            </div>
        <div class="clear"></div>
      </div>
    </div>
</asp:Content>
