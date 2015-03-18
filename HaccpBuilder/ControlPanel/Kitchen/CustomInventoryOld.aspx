<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_CustomInventory" Title="HACCP Builder | Custom Inventory Items " Codebehind="CustomInventoryOld.aspx.cs" %>


<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
function MoveBack()
{
window.location = "InventoryReview.aspx";
}
function CustomValidation(source, arguments)
{
     var txtQuantity = document.getElementById('PlaceHolder_txtQuantity');
     var rdlTypeCooling = document.getElementById('PlaceHolder_rdlType_0');
     var rdlTypeFreezing = document.getElementById('PlaceHolder_rdlType_1');
     var rdlTypeThermometer = document.getElementById('PlaceHolder_rdlType_2');
     var rdlTypeHeating = document.getElementById('PlaceHolder_rdlType_3');
     var nResult = 1;
     
//     alert(rdlTypeHeating.checked);
//     alert(rdlTypeCooling.checked);
//     if (rdlTypeCooling.checked == true || rdlTypeHeating.checked == true || rdlTypeFreezing.checked == true || rdlTypeThermometer.checked == true)
//     {
         if(txtQuantity.value > 1)
         {
             //             source.errormessage = "Only single Heating/Cooling/Freezing/Thermometer device can be entered at a time";
             source.errormessage = "Only single inventory type can be entered at a time";
             arguments.IsValid = false;
         }
//     }


 }
 function SetTextBox(val) {
    
     var radio = document.getElementById("<%= rdlType.ClientID %>"); 
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
//        document.getElementById("<%= txtName.ClientID %>").value = "";
//        document.getElementById("<%= txtQuantity.ClientID %>").value = "";
//        document.getElementById("<%= txtType.ClientID %>").value = "";
//       // document.getElementById("<%= rdlType.ClientID %>").options[0].selected = false;
//        document.getElementById("<%= cmdAdd.ClientID %>").visible = true;
//        if (document.getElementById("<%= cmdDelete.ClientID %>") != null) {
//            document.getElementById("<%= cmdDelete.ClientID %>").visible = false;
//        }
//        if ( document.getElementById("<%= cmdSubmit.ClientID %>") != null) {
//             document.getElementById("<%= cmdSubmit.ClientID %>").visible = false;
//         }
//         return false;
       // vldSummary.InnerHtml = "";
         }
        
    



</script>
    <div class="bdy_contents">
    <div class="log_form_left">
    <div class="grey_bg_left">
	    <table  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="red_heading" colspan="3">{  Custom Kitchen Inventory Items }</td>                                  
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr> 
                 <tr>
                  <td colspan="3"><asp:HyperLink ImageUrl="~/images/buttons/ButtonBackMenuManager.png" Width="180" Height="30"
                                  NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" runat="server" ID="HyperLink2"></asp:HyperLink></td>                                  
                </tr>                            
              </table>
	</div>		
    <div class="discp_left_bg">
	    <table  border="0" cellspacing="0" cellpadding="1">
                <tr>
                  <td align="center" ><asp:ImageButton ID="cmdAddNew" CausesValidation="false" runat="server" onclick="cmdAddNew_Click" ImageUrl="~/images/buttons/btn_add_new_black.jpg" /></td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  ><asp:HyperLink ID="hlInventoryReview" NavigateUrl="~/ControlPanel/Kitchen/InventoryReview.aspx" ImageUrl="~/images/buttons/ButtonBackInventory.png" runat="server"></asp:HyperLink>
                  </td>
                   <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>                                 
                </tr>                            
              </table>
	</div>
	<div class="grid_left">	 	  
		     <asp:GridView ID="grdCustomInventory" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin" 
                    DataSourceID="ObjectDataSource1">                
                <Columns> 
                    <asp:BoundField HeaderText="Entry ID" DataField="Id" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                   
                    <asp:TemplateField HeaderText="Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlName" runat="server"  NavigateUrl= '<%#"~/ControlPanel/Kitchen/CustomInventory.aspx?Id=" +  DataBinder.Eval(Container.DataItem,"Id") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:BoundField HeaderText="Type" DataField="Type" ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" /> 
                        <asp:BoundField HeaderText="Quantity" DataField="Quantity" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                   
	                    <%--<asp:TemplateField HeaderText="Food Item">
	                        <ItemTemplate>
	                           <asp:TextBox ID="txtSensorNumber" Width="120px" runat="server"></asp:TextBox>
	                        </ItemTemplate>
	                       <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>	               
                </Columns>
            </asp:GridView>
   </div>
		</div>
