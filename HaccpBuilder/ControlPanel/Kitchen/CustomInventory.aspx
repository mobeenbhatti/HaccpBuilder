<%@ Page Title="HACCP Builder | Custom Inventory Items" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="CustomInventory.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.CustomInventoryNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
     $(document).ready(function () {
        $("#<%= ddlType.ClientID %>").change(function () {
            var val = this.value;
            SetTextBox(val);
        });
    });
    $("#pnlBuildPlan").addClass('selected');
    function MoveBack() {
        window.location = "InventoryReview.aspx";
    }
    function CustomValidation(source, arguments) {
        var txtQuantity = document.getElementById('PlaceHolder_txtQuantity');
        var rdlTypeCooling = document.getElementById('PlaceHolder_rdlType_0');
        var rdlTypeFreezing = document.getElementById('PlaceHolder_rdlType_1');
        var rdlTypeThermometer = document.getElementById('PlaceHolder_rdlType_2');
        var rdlTypeHeating = document.getElementById('PlaceHolder_rdlType_3');
        var nResult = 1;      
        if (txtQuantity.value > 1) {
            //             source.errormessage = "Only single Heating/Cooling/Freezing/Thermometer device can be entered at a time";
            source.errormessage = "Only single inventory type can be entered at a time";
            arguments.IsValid = false;
        }       
    }
    function SetTextBox(val) {

        var radio = document.getElementById("<%= ddlType.ClientID %>");
        var text = document.getElementById("<%= txtType.ClientID %>");
        var vldTypeName = document.getElementById("<%= rfvTypeName.ClientID %>");

        if (val == 999) {
            text.disabled = false;

            ValidatorEnable(vldTypeName, true);

        }
        else {
            text.disabled = true;

            ValidatorEnable(vldTypeName, false);

        }
        
    }
    function SetValidator() {

        var vldId = document.getElementById('PlaceHolder_rfvCustom');
        var vldName = document.getElementById('PlaceHolder_rfvName');
        var vldType = document.getElementById('PlaceHolder_rfvType');
        var vldUser = document.getElementById('PlaceHolder_rfvQuantity');
        var vldSummary = document.getElementById('PlaceHolder_vldSummary');
        var velQuantity = document.getElementById('PlaceHolder_revQuantity');
        var revQuantity = document.getElementById('PlaceHolder_ravQuantity');

        ValidatorEnable(vldName, true);
        ValidatorEnable(vldUser, true);
        ValidatorEnable(vldType, true);
        ValidatorEnable(velQuantity, true);
        ValidatorEnable(revQuantity, true);
        ValidatorEnable(vldId, true);
        if (vldId != null) {
            ValidatorEnable(vldId, true);
        }

    }
    function SetValidatorOld() {

        var vldId = document.getElementById('PlaceHolder_rfvCustom');
        var vldName = document.getElementById('PlaceHolder_rfvName');
        var vldType = document.getElementById('PlaceHolder_rfvType');
        var vldUser = document.getElementById('PlaceHolder_rfvQuantity');
        var vldSummary = document.getElementById('PlaceHolder_vldSummary');
        var velQuantity = document.getElementById('PlaceHolder_revQuantity');
        var revQuantity = document.getElementById('PlaceHolder_ravQuantity');

        ValidatorEnable(vldName, false);
        ValidatorEnable(vldUser, false);
        ValidatorEnable(vldType, false);
        ValidatorEnable(velQuantity, false);
        ValidatorEnable(revQuantity, false);
        if (vldId != null) {
            ValidatorEnable(vldId, false);
        }
        document.getElementById("<%= vldSummary.ClientID %>").innerHTML = "";        
    }
