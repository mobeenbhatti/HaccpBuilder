<%@ Page Title="HACCP Builder | Ingredients" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="Ingredients.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.IngredientsNew" %>
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
    function SetValidator(status) {

        var vldNameControl = document.getElementById('<%= RequiredFieldValidator1.ClientID %>');
        var vldContactControl = document.getElementById('<%= RequiredFieldValidator2.ClientID %>');
        var vldPhoneControl = document.getElementById('<%= RequiredFieldValidator3.ClientID %>');

        if (status == 1) {
            ValidatorEnable(vldNameControl, true);
            ValidatorEnable(vldContactControl, true);
            ValidatorEnable(vldPhoneControl, true);              
        }
        else {
            ValidatorEnable(vldNameControl, false);
            ValidatorEnable(vldContactControl, false);
            ValidatorEnable(vldPhoneControl, false);
        }
    }
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
      <h1>Inputs</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
 <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp1"
                BackgroundCssClass="overlay"
                PopupDragHandleControlID="panelDragHandle1"               
                />
       <br />             
    <div class="box" id="divPopUp1" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" 
                  Height="50px" Width="100%">
                <Fields>
                <asp:TemplateField>
                <ItemTemplate>
                <div class="LogHeading">Food/Process Item (CP and CCP Relationship)</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CCP")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Critical Control Point Requirement</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Requirement")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Control Point (CP) Requirement</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CPRequirement")%>
                </div>
                </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                </asp:DetailsView> 
                <br />                       
                <asp:Button ID="btnClose" runat="server" Text="Close" />
               <br />
            </div>
    <div class="popUpStyle" id="divPopUp" style="display:none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:DetailsView ID="dtvFoodCategory" runat="server" AutoGenerateRows="False" 
                  Height="50px" Width="100%">
                <Fields>
                <asp:TemplateField>
                <ItemTemplate>
                <div class="LogHeading">FoodCategory</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "FoodCategory")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Biological Hazard</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "BiologicalHazard")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Chemical Hazard</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "ChemicalHazard")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Physical Hazard</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "PhysicalHazard")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Associated CCP</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CCP")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Associated CP</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CP")%>
                </div>
                 <div class="Clearer"></div>
                <div class="LogHeading">CCP Limit (F)</div>
                <div class="FloatLeft">
                <%--<%# DataBinder.Eval(Container.DataItem, "CCPLimit")%>--%>
                <%# DataBinder.Eval(Container.DataItem, "CCLTempLow")%>
               
                <%# DataBinder.Eval(Container.DataItem, "CCLTempHigh").ToString() == "" ? "" : " and " + DataBinder.Eval(Container.DataItem, "CCLTempHigh") %>
                </div>
                <div class="Clearer"></div>
                <%--<div class="LogHeading">Recommended Corrective Action</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CorrectiveAction")%>
                </div>   --%>  
                </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                </asp:DetailsView>    
                <asp:Repeater ID="rptCorrectiveAction" runat="server">
                <HeaderTemplate><div class="LogHeading">Recommended Corrective Action</div></HeaderTemplate>
                <ItemTemplate>                
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Name")%>
                </div>   
                <br />  
                </ItemTemplate>
                </asp:Repeater>             
               <%--<asp:DetailsView ID="dtvCorrectiveAction" runat="server" AutoGenerateRows="False" 
                  Height="50px" Width="100%">
                <Fields>
                <asp:TemplateField>
                <ItemTemplate> 
                <div class="LogHeading">Recommended Corrective Action</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Name")%>
                </div>     
                </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                </asp:DetailsView>--%>
                <br />                       
                <asp:Button ID="Button1" runat="server" Text="Close" />
               <br />
            </div>
    <asp:Panel ID="divVendors" runat="server" CssClass="popUpStyle" Style="display:none; overflow:visible; ">
            <%--<div class="popUpStyle1" id="divVendors" style="display:none; overflow:scroll;" runat="server">--%>
                <asp:Panel runat="Server" ID="panelVendors" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>               
               <asp:Label ID="lblIngredient" runat="server" Text="" class="red_heading"></asp:Label>
               <asp:GridView ID="grdVendorsList"  runat="server"  AutoGenerateColumns="False" OnRowCommand="grdHotHolding_RowCommand"  >                
                <Columns>              
	                    <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendors" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CreatedDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	            </Columns>
	            </asp:GridView> 
                <br />                       
                <asp:Button ID="Button2" runat="server" Text="Close" />
               <br />          
            </asp:Panel>
     </ContentTemplate>
    </asp:UpdatePanel> 
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>    
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
     <asp:ValidationSummary ID="vldSummary" DisplayMode="List" CssClass="msg-error" ShowSummary="true" ValidationGroup="Input" runat="server" />
     <asp:Label ID="lblError" runat="server" Text="" CssClass="msg-error" Visible="false"></asp:Label>
     <asp:HyperLink ID="hlDownLoadInvalidIngredient" Visible="false" NavigateUrl="~/ControlPanel/Kitchen/Data/csvInValidIngredient.csv" runat="server">Click Here</asp:HyperLink>
     <asp:HiddenField ID="hfIngredientId" runat="server" />   
  </div>
  <div class="clear"></div>
  <div class="form3">    
    <div class="left">      
      <label>Input Name: </label>
      <div class="input">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="log_textbox"></asp:TextBox>
         <asp:Button ID="cmdSearch"  runat="server" OnClientClick="SetValidator(0)"  Text="Search" Width="100px"  CssClass="button blue" onclick="cmdSearch_Click" />
        <asp:Button ID="cmdBack" runat="server" OnClientClick="SetValidator(0)" OnClick="cmdBackToList_Click" CssClass="button" Text="Back"  Visible="false" />
        <asp:Panel ID="dropdown" Height="100px" ScrollBars="Vertical" runat="server"></asp:Panel>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="dropdown" MinimumPrefixLength="1" 
                ServiceMethod="GetIngredients" ServicePath="~/AutoCompleteService.asmx" TargetControlID="txtSearch"
                OnClientHiding="OnClientCompleted" OnClientPopulated="OnClientCompleted" OnClientPopulating="OnClientPopulating" OnClientItemSelected="ItemSelected" >  
        </cc1:AutoCompleteExtender>   
        <asp:HiddenField ID="hfAutoComplete" runat="server"  onvaluechanged="hfAutoComplete_ValueChanged" /> 
      </div>     
    </div> 
     <div class="right button-margin">
                <div class="left">
                <label>Upload Inputs: </label>
                <div class="input"><asp:FileUpload ID="File1" runat="server"  /></div> </div>
            <asp:Button ID="cmdUpload" Text="Upload" runat="server"  OnClientClick="SetValidator(0)" onclick="cmdUpload_Click" CssClass="button blue" />
            <asp:Button ID="cmdDownload" Text="Get Food Categories" runat="server" Width="150px"  OnClientClick="SetValidator(0)" onclick="cmdDownload_Click" CssClass="button" />
            <asp:Button ID="cmdGetFormat" runat="server" Text="Get Upload Format" OnClientClick="SetValidator(0)" Width="150px" onclick="cmdGetFormat_Click" CssClass="button" />            
        </div>        
    <div class="clear"></div>
  </div>  
  <div class="clear"></div>
  <div>
  <div class="form4 left marginright">
    <a href="#"><h2>Add/Edit Input</h2></a>
    <h4 class="left h2margin-r">Entry Date:</h4>
    <div class="input left">
         <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox" ></asp:TextBox>         
    </div>
    <div class="clear"></div>
    <br />
    <h4 class="left h2margin-r">Input Name:</h4>
    <div class="input left">
        <asp:TextBox ID="txtIngredientName" runat="server" CssClass="log_textbox"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="true" runat="server" Display="None" 
        ErrorMessage="The value in field Ingredient Name is required" ControlToValidate="txtIngredientName" ValidationGroup="Input"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator> 
    </div>    
    <div class="clear"></div>
    <br />
    <h4 class="left h2margin-r">Vendor Name:</h4>
    <div class="input left">
        <asp:DropDownList ID="ddlVendor" runat="server" Width="250px" CssClass="log_textbox" DataSourceID="ObjectDataSource2" DataTextField="VendorName" DataValueField="VendorID" AppendDataBoundItems="true">
            <asp:ListItem>Select Vendor</asp:ListItem>
        </asp:DropDownList>                     
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="true" runat="server" Display="None" InitialValue="Select Vendor" ValidationGroup="Input"  ErrorMessage="The value in field Vendor Name is required" ControlToValidate="ddlVendor"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <br />
    <h4 class="left h2margin-r">Related Food Category:</h4>
    <div class="input left">
        <asp:DropDownList ID="ddlFoodCategory" runat="server" Width="250px" CssClass="log_textbox" DataSourceID="ObjectDataSource3" DataTextField="FoodCategory" DataValueField="FoodCategoryId" AppendDataBoundItems="true">
            <asp:ListItem>Select Food Category</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lblFoodCategory" runat="server" Text="NA"></asp:Label>                     
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Enabled="true" runat="server" Display="None"  InitialValue="Select Food Category" ValidationGroup="Input"  ErrorMessage="The value in field Food Category is required" ControlToValidate="ddlFoodCategory"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator>
    </div>
  </div>  
   <div class="clear tenpx"></div>
  <div class="form3"> 
    <div class="right button-margin">
        <asp:Button ID="cmdSubmit" runat="server" CssClass="blue button" OnClick="cmdSubmit_Click" Text="SUBMIT" ValidationGroup="Input" />
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE" ValidationGroup="Input"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" ValidationGroup="Input" />
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />  
        <asp:Button ID="cmdContinue" runat="server" OnClientClick="SetValidator(0)"  onclick="cmdContinue_Click" Text="FINISHED AND CONTINUE" Width="200px"/>
    </div>
    <div class="clear"></div>
  </div>
  </div>
  <div class="clear"></div>
  <div class="table">
    <div class="box-header">
      <h4 class="left">List of Ingredients</h4>
    </div>
     <asp:GridView ID="grdHotHolding"  runat="server" CssClass="zebra" AutoGenerateColumns="False" OnRowCommand="grdHotHolding_RowCommand"  >                
            <Columns>
	                <asp:TemplateField HeaderText="Entry Date">
	                    <ItemTemplate>
	                        <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                    </ItemTemplate>	                       
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input ">
	                    <ItemTemplate>	                          
	                        <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>                           
	                    </ItemTemplate>	                       
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Food Category">
	                    <ItemTemplate>	                           
	                        <asp:LinkButton ID="hlFoodCategory" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>' CommandName="Ingredient"  CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>	                           
	                    </ItemTemplate>
	                    <ItemStyle Width="200px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Vendor Name">
	                    <ItemTemplate>
	                        <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>                           
	                    </ItemTemplate>
	                    <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Hazards & CCP/CP">
	                    <ItemTemplate>
	                            <asp:LinkButton ID="lkbHazard" Text="View" Enabled='<%# Eval("FoodCategory").ToString()== ""? false: true%>' CommandName="Hazard" CommandArgument='<%# Eval("FoodCategoryId") %>'  runat="server" 
                            ></asp:LinkButton>	                           
	                    </ItemTemplate>
	                    <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Vendors History">
	                    <ItemTemplate>
	                            <asp:LinkButton ID="lkbVendors" Text="View"  CommandName="Vendors" CommandArgument='<%# Eval("IngredientID") %>'  runat="server" 
                            ></asp:LinkButton>	                           
	                    </ItemTemplate>
	                    <ItemStyle Width="100px" />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
            </Columns>
        </asp:GridView>            
        <asp:GridView ID="grdSearch" runat="server" CssClass="zebra" AutoGenerateColumns="False"  Visible="false" OnRowCommand="grdHotHolding_RowCommand"  >                
            <Columns>                     
	                <asp:TemplateField HeaderText="Entry Date">
	                    <ItemTemplate>
	                        <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>'></asp:Label>	                           
	                    </ItemTemplate>	                        
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                    <ItemTemplate>	                            
	                        <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton> 	                           
	                    </ItemTemplate>	                     
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Food Category">
	                    <ItemTemplate>	                          
	                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>	                           
	                    </ItemTemplate>	                       
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Vendor Name">
	                    <ItemTemplate>
	                        <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>                           
	                    </ItemTemplate>	                       
	                </asp:TemplateField >	                   
	                    <asp:TemplateField HeaderText="View Hazards & CCP/CP">
	                    <ItemTemplate>
	                            <asp:LinkButton ID="lkbHazard" Text="View" Enabled='<%# Eval("FoodCategory").ToString()== ""? false: true%>' CommandName="Hazard" CommandArgument='<%# Eval("FoodCategoryId") %>'  runat="server" 
                            ></asp:LinkButton>	                           
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
   <Triggers>
   <asp:PostBackTrigger ControlID="cmdDownload" />   
   <asp:PostBackTrigger ControlID="cmdUpload" />    
   <%--<asp:AsyncPostBackTrigger ControlID="cmdSubmit" EventName="cmdSubmit_Click" />
   <asp:AsyncPostBackTrigger ControlID="cmdDelete" EventName="cmdDelete_Click" />
   <asp:AsyncPostBackTrigger ControlID="cmdAdd" EventName="cmdAdd_Click" />
   <asp:AsyncPostBackTrigger ControlID="cmdCancel" EventName="cmdCancel_Click" />--%>
   </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
     <ProgressTemplate>                     
     <div id="progress">
         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
     </div>                    
     </ProgressTemplate>
     </asp:UpdateProgress>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetIngredientByKitchenId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    <asp:Label ID="lblCurrentPageNumber" runat="server" Visible="false" Text="1"></asp:Label>
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorByKitchenId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>
