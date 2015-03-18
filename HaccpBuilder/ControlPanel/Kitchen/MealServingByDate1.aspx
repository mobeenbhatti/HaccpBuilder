<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" Inherits="ControlPanel_PrintChecklist" Codebehind="MealServingByDate1.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Meal Serving Calendar</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div>
        <div class="MainHeading">
            SELECT MENU ITEMS
        </div>
        <div class="ContentLeft">
            <div class="ContactDetail">
                   <%-- <Contact:Detail ID="cd" runat="server" />--%>                     
            </div>    
             
        </div>
        <div class="SmallClearer"></div> 
            <div class="ContentLeft" >
                <div class="ContactDetail">
                </div>       
            </div>
            <div class="ContentRight" >                     
            </div>            
            <div class="Clearer"></div>
            <div class="ViewPlanClearer"></div>            
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
    </div>
    <div class="ViewPlanClearer"></div>
    <div class="ContentLeft">
    </div>
    <div class="ContentRight">
        <div style="float:left; margin-left:250px;">
         <%--<asp:ImageButton ID="btnBack" runat="server"  onclick="btnBack_Click" ImageUrl="~/images/buttons/ButtonBack.gif" />--%>
         </div>
        <div style="float:left; margin-left:5px;">
        <asp:ImageButton ID="btnContinue" runat="server"  
                ImageUrl="~/images/buttons/ButtonContinue.gif" style="height: 20px" 
                onclick="btnContinue_Click" />
        </div>   
    </div>    
     <div class="ViewPlanClearer"></div>
    <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
