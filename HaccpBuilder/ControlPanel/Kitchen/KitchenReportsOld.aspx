<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" CodeBehind="KitchenReportsOld.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.KitchenReportsNew" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<div class="bdy_contents">
<div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ LOCATION REPORTS }</td>
                            </tr>
                            <tr>
                              <td><Contact:Detail ID="cd" runat="server" /> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="54" background="../../images/District Images/bg_btns_strip.gif"><table width="690" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" width="10" height="12" /></td>
                        </tr>
                        <tr>
                          <td><table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/Kitchen/Default.aspx"></asp:HyperLink></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="300" align="left"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" /></td>
                        </tr>
                      </table></td>
              </tr>
                  </table>
   		  </div>
<div class="buttons_bg"></div> 
<div class="table_view">   
    <asp:GridView ID="grdDailyReports" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                OnRowCommand="grdDailyReports_RowCommand"
                SkinID="gridviewSkin">
                <Columns>
                    <asp:TemplateField HeaderText="Report Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <ew:CalendarPopup ID="cldStartDate" runat="server"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <ew:CalendarPopup ID="cldEndDate" runat="server" CommandName="Calendar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>'
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View Report">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbView" Text="View" CommandName="View" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Export to Excel">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbExport" Text="Export" CommandName="Export" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                   
                </Columns>
            </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetKitchenReports" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>           
            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
    <div class="grey_bg_dis">
    <div class="red_heading"><b>{ <asp:Label ID="lblReport" runat="server"></asp:Label> }</b></div>
    </div>
    <div class="table_view">	
             <asp:GridView ID="grdColdHoldingLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onselectedindexchanging="grdColdHoldingLog_SelectedIndexChanging" 
                onpageindexchanging="grdColdHoldingLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>   
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                     
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdHotHoldingLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onselectedindexchanging="grdHotHoldingLog_SelectedIndexChanging" 
                onpageindexchanging="grdHotHoldingLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>   
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                     
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onselectedindexchanging="grdReport_SelectedIndexChanging" 
                onpageindexchanging="grdReport_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblServiceDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="llbCategory" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblOutput" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblInput" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>     
                    <asp:BoundField DataField="BatchNo" HeaderText="Batch No" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>                
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFreezerLog" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                 onpageindexchanging="grdFreezerLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >                 
                     <asp:TemplateField HeaderText="Temp 1">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                      <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action 1" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>                   
                     <asp:TemplateField HeaderText="Temp 2">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                      <asp:BoundField DataField="CorrectiveAction2" HeaderText="Corrective Action 2" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>                   
                     <asp:TemplateField HeaderText="Temp 3">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3" Text='<%# DataBinder.Eval(Container.DataItem, "Temp3").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp3").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 3 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp3Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:BoundField DataField="CorrectiveAction3" HeaderText="Corrective Action 3" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>                   
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdReceivingLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onpageindexchanging="grdReceivingLog_PageIndexChanging" PageSize="20"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Vendor" HeaderText="Vendor" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:BoundField DataField="BatchNumber" HeaderText="Batch/Lot No." 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Volume" HeaderText="Volume" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Ingredient" HeaderText="Ingredient" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                      <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdRefrigerationLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onpageindexchanging="grdRefrigerationLog_PageIndexChanging"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Unit/Device" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdShippingLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onpageindexchanging="grdShippingLog_PageIndexChanging" PageSize="20"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Customer" HeaderText="Company Name" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="BatchNumber" HeaderText="Batch/Lot No." 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Volume" HeaderText="Volume" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="MenuItem" HeaderText="Output" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>       
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFreezerNewLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onpageindexchanging="grdFreezerNewLog_PageIndexChanging"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Unit/Device" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdThermoCaliberationLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onpageindexchanging="grdThermoCaliberationLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Thermometer" HeaderText="Thermometer" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>   
                         <asp:TemplateField HeaderText="Temperature 2">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText="Temperature 3">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature3").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature3").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFoodSafety" runat="server" AutoGenerateColumns="False" 
                 onrowdatabound="grdFoodSafety_RowDataBound" SkinID="gridviewSkin"
                onpageindexchanging="grdFoodSafety_PageIndexChanging"  >                
                <Columns>  
                    <asp:TemplateField ItemStyle-Width="5px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                           <asp:HiddenField ID="hfHistoryId" Value='<%# DataBinder.Eval(Container.DataItem, "HistoryId")  %>' runat="server" />
                        </ItemTemplate>                       
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>          
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>                       
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Observer" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblObserver" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Observer")  %>'></asp:Label>
                        </ItemTemplate>                        
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="View / Print" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" Text="View/Print" Target="_blank" runat="server"></asp:HyperLink>
                        </ItemTemplate>                        
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                >                
                <Columns>           
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>                       
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="View / Print " ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" Text="View/Print" NavigateUrl='<%# "~/ControlPanel/Kitchen/PrintValidation.aspx?date=" + DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>' Target="_blank" runat="server"></asp:HyperLink>
                        </ItemTemplate>                        
	                    <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdPhLog" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onselectedindexchanging="grdPhLog_SelectedIndexChanging" 
                onpageindexchanging="grdPhLog_PageIndexChanging"  >                
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                           <asp:Label ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/PhLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
                        <ItemTemplate>
                            <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("[CategoryName]")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Ph Level Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction1" runat="server" Text='<%# Eval("CorrectiveActionPhLevel")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Water Temp Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction2" runat="server" Text='<%# Eval("CorrectiveActionWaterTemp")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Contact Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction3" runat="server" Text='<%# Eval("CorrectiveActionContact")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                        
                    <asp:TemplateField HeaderText="Entry Date">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdPest" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                  onselectedindexchanging="grdPestLog_SelectedIndexChanging" 
                onpageindexchanging="grdPestLog_PageIndexChanging" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" >
                        <ItemTemplate>
                            <asp:Label ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Clean">
                        <ItemTemplate>
                             <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Entry Date" >
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdMaintenance" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
                 onpageindexchanging="grdMaintenance_PageIndexChanging" 
                onselectedindexchanging="grdMaintenance_SelectedIndexChanging">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label  ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Correct">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsCorrect").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Describe what was done">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("Comments")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdCleaning" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"  
                onpageindexchanging="grdCleaning_PageIndexChanging" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Clean">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Describe what was done">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("Comments")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="120px" />
                        <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false" SkinID="gridviewSkin">
                    <Columns>                 
                        <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" ItemStyle-Width="50px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
	                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId")  %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField> 
                         <asp:BoundField DataField="Observer" HeaderText="Observer" ItemStyle-Width="150px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField ItemStyle-Width="50px" HeaderText="Account Type" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountType" Text='<%# DataBinder.Eval(Container.DataItem, "AccountType").ToString() == "1"? "Location Level":"Mobile Level"  %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField>  
                    </Columns>
               </asp:GridView>
        </div>
    
</div>
</asp:Content>
