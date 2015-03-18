<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_District_MealServingByDate" Title="Meal Serving Menu" Codebehind="MealServingByDate.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

    <div >
        <div class="MainHeading">
          MEAL SERVING MENU
           <%--<span style="margin-left:200px;">
           <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
           </span>--%>
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
    <div class="GirdDiv">
        <asp:DataGrid runat="server" ID="grdMenuItem"
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
        <asp:HiddenField ID="hfMealCalendarId" runat="server" />
        <asp:HiddenField ID="hfEventId" runat="server" />
    </div>
    
    
</asp:Content>

