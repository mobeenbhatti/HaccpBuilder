<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.VendorsNew" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../../Controls/Pager.ascx" tagname="Pager" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $(".slidingDiv").hide();
        $(".show_hide").show();

        $('.show_hide').click(function () {
            $(".slidingDiv").slideToggle();
        });

    });
    function CheckTraining(val) {

           var txtCorreectiveControl = document.getElementById('<%=txtCorrectiveAction.ClientID%>');
           var txtTrainingControl = document.getElementById('<%=txtTraining.ClientID%>');
           var vldCorrectiveControl = document.getElementById('<%=reqValidateCorrectiveAction.ClientID%>');
           var vldTrainingControl = document.getElementById('<%=reqValidateTraining.ClientID%>');
        //var txtCorreectiveControl = document.getElementById('PlaceHolder_txtCorrectiveAction');
        //var txtTrainingControl = document.getElementById('PlaceHolder_txtTraining');
        //var vldCorrectiveControl = document.getElementById('PlaceHolder_reqValidateCorrectiveAction');
        //var vldTrainingControl = document.getElementById('PlaceHolder_reqValidateTraining');


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

        var vldNameControl = document.getElementById('<%=RequiredFieldValidator1.ClientID%>');
        var vldContactControl = document.getElementById('<%=RequiredFieldValidator2.ClientID%>');
        var vldPhoneControl = document.getElementById('<%=RequiredFieldValidator3.ClientID%>');
        var vldVerifiedControl = document.getElementById('<%=RequiredFieldValidator4.ClientID%>');
        var vldCorrectiveControl = document.getElementById('<%=reqValidateCorrectiveAction.ClientID%>');
        var vldTrainingControl = document.getElementById('<%=reqValidateTraining.ClientID%>');
        var rdbTrainingYes = document.getElementById('<%=rdbYes.ClientID%>');
        var rdbTrainingYes = document.getElementById('<%=rdbYes.ClientID%>');
        var CV_cldVerifyDate = document.getElementById('<%=CV_cldVerifyDate.ClientID%>');

        if (status == 1) {
            ValidatorEnable(vldNameControl, true);
            ValidatorEnable(vldContactControl, true);
            ValidatorEnable(vldPhoneControl, true);
            ValidatorEnable(vldVerifiedControl, true);
            ValidatorEnable(CV_cldVerifyDate, true);
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
        }
    }
    function VaidationDisable() {

        var vldNameControl = document.getElementById('<%=RequiredFieldValidator1.ClientID%>');
        var vldContactControl = document.getElementById('<%=RequiredFieldValidator2.ClientID%>');
        var vldPhoneControl = document.getElementById('<%=RequiredFieldValidator3.ClientID%>');
        var vldVerifiedControl = document.getElementById('<%=RequiredFieldValidator4.ClientID%>');
        var vldCorrectiveControl = document.getElementById('<%=reqValidateCorrectiveAction.ClientID%>');
        var vldTrainingControl = document.getElementById('<%=reqValidateTraining.ClientID%>');
        var CV_cldVerifyDate = document.getElementById('<%=CV_cldVerifyDate.ClientID%>');

        ValidatorEnable(vldNameControl, false);
        ValidatorEnable(vldContactControl, false);
        ValidatorEnable(vldPhoneControl, false);
        ValidatorEnable(vldVerifiedControl, false);
        ValidatorEnable(vldCorrectiveControl, false);
        ValidatorEnable(vldTrainingControl, false);
        ValidatorEnable(CV_cldVerifyDate, false);
    }
    /// Auto complete Extender functions
    function OnClientPopulating(sender, e) {
        sender._element.className = "loading";
    }
    function OnClientCompleted(sender, e) {
        sender._element.className = "";
    }
    function ItemSelected(source, eventArgs) {

        var hdnValueID = "<%= hfAutoComplete.ClientID %>";

        document.getElementById(hdnValueID).value = eventArgs.get_value();
        __doPostBack(hdnValueID, "");
    } 
