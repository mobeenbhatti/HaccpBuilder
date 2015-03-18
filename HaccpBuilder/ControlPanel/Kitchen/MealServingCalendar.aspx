<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" Theme="Default" AutoEventWireup="true" Inherits="ControlPanel_MealServingCalendar" Title="HACCP Builder | Meal Serving Calendar" Codebehind="MealServingCalendar.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
 <%--<script language="javascript" type="text/javascript">
  function check(lkbObj,chkObj)
  {
  if(chkObj.checked == "checked")
  {
  lkbObj.disabled = false;
  }
  else
  {
  lkbObj.disabled = true;
  }
  
//    if(enable == false)
//    {
//   
//     ValidatorEnable(vldObj, false); 
//     txtobj.disabled=true;
//     txtobj.value = "";
//    }
//    else
//    { 
//   
//     ValidatorEnable(vldObj, true);  
//     txtobj.disabled=false;
//    }
   
  }
</script>--%> 
    <%--<center>--%>
        <div >
            <div class="MainHeading">
              MEAL SERVING CALENDAR
               <span style="margin-left:200px;">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
               </span>
            </div>            
        </div>
        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="HaccpPlantLeft">
                    <div >
                        <asp:ImageButton ID= "btnAcceptPlan"  onclick="btnAcceptPlan_Click" ImageUrl="~/images/buttons/ButtonContinue.gif" runat="server" />
                        
                    </div>                              
                    <div style="margin-top:15px;">
                        <asp:ImageButton ID="btnEditPlan" onclick="btnEditPlan_Click" ImageUrl="~/images/buttons/ButtonEditHaccpPlan.jpg" runat="server" />
                        
                    </div>
                    <div style="margin-top:15px; margin-bottom:10px;">
                       <span style="padding-right:20px; ">INSTRUCTIONS:</span><span >Please place a check box in either or both Breakfast and 
                       Lunch, then click on select.  Then select the menu items that you will be serving 
                       on that date.  Please select the check box, for each menu item for that date and 
                       click update. Then move on to the next main meal check box. 
                       </span> 
                    </div>                                                       
                </div> 
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div> 
        <div class="ViewPlanClearer"></div>
        <div style="margin-left:20px; color:Red;">
        <asp:Label ID="lblError" Text="" runat="server"></asp:Label>
        </div>  
       
        <div class="GirdDiv">
                   
            
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>                   
                    <asp:Repeater ID="rptMealCalendar" runat="server" 
                DataSourceID="ObjectDataSource1"  OnItemCommand="rptMealCalendar_OnItemCommand" 
                onitemdatabound="rptMealCalendar_ItemDataBound">
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;"> 
            <td></td>            
            <td width="150px"><b>Date</b></td> 
            <td width="150px"><b>Breakfast Status</b></td> 
            <td width="100px" align="center" ><b>BreakFast</b></td>
            <td width = "100px" align="center" colspan="2" ><b>Menu</b></td>
            <td width="150px"><b>Lunch Status</b></td>
            <td width="100px" align="center" ><b>Lunch</b></td>
            <td width="100px" align="center" colspan="2" ><b>Menu</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >
        <td><asp:HiddenField ID="hfMealId" Value='<%# Eval("Id") %>' runat="server" /></td>
        <%--<td ><%#DataBinder.Eval(Container.DataItem, "MealDate","{0:d}") %></td>--%>
        <td><asp:Label ID="lblDate" Text='<%#DataBinder.Eval(Container.DataItem, "MealDate","{0:d}") %>' runat="server"></asp:Label></td>
        <td><asp:Label ID="lblBreakFast" Text="" runat="server"></asp:Label></td>
        <td align="center"><asp:CheckBox ID="chkBreakFast" runat="server" Checked='<%# Eval("BreakFast").ToString() == "1"? true:false %>' /></td>
        <td align="center"><asp:LinkButton ID="lkbBreakFast" runat="server" Text="Select" CommandName="BreakFast" /></td>
        <td>
            <asp:DataGrid runat="server" ID="grdBreakFast"  Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
            <asp:TemplateColumn >
                <ItemTemplate>
                <asp:HiddenField ID="hfDailyMealId" runat="server" Value='<%# Eval("DailyMealId") %>' />
                </ItemTemplate>
            </asp:TemplateColumn>                       
            <asp:TemplateColumn>
                <ItemTemplate> 
                <asp:CheckBox ID="chkBreakFast" runat="server" Checked='<%# Eval("Selected").ToString() == "1"? true:false %>'  />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="MenuItem">
                <ItemTemplate> 
                <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Food Group">
                <ItemTemplate>
                <asp:Label ID="lblFoodGroup" runat="server" Text='<%# Eval("FoodGroup") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
             <asp:TemplateColumn>
                <ItemTemplate>                
                <asp:HiddenField ID="hfMenuItemId" Value='<%# Eval("MenuItemId") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateColumn>                      
            </Columns>
            </asp:DataGrid>            
        </td>   
        <td><asp:Label ID="lblLunch" Text="" runat="server"></asp:Label></td>     
        <td align="center"><asp:CheckBox ID="chkLunch" runat="server" Checked='<%# Eval("Lunch").ToString() == "1"? true:false %>' /></td>
        <td align="center"><asp:LinkButton ID="lkbLunch" runat="server" Text="Select" CommandName="Lunch" /></td>
        <td>
            <asp:DataGrid runat="server" ID="grdLunch"  Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfDailyMealId" runat="server" Value='<%# Eval("DailyMealId") %>' />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <ItemTemplate> 
                        <asp:CheckBox ID="chkLunch" runat="server" Checked='<%# Eval("Selected").ToString() == "1"? true:false %>'  />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                <ItemTemplate> 
                <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Food Group">
                    <ItemTemplate>
                    <asp:Label ID="lblFoodGroup" runat="server" Text='<%# Eval("FoodGroup") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn> 
                <asp:TemplateColumn>
                <ItemTemplate>
                <asp:HiddenField ID="hfMenuItemId" Value='<%# Eval("MenuItemId") %>' runat="server" />
                </ItemTemplate>
                </asp:TemplateColumn>           
            </Columns>
            </asp:DataGrid>
            <%--<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetMenuItemsDataSet" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
            <SelectParameters>
                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
            </asp:ObjectDataSource>--%>
        </td>
    </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                    </ContentTemplate>
            </asp:UpdatePanel>         
        </div>
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMealServingCalendarByKitchenId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMealServingCalendar">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
         
        
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    <%--</center>--%>
</asp:Content>

