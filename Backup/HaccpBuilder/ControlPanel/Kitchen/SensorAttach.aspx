<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_SensorAttach" Title="Untitled Page" Codebehind="SensorAttach.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
    <%--<center>--%>
        <div >
            <div class="MainHeading">
              DAILY MENU ITEMS SERVED - Sensor Attach
               <span style="font-size:10px; margin-left:50px"><asp:Button ID="btnBack" 
                    runat="server" CssClass="ButtonLarge"  Text="Back To Main Control Panel" 
                    onclick="btnBack_Click"  /></span>
            </div>            
        </div>
        
        <div>
            <div class="ContentLeft">
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>
                <div class="HaccpPlantLeft">
                    <div >
                        <asp:Button ID="btnAcceptPlan" Text="Accept HACCP Plan" runat="server" CssClass="HaccpButton" />
                    </div>                              
                    <div style="margin-top:15px;">
                       <asp:Button ID="btnEditPlan"  Text="Edit HAACP Plan" runat="server" 
                            CssClass="HaccpButton" onclick="btnEditPlan_Click" />    
                    </div>
                    <div style="margin-top:15px;">
                       <span style="padding-right:20px; ">INSTRUCTIONS:</span><span >A check box means that the kitchen will be serving the meal that
                       Day.  To enter menu items and attach sensors click on <a href="Default2.aspx">items</a>
                                                                                 </span> 
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
        <div style="border-top: solid 1px #000000; border-bottom: solid 1px #000000; margin-left:20px; margin-right:20px; font-size:14px; font-weight:bold; font-family:Verdana;" >
            <asp:Label ID="lblDate" Text="March 2, 2007"  runat="server"></asp:Label>
            <div style="margin-top:10px;"></div>
        </div>
        <div>
        <div class="SmallClearer"></div>
        <div class="ContentLeft">                     
           <span class="Heading">Breakfast:</span>
           <span style="margin-left:30px;"><asp:DropDownList ID="ddlMenuItemBreakfast" CssClass="DropDown" runat="server"></asp:DropDownList></span>    
        </div>
        <div class="ContentRight">                     
           <span class="Heading">Sensor:</span>
           <span style="margin-left:55px;"><asp:DropDownList ID="ddlSensorBreakfast" CssClass="DropDown" runat="server"></asp:DropDownList></span>    
           <div class="SmallClearer"></div>
           <span style="float:right; margin-right:110px;"><asp:Button ID="cmdBreakFast" Text="Submit" CssClass="Button" runat="server" /></span>
        </div>
        
            <div class="GirdDiv">
            <asp:GridView ID="grdSensorBreakFast" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"   SkinID="gridviewSkin">                
                <Columns>  
                <asp:BoundField DataField="DateFlag1" HeaderText="Assigned Sensor Label" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" /> 
                <%--<asp:TemplateField HeaderText="Assigned Sensor Label">
                    <ItemTemplate>
	                      <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                      </asp:HyperLink>
	               </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField> --%>                
                    
	                    <asp:TemplateField HeaderText="Sensor Number">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Menu Items">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%--<asp:HyperLinkField HeaderText="Menu Items" Text="View" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="200px" /> --%>
                        <asp:BoundField HeaderText="Menu Item Number"  HeaderStyle-CssClass="gridheaderline"  DataField="Date2" ItemStyle-Width="50px" />  
	                    <asp:HyperLinkField HeaderText="Process" HeaderStyle-CssClass="gridheaderline" NavigateUrl="~/ControlPanel/Default2.aspx" DataTextField="DateFlag2" ItemStyle-Width="50px" />
	                    <%--<asp:CheckBoxField HeaderText="Process" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px"   />--%>
	                    <asp:TemplateField HeaderText="Pre-Made">
                            <ItemTemplate>
	                            <asp:RadioButton ID="rdbPreMade" GroupName="foodCategory" runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
	                    <%--<asp:HyperLinkField HeaderText="Pre-Made" Text="Yes" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px" />--%>
                       <asp:TemplateField HeaderText="Vendor Supplied">
                            <ItemTemplate>
	                            <asp:RadioButton ID="rdbPreVendorSupplied" GroupName="foodCategory" runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <%--<asp:HyperLinkField HeaderText="Vendor Supplied" Text="1" NavigateUrl="~/ControlPanel/Default2.aspx" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />--%>
	                    <asp:BoundField DataField="DateFlag3" HeaderText="Custom Item" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" />	                   
 	                    <asp:HyperLinkField HeaderText="Add/Edit Recipe" NavigateUrl="~/ControlPanel/Default2.aspx" Text="Add/Edit" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />
 	                    <asp:HyperLinkField HeaderText="View Recipe" NavigateUrl="~/ControlPanel/Default2.aspx" Text="View" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />

	                                    
	                    	                  
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
        </div>
        <div style="border-top: solid 1px #000000; margin-top:20px;margin-left:20px; margin-right:20px;" >
        </div>
            <div class="SmallClearer"></div>
            <div class="ContentLeft">                     
               <span class="Heading">Lunch:</span>
               <span style="margin-left:30px;"><asp:DropDownList ID="ddlMenuItemLunch" CssClass="DropDown" runat="server"></asp:DropDownList></span>    
            </div>
            <div class="ContentRight">                     
               <span class="Heading">Sensor:</span>
               <span style="margin-left:55px;"><asp:DropDownList ID="ddlSensorLunch" CssClass="DropDown" runat="server"></asp:DropDownList></span>    
               <div class="SmallClearer"></div>
               <span style="float:right; margin-right:110px;"><asp:Button ID="cmdLunch" Text="Submit" CssClass="Button" runat="server" /></span>
            </div>        
            <div class="GirdDiv">
                <asp:GridView ID="grdSensorLunch" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"   SkinID="gridviewSkin">                
                <Columns>  
                <asp:BoundField DataField="DateFlag1" HeaderText="Assigned Sensor Label" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" /> 
                <%--<asp:TemplateField HeaderText="Assigned Sensor Label">
                    <ItemTemplate>
	                      <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                      </asp:HyperLink>
	               </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                </asp:TemplateField> --%>                
                    
	                    <asp:TemplateField HeaderText="Sensor Number">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Menu Items">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlDate1" runat="server"  NavigateUrl='<%#"~/ControlPanel/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")+ "&date=" + DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'
	                             Text='<%# DataBinder.Eval(Container.DataItem, "Date1","{0:d}")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%--<asp:HyperLinkField HeaderText="Menu Items" Text="View" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="200px" /> --%>
                        <asp:BoundField HeaderText="Menu Item Number"  HeaderStyle-CssClass="gridheaderline"  DataField="Date2" ItemStyle-Width="50px" />  
	                    <asp:HyperLinkField HeaderText="Process" HeaderStyle-CssClass="gridheaderline" NavigateUrl="~/ControlPanel/Default2.aspx" DataTextField="DateFlag2" ItemStyle-Width="50px" />
	                    <%--<asp:CheckBoxField HeaderText="Process" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px"   />--%>
	                    <asp:TemplateField HeaderText="Pre-Made">
                            <ItemTemplate>
	                            <asp:RadioButton ID="rdbPreMade" GroupName="foodCategory" runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
	                    <%--<asp:HyperLinkField HeaderText="Pre-Made" Text="Yes" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px" />--%>
                       <asp:TemplateField HeaderText="Vendor Supplied">
                            <ItemTemplate>
	                            <asp:RadioButton ID="rdbPreVendorSupplied" GroupName="foodCategory" runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle Width="50px" />
	                        <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <%--<asp:HyperLinkField HeaderText="Vendor Supplied" Text="1" NavigateUrl="~/ControlPanel/Default2.aspx" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />--%>
	                    <asp:BoundField DataField="DateFlag3" HeaderText="Custom Item" HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" />	                   
 	                    <asp:HyperLinkField HeaderText="Add/Edit Recipe" NavigateUrl="~/ControlPanel/Default2.aspx" Text="Add/Edit" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />
 	                    <asp:HyperLinkField HeaderText="View Recipe" NavigateUrl="~/ControlPanel/Default2.aspx" Text="View" HeaderStyle-CssClass="gridheaderline" DataTextField="" ItemStyle-Width="50px"  />

	                                    
	                    	                  
                </Columns>
            </asp:GridView>           
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" 
                    Name="dtStartDate" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
            </asp:ObjectDataSource>
            </div>
       <div style="border-bottom: solid 1px #000000; margin-top:20px;margin-left:20px; margin-right:20px;" >
        </div>
        
        
        
        
         <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
    <%--</center>--%>
</asp:Content>

