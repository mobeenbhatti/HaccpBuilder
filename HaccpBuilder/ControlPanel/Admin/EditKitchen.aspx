<%@ Page Language="C#" MasterPageFile="~/ControlPanel/AdminMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Admin_EditKitchen" Title="Admin Panel | Edit Kitchen" Codebehind="EditKitchen.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
     <div >
      <div class="MainHeading">
               EDIT KITCHEN
               <span style="font-size:10px; margin-left:390px;">
               <%--<asp:ImageButton ID="btnBack" runat="server" onclick="btnBack_Click"  ImageUrl="~/images/buttons/ButtonBackToMain.jpg" />--%>
                <a href="Default.aspx"><img src="../../images/buttons/ButtonBackToMain.jpg" alt="" /></a>            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >               
                <div style="margin-left:10px; margin-right:10px; margin-top:10px; font-family:Verdana; font-size:14px; font-weight:bold; color:Red;">
                    <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
                </div> 
                <div style="float:left; margin-left:15px;">
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" />
                </div>
                <asp:HiddenField ID="hfKitchenId" runat="server" />
                <asp:HiddenField ID="hfContactId" runat="server" />
                <asp:HiddenField ID="hfAddressId" runat="server" />
                <div class="Clearer"></div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Create Name of Kitchen:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtKitchenName" runat="server" Width="200px" 
                            CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rqvldKitchenName" runat="server" Display="None"  
                             ErrorMessage="The value in field Kitchen Name is required." ControlToValidate="txtKitchenName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>                    
                </div>               
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Kitchen Manager Name:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtManagerName" runat="server" Width="200px" 
                            CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rqvldManagerName" runat="server" Display="None" 
                             ErrorMessage="The value in field Manager is required." ControlToValidate="txtManagerName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>                    
                </div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Kitchen Manager Email:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtEmail" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" 
                             ErrorMessage="The value in field Contact Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"
                             InitialValue="Select Value"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
				Display="None" EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />"
				ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                    
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Address Line One:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtAddress1" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" 
                             ErrorMessage="The value in field Address1 is required." ControlToValidate="txtAddress1"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Address Line Two:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtAddress2" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">City:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtCity" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">State:</div>
                    <div class="DistrictSearchCol2">
                    <asp:DropDownList ID="ddlStateProvince" runat="server" DataSourceID="sqlDsStates"
                    DataTextField="Name" DataValueField="StateProvinceId" AppendDataBoundItems="true"
                    Width="200px" CssClass="DropDown">
                    <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                    </asp:DropDownList>
                     <asp:TextBox ID="txtState" runat="server" Visible="false" Width="200px" CssClass="TextBox1"></asp:TextBox>            
                    <asp:HiddenField ID="hfState" runat="server" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" Display="None" 
                             ErrorMessage="The value in field State Id is required." ControlToValidate="ddlStateProvince"  Font-Names="Verdana" Font-Size="10px"
                            ></asp:RequiredFieldValidator>   
                    <asp:RequiredFieldValidator ID="rfvState2" runat="server" ControlToValidate="txtState" Enabled="false"
			        	Display="None" ErrorMessage="Please enter a state/province.<br />"></asp:RequiredFieldValidator>                
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
                     <div class="DistrictSearchCol1">Zip Code:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtZipCode" MaxLength="6" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" 
                             ErrorMessage="The value in field Zip Code is required." ControlToValidate="txtZipCode"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
				Display="None" EnableClientScript="true" 
				ErrorMessage="Please enter valid Zip code." ValidationExpression="^(\d)+$"></asp:RegularExpressionValidator>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Main Phone Number:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtPhone" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None" 
                             ErrorMessage="The value in field Phone is required." ControlToValidate="txtPhone"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Alternative Phone Number:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtAltPhone" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>                   
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">FAX Number:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtFax" runat="server" Width="200px" CssClass="TextBox1"></asp:TextBox>
                    </div>                   
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1"><b>Send E-Alerts</b></div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbAlertsYes" runat="server" Text="Yes" GroupName="Alerts" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbAlertsNo" runat="server" Text="No" GroupName="Alerts" />
                    </div>                     
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1"><b>Alerts - On/Off Master</b></div>
                    <div class="DistrictSearchCol3">
                        <b>ON</b>
                    </div>
                    <div class="DistrictSearchCol3">
                        <b>OFF</b>
                    </div>                     
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Temperature Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbTemperatureLogOn" runat="server" GroupName="TemperatureLog" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbTemperatureLogOff" runat="server" GroupName="TemperatureLog" />
                    </div>                        
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Cold Holding Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbColdHoldingLogOn" runat="server" GroupName="ColdHoldingLog" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbColdHoldingLogOff" runat="server" GroupName="ColdHoldingLog" />
                    </div>                      
                </div>   
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Receiving Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbReceivingLogOn" runat="server" GroupName="ReceivingLog" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbReceivingLogOff" runat="server" GroupName="ReceivingLog" />
                    </div>                      
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Cooling Temperature Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbFreezerLogOn" runat="server" GroupName="FreezerLog" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbFreezerLogOff" runat="server" GroupName="FreezerLog" />
                    </div>                      
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Refrigeration Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbRefrigerationLogOn" runat="server" GroupName="RefrigerationLog" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbRefrigerationLogOff" runat="server" GroupName="RefrigerationLog" />
                    </div>                      
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Food Safety Checklist</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbFoodSafetyOn" runat="server" GroupName="FoodSafetChecklist" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbFoodSafetyOff" runat="server" GroupName="FoodSafetChecklist" />
                    </div>                      
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Thermometer Calibration</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbThermometerOn" runat="server" GroupName="Thermometer" />
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbThermometerOff" runat="server" GroupName="Thermometer"/>
                    </div>                      
                </div>
                <div class="SearchDiv1">
                     <div class="DistrictSearchCol1">Hot Holding Log</div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbHotHoldingLogOn" runat="server"  GroupName="HotHoldingLog"/>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:RadioButton ID="rdbHotHoldingLogOff" runat="server" GroupName="HotHoldingLog" />
                    </div>                      
                </div>                 
                <div class="Clearer"></div>  
                <asp:ObjectDataSource ID="odsStateProvince" runat="server" OldValuesParameterFormatString="original_{0}"
				SelectMethod="GetStateProvinceDropdown" TypeName="SchoolHaccp.BusinessLogic.ProcessStateProvince">
			</asp:ObjectDataSource> 
            <asp:SqlDataSource ID="dqlDsTimeZone" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspDS_GetTimeZones" SelectCommandType="StoredProcedure">       
            </asp:SqlDataSource>    
            <asp:SqlDataSource ID="sqlDsStates" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                SelectCommand="uspDS_GetStateProvinceByCountry" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCountry" DefaultValue="" 
                        Name="chCountryCode" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>                      
          </div>
         <div class="ContentRight" >                
                <div class="Clearer"></div>
                <div style="margin-left:10px; margin-right:10px; margin-top:10px;">
                    <asp:ImageButton ID="cmdSubmit" runat="server" 
                        ImageUrl="~/images/District Images/ButtonSubmitHere.jpg" 
                        onclick="cmdSubmit_Click" />
                        <asp:ImageButton ID="cmdEdit" runat="server" Visible="false" 
                        ImageUrl="~/images/buttons/ButtonUpdate.gif" onclick="cmdEdit_Click" />
                        <asp:ImageButton id="cmdCancel" runat="server" Visible="false" 
                        ImageUrl="~/images/buttons/ButtonCancel.gif" onclick="cmdCancel_Click" />
                </div>
           </div>
           </div>
</asp:Content>

