<%@ Page Title="HACCP Builder | Facility Dashboard" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="FacilityTest.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.FacilityTest" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="~/Controls/AccountDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>    $("#pnlDashBoard").addClass('selected');</script>
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1> Facility Dashboard</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
 <div class="left"><br /><!----BODY-TOP-START----->    
    <%--<h2>Heading</h2>--%>
    <Contact:Detail ID="cd" runat="server" />
  </div>
  <div class="right"><br />
    <%--<h2>Heading</h2>--%>
    <div class="form"> <div class="client-logo"><asp:Image ID="imgLogo" runat="server" Width="330px" Height="132px" /></div></div>
  </div><!----BODY-TOP-END----->
  
  <div class="clear tenpx"></div>
  
  <div class="nav2"> <!----BODY-NAV-2-START----->
    <ul id="menu">
      <li runat="server" id="pnlInventory"><a href="SetupInventoryHaccp.aspx">Facility Inventory</a></li>
      <li runat="server" id="pnlVendors"><a href="Vendors.aspx">Vendors</a>
        <%--<ul>
          <li><a href="#">Allergen Plan</a></li>
          <li><a href="#">Allergen Plan</a></li>
          <li><a href="#">Allergen Plan</a></li>
          <li><a href="#" class="last">Allergen Plan</a></li>
        </ul>--%>
      </li>
      <li runat="server" id="pnlCutomers"><a href="Customers.aspx">Customers</a></li>
      <li runat="server" id="pnlInputs"><a href="Ingredients.aspx">Inputs</a></li>
      <li class="last" runat="server" id="pnlOutputs"><a href="MenuItems.aspx">Outputs</a></li>     
      <li class="last" runat="server" id="pnlSops"><a href="SOPList.aspx">SOP's / SSOP's / GMP's</a>
        <%--<ul>
          <li><a href="#">Allergen Plan Allergen Plan</a></li>
          <li><a href="#">Allergen Plan</a></li>
          <li><a href="#">Allergen Plan</a></li>
          <li><a href="#" class="last">Allergen Plan</a></li>
        </ul>--%>
      </li>      
    </ul>
  </div><!----BODY-NAV-2-END----->  
  <div class="clear"></div>
<div class="left"><br /><!----BODY-CONTENT1-START----->
    <h2>Logs:</h2>    
    <div class="box-header">
      <h4 class="left">Log Name</h4>
      <h4 class="right">Date Select</h4>
    </div>
    <div class="form2">
      <asp:Repeater ID="rptReports" runat="server" DataSourceID="ObjectDataSource1"
            onitemcommand="rptReports_ItemCommand" 
            onitemdatabound="rptReports_ItemDataBound">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
              <td ><a href='<%# "~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' runat="server" id="hlReport"><%# DataBinder.Eval(Container.DataItem, "TableName")  %></a></td>
              <td ><ew:CalendarPopup ID="cldReport" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>           
        </FooterTemplate>
      </asp:Repeater>
       <asp:Repeater ID="rptWeekly" runat="server" DataSourceID="odsWeekly" onitemcommand="rptWeekly_ItemCommand"  onitemdatabound="rptWeekly_ItemDataBound">        
        <ItemTemplate>
            <tr>
              <td ><a href='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' runat="server" id="hlReport"><%# DataBinder.Eval(Container.DataItem, "TableName") %></a></td>
              <td ><ew:CalendarPopup ID="cldReport" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
      </asp:Repeater>
    </div>
  </div><!----BODY-CONTENT1-END----->
  
  <div class="left form-margin"><br /><!----BODY-CONTENT2-START----->
    <h2>Checklists:</h2>
    <div class="box-header">
      <h4 class="left">Checklist Name</h4>
      <h4 class="right">Date Select</h4>
    </div>
    <div class="form2">
      <asp:Repeater ID="rptChecklist" runat="server" DataSourceID="odsChecklist"
            onitemcommand="rptChecklist_ItemCommand" 
            onitemdatabound="rptChecklist_ItemDataBound">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
              <td ><a href='<%# "~/ControlPanel/Kitchen/ChecklistQuestion.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&Date=" + DateTime.Today.ToShortDateString() %>' runat="server" id="hlReport"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
              <td ><ew:CalendarPopup ID="cldReport" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" /></td>
            </tr>
        </ItemTemplate>        
      </asp:Repeater>
      <asp:Repeater ID="rptOther" runat="server" DataSourceID="odsOther"
            onitemcommand="rptOther_ItemCommand" 
            onitemdatabound="rptOther_ItemDataBound">        
        <ItemTemplate>
            <tr>
              <td ><a href='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>' runat="server" id="hlReport"><%# DataBinder.Eval(Container.DataItem, "TableName") %></a></td>
              <td ><ew:CalendarPopup ID="cldReport" runat="server" AutoPostBack="True" CommandName="Calendar"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
      </asp:Repeater>
    </div>
  </div><!----BODY-CONTENT2-SEND----->
  
  <div class="left"><br /><!----BODY-CONTENT3-START----->
    <h2>LogiSafe ERP LTE Admin and Logs:</h2>
    <div class="box-header">
      <h4 class="left">Item Name</h4>
      <h4 class="right">Date Select</h4>
    </div>
    <div class="form2">
      <%--<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="90%"><a href="#">Cold Holding Log</a></td>
          <td width="8%"><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Cooling Temperature Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">End Point Temperature Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Freezer Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Hot Holding Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Receiving Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Refrigeration Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
        <tr>
          <td><a href="#">Shipping Log</a></td>
          <td><img src="images/ico-calander.png" width="16" height="16" /></td>
        </tr>
      </table>--%>
    </div>
  </div><!----BODY-CONTENT3-END-----> 
</div>
    <asp:Button ID="Button1" runat="server" Text="Upload Data" 
        onclick="Button1_Click" />
    <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
  <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
            PropertyName="Text" Type="DateTime" />
        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
 </asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
    <SelectParameters>                       
        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsOther" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetOtherReport" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
            PropertyName="Text" Type="DateTime" />
        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
 <asp:ObjectDataSource ID="odsWeekly" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Get" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label1" DefaultValue="02/08/2008" Name="dtStartDate"
            PropertyName="Text" Type="DateTime" />
        <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
</asp:Content>
