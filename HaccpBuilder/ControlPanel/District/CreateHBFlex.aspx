<%@ Page Language="C#" MasterPageFile="~/ControlPanel/TestMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CreateHBFlex" Title="HACCP Builder | Edit Location" Codebehind="CreateHBFlex.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
 <div class="bdy_contents">
<div class="grey_bg">
             <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

            <table width="690" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                        <tr>
                          <td height="165" valign="top"><table width="690" border="0" cellspacing="5">
                            <tr>
                              <td class="red_heading">{ CREATE/EDIT A LOCATION  }</td>
                            </tr>
                            <tr>
                              <td><uc1:districtaddrssnew ID="DistrictAddrssNew1" runat="server" /> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="54" background="../../images/District Images/bg_btns_strip.gif"><table width="690" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" width="10" height="12" /></td>
                        </tr>
                        <tr>
                          <td><table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"><asp:HyperLink ID="hlGotoMain" runat="server" Width="180" Height="30" ImageUrl="~/images/District Images/ButtonGoToMain.png" NavigateUrl="~/ControlPanel/District/LayoutTest.aspx"></asp:HyperLink></td>
                              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td width="180"></td>
                              <td width="300" align="left"><img src="../../images/District Images/spacer.gif" width="10" height="10" /></td>
                              <td></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" /></td>
                        </tr>
                      </table></td>
              </tr>
                  </table>
   		  </div>
    <div class="buttons_bg"></div>   
     <asp:HiddenField ID="hfKitchenId" runat="server" />
    <asp:HiddenField ID="hfContactId" runat="server" />
    <asp:HiddenField ID="hfAddressId" runat="server" />
    <asp:HiddenField ID="hfUserId" runat="server" />
    <asp:HiddenField ID="hfPassword" runat="server" /> 
     <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
     <ContentTemplate>
	<div class="log_form_left">
	<table  border="0" cellspacing="0" cellpadding="0" width="540" class="table_form_view"> 
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>  
                <tr>
                   <td class="red_heading" > 
                   <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
                   <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" /></td>                  
                   <td> </td>
                   <td></td>
                </tr>
                <tr>
                   <td colspan="3" padding="10"><b>MASTER LOCATIONS:</b>  Please refer to user's guide to understand the value of creating
                    a master location.  Creating a master location can save your Corporation an incredible amount
                    of time.</td> 
                </tr> 
                <tr>
                   <td padding="10">&nbsp;</td>                  
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
                </tr>                    
                <tr>
                  <td >Create Name of Location:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  >  <asp:TextBox ID="txtKitchenName" runat="server" Width="200px" ></asp:TextBox></td>
                </tr>
                 <asp:RequiredFieldValidator ID="rqvldKitchenName" runat="server" Display="None"  
                             ErrorMessage="The value in field Location Name is required." ControlToValidate="txtKitchenName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="revNumberOfKitchens" runat="server" ControlToValidate="txtKitchenName"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)."
				ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>   
                <tr>                 
                  <td >Location Manager Name:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtManagerName" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:RequiredFieldValidator ID="rqvldManagerName" runat="server" Display="None" 
                             ErrorMessage="The value in field Manager is required." ControlToValidate="txtManagerName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                <tr>                 
                  <td >Location Manager Email:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtEmail" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" 
                             ErrorMessage="The value in field Contact Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                             InitialValue="Select Value"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
                <tr>                 
                  <td >Address Line One:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAddress1" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" 
                             ErrorMessage="The value in field Address1 is required." ControlToValidate="txtAddress1"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator> 
                <tr>                 
                  <td >Address Line Two:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAddress2" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >City:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtCity" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >Country:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlCountry" runat="server" Width="200px" DataSourceID="sqlDsCountry" DataTextField="Name" DataValueField ="CountryRegionCode"
                          CssClass="DropDown" AutoPostBack="true"
                          onselectedindexchanged="ddlCountry_SelectedIndexChanged" >                         			            
				            <%--<asp:ListItem Text="Canada" Value="CA" />
				            <asp:ListItem Text="United States" Value="US" />--%>
			            </asp:DropDownList>
                 </td>                
                </tr>
                <tr>                 
                  <td >State:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates"
				            DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			            </asp:DropDownList>
                     <asp:TextBox ID="txtState" runat="server" Visible="false" Width="200px" CssClass="TextBox1"></asp:TextBox>            
                    <asp:HiddenField ID="hfState" runat="server" />
                 </td>                
                </tr>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="None" 
                             ErrorMessage="The value in field State Id is required." ControlToValidate="ddlStateProvince"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator> 
                 <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
				Display="None" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator> 
                 <tr>                 
                  <td >TiimeZone:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlTimeZone" runat="server" DataSourceID="dqlDsTimeZone"
				            DataTextField="DisplayName" DataValueField="Name" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
			            </asp:DropDownList>
                 </td>                
                </tr>    
                <asp:RequiredFieldValidator ID="rfvTimeZone" runat="server" Display="None" 
                             ErrorMessage="The value in field Time Zone is required." ControlToValidate="ddlTimeZone"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator> 
                <tr>                 
                  <td >Zip Code:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtZipCode" runat="server" Width="200px" MaxLength="10" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" 
                             ErrorMessage="The value in field Zip Code is required." ControlToValidate="txtZipCode"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
				Display="None" EnableClientScript="true" 
				ErrorMessage="Please enter valid Zip code." ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>   
                <tr>                 
                  <td >Main Phone Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtPhone" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >Alternative Phone Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtAltPhone" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                <tr>                 
                  <td >FAX Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtFax" runat="server" Width="200px" ></asp:TextBox>
                 </td>                
                </tr>
                 <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
			</asp:ObjectDataSource>
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <!-- Logs -->
                
                <tr><td colspan="3">&nbsp;</td>                  
                </tr> 
                <tr>
                <td colspan="3"><asp:ImageButton ID="cmdSubmit" runat="server" 
                        ImageUrl="~/images/District Images/ButtonSubmitNew.png" 
                        onclick="cmdSubmit_Click" />
                        <asp:ImageButton ID="cmdEdit" runat="server" Visible="false" 
                        ImageUrl="~/images/District Images/ButtonUpdate.png" onclick="cmdEdit_Click" />
                        <asp:ImageButton id="cmdCancel" runat="server" Visible="false" 
                        ImageUrl="~/images/District Images/ButtonCancel.png" onclick="cmdCancel_Click" /></td>              
                                 
                </tr>               
              </table>
	</div>
	<div class="content_right">
	 <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td><table width="368" border="0" cellspacing="0" cellpadding="0" padding="5px">
                <tr align="right">
                  <td colspan="3" align="left" class="red_heading"><img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{ INSTRUCTIONS }</td>
                </tr>
                <tr>
                  <td align="left" class="red_heading"></td>                  
                </tr>
                <tr>
                  <td align="left">Simply fill out the information for the location
                    you wish to create.  Once you have filled out the form please click 
                    "Click Here To Submit" below.</td>
                 
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>                  
                </tr>
                <tr>
                  <td align="left"> Once you click submit, an email will be sent to the email address
                    that you provided in the Location Manager Email field.  The email
                    sent to that address will provide the recipient with their new
                    logins to log into their location to begin building their Location
                    HACCP plan and reporting.</td>                  
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>                  
                </tr>
                <tr>
                  <td align="left"><b>SPECIAL NOTE:</b> If you have groups of locations that are similar
                    we recommend you build master locations and then copy.</td>                  
                </tr>
                <tr>
                  <td align="left">&nbsp;</td>                 
                </tr>
                <tr>
                  <td align="left"><b>EDIT AN EXISTING LOCATION:</b>  Please go back to the Control Panel and find the location 
                    that you want to edit.  Then click on the LOCATION NAME of the location you wish to edit.  
                    You will then be directed back to this page with the fields pre-populated and you can make 
                    your changes.  Once you have completed your changes, simply click on the CLICK HERE TO SUBMIT button.</td>
                  
                </tr>               
                <tr>
                  <td align="left">&nbsp;</td>                  
                </tr>               
                  <td align="right">&nbsp;</td>                  
                </tr>
              </table></td>
            </tr>
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
          </table>
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
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetKitchenByDistrictId" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
  <asp:HiddenField ID="HiddenField1" runat="server" />	    
    <div style="clear:both;"></div>    
</div>
</asp:Content>

