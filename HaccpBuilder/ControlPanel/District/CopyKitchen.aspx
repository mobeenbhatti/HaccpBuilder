<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CopyKitchen" Title="HACCP Builder | My Locations" Codebehind="CopyKitchen.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">

   
    <div id="titlediv"><!----HEADER-TITLE-START----->
      <div class="container">
        <div class="page-title">
          <h1>COPY A LOCATION</h1>
        </div>
      </div>
    </div>
<div class="container">
     <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
        <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" CssClass="msg-error" />
    </div>
    <div class="form3">
        <div class="left">
           <h2>{ INSTRUCTIONS }</h2>
               <br />
               <h1>Simply fill out the information for the location
                    you wish to create.  Once you have filled out the form please click 
                    "Click Here To Submit" below.</h1>
                 
             <br />
             <h1>Once you click submit, an email will be sent to the email address
                    that you provided in the Location Manager Email field.  The email
                    sent to that address will provide the recipient with their new
                    logins to log into their location to begin building their Location
                    HACCP plan and reporting.</h1>             
                <br />
                <h1><b>SPECIAL NOTE:</b> If you have groups of locations that are similar
                    we recommend you build master locations and then copy.</h1><br />

               <h1><b>EDIT AN EXISTING LOCATION:</b>  Please go back to the Control Panel and find the location 
                    that you want to edit.  Then click on the LOCATION NAME of the location you wish to edit.  
                    You will then be directed back to this page with the fields pre-populated and you can make 
                    your changes.  Once you have completed your changes, simply click on the CLICK HERE TO SUBMIT button.</h1>     
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="left">
        Find a location to copy: <asp:TextBox ID="txtKitchen" runat="server" Width="200px"></asp:TextBox>
        <asp:Button ID="cmdSearch" CausesValidation="false"  runat="server" Text="Search" onclick="cmdSearch_Click" CssClass="Button blue"/>
        </div>
        <div class="clear"></div>
    </div>               
    <div class="form4 left marginright">
    <h2><b>MASTER LOCATIONS:</b>  Please refer to user's guide to understand the value of creating
                    a master location.  Creating a master location can save your Corporation an incredible amount
                    of time.</h2>
    <h1 class="left h2margin-r">Create Name of Location:</h1>
    <div class="input left">
        <asp:TextBox ID="txtKitchenName" runat="server" Width="200px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqvldKitchenName" runat="server" Display="None"  ErrorMessage="The value in field Location Name is required." ControlToValidate="txtKitchenName"  Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtKitchenName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
				ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>  
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Location Manager Name:</h1>
    <div class="input left">
        <asp:TextBox ID="txtManagerName" runat="server" Width="200px" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="rqvldManagerName" runat="server" Display="None" 
          ErrorMessage="The value in field Manager is required." ControlToValidate="txtManagerName"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="REV_txtManagerName" runat="server" ControlToValidate="txtManagerName" Display="None" ErrorMessage="The value in field 'Location Manager Name' is not valid."
         Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Location Manager Email:</h1>
    <div class="input">
        <asp:TextBox ID="txtEmail" runat="server" Width="200px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" 
                             ErrorMessage="The value in field Contact Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                             InitialValue="Select Value"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Address Line One:</h1>
    <div class="input left">
       <asp:TextBox ID="txtAddress1" runat="server" Width="200px" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"  ErrorMessage="The value in field Address1 is required." ControlToValidate="txtAddress1"  Font-Names="Verdana" Font-Size="10px"
       ></asp:RequiredFieldValidator> 
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Address Line Two:</h1>
    <div class="input left">
        <asp:TextBox ID="txtAddress2" runat="server" Width="200px" ></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" 
          ErrorMessage="The value in field Manager is required." ControlToValidate="txtManagerName"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtManagerName" Display="None" ErrorMessage="The value in field 'Location Manager Name' is not valid."
         Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>   
     <h1 class="left h1margin-r">City:</h1>
    <div class="input left">
        <asp:TextBox ID="txtCity" runat="server" Width="200px" ></asp:TextBox>
        <asp:RegularExpressionValidator ID="REV_txtCity" runat="server" ControlToValidate="txtCity" Display="None" ErrorMessage="The value in field 'City' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
    </div>
  </div>
  <div class="form4 left">
    <h2 class="left h1margin-r">Country:</h2>
    <div class="input left">
        <asp:DropDownList ID="ddlCountry" runat="server" Width="200px" DataSourceID="sqlDsCountry" DataTextField="Name" DataValueField ="CountryRegionCode" AutoPostBack="true"
                          onselectedindexchanged="ddlCountry_SelectedIndexChanged" >                         			            
				            <%--<asp:ListItem Text="Canada" Value="CA" />
				            <asp:ListItem Text="United States" Value="US" />--%>
			            </asp:DropDownList>
    </div>
    <div class="clear"></div>
    <h1 class="left h2margin-r">State/Province:</h1>
    <div class="input left">
        <asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates" DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true" Width="200px" >
			    <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
		</asp:DropDownList>
    </div>
    <div class="input left">
        <asp:TextBox ID="txtState" runat="server" Visible="false" Width="200px" CssClass="TextBox1"></asp:TextBox>            
        <asp:HiddenField ID="hfState" runat="server" />
        <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="None"  ErrorMessage="The value in field State Id is required." ControlToValidate="ddlStateProvince"  Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
		Display="None" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator> 
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">TiimeZone:</h1>
    <div class="input left">
        <asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
			DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" >
			<asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
		</asp:DropDownList>
         <asp:RequiredFieldValidator ID="rfvTimeZone" runat="server" Display="None"  ErrorMessage="The value in field Time Zone is required." ControlToValidate="ddlTimeZone"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator> 
    </div>
    <div class="clear"></div>
    <h1 class="left h1margin-r">Zip Code:</h1>
    <div class="input left">
       <asp:TextBox ID="txtZipCode" MaxLength="10" runat="server" Width="200px" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None"   ErrorMessage="The value in field Zip Code is required." ControlToValidate="txtZipCode"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode"
        Display="None" ErrorMessage="Please enter valid Zip code."
        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <h1 class="left h2margin-r">Main Phone Number:</h1>
    <div class="input left">
        <asp:TextBox ID="txtPhone" runat="server" Width="200px" ></asp:TextBox>
    </div>
    <div class="clear"></div>
    <h1 class="left h2margin-r">Alternative Phone Number:</h1>
    <div class="input left">
        <asp:TextBox ID="txtAltPhone" runat="server" Width="200px" ></asp:TextBox>
    </div>
    <div class="clear"></div>
    <h1 class="left h2margin-r">FAX Number:</h1>
    <div class="input left">
        <asp:TextBox ID="txtFax" runat="server" Width="200px" ></asp:TextBox>
    </div>
   </div>
   <div class="clear tenpx"></div>
  <div class="form3">
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server" Text="Submit" onclick="cmdSubmit_Click" CssClass="Button" />
    </div>
    <div class="clear"></div>
  </div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Locations</h4>
    </div>
    <asp:GridView ID="grdKitchenDetails" runat="server" AutoGenerateColumns="False"  DataSourceID="ObjectDataSource1" CssClass="zebra"  AllowPaging="True"  PageSize="5">                
        <Columns>                    
                <asp:TemplateField HeaderText="Location Name" >
	                <ItemTemplate>
	                    <asp:HyperLink ID="hlKitchen" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/CopyKitchen.aspx?Name=" + DataBinder.Eval(Container.DataItem, "Kitchen") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                    </asp:HyperLink>
	                </ItemTemplate>	               
	            </asp:TemplateField >	                                        
	            <asp:BoundField DataField="Manager" HeaderText="Manager" >	
                </asp:BoundField>
                <asp:TemplateField HeaderText="User Name">
	                <ItemTemplate>
	                    <asp:HyperLink ID="hlUserName" runat="server"  NavigateUrl='<%#"~/ControlPanel/District/DistrictUsers.aspx?UserId=" + DataBinder.Eval(Container.DataItem, "ContactId")%>'
	                        Text='<%# DataBinder.Eval(Container.DataItem, "UserName")  %>'>
	                    </asp:HyperLink>
	                </ItemTemplate>	               
	            </asp:TemplateField >  	                             
        </Columns>
    </asp:GridView>
  </div>  
 </div>              
 <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
	SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
