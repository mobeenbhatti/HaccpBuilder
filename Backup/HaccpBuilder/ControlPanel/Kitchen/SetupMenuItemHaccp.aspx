<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_SetupMenuItemHaccp" Title="Build HACCP Plan- Setup Menu Items" Codebehind="SetupMenuItemHaccp.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
<script language="javascript" type="text/javascript">
function openFile(strPath)
{
window.open(strPath);
}

</script>
    <%--<center>--%>
        <div >
            <div class="MainHeading">
               BUILD HAACP PLAN - SET UP MENU ITEMS
               <span style="font-size:10px; margin-left:140px">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />            
               </span>
            </div>            
        </div>
        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />            
                </div>
                <div class="InventoryButtons">
                    <div >
                        <asp:Label ID="lblFoodGroup" runat="server" CssClass="FoodGroupLabel" ></asp:Label>   
                    </div>  
                    <%--<div style="margin-top:15px;" >
                        <asp:Button ID="btnContinue" Text="Continue to Desserts" runat="server" CssClass="InventoryButton" />
                    </div>   --%>                 
                              
                    <div style="margin-top:15px;">
                    <%--<asp:ImageButton ID="btnAddItem" runat="server"   
                            ImageUrl="~/images/buttons/ButtonAddCustomMenuItem.jpg" 
                            onclick="btnAddItem_Click" /> --%>
                      <%-- <asp:Button ID="btnAddItem"  Text="Add Custom Menu Item" runat="server" CssClass="InventoryButton" />    --%>
                    </div> 
                                                      
                </div>   
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div>
        
       <div style="float:left; margin-left:10px;">
        <asp:Label ID="lblError" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
        </div>
        <div class="Clearer"></div>
        <div class="GirdDiv">
            <asp:GridView ID="grdKitchenMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
             SkinID="gridviewSkin" onrowdatabound="grdKitchenMenu_RowDataBound" >                
                <Columns>  
                    <asp:BoundField DataField="ItemName" ItemStyle-Width="150px" HeaderText="Menu Item" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>

                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ItemId" ItemStyle-Width="50px" HeaderText="Item Id"  
                        HeaderStyle-CssClass="gridheaderline" >                  
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>

                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="USDA Recipe">
                            <ItemTemplate>
                               <asp:HyperLink ID="hlFileName" Text="View"
                                NavigateUrl='<%#"~/StaticContent/Files/" + DataBinder.Eval(Container.DataItem, "FileName")  %>'
                                 runat="server" Target="_blank" ></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" Checked='<%# Eval("Selected").ToString() == "1"? true:false%>' />
                                <asp:Label ID="lblValidateProcess" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pre-Made Vendor Supplied">
                            <ItemTemplate>
                                <asp:RadioButton ID="rdbVendorSupplied" runat="server" GroupName="Preparationtype"  Checked='<%# Eval("PreparationType").ToString() == "1"? true:false%>'  />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prepared on Site By Recipe">
                            <ItemTemplate>
                                <asp:RadioButton ID="rdbOnSite" runat="server" GroupName="Preparationtype"  Checked='<%# Eval("PreparationType").ToString() == "2"? true:false%>'  />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CustomItem" ItemStyle-Width="50px" HeaderText="Custom Item" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>

                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                        <asp:BoundField DataField="Process" ItemStyle-Width="50px" HeaderText="Process" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>

                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                                
                </Columns>
            </asp:GridView>
         </div>
            <div style="clear:both; margin-top:10px;"></div>
            <div style="margin-left:750px;">              
                <div class="FloatLeft" >
                 <asp:ImageButton ID="cmdBack" OnClick="cmdBack_Click" runat="server" ImageUrl="~/images/buttons/ButtonBack.gif" />
                 </div>
                <div class="ButtonsCols"  >
                <asp:ImageButton ID="cmdContinue" ImageUrl="~/images/buttons/ButtonContinue.gif" OnClick="cmdContinue_Click" runat="server" />
                </div>                
                <div class="Clearer"></div>
            </div>
            <div>         
         <asp:Label ID="lblFoodGroupId" Text="1" Visible="false" runat="server"></asp:Label> 
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
         </div>
         <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
    
</asp:Content>
