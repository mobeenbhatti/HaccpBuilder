<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Location_Customers" Title="HACCP Builder | Customer" Codebehind="Customers.aspx.cs" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Register assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI.Compatibility" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function CheckTraining(val) {

        //   var txtCorreectiveControl = document.getElementById('<%=txtCorrectiveAction.ClientID%>');
        //   var txtTrainingControl = document.getElementById('<%=txtTraining.ClientID%>');
        //   var vldCorrectiveControl = document.getElementById('<%=reqValidateCorrectiveAction.ClientID%>');
        //   var vldTrainingControl = document.getElementById('<%=reqValidateTraining.ClientID%>');
        var txtCorreectiveControl = document.getElementById('PlaceHolder_txtCorrectiveAction');
        var txtTrainingControl = document.getElementById('PlaceHolder_txtTraining');
        var vldCorrectiveControl = document.getElementById('PlaceHolder_reqValidateCorrectiveAction');
        var vldTrainingControl = document.getElementById('PlaceHolder_reqValidateTraining');


        if (val == 1) {
            txtCorreectiveControl.disabled = true;
            ValidatorEnable(vldCorrectiveControl, false);
            //vldCorrectiveControl.disabled = true;
            txtTrainingControl.disabled = false;
            ValidatorEnable(vldTrainingControl, true);
            //vldTrainingControl.disabled = false;

        }
        else {
            txtCorreectiveControl.disabled = false;
            // vldCorrectiveControl.disabled = false;
            ValidatorEnable(vldCorrectiveControl, true);
            txtTrainingControl.disabled = true;
            ValidatorEnable(vldTrainingControl, false);
            // vldTrainingControl.disabled = true;

        }
    }
    function SetValidator(status) {

        var vldNameControl = document.getElementById('PlaceHolder_RequiredFieldValidator1');
        var vldContactControl = document.getElementById('PlaceHolder_RequiredFieldValidator2');
        var vldPhoneControl = document.getElementById('PlaceHolder_RequiredFieldValidator3');
        var vldVerifiedControl = document.getElementById('PlaceHolder_RequiredFieldValidator4');
        var vldCorrectiveControl = document.getElementById('PlaceHolder_reqValidateCorrectiveAction');
        var vldTrainingControl = document.getElementById('PlaceHolder_reqValidateTraining');
        var rdbTrainingYes = document.getElementById('PlaceHolder_rdbYes');
        var rdbTrainingYes = document.getElementById('PlaceHolder_rdbYes');
        var CV_cldVerifyDate = document.getElementById('PlaceHolder_CV_cldVerifyDate');

        var REV_txtCompanyName = document.getElementById('PlaceHolder_REV_txtCompanyName');
        var REV_txtContactName = document.getElementById('PlaceHolder_REV_txtContactName');
        var REV_txtVerifiedBy = document.getElementById('PlaceHolder_REV_txtVerifiedBy');

        if (status == 1) {
            ValidatorEnable(vldNameControl, true);
            ValidatorEnable(vldContactControl, true);
            ValidatorEnable(vldPhoneControl, true);
            ValidatorEnable(vldVerifiedControl, true);
            ValidatorEnable(CV_cldVerifyDate, true);
            ValidatorEnable(REV_txtCompanyName, true);
            ValidatorEnable(REV_txtContactName, true);
            ValidatorEnable(REV_txtVerifiedBy, true);
            if (rdbTrainingYes.checked == true) {
                ValidatorEnable(vldCorrectiveControl, false);
                ValidatorEnable(vldTrainingControl, true);
            }
            else {
                ValidatorEnable(vldCorrectiveControl, true);
                ValidatorEnable(vldTrainingControl, false);
            }
        }
        else {
            ValidatorEnable(vldNameControl, false);
            ValidatorEnable(vldContactControl, false);
            ValidatorEnable(vldPhoneControl, false);
            ValidatorEnable(vldVerifiedControl, false);
            ValidatorEnable(vldCorrectiveControl, false);
            ValidatorEnable(vldTrainingControl, false);
            ValidatorEnable(CV_cldVerifyDate, false);
            ValidatorEnable(REV_txtCompanyName, false);
            ValidatorEnable(REV_txtContactName, false);
            ValidatorEnable(REV_txtVerifiedBy, false);
        }
    }
    function VaidationDisable() {

        var vldNameControl = document.getElementById('PlaceHolder_RequiredFieldValidator1');
        var vldContactControl = document.getElementById('PlaceHolder_RequiredFieldValidator2');
        var vldPhoneControl = document.getElementById('PlaceHolder_RequiredFieldValidator3');
        var vldVerifiedControl = document.getElementById('PlaceHolder_RequiredFieldValidator4');
        var vldCorrectiveControl = document.getElementById('PlaceHolder_reqValidateCorrectiveAction');
        var vldTrainingControl = document.getElementById('PlaceHolder_reqValidateTraining');
        var CV_cldVerifyDate = document.getElementById('PlaceHolder_CV_cldVerifyDate');
        var REV_txtCompanyName = document.getElementById('PlaceHolder_REV_txtCompanyName');
        var REV_txtContactName = document.getElementById('PlaceHolder_REV_txtContactName');
        var REV_txtVerifiedBy = document.getElementById('PlaceHolder_REV_txtVerifiedBy');

        ValidatorEnable(vldNameControl, false);
        ValidatorEnable(vldContactControl, false);
        ValidatorEnable(vldPhoneControl, false);
        ValidatorEnable(vldVerifiedControl, false);
        ValidatorEnable(vldCorrectiveControl, false);
        ValidatorEnable(vldTrainingControl, false);
        ValidatorEnable(CV_cldVerifyDate, false);
        ValidatorEnable(REV_txtCompanyName, false);
        ValidatorEnable(REV_txtContactName, false);
        ValidatorEnable(REV_txtVerifiedBy, false);
    }
