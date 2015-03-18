<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_District_CustomSOP" Title="Untitled Page" Codebehind="CustomSOP(old).aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               CREATE CUSTOM SOP GROUP NAME
               <span style="font-size:10px; margin-left:120px;">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>                
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="btnEditSOPGroup"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonEditKitchenSOPGroup.jpg"/>  
                   </div>                  
                   <div class="Clearer" style="margin-top:15px"></div>
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnCreateCustomSOP"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonCreateCustomSOPjpg.jpg"/>
                   </div>                   
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <div class="FloatLeft">
                    <asp:ImageButton ID="btnSOPManager"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonSOPManager.jpg"/> 
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>            
    </div>
    <div class="SearchDiv">
            <div class="SearchCol1">Add/Create New SOP Group:</div>
            <div class="SearchCol2">Search</div>
            <div class="SearchCol3">
                <asp:TextBox ID="TextBox1" runat="server" Width="220px" CssClass="TextBox"></asp:TextBox>
            </div>
            <div class="SearchCol4">
                <asp:Button ID="Button6" runat="server" Text="GO" Width="87px" style="font-family:Verdana; border: solid 2px; background-color:#c0c0c0; text-align:left;" />
            </div>
     </div>
    <div class="GirdDiv">
            <asp:GridView ID="grdMenuItems" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin" AllowPaging="True" 
                PageSize="20">                
                <Columns>
                    <asp:BoundField DataField="MenuItem" HeaderText="Menu Item" 
                        ItemStyle-Width="200px" HeaderStyle-CssClass="gridheaderline" >                    
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="ItemId" HeaderText="Item ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="FoodGroup" HeaderText="Food Group" 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="100px"></ItemStyle>
                  </asp:BoundField>
	                <asp:BoundField DataField="PreparationType" HeaderText="Prepration" 
                        ItemStyle-Width="200px" HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="CustomItem" HeaderText="Custom Item" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >	                   
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
	                <asp:BoundField DataField="Process" HeaderText="Process" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
	                <asp:TemplateField HeaderText="Recipe">
                            <ItemTemplate>
                               <asp:HyperLink ID="hlFileName" Text="View"
                                NavigateUrl='<%#"~/StaticContent/Files/" + DataBinder.Eval(Container.DataItem, "FileName")  %>'
                                 runat="server" Target="_blank" ></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
	                <asp:CommandField ButtonType="Link" HeaderText="Menu Item" EditText="Edit" 
                        ShowEditButton="true" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:CommandField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

