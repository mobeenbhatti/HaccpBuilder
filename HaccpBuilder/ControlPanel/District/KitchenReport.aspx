<%@ Page Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master" AutoEventWireup="true" Inherits="ControlPanel_District_KitchenReport" Title="HACCP Builder | Location Report" Codebehind="KitchenReport.aspx.cs" EnableEventValidation="false" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI.Compatibility" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
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
                              <td><uc1:DistrictAddrssNew ID="DistrictAddrssNew1" runat="server" /> </td>
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
                              <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/District/LayoutTest.aspx"></asp:HyperLink></td>
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
   <div class="grey_bg_dis">
    <div class="red_heading">{ <b>Location: </b><asp:Label ID="lblKitchen" runat="server"></asp:Label> }</div>
    </div>  
	<div class="grey_bg_dis">
	<table  border="0" cellspacing="0" cellpadding="0"> 
                 <tr>
                   <td colspan="11">&nbsp;</td>                  
                </tr>                  
                <tr>
                  <td >Report:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  > <asp:DropDownList ID="ddlReportName" Width="200px" runat="server">
                 <asp:ListItem Value="1">Cleaning and Sanitization Log</asp:ListItem>
                 <asp:ListItem Value="2">ColdHolding Log</asp:ListItem>
                 <asp:ListItem Value="3">Cooling Temperature Log</asp:ListItem>
                 <asp:ListItem Value="4">Food Safety Checklist</asp:ListItem>
                 <asp:ListItem Value="5">Freezer Log</asp:ListItem>
                 <asp:ListItem Value="6">Hot Holding Log</asp:ListItem>
                 <asp:ListItem Value="7">Maintenance Log</asp:ListItem>
                 <asp:ListItem Value="8">Pest Control Log</asp:ListItem>
                 <asp:ListItem Value="9">PH Log</asp:ListItem>                 
                 <asp:ListItem Value="10">Receiving Log</asp:ListItem>
                 <asp:ListItem Value="11">Refrigeration Log</asp:ListItem>
                  <asp:ListItem Value="12">Shipping Log</asp:ListItem>
                 <asp:ListItem Value="13">Temperature Log</asp:ListItem>
                 <asp:ListItem Value="14">Thermometer Calibration</asp:ListItem>
                 <asp:ListItem Value="15">Validation Checklist</asp:ListItem>
                 </asp:DropDownList></td>
                   <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> </td>
               </tr>
               <tr><td colspan="5">&nbsp;</td></tr>
               <tr>                 
                  <td >Start Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <cc1:CalendarPopup ID="cldStartDate" runat="server" CommandName="Calendar" 
                     ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png"></cc1:CalendarPopup>
                 </td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                 <td> 
                   </td>
                </tr>
                 <tr><td colspan="5">&nbsp;</td></tr>
                <tr>                 
                  <td >End Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><cc1:CalendarPopup ID="cldEndDate" runat="server" CommandName="Calendar" 
                     ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png"></cc1:CalendarPopup>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                     ControlToCompare="cldStartDate" ControlToValidate="cldEndDate" 
                     ErrorMessage="Please select valid date" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator></td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                 <td>  <asp:ImageButton ID="cmdSubmit" runat="server" 
                 ImageUrl="~/images/District Images/ButtonGO.png" onclick="cmdSubmit_Click" /></td>
                </tr>
                 <tr><td colspan="5" class="red_heading"><asp:Label ID="lblMessage" runat="server" Text="No Record Found" Visible="false"></asp:Label></td></tr>
                <tr>
                   <td colspan="5"><asp:LinkButton ID="lkbPrintReport" runat="server" onclick="lkbPrintReport_Click" Text="Export to Excel"  Visible="true"></asp:LinkButton></td>                  
                </tr>  
                 <tr>
                   <td colspan="5">&nbsp;</td>                  
                </tr>               
                
              </table>
	</div>	
    <div style="clear:both;"></div>
    <div class="table_view">	
            <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin"
                onselectedindexchanging="grdReport_SelectedIndexChanging" 
                onpageindexchanging="grdReport_PageIndexChanging"  >                
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
                  <%--  <asp:BoundField DataField="Internaltemp1" HeaderText="Internal Temp1" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>                    
                    </asp:BoundField>--%>
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
                 <%--   <asp:BoundField DataField="Internaltemp2" HeaderText="Internal Temp 2" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>--%>
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
        </div>
</div>
         
</asp:Content>