</script>
    <div class="bdy_contents">
    <div class="log_form_left">
    <div class="grey_bg_left">
	    <table  border="0" cellspacing="0" cellpadding="0">
                <tr>
                 <td class="red_heading">{ CUSTOMERS IDENTIFICATION }</td>                                  
                </tr>
                <tr><td >&nbsp;</td></tr> 
                 <tr>
                  <td ><asp:HyperLink ImageUrl="~/images/buttons/ButtonBackToProduct.png"  Height="30"
                                  NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" runat="server" ID="HyperLink2"></asp:HyperLink></td>                                  
                </tr>                            
         </table>
	</div>		
    <div class="discp_left_bg">
	    <table  border="0" cellspacing="0" cellpadding="1">
                <tr>
                  <td align="center" >Customer Name:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  > <asp:TextBox ID="txtSearch" runat="server" CssClass="log_textbox"></asp:TextBox></td>
                   <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <asp:ImageButton ID="cmdSearch"  runat="server"  ImageUrl="~/images/District Images/ButtonGo.png"
                        OnClientClick="SetValidator(0)" onclick="cmdSearch_Click" ImageAlign="AbsMiddle" /></td>                 
                </tr>                            
              </table>
	</div>
	<div class="grid_left">	  
    <asp:GridView ID="grdHotHolding" runat="server" SkinID="gridviewSkin" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Customer Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Customers.aspx?Id=" + DataBinder.Eval(Container.DataItem, "CustomerID") %>' Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName")  %>'></asp:HyperLink>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>                    
                </Columns>
            </asp:GridView>    
    <asp:GridView ID="grdSearch" runat="server" SkinID="gridviewSkin" AutoGenerateColumns="False" 
                   AllowPaging="True" Visible="false"  >                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Customer Name">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Customers.aspx?Id=" + DataBinder.Eval(Container.DataItem, "CustomerID") %>' Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName")  %>'></asp:HyperLink>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblContact" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>                    
                </Columns>
            </asp:GridView> 
    </div>
	</div> 
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
    <div class="content_right">
    <div class="grey_bg_right">
    <table  border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td>&nbsp;</td>
            </tr>
            <tr>
              <td style="font-size:small;" width="138" >Upload Customers from file: </td> 
              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
              <td width="220"><asp:FileUpload ID="File1" runat="server" /></td>                                 
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
            <td >
            <asp:Button ID="cmdGetFormat" runat="server" Text="Get Upload Format" OnClientClick="SetValidator(0)" Width="150px"
                  onclick="cmdGetFormat_Click" />
            <asp:Button ID="cmdUpload" Text="Upload" runat="server" 
            OnClientClick="SetValidator(0)" onclick="cmdUpload_Click" /></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>                                       
    </table>
    </div>
    <div class="log_right_view">
          <table width="390" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td><table width="368" border="0" cellspacing="0" cellpadding="0">
                <tr style="font-size:small;">
                  <td colspan="3" align="left" class="red_heading"><img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{ Add/Edit Customer }</td>
                </tr>
                <tr>
                <td colspan="3" class="red_heading">
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" />
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                  <asp:HyperLink ID="hlDownLoadInvalidCustomers" Visible="false" NavigateUrl="~/ControlPanel/Kitchen/Data/csvInValidVendors.csv" runat="server">Click Here</asp:HyperLink>
                </td>
                </tr>
                <tr>
                  <td width="163" style="font-size:small;">Entry Date:</td>
                  <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td width="200"><asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox" ></asp:TextBox></td>
                </tr>
                <tr>
                  <td style="font-size:small;">Customer Name:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtCompanyName" runat="server" CssClass="log_textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="false" runat="server" Display="None" 
                             ErrorMessage="The value in field Customer Name is required" ControlToValidate="txtCompanyName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="REV_txtCompanyName" Enabled="false" runat="server" ControlToValidate="txtCompanyName"
                                        Display="None" ErrorMessage="The value in field 'Customer Name' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>

                  </td>
                </tr>
                <tr>
                  <td style="font-size:small;">Customer Contact Name</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtContactName" runat="server" CssClass="log_textbox" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="false" runat="server" Display="None" 
                             ErrorMessage="The value in field Customer Contact Name is required" ControlToValidate="txtContactName"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="REV_txtContactName" Enabled="false" runat="server" ControlToValidate="txtContactName"
                                        Display="None" ErrorMessage="The value in field 'Customer Contact Name' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                             
                             </td>
                </tr>
                <tr>
                  <td style="font-size:small;">Customer Phone Number:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtPhone" runat="server"  CssClass="log_textbox" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Enabled="false" runat="server" Display="None" 
                             ErrorMessage="The value in field Customer Phone Number is required" ControlToValidate="txtPhone"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>

                  </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr>
                  <td style="font-size:small;">Does Customer have Training and Certifications in Place:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:RadioButton ID="rdbYes" Text="Yes" onClick="CheckTraining(1)" 
                      ValidationGroup="Training" Checked="true" runat="server" GroupName="PreparationType" /> 
                     <asp:RadioButton ID="rdbNo" Text="No" onClick="CheckTraining(0)" 
                             ValidationGroup="Training" runat="server" GroupName="PreparationType" />
                             

                  </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr>
                  <td style="font-size:small;">If no, please provide corrective actions:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtCorrectiveAction"  TextMode="MultiLine" runat="server" CssClass="log_textbox" ></asp:TextBox>                    
                     <asp:RequiredFieldValidator ID="reqValidateCorrectiveAction" Enabled="false" ControlToValidate="txtCorrectiveAction" Display="None"  ErrorMessage="The value in field Corrective Actions is required."  runat="server"></asp:RequiredFieldValidator>

                  </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                 <tr>
                  <td style="font-size:small;">If yes, please provide or describe Customer training and/or certifications:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtTraining"  TextMode="MultiLine" runat="server" CssClass="log_textbox" ></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="reqValidateTraining" Enabled="false" ControlToValidate="txtTraining" Display="None"  ErrorMessage="The value in field Provide Customer Training is required."  runat="server"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                 <tr>
                  <td style="font-size:small;">Verified By:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtVerifiedBy"  runat="server" CssClass="log_textbox"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Enabled="false" ControlToValidate="txtVerifiedBy" Display="None"  ErrorMessage="The value in field Verified By is required."  runat="server"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" Enabled="false" runat="server" ControlToValidate="txtVerifiedBy"
                                        Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                        Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:small;">Verified Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><ew:CalendarPopup ID="cldVerifiedDate" runat="server" CommandName="Calendar" ControlDisplay="TextBoxImage" 
                                         ImageUrl="~/images/Calendar_scheduleHS.png" /> 
                                           <asp:CompareValidator ID="CV_cldVerifyDate" Enabled="false" runat="server" ControlToValidate="cldVerifiedDate"
                                        Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>

                  </td>
                </tr>                
                <tr>
                  <td style="font-size:small;">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                </tr>
                <tr>
                  <td style="font-size:small;">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>
                   <asp:ImageButton ID="cmdSubmit" runat="server" 
                         ImageUrl="~/images/buttons/ButtonUpdate.png"  OnClientClick="SetValidator(1)"  onclick="cmdSubmit_Click" />
                    <asp:ImageButton ID="cmdDelete"  onclick="cmdDelete_Click" OnClientClick="SetValidator(0)" runat="server" Visible="false" ImageUrl="~/images/buttons/ButtonDelete.png" />
                    <asp:ImageButton ID="cmdAdd" runat="server" 
                         ImageUrl="~/images/buttons/ButtonAdd.png" OnClientClick="SetValidator(1)"  onclick="cmdAdd_Click" />
                    <asp:ImageButton ID="cmdCancel" runat="server" 
                         ImageUrl="~/images/buttons/ButtonCancel.png" OnClientClick="SetValidator(0)"  onclick="cmdCancel_Click" />                  
                   <asp:ImageButton ID="cmdContinue" runat="server" OnClientClick="SetValidator(0)" 
                         ImageUrl="~/images/buttons/ButtonFinishContinue.png" onclick="cmdContinue_Click"/>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:small;">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
            </table>
            </td>
            </tr>
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            </table>
    </div> 
    </div>
         
    <%--<div class="grey_bg_form"><a href="InventoryItemManager.aspx">Terms Of Use</a>        
        <a href="InventoryItemManager.aspx"> Training Manual</a>
    </div>--%>
    
         <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetFoodCategoriesByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategory"> 
                 <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>               
              </asp:ObjectDataSource>  
         <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPsByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP">
                 <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>                
              </asp:ObjectDataSource> 
         <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>  
 
       
    </div>
</asp:Content>

