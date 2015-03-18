<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_CustomMenuItems" Title="SchoolHACCP | Custom Kitchen Menu Items " Codebehind="CustomMenuItems.aspx.cs" %>



<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
function MoveBack(int nPageIndex)
{
    window.location = "MenuItemsReview.aspx" ;

}

</script>
    <div>
        <div class="MainHeading">
              Custom Kitchen Menu Items
        </div> 
        <div class="SmallClearer"></div> 
          
        <div class="ContentLeft">
            <%--<div class="Buttons">
                <div class="FloatLeft"><asp:Button ID="cmdAddNew" Text="Add New Entry" 
                        runat="server" CssClass="Button" onclick="cmdAddNew_Click" /></div>
                <div class="ButtonsCols"> <asp:Button ID="cmdBack" Text="Back to Inventory ITems" 
                        runat="server" CssClass="ButtonLarge" onclick="cmdBack_Click" /></div>
            </div>--%>
            <div class="Buttons">
                <div class="FloatLeft">
                <asp:ImageButton ID="cmdAddNew" runat="server" onclick="cmdAddNew_Click" ImageUrl="~/images/buttons/AddNewEntry.gif" />
                </div>                
                <div class="ButtonsCols">
                <asp:ImageButton ID="cmdBack" runat="server" 
                        ImageUrl="~/images/buttons/ButtobBackToMenuReview.jpg" 
                        onclick="cmdBack_Click"  />
                 
                </div>
            </div>
            <div class="Clearer"></div>
            <div  style="height:10px;"></div>
            <div style="margin-left:10px; margin-right:10px;">
                <span class="LogHeading">List of Your Custom Menu Itemns Entries</span>
            </div> 
            <div class="Clearer"></div>
            <div style="margin-left:10px; margin-top:10px;">
                <asp:GridView ID="grdCustomMenuItem" DataSourceID="ObjectDataSource1"  runat="server" AutoGenerateColumns="False" >                
                <Columns> 
                    <asp:BoundField HeaderText="Entry ID" DataField="Id" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                   
                    <%--<asp:TemplateField HeaderText="Entry ID">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <%--<asp:HyperLinkField HeaderText="Name" DataTextField="Name" NavigateUrl='~/ControlPanel/Kitchen/CustomInventory.aspx?nm=<%#Eval(Container.DataItem,"Name") %>' />--%>
	                    <asp:TemplateField HeaderText="Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlName" runat="server"  NavigateUrl= '<%#"~/ControlPanel/Kitchen/CustomMenuItems.aspx?Id=" +  DataBinder.Eval(Container.DataItem,"Id") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:BoundField HeaderText="Prep" DataField="ProcessName" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" /> 
                        <asp:BoundField HeaderText="Food Group" DataField="FoodGroup" ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" />                   
	                    <%--<asp:TemplateField HeaderText="Food Item">
	                        <ItemTemplate>
	                           <asp:TextBox ID="txtSensorNumber" Width="120px" runat="server"></asp:TextBox>
	                        </ItemTemplate>
	                       <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>	               
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomMenuItemsDataSet" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomMenuItems">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
            </div>          
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="ContentRight">
           <div style="margin-top:10px;">
                <span class="LogHeading"> Add/Edit Custom Menu Item </span>
           </div>           
           <div style="margin-top:10px;">
                 <div>                    
                     <asp:ValidationSummary ID="ValidationSummary1"  runat="server" ShowSummary="True" /> 
                     <asp:Label ID="lblError" runat = "server" Text="" ForeColor="Red"  ></asp:Label>                 
                 </div>
                 <div>
                     <div class="LogLable">Item Name</div>
                     <div class="FloatLeft"><asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                     </div>
                     <asp:RequiredFieldValidator ID="reqValidateName" ControlToValidate="txtName" Display="None"  ErrorMessage="The value in field Item Name is required."  runat="server"></asp:RequiredFieldValidator>
                     <div class="Clearer"></div> 
                 </div>                 
                 <div>
                    <div class="LogLable">Recipe Number</div>
                     <div class="FloatLeft"><asp:TextBox ID="txtRecipeNumber" Width="50px" runat="server"></asp:TextBox> 
                     </div>
                     <%--<asp:RequiredFieldValidator ID="reqValidateRecipeNumber" ControlToValidate="txtRecipeNumber" Display="None"  ErrorMessage="The value in field recipe Number is required."  runat="server"></asp:RequiredFieldValidator>--%>
                     <div class="Clearer"></div> 
                 </div>                 
                 <div>
                     <div class="LogLable">Food Group</div>                    
                     <div class="FloatLeft" >
                    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>--%>
                     <asp:DropDownList ID="ddlFoodGroup" Width="200px" AutoPostBack="true" runat="server" onselectedindexchanged="ddlFoodGroup_SelectedIndexChanged"></asp:DropDownList>
                     <%--</ContentTemplate>
                     </asp:UpdatePanel>--%>
                     <%--<asp:RequiredFieldValidator ID="reqFoodGroup" ControlToValidate="ddlFoodGroup" Display="None" ErrorMessage="The Food Group is required."  runat="server"></asp:RequiredFieldValidator>--%>
                     </div> 
                     <div class="Clearer"></div>                     
                 </div>
                 <div>
                    <div class="LogLable">Preparation</div>
                     <div class="FloatLeft">
                     <asp:RadioButton ID="rdbPreMade" Text="Pre-made (Vendor Supplied)" 
                             ValidationGroup="Prparation" runat="server" GroupName="PreparationType" />
                     </div>
                     <div class="Clearer"></div> 
                     <div class="LogLable"></div> 
                     <div style="float:left;">
                     <asp:RadioButton ID="rdbOnsite" Text="Prepared On-site by Recipe" 
                             ValidationGroup="Prparation" runat="server" GroupName="PreparationType" />
                     </div>                     
                     <div class="Clearer"></div>                    
                 </div>  
                 <div>
                    <div class="LogLable">Process</div>
                     <div class="FloatLeft"><asp:RadioButtonList ID="rdlProcess" runat="server"></asp:RadioButtonList> 
                     </div>  
                     <asp:RequiredFieldValidator ID="reqValidatePreparation" ControlToValidate="rdlProcess" Display="None"  ErrorMessage="The value in field Process is required."  runat="server"></asp:RequiredFieldValidator>
                     <div class="Clearer"></div>                     
                 </div> 
                 <div>
                    <div class="LogLable">Ready to eat</div>
                     <div class="FloatLeft">
                     <asp:RadioButton ID="rdbYes" Text="Yes" ValidationGroup="ready" runat="server" 
                             GroupName="Ready" />
                     </div>
                     <div style="float:left; margin-left:10px;">
                     <asp:RadioButton ID="rdbNo" Text="No" ValidationGroup="ready" runat="server" 
                             GroupName="Ready" /> 
                     </div>
                     <div class="Clearer"></div>  
                  </div>   
                 <div>
                    <div class="LogLable">Instructions to Recipe and/or Instructions</div>
                     <div class="FloatLeft"><asp:TextBox ID="txtRecipe" TextMode="MultiLine" 
                             Width="150px" runat="server" Height="60px"></asp:TextBox> 
                     </div>
                     <%--<asp:RequiredFieldValidator ID="reqValidateRecipe" ControlToValidate="txtRecipe" Display="None"  ErrorMessage="The value in field Quantity is required."  runat="server"></asp:RequiredFieldValidator>--%>
                     <div class="Clearer"></div> 
                 </div>  
                 <div class="Clearer"></div>
                 <%--<div class="LogButton" >
                    <asp:Button ID="cmdSubmit" runat="server" Text="Submit" Visible="false" 
                         CssClass="ButtonSmall" onclick="cmdSubmit_Click" />
                    <asp:Button ID="cmdAdd" runat="server" Text="Add" CssClass="ButtonSmall" 
                         onclick="cmdAdd_Click" />
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete"  Visible="false" 
                         CssClass="ButtonSmall" onclick="cmdDelete_Click" />
                   <asp:Button ID="cmdCancel" runat="server" Text="Cancel" CssClass="ButtonSmall" 
                         onclick="cmdCancel_Click" />                    
                 </div>--%>
                 <div class="LogButton">
                    <asp:ImageButton ID="cmdSubmit" Visible="false" onclick="cmdSubmit_Click" runat="server" ImageUrl="~/images/buttons/ButtonUpdate.gif" />
                    <asp:ImageButton ID="cmdAdd" runat="server" onclick="cmdAdd_Click" ImageUrl="~/images/buttons/ButtonInsert.gif" />
                    <asp:ImageButton ID="cmdCancel" runat="server" onclick="cmdCancel_Click" ImageUrl="~/images/buttons/ButtonCancel.gif" />
                    <asp:ImageButton ID="cmdDelete" Visible="false" onclick="cmdDelete_Click" runat="server" ImageUrl="~/images/buttons/ButtonDelete.gif" />
                                       
                 </div>
           </div>
        </div> 
        <div class="Clearer"></div>
        <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2007 " ForeColor="White" runat="server"></asp:Label>
        </div>        
       <%-- <div style="margin-left:10px;">
        <div style="float:left;"><a href="InventoryItemManager.aspx">Terms Of Use</a></div>
        <div style="float:left; margin-left:20px;"><a href="InventoryItemManager.aspx"> Training Manual</a></div>
        </div>  --%>             
    </div>   
    
     <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>




