﻿<%@ Page Language="C#" MasterPageFile="~/ControlPanel/AdminMaster.master" AutoEventWireup="true" Inherits="ControlPanel_Admin_CreateHBFlex" Title="Admin Panel | Create HBFlex Kitchen" Codebehind="CreateHBFlex.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">
     <script language="javascript" type="text/javascript" src="../../JScript/overlibmws.js"></script>
    <div>
        <div class="MainHeading">
            Create HBFlex Corporate Level <span style="font-size: 10px; margin-left: 340px;"><a
                href="Default.aspx">
                <img src="../../images/buttons/ButtonBackToMain.jpg" alt="" /></a>
                <%--<asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />--%>
            </span>
        </div>
    </div>
   <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

     <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
     <ContentTemplate>
    <div>
        <div class="ContentLeft">
            <div style="margin-left: 10px; margin-right: 10px; margin-top: 10px; width: 500px;">
                <b>MASTER Districts:</b> Please refer to user's guide to understand the value of
                creating a master District. Creating a master District can save your District an
                incredible amount of time.
            </div>
            <div style="margin-left: 10px; margin-right: 10px; margin-top: 10px; font-family: Verdana;
                font-size: 14px; font-weight: bold; color: Red;">
                <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
            </div>
            <div style="float: left; margin-left: 15px;">
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" />
            </div>
            <asp:HiddenField ID="hfDistrictId" runat="server" />
            <asp:HiddenField ID="hfContactId" runat="server" />
            <asp:HiddenField ID="hfAddressId" runat="server" />
            <div class="Clearer">
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Create Name of District:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtDistrictName" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rqvldDistrictName" runat="server" Display="None"
                    ErrorMessage="The value in field District Name is required." ControlToValidate="txtDistrictName"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtDistrictName"
                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\' ]{1,100}$"></asp:RegularExpressionValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    District Contact Person:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtManagerName" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="rqvldManagerName" runat="server" Display="None" ErrorMessage="The value in field Manager is required."
                    ControlToValidate="txtManagerName" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="REV_txtManagerName" runat="server" ControlToValidate="txtManagerName"
                        Display="None" ErrorMessage="The value in field 'District Contact Person' is not valid."
                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Contact Person Email:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                    ErrorMessage="The value in field Contact Email is required." ControlToValidate="txtEmail"
                    Font-Names="Verdana" Font-Size="10px" InitialValue="Select Value"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Number Of Kitchens:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtKitchenNumber" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtKitchenNumber"
                        Font-Names="Verdana" Font-Size="10px" Display="None" EnableClientScript="true"
                        ErrorMessage="Please enter a valid integer." ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtKitchenNumber"
                        Display="None" MaximumValue="99" MinimumValue="0" Type="Integer" ErrorMessage="Please enter value in range 1-99."></asp:RangeValidator>
                </div>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtKitchenNumber"
                    Font-Names="Verdana" Font-Size="10px" Display="None" EnableClientScript="true"
                    ErrorMessage="Please enter a valid value in  'Number Of Locations' field." ValidationExpression="(\d)+"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                    ErrorMessage="The value in field Number Of Kitchens is required." ControlToValidate="txtKitchenNumber"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    City:</div>
                <div class="DistrictSearchCol2">
               
                    <asp:TextBox ID="txtCity" runat="server" Width="200px" MaxLength="40" CssClass="TextBox1"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCity"
                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid city name."
                    ValidationExpression="^[a-zA-Z0-9'.\s\,\.\' ]{1,40}$"></asp:RegularExpressionValidator>
               </div>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Country:</div>
                <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlCountry" runat="server" Width="200px" DataSourceID="sqlDsCountry" DataTextField="Name" DataValueField ="CountryRegionCode"
                          CssClass="DropDown" AutoPostBack="true"
                          onselectedindexchanged="ddlCountry_SelectedIndexChanged" >                         			            
				            <%--<asp:ListItem Text="Canada" Value="CA" />
				            <asp:ListItem Text="United States" Value="US" />--%>
			            </asp:DropDownList>
                </div>                
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    State/Province:</div>
                <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates"
				            DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			            </asp:DropDownList>
                     <asp:TextBox ID="txtState" runat="server" Visible="false" Width="200px" CssClass="TextBox1"></asp:TextBox>            
                    <asp:HiddenField ID="hfState" runat="server" />
                </div>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="None"
                    ErrorMessage="The value in field State Id is required." ControlToValidate="ddlStateProvince"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
				Display="None" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator> 
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Zip Code:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtZipCode" MaxLength="10" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None"
                    ErrorMessage="The value in field Zip Code is required." ControlToValidate="txtZipCode"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode"
                    Font-Names="Verdana" Font-Size="10px" Display="None" EnableClientScript="true"
                   ErrorMessage="Please enter valid Zip code." ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                TiimeZone:</div>
                <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				        DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				        CssClass="DropDown" >
				        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			        </asp:DropDownList>
                 </div>   
                <asp:RequiredFieldValidator ID="rfvTimeZone" runat="server" Display="None" 
                    ErrorMessage="The value in field Time Zone is required." ControlToValidate="ddlTimeZone"  Font-Names="Verdana" Font-Size="10px">
                </asp:RequiredFieldValidator> 
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Assign/Edit User Name:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtUser" runat="server" Width="200px" MaxLength="40" CssClass="TextBox1"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
                    ErrorMessage="The value in field User ID is required." ControlToValidate="txtUser"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="REV_txtUser" runat="server" ControlToValidate="txtUser"
                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid user name.<br />"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    Assign/Edit Password:</div>
                <div class="DistrictSearchCol2">
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                     <img id="Img_passwordhelp" style="vertical-align: middle" alt="" runat="server"
                        src="~/App_Themes/Control/images/board_help.gif" />
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="None"
                    ErrorMessage="The value in field Password is required." ControlToValidate="txtPassword"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPassword"
                    Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid password.<br />"
                    ValidationExpression="(?=^.{8,}$)(?=.*\d)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
            </div>
            <%--<div class="SearchDiv1">
                     <div class="DistrictSearchCol1">District Type:</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlDistrictType" runat="server" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="0" />
			                <asp:ListItem Value="1">Paid</asp:ListItem>
                            <asp:ListItem Value="2">Free Trial</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
			            </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="None" 
                             ErrorMessage="The value in field District Type is required." ControlToValidate="ddlDistrictType"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator>   
                    </div>  --%>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    District Print Capability</div>
                <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlDistrictPrint" runat="server" AppendDataBoundItems="true"
                        Width="200px" CssClass="DropDown">
                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="None"
                    ErrorMessage="The value in field Printing Capability is required." ControlToValidate="ddlDistrictPrint"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    District Status</div>
                <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="true" Width="200px"
                        CssClass="DropDown">
                        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                        <asp:ListItem Value="1">Active</asp:ListItem>
                        <asp:ListItem Value="0">Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="None"
                    ErrorMessage="The value in field District Status is required." ControlToValidate="ddlDistrictPrint"
                    Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
            </div>
            <div class="SearchDiv1">
                <div class="DistrictSearchCol1">
                    <b>Reports</b></div>
                <div class="DistrictSearchCol3">
                    <asp:RadioButton ID="rdbReportsYes" runat="server" Text="Yes" GroupName="Reports" />
                </div>
                <div class="DistrictSearchCol3">
                    <asp:RadioButton ID="rdbReportsNo" runat="server" Text="No" GroupName="Reports" />
                </div>
            </div>
            <div class="Clearer">
            </div>
            <%--<div style="margin-left:10px; margin-right:10px; margin-top:10px;">
                    <asp:ImageButton ID="cmdSubmit" runat="server" 
                        ImageUrl="~/images/District Images/ButtonSubmitHere.jpg" 
                        onclick="cmdSubmit_Click" />                        
                </div>--%>
        </div>
        <div class="ContentRight">
            <div class="Clearer">
            </div>
            <div style="margin-left: 10px; margin-right: 10px; margin-top: 10px; width: 400px;">
                <b>INSTRUCTIONS:</b> Simply fill out the information for the District you wish to
                create. Once you have filled out the form please click "Click Here To Submit" below.
            </div>
            <div class="Clearer">
            </div>
            <div style="margin-left: 10px; margin-right: 10px; margin-top: 10px;">
                <asp:ImageButton ID="cmdSubmit" runat="server" ImageUrl="~/images/District Images/ButtonSubmitHere.jpg"
                    OnClick="cmdSubmit_Click" />
                <asp:ImageButton ID="cmdEdit" runat="server" Visible="false" ImageUrl="~/images/buttons/ButtonUpdate.gif"
                    OnClick="cmdEdit_Click" />
                <asp:ImageButton ID="cmdCancel" runat="server" Visible="false" ImageUrl="~/images/buttons/ButtonCancel.gif"
                    OnClick="cmdCancel_Click" />
            </div>
        </div>
        <div class="Clearer">
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
        </div>
        <div class="ViewPlanClearer">
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true" AssociatedUpdatePanelID="UpdatePanel1" >
     <ProgressTemplate>                     
     <div id="progress">
         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
     </div>                    
     </ProgressTemplate>
     </asp:UpdateProgress>
</asp:Content>
