<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"   AutoEventWireup="true" Inherits="ControlPanel_DailyParticipationHaccp" Title="HACCP Builder | Daily Participation" Codebehind="DailyParticipationHaccp.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
        <div >
            <div class="MainHeading">
              BUILD HAACP PLAN - DAILY PARTICIPATION
               <span style="font-size:10px; margin-left:105px">
               <asp:ImageButton ID="btnBack" onclick="btnBack_Click" runat="server" ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />
               <%--<asp:Button ID="btnBack" 
                    runat="server" CssClass="ButtonLarge"  Text="Back To Main Control Panel" 
                    onclick="btnBack_Click"  />--%></span>
            </div>            
        </div>
        <asp:ScriptManager ID="scpAjax" runat="server"></asp:ScriptManager>
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="InventoryButtons">
                    <div class="Heading">
                        Daily Participation
                    </div>
                    <div class="ViewPlanLabel">
                        Number of Breakfasts Served
                    </div>
                    <div >
                      <asp:TextBox ID="txtBreakfastServed" Text="200" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please fill Breakfast field" runat="server" ControlToValidate="txtBreakfastServed"></asp:RequiredFieldValidator>
                    </div>                     
                    <div class="ViewPlanLabel">
                        Number of Lunches Served
                     </div>
                    <div >
                      <asp:TextBox ID="txtLunchServed" Text="200" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please fill Lunch field" runat="server" ControlToValidate="txtLunchServed"></asp:RequiredFieldValidator>
                    </div>                             
                    <div class="Heading">
                        Food Service Staff
                    </div>
                    <div class="ViewPlanLabel">
                        Number of Managers
                     </div>
                    <div >
                       <asp:TextBox ID="txtManagers" Text="2" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Please fill Managers field" runat="server" ControlToValidate="txtManagers"></asp:RequiredFieldValidator>
                    </div> 
                    <div class="ViewPlanLabel">
                        Number of Staff
                    </div>
                    <div >
                      <asp:TextBox ID="txtStaff" Text="20" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please fill Staff field" runat="server" ControlToValidate="txtStaff"></asp:RequiredFieldValidator>
                    </div>                   
                    <div class="Heading">
                       Menu Cycle                    
                    </div>                    
                    <div class="ViewPlanLabel">
                        Cycle Measured by:
                    </div>
                    <div >
                      <asp:DropDownList ID="ddlCycleMeasuredBy" runat="server">
                            <asp:ListItem Value="1" Selected="True">Day</asp:ListItem>
                            <asp:ListItem Value="2">Week</asp:ListItem>
                            <asp:ListItem Value="3">Month</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div> 
                    <div class="ViewPlanLabel">
                       How Many Units in Cycle:
                    </div>
                    <div>                       
                       <asp:DropDownList ID="ddlCycleUnit" runat="server">
                           <asp:ListItem Selected="True">1</asp:ListItem>
                           <asp:ListItem>2</asp:ListItem>
                           <asp:ListItem>3</asp:ListItem>
                           <asp:ListItem>4</asp:ListItem>
                           <asp:ListItem>5</asp:ListItem>
                           <asp:ListItem>6</asp:ListItem>
                           <asp:ListItem>7</asp:ListItem>
                           <asp:ListItem>8</asp:ListItem>
                           <asp:ListItem>9</asp:ListItem>
                           <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </div> 
                    <div class="ViewPlanLabel">
                       Does Cycle Repeat:
                     </div>
                     <div>                      
                       <asp:DropDownList ID="ddlIsCycleRepeat" runat="server">
                           <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                           <asp:ListItem Value="2">No</asp:ListItem>
                           <asp:ListItem></asp:ListItem>
                         </asp:DropDownList>
                    </div>                                       
                </div>          
            </div>
            <div class="ContentRight">
                <div>                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs> 
                </div>
                <div>
                    <div class="Heading">
                        Menu Calendar                    
                     </div>
                    <div class="ViewPlanLabel" >
                           Start Date:
                       </div>
                       <asp:UpdatePanel ID="updDates" runat="server" >
                       <ContentTemplate>
                    <div > 
                        <ew:CalendarPopup ID="cldStartDate" runat="server" AutoPostBack="True" 
                                             CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                             ImageUrl="~/images/Calendar_scheduleHS.png" 
                            ondatechanged="cldStartDate_DateChanged" /> 
                       </div>
                    <div class="ViewPlanLabel">
                        End Date:
                      </div>
                    <div>
                        <ew:CalendarPopup ID="cldEndDate" runat="server" AutoPostBack="True"
                                         CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                         ImageUrl="~/images/Calendar_scheduleHS.png" 
                             ondatechanged="cldEndDate_DateChanged" />                         
                     </div>
                     </ContentTemplate>
                     </asp:UpdatePanel>
                    <div style="width:350px; margin-left:20px;">
                     NOTE:  The calendar will populate every week day in the range
                     you select as a day you are serving meals.  If you have put
                     numbers in breakfast and lunch, the calendar will prompt you
                     to complete the menu items in each date.
                                          
                    </div>   
                 </div>
            </div>     
                        
            <div class="Clearer"></div>
            <div class="ViewPlanClearer"></div>
            
           <div style="float:left; margin-left:20px;">
            <asp:ImageButton ID="cmdSubmit" runat="server" onclick="cmdSubmit_Click" ImageUrl="~/images/buttons/ButtonUpdate.gif" />           
           </div>
           <%--<div style="float:left; margin-left:20px;">
            <asp:ImageButton ID="cmdPrint" runat="server" 
                   ImageUrl="~/images/buttons/ButtonPrint-Test.GIF"    />
           </div>--%>
        </div>
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    <%--</center>--%>
</asp:Content>
