<%@ Page Title="HACCP Builder | Product/Menu Items" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="MenuItems.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.MenuItemsNew1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../../Controls/Pager.ascx" tagname="Pager" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src="../../JScript/chosen.jquery.js" type="text/javascript"></script>
<script src="../../JScript/prism.js" type="text/javascript"></script>
<link rel="Stylesheet" href="../../App_Themes/Facility/chosen.css" />
<link rel="Stylesheet" href="../../App_Themes/Facility/prism.css" />
<script language="javascript" type="text/javascript">
//    $(document).ready(function () {
//        $(".slidingDiv").hide();
//        $(".show_hide").show();

//        $('.show_hide').click(function () {
//            $(".slidingDiv").slideToggle();
//        });

//    });
    function SetValidator(status) {

        var vldContactControl = document.getElementById('<%= reqVldProcess.ClientID %>');
       

      
        if (status == 1) {
           // ValidatorEnable(vldNameControl, true);
           // ValidatorEnable(vldContactControl, true);
        
          
        }
        else {
         //   ValidatorEnable(vldNameControl, false);
        //    ValidatorEnable(vldContactControl, false);
        
            
        }

        
    }
    function CustomValidation(source, arguments) {
        var rdbYes = document.getElementById('<%= rdbNo.ClientID %>');
        var rdbNo = document.getElementById('<%= rdbYes.ClientID %>');
        var rdbOnsite = document.getElementById('<%= rdbOnsite.ClientID %>');
        var rdbPreMade = document.getElementById('<%= rdbPreMade.ClientID %>');
      
        var nResult = 1;
        source.errormessage = "";
        if (rdbOnsite.checked == false && rdbPreMade.checked == false) {
            arguments.IsValid = false;
            source.errormessage += "The value in field Preparation type is required <br/>";
        }
        
        if (rdbNo.checked == false && rdbYes.checked == false) {
            arguments.IsValid = false;
            source.errormessage += "The value in field Ready to eat is required";

        }


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
      <h1>Outputs</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
   <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
    
   <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>--%>
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
    <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" ShowSummary="true" runat="server" />
    <asp:RequiredFieldValidator ID="reqVldProcess" Enabled="true" ControlToValidate="ddlProcess" CssClass="msg-error" Display="Static" ErrorMessage="The value in field Process is required." runat="server" ValidationGroup="MenuItems"></asp:RequiredFieldValidator>
    <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false"></asp:Label> 
    <asp:Label ID="lblInfo" runat="server" CssClass="msg-error" Visible="false" ></asp:Label>  
    <asp:HiddenField ID="hfAutoComplete" runat="server" 
          onvaluechanged="hfAutoComplete_ValueChanged" /> 
  </div>
  <div class="clear"></div>
  <div class="form3">    
    <div class="left">      
      <label>Item Name: </label>
      <div class="input">
        <asp:TextBox ID="txtSearchItem" runat="server"></asp:TextBox>
        <asp:Panel ID="dropdown" Height="100px" ScrollBars="Vertical" runat="server"></asp:Panel>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="dropdown" MinimumPrefixLength="1" OnClientItemSelected="ItemSelected"  
            ServiceMethod="GetMenuItems" ServicePath="~/AutoCompleteService.asmx" TargetControlID="txtSearchItem" OnClientHiding="OnClientCompleted" OnClientPopulated="OnClientCompleted" OnClientPopulating="OnClientPopulating">  
        </cc1:AutoCompleteExtender>  
         <asp:Button ID="cmdSearch"  runat="server" OnClientClick="SetValidator(0)"  Text="Search" Width="100px"  CssClass="button blue" onclick="cmdSearch_Click" />
        <asp:Button ID="cmdBack" runat="server" OnClientClick="SetValidator(0)" OnClick="cmdBackToList_Click" CssClass="button" Text="Back"  Visible="false" />         
      </div>
      <div class="input">
       
      </div>
    </div>     
    <div class="clear"></div>
  </div>  
  <div class="clear"></div>       
  <div class="slidingDiv" style="display: block;">
  <div class="form4 left marginright">
    <a href="#"><h2>Add/Edit Output</h2></a>
    <h2 class="left h2margin-r">Entry Date:</h2>
    <div class="input left">
         <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox"></asp:TextBox>
    </div>
    <div class="clear"></div>
    <br />
    <h4>Item Name:</h4>
    <div class="input">
        <asp:TextBox ID="txtName" runat="server" CssClass="log_textbox"></asp:TextBox>                                       
       <%-- <asp:RegularExpressionValidator ID="REV_txtName" MaxLength="100" Display="None" runat="server" ControlToValidate="txtName" ErrorMessage="The value in field 'Item Name' is not valid."
                ValidationExpression="^[A-Za-z0-9.\-_ ]+$" ValidationGroup="MenuItems"></asp:RegularExpressionValidator>--%>
        <asp:RequiredFieldValidator ID="reqValidateName" Enabled="false" ControlToValidate="txtName"
            Display="Static" ErrorMessage="The value in field Item Name is required." ValidationGroup="MenuItems" runat="server"></asp:RequiredFieldValidator>
    </div>    
    <div class="clear"></div>
    <br />
    <h4>Recipe Number:</h4>
    <div class="input">
        <asp:TextBox ID="txtRecipeNumber" MaxLength="50" runat="server" CssClass="log_textbox"></asp:TextBox>
        <asp:RegularExpressionValidator ID="REV2_txtRecipeNumber" runat="server" ControlToValidate="txtRecipeNumber" Font-Names="Verdana" Font-Size="10px" Display="None" EnableClientScript="true" ValidationGroup="MenuItems"
            ErrorMessage="Please enter a valid Recipe Number." ValidationExpression="[A-Za-z0-9]+$"></asp:RegularExpressionValidator>    
    </div>        
    <div class="clear"></div>
    <br />
    <h4> Add Inputs</h4>
    <div class="input left">
        <asp:ListBox ID="lstIngredients" runat="server"  Width="230px" Height="150px" CssClass="chosen-select" multiple data-placeholder="Choose an Input..."
            SelectionMode="Multiple" DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="IngredientID" ></asp:ListBox>
       <%-- <asp:LinkButton ID="cmdSelect" Text="Add" runat="server" ForeColor="Blue" 
            OnClientClick="SetValidator(0)"  CssClass="log_textbox" 
            OnClick="cmdSelect_Click" ValidationGroup="MenuItems"></asp:LinkButton>                                        
        <asp:CustomValidator ID="vldCustom" runat="server" ClientValidationFunction="CustomValidation"  ErrorMessage="" Display="None" ValidationGroup="MenuItems"></asp:CustomValidator>  --%>      
    </div>
     <%--<div class="clear"></div>
    <h4> Selected Input(s):</h4>
    <div class="input left">
        <asp:ListBox ID="lstIngredient" runat="server" CssClass="log_textbox" Width="230px" Height="150px" SelectionMode="Multiple" ></asp:ListBox>
        <asp:LinkButton ID="cmdRemove" Text="Remove" runat="server" ForeColor="Blue" OnClientClick="SetValidator(0)" OnClick="cmdRemove_Click"></asp:LinkButton>
    </div>    --%>
  </div>
  <div class="form4 left">
    <h2> Process:</h2>
    <div class="input">
       <%-- <asp:RadioButtonList ID="rdlProcess" runat="server" ValidationGroup="MenuItems"></asp:RadioButtonList>--%>  
        <asp:DropDownList ID="ddlProcess" runat="server" ValidationGroup="MenuItems"></asp:DropDownList>      
    </div>
     <div class="clear"></div>
    <br />
    <h4>Preparation:</h4>
    <div class="input">
        <asp:RadioButton ID="rdbPreMade" Text="Pre-made (Vendor Supplied)" ValidationGroup="Prparation" runat="server" GroupName="PreparationType" />
        <asp:RadioButton ID="rdbOnsite" Text="Prepared On-site by Recipe" ValidationGroup="Prparation" runat="server" GroupName="PreparationType" />
    </div>   
    <div class="clear"></div>
    <br />
    <h4>Ready to eat:</h4>
    <div class="input">
        <asp:RadioButton ID="rdbYes" Text="Yes" ValidationGroup="ready" runat="server" GroupName="Ready" />
        <asp:RadioButton ID="rdbNo" Text="No" ValidationGroup="ready" runat="server" GroupName="Ready" />
    </div>    
    <div class="clear"></div>       
    <br />
    <h4>Instructions to Recipe and/or Instructions:</h4>
    <div class="input">
        <asp:TextBox ID="txtRecipe" TextMode="MultiLine" MaxLength="240" Width="150px" runat="server" CssClass="log_textbox" Height="60px" Visible="false"></asp:TextBox>
        <asp:LinkButton ID="hlRecipe" Text ="Add/Edit Recipe" runat="server"  Visible="false" onclick="hlRecipe_Click"></asp:LinkButton>
    </div>  
   </div>
   <div class="clear tenpx"></div>
  <div class="form3">
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server" CssClass="blue button" OnClick="cmdSubmit_Click" Text="SUBMIT" ValidationGroup="MenuItems" />
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" ValidationGroup="MenuItems" />
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />  
        <asp:Button ID="cmdContinue" runat="server" OnClientClick="SetValidator(0)"  onclick="cmdContinue_Click" Text="FINISHED AND CONTINUE" Width="200px"/>
    </div>
    <div class="clear"></div>
  </div>
  </div>
  <div class="clear"></div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Outputs</h4>
    </div>
    <asp:GridView ID="grdHotHolding" runat="server" CssClass="zebra" AutoGenerateColumns="False" OnRowDataBound="grdHotHolding_RowDataBound" OnRowCommand="grdHotHolding_RowCommand">
        <Columns>                       
            <asp:TemplateField HeaderText="Item Name">
                <ItemTemplate>                              
                    <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'
                        CommandName="MenuItem" CommandArgument='<%# Eval("MenuItemID") %>'></asp:LinkButton>
                </ItemTemplate>                   
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Process Type">
                <ItemTemplate>
                    <asp:Label ID="lblProcess" runat="server" Text='<%# Eval("Process").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("Process")%>'></asp:Label>
                </ItemTemplate>                  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Inputs">
                <ItemTemplate>
                    <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                </ItemTemplate>                   
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vendor">
                <ItemTemplate>
                    <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>
                </ItemTemplate>                 
            </asp:TemplateField>                       
        </Columns>
    </asp:GridView>
    <asp:GridView ID="grdSearch" runat="server" CssClass="zebra" AutoGenerateColumns="False" Visible="false" OnRowDataBound="grdSearch_RowDataBound" >
        <Columns>               
            <asp:TemplateField HeaderText="Item Name">
                <ItemTemplate>
                    <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + DataBinder.Eval(Container.DataItem, "MenuItemID") %>'
                        Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>                       
                </ItemTemplate>                   
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Process Type">
                <ItemTemplate>
                    <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>
                </ItemTemplate>                   
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Input">
                <ItemTemplate>
                    <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                </ItemTemplate>                   
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Vendor">
                <ItemTemplate>
                    <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>
                </ItemTemplate>                   
            </asp:TemplateField>
              
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
<script type="text/javascript">
    var config = {
        '.chosen-select': {},
        '.chosen-select-deselect': { allow_single_deselect: true },
        '.chosen-select-no-single': { disable_search_threshold: 10 },
        '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
        '.chosen-select-width': { width: "95%" }
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
  </script>
 <%--</ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
         <ProgressTemplate>                     
         <div id="progress">
             <img src="../../images/buttons/ajax-loader1.gif" alt="" />
         </div>                    
         </ProgressTemplate>
         </asp:UpdateProgress>--%>
 
        <asp:Label ID="lblCurrentPageNumber" runat="server" Visible="false" Text="1"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetIngredientsByKitchenMenuItemId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllFoodCategories" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategories">
        </asp:ObjectDataSource>  
</asp:Content>