</script>
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Vendors</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager> 
<asp:UpdatePanel ID="updPanel" runat="server">
<Triggers>
<asp:PostBackTrigger ControlID="cmdUpload" />
</Triggers>
<ContentTemplate>  
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
    <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" ShowSummary="true" runat="server" />
    <asp:Label ID="lblError" runat="server" Text="" Visible="false" CssClass="msg-error"></asp:Label>    
  </div>
  <div class="clear"></div>
  <div class="form3">    
    <div class="left">      
      <label>Vendor Name: </label>
      <div class="input">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="log_textbox"></asp:TextBox>
         <asp:Button ID="cmdSearch"  runat="server" OnClientClick="SetValidator(0)"  Text="Search" Width="100px"  CssClass="button blue" onclick="cmdSearch_Click" />
        <asp:Button ID="cmdBack" runat="server" OnClientClick="SetValidator(0)" OnClick="cmdBackToList_Click" CssClass="button" Text="Back"  Visible="false" />
        <asp:Panel ID="dropdown" Height="100px" ScrollBars="Vertical" runat="server"></asp:Panel>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="dropdown" MinimumPrefixLength="1" 
            ServiceMethod="GetVendors" ServicePath="~/AutoCompleteService.asmx" TargetControlID="txtSearch"
            OnClientHiding="OnClientCompleted" OnClientPopulated="OnClientCompleted" OnClientPopulating="OnClientPopulating" OnClientItemSelected="ItemSelected">  
        </cc1:AutoCompleteExtender>    
        <asp:HiddenField ID="hfAutoComplete" runat="server" onvaluechanged="hfAutoComplete_ValueChanged" />
      </div>     
    </div> 
    <div class="right button-margin">
        <label>Upload Vendors from file: </label>
         <asp:FileUpload ID="File1" runat="server" />    
        <asp:Button ID="cmdUpload" Text="Upload" runat="server"  OnClientClick="SetValidator(0)" onclick="cmdUpload_Click" CssClass="button blue" />
        <asp:Button ID="cmdGetFormat" runat="server" Text="Get Upload Format" OnClientClick="SetValidator(0)" Width="150px" onclick="cmdGetFormat_Click" CssClass="button" />          
    </div>        
    <div class="clear"></div>
  </div>  
  <div class="clear"></div>  
  <div>
  <div class="form4 left marginright">
    <a href="#" ><h2>Add/Edit Vendor</h2></a>
    <h2 class="left h2margin-r">Entry Date:</h2>
    <div class="input left">
         <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox" ></asp:TextBox>         
    </div>
    <div class="clear"></div>
    <br />
    <h4>Vendor Name:</h4>
    <div class="input">
        <asp:TextBox ID="txtVendorName" runat="server" CssClass="log_textbox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="false" runat="server" Display="None" ErrorMessage="The value in field Vendor Name is required" ControlToValidate="txtVendorName"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>        
    </div>    
    <div class="clear"></div>
    <br />
    <h4>Vendor Contact Name</h4>
    <div class="input">
        <asp:TextBox ID="txtContactName" runat="server" CssClass="log_textbox" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="false" runat="server" Display="None" ErrorMessage="The value in field Vendor Contact Name is required" ControlToValidate="txtContactName"  Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>        
    </div>
    <br />
    <h4>Vendor Phone Number</h4>
    <div class="input">
         <asp:TextBox ID="txtPhone" runat="server"  CssClass="log_textbox" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Enabled="false" runat="server" Display="None"  ErrorMessage="The value in field Vendor Phone Number is required" ControlToValidate="txtPhone"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
    </div>
  </div>
  <div class="form4 left">
    <h2>Does Vendor have Training and Certifications in Place:</h2>
    <div class="input left">
       <asp:RadioButton ID="rdbYes" Text="Yes" onClick="CheckTraining(1)" ValidationGroup="Training" Checked="true" runat="server" GroupName="PreparationType" /> 
        <asp:RadioButton ID="rdbNo" Text="No" onClick="CheckTraining(0)" ValidationGroup="Training" runat="server" GroupName="PreparationType" />
    </div>
     <div class="clear"></div>
    <br />
    <h4>If no, please provide corrective actions:</h4>
    <div class="input left">
        <asp:TextBox ID="txtCorrectiveAction"  TextMode="MultiLine" runat="server" CssClass="log_textbox" ></asp:TextBox>                    
        <asp:RequiredFieldValidator ID="reqValidateCorrectiveAction" Enabled="false" ControlToValidate="txtCorrectiveAction" Display="None"  ErrorMessage="The value in field Corrective Actions is required."  runat="server"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>   
    <br /> 
    <h4>If yes, please provide or describe vendor training and/or certifications:</h4>
    <div class="input">
        <asp:TextBox ID="txtTraining"  TextMode="MultiLine" runat="server" CssClass="log_textbox" ></asp:TextBox> 
        <asp:RequiredFieldValidator ID="reqValidateTraining" Enabled="false" ControlToValidate="txtTraining" Display="None"  ErrorMessage="The value in field Provide Vendor Training is required."  runat="server"></asp:RequiredFieldValidator>      
    </div>
   </div>
   <div class="clear tenpx"></div>
  <div class="form3">
    <div class="left">
      <h4>Verified By*:</h4>
      <div class="input">
       <asp:TextBox ID="txtVerifiedBy"  runat="server" CssClass="log_textbox"></asp:TextBox> 
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Enabled="false" ControlToValidate="txtVerifiedBy" Display="None"  ErrorMessage="The value in field Verified By is required."  runat="server"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="left date-marginl">
      <h4>Verified Date:</h4>
      <div class="input">
        <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CommandName="Calendar" ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" /> 
        <asp:CompareValidator ID="CV_cldVerifyDate" Enabled="false" runat="server" ControlToValidate="cldVerifiedDate" Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
      </div>
    </div>
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server" CssClass="blue button" OnClick="cmdSubmit_Click" Text="SUBMIT" />
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" />
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />  
        <asp:Button ID="cmdContinue" runat="server" OnClientClick="SetValidator(0)"  onclick="cmdContinue_Click" Text="FINISHED AND CONTINUE" Width="200px"/>
    </div>
    <div class="clear"></div>
  </div>
  </div>
  <div class="clear"></div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Vendors</h4>
    </div>
    <asp:GridView ID="grdHotHolding" runat="server" CssClass="zebra" AutoGenerateColumns="False"  OnRowCommand="grdHotHolding_RowCommand" >                
        <Columns>                     
	            <asp:TemplateField HeaderText="Entry Date">
	                <ItemTemplate>
	                    <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                </ItemTemplate>
	                <ItemStyle Width="100px" />
	                <HeaderStyle CssClass="gridheaderline" />
	            </asp:TemplateField >	                    
	            <asp:TemplateField HeaderText="Vendor Name">
	                <ItemTemplate>	                            
	                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VendorName")  %>' CommandName="Vendor" CommandArgument='<%# Eval("VendorID") %>'></asp:LinkButton> 
	                </ItemTemplate>	                       
	            </asp:TemplateField >
	                <asp:TemplateField HeaderText="Contact Name">
	                <ItemTemplate>
	                    <asp:Label ID="lblContactName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                </ItemTemplate>	                      
	            </asp:TemplateField >
	                <asp:TemplateField HeaderText="Phone">
	                <ItemTemplate>
	                    <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                </ItemTemplate>	                       
	            </asp:TemplateField >		                                       
        </Columns>
    </asp:GridView>    
    <asp:GridView ID="grdSearch" runat="server" CssClass="zebra" AutoGenerateColumns="False"  AllowPaging="True" Visible="false"  OnRowCommand="grdHotHolding_RowCommand"  >                
        <Columns>                     
	            <asp:TemplateField HeaderText="Entry Date">
	                <ItemTemplate>
	                    <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                </ItemTemplate>	                        
	            </asp:TemplateField >	                    
	            <asp:TemplateField HeaderText="Vendor Name">
	                <ItemTemplate>	                            
	                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VendorName")  %>' CommandName="Vendor" CommandArgument='<%# Eval("VendorID") %>'></asp:LinkButton> 	                           
	                </ItemTemplate>	                       
	            </asp:TemplateField >
	                <asp:TemplateField HeaderText="Contact Name">
	                <ItemTemplate>
	                    <asp:Label ID="lblContact" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                </ItemTemplate>	                      
	            </asp:TemplateField >
	                <asp:TemplateField HeaderText="Phone">
	                <ItemTemplate>
	                    <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                </ItemTemplate>	                        
	            </asp:TemplateField >
        </Columns>
    </asp:GridView>     
    <asp:Panel ID="pnlPaging" runat="server">
        <div class="box-bottom" style="text-align:center;">
            <uc2:Pager ID="custPager" runat="server" OnPageChanged="custPager_PageChanged"/> 
            <div class="clear"></div>         
        </div>       
    </asp:Panel>
  </div>
</div>
</ContentTemplate>
</asp:UpdatePanel> 
<asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
<ProgressTemplate>                     
<div id="progress">
    <img src="../../images/buttons/ajax-loader1.gif" alt="" />
</div>                    
</ProgressTemplate>
</asp:UpdateProgress>
<asp:HiddenField ID="hfVendorId" runat="server" />
<asp:Label ID="lblCurrentPageNumber" runat="server" Visible="false" Text="1"></asp:Label>   
</asp:Content>