<div class="content_right">
    <div class="log_right_view">
          <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td><table width="391" border="0" cellspacing="0" cellpadding="0">
                <tr align="right">
                  <td colspan="3" align="left" class="red_heading"><img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{ Add/Edit Custom Inventory Item }</td>
                </tr>
                <tr>
                <td colspan="3" class="red_heading">
                 <asp:Label ID="lblError" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" EnableClientScript="true" runat="server" />
                </td>
                </tr>
                <tr>
                  <td width="168" align="right">Item Name *:</td>
                  <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td width="200"><asp:TextBox ID="txtName" runat="server" CssClass="log_textbox"></asp:TextBox></td>                  
                </tr>
                <asp:RequiredFieldValidator ID="rfvName" ControlToValidate="txtName" Display="None" ErrorMessage="The value in field Item Name is required."  runat="server"></asp:RequiredFieldValidator></td>
                <tr>
                  <td align="right">Quantity *:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtQuantity" Width="50px" runat="server" CssClass="log_textbox" Text="1" Enabled="false"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="rfvQuantity" ControlToValidate="txtQuantity" Display="None" ErrorMessage="The value in field Quantity is required."  runat="server"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="ravQuantity" runat="server" ControlToValidate="txtQuantity" Display="None" MaximumValue="100" MinimumValue="1" Type="Integer" Enabled="false" ErrorMessage="Please enter value in range 1-100."></asp:RangeValidator>
                      <asp:RegularExpressionValidator ID="revQuantity" runat="server" ControlToValidate="txtQuantity" Enabled="false" Font-Names="Verdana" Font-Size="10px"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid integer."
				ValidationExpression="(\d)+"></asp:RegularExpressionValidator>  
                  </td>
                </tr>
                <tr>
                  <td align="right">Item Type:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                             OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomTypes" 
                             TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomInventory">
                             <SelectParameters>
                                 <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                             </SelectParameters>
                         </asp:ObjectDataSource>
                         <asp:RadioButtonList ID="rdlType" Width="300px" DataValueField="Id"  
                          DataTextField="Name" OnClientClick="SetTextBox();" runat="server" 
                          ondatabound="rdlType_DataBound"></asp:RadioButtonList>
                     <asp:TextBox ID="txtType" runat="server" Enabled="false" CssClass="log_textbox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvType" ControlToValidate="rdlType" Display="None" ErrorMessage="The Item Type is required." runat="server"></asp:RequiredFieldValidator>
                     <asp:RequiredFieldValidator ID="rfvTypeName" ControlToValidate="txtType" Enabled="false" Display="None" ErrorMessage="The Item Type Name is required." runat="server"></asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="rfvCustom" runat="server" ClientValidationFunction="CustomValidation" ErrorMessage="" Display="None" Enabled="false"></asp:CustomValidator></td>
                </tr>                
                <tr>
                  <td align="right">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>
                  <asp:ImageButton ID="cmdSubmit" runat="server" 
                         ImageUrl="~/images/buttons/ButtonUpdate.png" onclick="cmdSubmit_Click" Visible="false" OnClientClick="SetValidator();" />
                    <asp:ImageButton ID="cmdDelete"  onclick="cmdDelete_Click" runat="server" Visible="false" ImageUrl="~/images/buttons/ButtonDelete.png" />
                    <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png" onclick="cmdAdd_Click" OnClientClick="SetValidator();" />
                    <asp:ImageButton ID="cmdCancel" CausesValidation="false" runat="server" ImageUrl="~/images/buttons/ButtonCancel.png" onclick="cmdCancel_Click" OnClientClick="SetValidatorOld();"  />      
                     
                  </td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
            </table>
            </td>
            </tr>
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            </table>
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
    <%--<div class="grey_bg_form"><a href="InventoryItemManager.aspx">Terms Of Use</a>        
        <a href="InventoryItemManager.aspx"> Training Manual</a>
   </div>   --%>  
</div>   
     <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>