</script>
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Custom Inventory</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
  <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" ShowSummary="true" CssClass="msg-error" Enabled="true" />  
  <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false"></asp:Label>
  </div>
  <div class="clear"></div>  
  <div class="form3">
    <div class="left">      
      <div class="input">
        <asp:Button ID="cmdAddNew" CausesValidation="false" runat="server" onclick="cmdAddNew_Click" Text="ADD NEW ENTRY" CssClass="button" />       
      </div>
    </div>
    <div class="clear"></div>
  </div>  
  <div class="form4 left marginright">
    <h2 class="left h2margin-r">Item Name *:</h2>
    <div class="input left">
         <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvName" ControlToValidate="txtName" Display="None" ErrorMessage="The value in field Item Name is required."  runat="server"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <br />
    <h4>Quantity *:</h4>
    <div class="input">
        <asp:TextBox ID="txtQuantity" Width="50px" runat="server" CssClass="log_textbox" Text="1" Enabled="false"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="rfvQuantity" ControlToValidate="txtQuantity" Display="None" ErrorMessage="The value in field Quantity is required."  runat="server"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="ravQuantity" runat="server" ControlToValidate="txtQuantity" Display="None" MaximumValue="100" MinimumValue="1" Type="Integer" Enabled="false" ErrorMessage="Please enter value in range 1-100."></asp:RangeValidator>
                      <asp:RegularExpressionValidator ID="revQuantity" runat="server" ControlToValidate="txtQuantity" Enabled="false" Font-Names="Verdana" Font-Size="10px"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid integer."
				ValidationExpression="(\d)+"></asp:RegularExpressionValidator>         
       
    </div>
    <br />
  </div>
  <div class="form4 left">
    <h2 class="left h2margin-r">Item Type:</h2>
    <div class="input left">
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"   OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomTypes"  TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomInventory">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:DropDownList ID="ddlType" runat="server" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
        <%--<asp:RadioButtonList ID="rdlType" Width="300px" DataValueField="Id"  
        DataTextField="Name" OnClientClick="SetTextBox();" runat="server" 
        ondatabound="rdlType_DataBound"></asp:RadioButtonList>--%>
    <asp:TextBox ID="txtType" runat="server" Enabled="false" CssClass="log_textbox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvType" ControlToValidate="ddlType" Display="None" ErrorMessage="The Item Type is required." runat="server"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvTypeName" ControlToValidate="txtType" Enabled="false" Display="None" ErrorMessage="The Item Type Name is required." runat="server"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="rfvCustom" runat="server" ClientValidationFunction="CustomValidation" ErrorMessage="" Display="None" Enabled="false"></asp:CustomValidator></td>

    </div>
    <div class="clear"></div>
  </div>
  <div class="clear tenpx"></div>
  <div class="form3">
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server"   onclick="cmdSubmit_Click" Visible="false" Text="SUBMIT" OnClientClick="SetValidator();" CssClass="button blue" />
        <asp:Button ID="cmdDelete"  onclick="cmdDelete_Click" runat="server" Text="DELETE" Visible="false" CssClass="button"  />
        <asp:Button ID="cmdAdd" runat="server"  onclick="cmdAdd_Click" Text="ADD" OnClientClick="SetValidator();" CssClass="button blue" />
        <asp:Button ID="cmdCancel" CausesValidation="false" runat="server" Text="CANCEL"  onclick="cmdCancel_Click" OnClientClick="SetValidatorOld();" CssClass="button"  />
        <asp:Button ID="cmdContinue" CausesValidation="false" runat="server" 
            Text="FINISHED AND CONTINUE"  CssClass="button" onclick="cmdContinue_Click"  /> 
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Inventory Items</h4>
    </div>
    <asp:GridView ID="grdCustomInventory" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1">                
        <Columns> 
            <asp:BoundField HeaderText="Entry ID" DataField="Id" />                   
            <asp:TemplateField HeaderText="Name">
	            <ItemTemplate>
	                <asp:HyperLink ID="hlName" runat="server"  NavigateUrl= '<%#"~/ControlPanel/Kitchen/CustomInventory.aspx?Id=" +  DataBinder.Eval(Container.DataItem,"Id") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'>
	                </asp:HyperLink>
	            </ItemTemplate>	              
	        </asp:TemplateField >
	        <asp:BoundField HeaderText="Type" DataField="Type" /> 
            <asp:BoundField HeaderText="Quantity" DataField="Quantity"  /> 
        </Columns>
    </asp:GridView>
    <div class="box-bottom"> </div>
  </div>
</div>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomInventoryDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomInventory">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
<asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
