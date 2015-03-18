<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_MYSQLConnect" Title="Untitled Page" Codebehind="MYSQLConnect.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="MainHeading">
<%--<asp:ImageButton ImageUrl="~/images/District Images/buttonCreateDistrict.jpg" 
        ID="cmdCreate" runat="server" 
        onclick="cmdCreate_Click" />
         <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="odsStateProvince"
				            DataTextField="Name" DataValueField="StateProvinceId"  Width="200px" 
				            CssClass="DropDown" >
				            
			            </asp:DropDownList>
                    </div>
 <asp:ImageButton ImageUrl="~/images/District Images/ButtonCreateKitchen.jpg" 
        ID="cmdCreateKitchen" runat="server" onclick="cmdCreateKitchen_Click" 
       />
 <asp:ImageButton ImageUrl="~/images/District Images/buttonGoToInventoryReview.jpg" 
        ID="cmdInventory" runat="server" onclick="cmdInventory_Click" />
 <asp:ImageButton ImageUrl="~/images/buttons/ButtonViewEditMenuCalendar.jpg" 
        ID="cmdKitchenDetails" runat="server" onclick="cmdKitchenDetails_Click"  />
 <asp:ImageButton ImageUrl="~/images/buttons/ButtonAddCustomInvertoryItem.jpg" 
        ID="cmdCustomInventory" runat="server" 
        onclick="cmdCustomInventory_Click"   />
 <asp:ImageButton ImageUrl="~/images/buttons/ButtonMenuItems-1.jpg" 
        ID="cmdMenuItems" runat="server" onclick="cmdMenuItems_Click" />
 <asp:ImageButton ImageUrl="~/images/buttons/ButtonAddCustomMenuItem.jpg" 
        ID="cmdCustomMenu" runat="server" onclick="cmdCustomMenu_Click"  />
 <div class="clearer"></div>
 <asp:LinkButton ID="lkbColHolding" runat="server" Text="Cold Holding Log" 
        onclick="lkbColHolding_Click"></asp:LinkButton>
 <asp:LinkButton ID="lkbFreezerLog" runat="server" Text="Freezer Log" onclick="lkbFreezerLog_Click" 
        ></asp:LinkButton>
 <asp:LinkButton ID="lkbHotHolding" runat="server" Text="Hot Holding Log" onclick="lkbHotHolding_Click" 
       ></asp:LinkButton>
 <asp:LinkButton ID="lkbReceiving" runat="server" Text="Receiving  Log" onclick="lkbReceiving_Click" 
        ></asp:LinkButton>
 <asp:LinkButton ID="lkbRefrigeration" runat="server" Text="Refrigeration Log" onclick="lkbRefrigeration_Click" 
        ></asp:LinkButton>
 <asp:LinkButton ID="lkbTemperature" runat="server" Text="Temperature Log" onclick="lkbTemperature_Click" 
       ></asp:LinkButton>
 <asp:LinkButton ID="lkbThermo" runat="server" Text="Thermocalibration Log" onclick="lkbThermo_Click" 
       ></asp:LinkButton>
 <asp:LinkButton ID="lkbCheckList" runat="server" Text="Food SAfety Checklist" 
        onclick="lkbCheckList_Click"></asp:LinkButton>
 <asp:ImageButton ID="cmdContinue" runat="server" 
        ImageUrl="~/images/buttons/ButtonContinue.jpg" onclick="cmdContinue_Click" />--%>
        
</div>
<div class="GirdDiv">
<%--<asp:GridView ID="grdMySql" runat="server" AllowPaging="true">
</asp:GridView>
</div>
<asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
			</asp:ObjectDataSource>--%>
</asp:Content>

