<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" Inherits="ControlPanel_SetupInventory" Codebehind="SetupInventory.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
        <div >
            <div class="MainHeading">
               BUILD HAACP PLAN - SET UP KITCHEN INVENTORY
               <span style="font-size:10px; margin-left:50px">
               <asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" /> 
               <%--<asp:Button ID="btnBack" 
                    runat="server" CssClass="ButtonLarge"  Text="Back To Main Control Panel" 
                    onclick="btnBack_Click"  />--%>
                    </span>
            </div>            
        </div>
        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="InventoryButtons">
                    <div >
                        <asp:Button ID="btnGoTInventory" Text="Go To Inventory Review" runat="server" CssClass="InventoryButton" />
                    </div>                    
                              
                    <div style="margin-top:15px;">
                       <asp:Button ID="btnAddItem"  Text="Add Custom Inventory Item" runat="server" CssClass="InventoryButton" />    
                    </div>                                   
                </div>
               
                <%--<div class="Buttons">
                   <div class="FloatLeft">
                       <asp:Button ID="Button1" runat="server" Text="Edit HACCP Plan" CssClass="Button" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="Button2" runat="server" Text="Inventroy Items" CssClass="Button" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="Button3" runat="server" Text="View SOP's" CssClass="Button" />
                   </div>
                   <div class="Clearer" style="margin-top:15px"></div>
                   <div class="FloatLeft">
                       <asp:Button ID="Button4" runat="server" Text="Edit HACCP Plan" CssClass="Button" />
                   </div>
                   <div class="ButtonsCols">
                        <asp:Button ID="Button5" runat="server" Text="Inventroy Items" CssClass="Button" />
                   </div>
                   <div class="FloatLeft">
                   </div>
                   <div class="Clearer"></div>
                </div>--%>
            </div>
            <div class="ContentRight">                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
            <div class="Clearer"></div>
        </div>
        
       
        <div class="GirdDiv">
            <asp:GridView ID="grdInventoryDetails" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"   SkinID="gridviewSkin">                
                <Columns>                    
                    <asp:TemplateField HeaderText="Inventory Item">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Quantity">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="350px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
<%--	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag1")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>
	                    <asp:TemplateField HeaderText="Custom Item">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate2" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date2","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
<%--	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag2")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>
	                    <asp:TemplateField HeaderText="Inventory Item">
	                        <ItemTemplate> 
	                            <asp:HyperLink ID="hlDat3" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date3","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	               <%--     <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag3")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate4" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'
	                            Text='<%# DataBinder.Eval(Container.DataItem, "Date4","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag4")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Date">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate5" runat="server" NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date5","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField Visible="false">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDateFlag5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DateFlag5")  %>'>
	                            </asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Calendar">
                             <ItemTemplate>
                                 <ew:CalendarPopup ID="CalendarPopup1" runat="server" AutoPostBack="True" 
                                     CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                     ImageUrl="~/images/Calendar_scheduleHS.png" />
                             </ItemTemplate>
                             <ItemStyle Width="50px" />
                             <HeaderStyle CssClass="gridheaderline" />
                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Alerts">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlAlerts" runat="server" Text="No" NavigateUrl=''>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Report History">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlView" runat="server" Text="View" NavigateUrl=''>
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" HorizontalAlign="Center" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField HeaderText="Actions">
	                        <ItemTemplate>
	                        <asp:HyperLink ID="hlActions" runat="server" Text="No" NavigateUrl=''>
	                        </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
           
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                Name="dtStartDate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
        </asp:ObjectDataSource>
        </div>
        
        
        
        
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    <%--</center>--%>
</asp:Content>