</asp:ObjectDataSource>
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetKitchenDetailsByDistrictId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenDetail">
                <SelectParameters>
                    <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
    <asp:SqlDataSource ID="sqlDsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetCountryRegion" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDsStates" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetStateProvinceByCountry" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCountry" DefaultValue="" 
                Name="chCountryCode" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dqlDsTimeZone" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspDS_GetTimeZones" SelectCommandType="StoredProcedure">       
    </asp:SqlDataSource> 
<asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="hfContactId" runat="server" />
    <asp:HiddenField ID="hfAddressId" runat="server" />
    <asp:HiddenField ID="hfUserId" runat="server" />
    <asp:HiddenField ID="hfPassword" runat="server" />     
    <asp:HiddenField ID="hfKitchenId" runat="server" />
    <asp:HiddenField ID="hfTemperatureLog" runat="server" />
    <asp:HiddenField ID="hfColdHoldingLog" runat="server" />
    <asp:HiddenField ID="hfHotHoldingLog" runat="server" />
    <asp:HiddenField ID="hfReceivingLog" runat="server" />
    <asp:HiddenField ID="hfFreezerLog" runat="server" />
    <asp:HiddenField ID="hfRefrigerationLog" runat="server" />
    <asp:HiddenField ID="hfFreezerNewLog" runat="server" />
    <asp:HiddenField ID="hfShippingLog" runat="server" />
    <asp:HiddenField ID="hffoodSafety" runat="server" />
    <asp:HiddenField ID="hfThemometer" runat="server" />
    <asp:HiddenField ID="hfCity" runat="server" />
    <asp:HiddenField ID="hfAlerts" runat="server" /> 
    <asp:HiddenField ID = "hfPhLog" runat="server" />
    <asp:HiddenField ID = "hfPestLog" runat="server" />
    <asp:HiddenField ID = "hfMaintenanceLog" runat="server" />
    <asp:HiddenField ID = "hfCleaningLog" runat="server" />
    <asp:HiddenField ID = "hfChecklist" runat="server" />
    <asp:HiddenField ID="hfTypeId" runat="server" />
</asp:Content>

