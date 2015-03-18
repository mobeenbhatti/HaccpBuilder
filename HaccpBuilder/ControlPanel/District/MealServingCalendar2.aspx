<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" Theme="Default" AutoEventWireup="true" Inherits="ControlPanel_MealServingCalendar" Title="HACCP Builder | Meal Serving Calendar" Codebehind="MealServingCalendar2.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
 <%--<script language="javascript" type="text/javascript">
 function GetData(strPath,ObjLabel)
 {
    alert(strPath);
    var strReturn;
    
   // window.open(strPath,'School HACCP | Meal Serving Selection','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');
    strReturn = window.showModalDialog(strPath,'','School HACCP | Meal Serving Selection','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');
    ObjLabel.Text = "Menu Item Selected";
 }
//  function check(lkbObj,chkObj)
//  {
//  if(chkObj.checked == "checked")
//  {
//  lkbObj.disabled = false;
//  }
//  else
//  {
//  lkbObj.disabled = true;
//  }
  
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
   
//  }
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
                   
            
            <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>  --%> 
                    <div class="GirdDiv">
                    <asp:GridView ID="grdMealCalendar" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfMealId" Value='<%# Eval("Id") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="gridheaderline">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" Text='<%#DataBinder.Eval(Container.DataItem, "MealDate","{0:d}") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                            </asp:TemplateField>
                           <%-- <asp:TemplateField HeaderText="Breakfast Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblBreakFast" Text="" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Breakfast" HeaderStyle-CssClass="gridheaderline">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkBreakFast" runat="server" 
                                        Checked='<%# Eval("BreakFast").ToString() == "1"? true:false %>' 
                                        oncheckedchanged="chkBreakFast_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                            </asp:TemplateField>
                           <%-- <asp:TemplateField HeaderText="Menu">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbBreakFast" runat="server" Text="Select" CommandName="BreakFast" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lunch Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblLunch" Text="" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Lunch" HeaderStyle-CssClass="gridheaderline">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkLunch" runat="server" 
                                        Checked='<%# Eval("Lunch").ToString() == "1"? true:false %>' 
                                        oncheckedchanged="chkLunch_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Menu">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbLunch" runat="server" Text="Select" CommandName="Lunch" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            
                        </Columns>
                    </asp:GridView>  
                    </div> 
                    
                   <%-- </ContentTemplate>
            </asp:UpdatePanel>   --%>      
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

