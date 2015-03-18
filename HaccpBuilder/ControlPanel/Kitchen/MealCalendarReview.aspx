<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MealCalendarReview" Title="HACCP Builder | Meal Serving Calendar Review" Codebehind="MealCalendarReview.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
     <div >
         <div class="MainHeading">
               BUILD HAACP PLAN - MEAL SERVING CALENDAR REVIEW
               <span style="font-size:10px; margin-left:10px">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
              </span>
            </div>            
      </div>        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="cmdViewPlan" runat="server" onclick="btnEditPlan_Click" 
                           ImageUrl="~/images/buttons/ButtonViewHaccpPlan.jpg" />                       
                   </div>
                </div>                
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div>       
       <div class="Clearer"></div>
       <div class="GirdDiv">           
            <asp:Repeater ID="rptMealCalendar" runat="server" 
                DataSourceID="ObjectDataSource1"  OnItemCommand="rptMealCalendar_OnItemCommand" 
                onitemdatabound="rptMealCalendar_ItemDataBound">
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;"> 
            <td></td>            
            <td width="250px" ><b>Date</b></td> 
            <td width="100px" align="center" colspan="2" ><b>Break Fast Menu </b></td>
            <td width="100px" align="center" colspan="2" ><b>Lunch Menu </b></td>            
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >
        <td><asp:HiddenField ID="hfMealId" Value='<%# Eval("Id") %>' runat="server" /></td>
        <td ><%#DataBinder.Eval(Container.DataItem, "MealDate","{0:d}") %></td>        
        <td align="center"><asp:LinkButton ID="lkbBreakFast" runat="server" Text="View" CommandName="BreakFast" /></td>
        <td>
            <asp:DataGrid runat="server" ID="grdBreakFast"  Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
            <%--<asp:TemplateColumn>
                <ItemTemplate>
                <asp:HiddenField ID="hfDailyMealId" runat="server" Value='<%# Eval("DailyMealId") %>' />
                </ItemTemplate>
            </asp:TemplateColumn> --%>           
            <asp:TemplateColumn>
                <ItemTemplate> 
                <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
             <%--<asp:TemplateColumn>
                <ItemTemplate>                
                <asp:HiddenField ID="hfMenuItemId" Value='<%# Eval("MenuItemId") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateColumn>--%>                      
            </Columns>
            </asp:DataGrid>
            <asp:Label ID="lblBreakFast" Text="No Item Selected" Visible="false" ForeColor="Red" runat="server"></asp:Label>            
        </td>        
        <td align="center"><asp:LinkButton ID="lkbLunch" runat="server" Text="View" CommandName="Lunch" /></td>
        <td>
            <asp:DataGrid runat="server" ID="grdLunch"  Visible="false"
            AutoGenerateColumns="false" > 
            <Columns>
            <%--<asp:TemplateColumn>
            <ItemTemplate>
            <asp:HiddenField ID="hfDailyMealId" runat="server" Value='<%# Eval("DailyMealId") %>' />
            </ItemTemplate>
            </asp:TemplateColumn>--%>            
            <asp:TemplateColumn>
            <ItemTemplate> 
            <asp:Label ID="LabelMenuItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateColumn> 
            <%--<asp:TemplateColumn>
            <ItemTemplate>
            <asp:HiddenField ID="hfMenuItemId" Value='<%# Eval("MenuItemId") %>' runat="server" />
            </ItemTemplate>
            </asp:TemplateColumn> --%>          
            </Columns>
            </asp:DataGrid> 
            <asp:Label ID="lblLunch" Text="No Item Selected" Visible="false" ForeColor="Red" runat="server"></asp:Label>           
        </td>
    </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>         
        </div>
        <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedMealServingCalendar" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMealServingCalendar">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>

