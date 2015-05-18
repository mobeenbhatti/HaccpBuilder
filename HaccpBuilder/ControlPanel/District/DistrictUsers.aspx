<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_DistrictUsers" Title="HACCP Builder | District Users" Codebehind="DistrictUsers.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
        <script language="javascript" type="text/javascript" src="../../JScript/overlibmws.js"></script>
    <script language="javascript" type="text/javascript">
function MoveBack()
{
window.location = "DistrictControl.aspx";
}
function ValidatorsEnabled(state)
{

   document.getElementById('<%=rqVldName.ClientID%>').disable = state;
    document.getElementById('<%=rqVldPassword.ClientID%>').disable = state;
    document.getElementById('<%=RegularExpressionValidator7.ClientID%>').disable = state;
    document.getElementById('<%=REV_txtUserEdit.ClientID%>').disable = state;
  
         

}
</script>
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>MANAGE USERS</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
    <div class="ph-top"></div>
     <div class="form3">
    <div class="left">
      <label>Search By User Name</label>
      <div class="input">
       <asp:TextBox ID="txtUserName" runat="server" Width="200px" ></asp:TextBox>
       <asp:Button ID="cmdSearchByUserName" Text="Search" CssClass="Button"  runat="server"   onclick="cmdSearchByUserName_Click" />
      </div>
    </div>
        <div class="left" style="margin:25px 0 0 10px; width:20px; height:20px">
          <h1></h1>
        </div>
        <div class="left margin-lr">
          <label>Search By Email Address</label>
          <div class="input">
            <asp:TextBox ID="txtEmailAddress" runat="server" Width="200px"></asp:TextBox>
            <asp:Button ID="cmdSearchByEmail"  runat="server" Text="Search" onclick="cmdSearchByEmail_Click" CssClass="Button"/>
          </div>
        </div>    
    <div class="clear"></div>
  </div>  
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
    <asp:UpdatePanel ID="updUser" runat="server">
    <ContentTemplate>
         <div class="ph-top">
            <asp:Label ID="lblError" Text="" CssClass="msg-error" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="List" runat="server" CssClass="msg-error" />
            <asp:RequiredFieldValidator ID="rqVldName" runat="server" Display="None" ErrorMessage="The value in field User Name is required." ControlToValidate="txtUserEdit"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rqVldPassword" runat="server" Display="None"  ErrorMessage="The value in field Password is required." ControlToValidate="txtPasswordEdit"></asp:RequiredFieldValidator>
            <%--<asp:RequiredFieldValidator ID="rqVldEmail" runat="server" Display="None" ErrorMessage="The value in field Email Address is required." ControlToValidate="txtEmailAddressEdit"></asp:RequiredFieldValidator>--%>
        </div>
        <div class="form3">        
        <h2 class="left h2margin-r">Add/Edit a User :</h2>
        <div class="clear"></div>        
        <asp:HiddenField ID="hfContactId" runat="server" />
        <h1 class="left">Note: Select User Name from the list below:</h1>
        <div class="clear"></div>
        <h1 class="left h1margin-r">Select Location:</h1>
        <div class="input left">
        <asp:DropDownList ID="ddlKitchenEdit" Width="200px" runat="server"  DataSourceID="ObjectDataSource1" DataTextField="Name"  DataValueField="KitchenId" AutoPostBack="true" 
         onselectedindexchanged="ddlKitchenEdit_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div class="clear"></div>
        <h1 class="left h1margin-r">User Name:</h1>
        <div class="input left">
        <asp:TextBox ID="txtUserEdit" runat="server" MaxLength="40" Width="200px" ></asp:TextBox>
      
          <asp:RegularExpressionValidator ID="REV_txtUserEdit" runat="server" ControlToValidate="txtUserEdit" Text="*"
			EnableClientScript="true" ErrorMessage="Please enter a valid user name.<br />" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
            
             </div>
        <div class="clear"></div>
        <h1 class="left h1margin-r">Password:</h1>
        <div class="input left">
        <asp:TextBox ID="txtPasswordEdit" runat="server" Width="200px" ></asp:TextBox>
              <img id="Img_passwordhelp" style="vertical-align: middle" alt="" runat="server"
                            src="~/App_Themes/Control/images/board_help.gif" />
              <asp:HiddenField runat="server" ID="hfPassword" />
                 <asp:HiddenField runat="server" ID="hfpasswordSalt" />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPasswordEdit"
                             EnableClientScript="true" Text="Please Enter a valid password." ErrorMessage="Please enter a valid password.<br />"
                            display="Dynamic" ValidationExpression="(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
        </div>
      <%--  <div class="clear"></div>
        <h1 class="left h1margin-r">Email Address:</h1>
        <div class="input left">
        <asp:TextBox ID="txtEmailAddressEdit" runat="server" Width="200px"  ></asp:TextBox>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmailAddressEdit"  Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>--%>
        <div class="clear"></div>
        <asp:Button ID="cmdSubmit" Text="Submit" CssClass="Button Blue"  OnClick="cmdSubmit_Click" runat="server" />
  </div>    
     </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true" AssociatedUpdatePanelID="updUser" >
     <ProgressTemplate>                     
     <div id="progress">
         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
     </div>                    
     </ProgressTemplate>
     </asp:UpdateProgress>

   <div class="table">
    <div class="box-header">
      <h4 class="left">Locations</h4>
    </div>
  <asp:GridView ID="grdUser" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" CssClass="zebra">                
        <Columns>                    
                <asp:BoundField DataField="Kitchen" HeaderText="Location Name" />
	            <asp:TemplateField HeaderText="User Name">
	                <ItemTemplate>
	                    <asp:HyperLink ID="hlUser" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId") %>' Text='<%# DataBinder.Eval(Container.DataItem, "UserId")  %>'>
	                    </asp:HyperLink>
	                </ItemTemplate>	                        
	            </asp:TemplateField >	                                 
	           <%-- <asp:BoundField DataField="Password" HeaderText="Password"  />--%>	                    
	            <asp:BoundField DataField="Phone" HeaderText="Phone" />                    
	            <asp:TemplateField HeaderText="Login Level">
	                <ItemTemplate>
	                    <asp:Label ID="lblRole" Text='<%# DataBinder.Eval(Container.DataItem, "RoleName").ToString() == "KitchenAdmin"? "Location Admin" : "Corporate Admin" %>' runat="server" ></asp:Label>                        
	                </ItemTemplate>	                      
	            </asp:TemplateField >		                        
        </Columns>
    </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetContactsByDistrictId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetContact">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="grdSearchKitchen" runat="server" AutoGenerateColumns="False" CssClass="zebra" >                
                <Columns>                    
                        <asp:BoundField DataField="Kitchen" HeaderText="Location Name" />
	                    <asp:TemplateField HeaderText="User Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlUser" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId") %>' Text='<%# DataBinder.Eval(Container.DataItem, "UserId")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>	                        
	                    </asp:TemplateField >	                                 
	                    <asp:BoundField DataField="Password" HeaderText="Password"/>	                    
	                    <asp:BoundField DataField="Phone" HeaderText="Phone"  />                    
	                    <asp:BoundField DataField="RoleName" HeaderText="Login Level"  />	                    
                         	                   
                </Columns>
            </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
            OldValuesParameterFormatString="original_{0}" 
            SelectMethod="Getroles" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetContact">            
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"  OldValuesParameterFormatString="original_{0}"  SelectMethod="GetKitchenByDistrictId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>


    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
     
    </div>
    
</asp:Content>

