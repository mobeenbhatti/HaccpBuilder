<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" Theme="Default"
    AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuItems"
    Title="HACCP Builder | Product/Menu Items" Codebehind="MenuItems2.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="~/Controls/MultiCheckDropdown.ascx" tagname="MultiCheckDropdown" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

    <script language="javascript" type="text/javascript">
        function SetValidator(status) {

            var vldNameControl = document.getElementById('ctl00_PlaceHolder_reqValidateName');
            var vldContactControl = document.getElementById('ctl00_PlaceHolder_reqValidatePreparation');
            var vldCustom = document.getElementById('ctl00_PlaceHolder_vldCustom');

            //   var vldPhoneControl = document.getElementById('ctl00_PlaceHolder_reqValidateRecipe');
            //     var vldVerifiedControl = document.getElementById('ctl00_PlaceHolder_RequiredFieldValidator4');
            //     var vldCorrectiveControl = document.getElementById('ctl00_PlaceHolder_reqValidateCorrectiveAction');
            //     var vldTrainingControl = document.getElementById('ctl00_PlaceHolder_reqValidateTraining');
            if (status == 1) {
                ValidatorEnable(vldNameControl, true);
                ValidatorEnable(vldContactControl, true);
                ValidatorEnable(vldCustom, true);
                //   ValidatorEnable(vldPhoneControl, true);
            }
            else {
                ValidatorEnable(vldNameControl, false);
                ValidatorEnable(vldContactControl, false);
                ValidatorEnable(vldCustom, false);
                //    ValidatorEnable(vldPhoneControl, false);
            }

            //     ValidatorEnable(vldVerifiedControl, false);
            //     ValidatorEnable(vldCorrectiveControl, false);
            //     ValidatorEnable(vldTrainingControl, false);
        }
        function CustomValidation(source, arguments) {
            var rdbYes = document.getElementById('ctl00_PlaceHolder_rdbNo');
            var rdbNo = document.getElementById('ctl00_PlaceHolder_rdbYes');
            var rdbOnsite = document.getElementById('ctl00_PlaceHolder_rdbOnsite');
            var rdbPreMade = document.getElementById('ctl00_PlaceHolder_rdbPreMade');
            var lstIngredient = document.getElementById('ctl00_PlaceHolder_lstIngredient');
            var nResult = 1;
            source.errormessage = "";
            if (rdbOnsite.checked == false && rdbPreMade.checked == false) {
                arguments.IsValid = false;
                source.errormessage += "The value in field Preparation type is required <br/>";
            }
            if (lstIngredient.options.length == 0) {
                arguments.IsValid = false;
                source.errormessage += "Please select Ingredient  <br/>";
            }
            if (rdbNo.checked == false && rdbYes.checked == false) {
                arguments.IsValid = false;
                source.errormessage += "The value in field Ready to eat is required";

            }


        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="popUpStyle" PopupDragHandleControlID="panelDragHandle1"
                DropShadow="true" />
            <br />
            <div class="popUpStyle" id="divPopUp" style="display: none;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <asp:DetailsView ID="dtvProcess" runat="server" AutoGenerateRows="False" Height="50px"
                    Width="100%">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="LogHeading">
                                    Process Name</div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "ProcessName")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                    Short Name</div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "ProcessShortName")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field1")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field2")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field3")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field4")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field5")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field6")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field7")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field8")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field9")%>
                                </div>
                                <div class="Clearer">
                                </div>
                                <div class="LogHeading">
                                </div>
                                <div class="FloatLeft">
                                    <%# DataBinder.Eval(Container.DataItem, "Field10")%>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Close" />
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="bdy_contents">
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <div class="log_form_left">
            <div class="grey_bg_left">
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="red_heading" colspan="3">
                            { PRODUCT /MENU ITEM IDENTIFICATION: <span class="SecondaryHeading">STEP <span style="color: Black;">
                                NINE</span> OF NINE BUILDING YOUR HACCP PLAN }
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:HyperLink ImageUrl="~/images/buttons/ButtonBackToProduct.png" Width="180" Height="30"
                                NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" runat="server" ID="HyperLink2"></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="discp_left_bg">
                <table border="0" cellspacing="0" cellpadding="1">
                    <tr>
                        <td align="center">
                            Item Name:
                        </td>
                        <td>
                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearchItem" runat="server"></asp:TextBox>
                            <asp:Panel ID="dropdown" Height="100px" ScrollBars="Vertical" runat="server"></asp:Panel>
                            <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="dropdown" MinimumPrefixLength="1" 
                                ServiceMethod="GetMenuItems" ServicePath="~/AutoCompleteService.asmx" TargetControlID="txtSearchItem">  
                            </cc1:AutoCompleteExtender>                             
                        </td>
                        <td>
                            <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                        </td>
                        <td>
                            <asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/District Images/ButtonGo.png"
                                OnClientClick="SetValidator(0)" OnClick="cmdSearch_Click" ImageAlign="AbsMiddle" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="grid_left">
                <asp:GridView ID="grdHotHolding" runat="server" SkinID="gridviewSkin" AutoGenerateColumns="False"
                   OnRowDataBound="grdHotHolding_RowDataBound">
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
                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + DataBinder.Eval(Container.DataItem, "MenuItemID") %>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>
                               <%-- <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'
                                 CommandName="MenuItem" CommandArgument='<%# Eval("MenuItemID") %>'></asp:LinkButton>--%>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Process Type">
                            <ItemTemplate>
                                <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ingredient">
                            <ItemTemplate>
                                <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vendor">
                            <ItemTemplate>
                                <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
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
                    Visible="false" OnRowDataBound="grdSearch_RowDataBound" >
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
                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + DataBinder.Eval(Container.DataItem, "MenuItemID") %>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>
                                <%--<asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'
                                 CommandName="MenuItem" CommandArgument='<%# Eval("MenuItemID") %>' CausesValidation="false"></asp:LinkButton>--%>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Process Type">
                            <ItemTemplate>
                                <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ingredient">
                            <ItemTemplate>
                                <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vendor">
                            <ItemTemplate>
                                <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" />
                            <HeaderStyle CssClass="gridheaderline" />
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
                    </Columns>
                </asp:GridView>
                <asp:Panel ID="pnlPaging" runat="server">
                    <div class="discp_left_bg" style="text-align:center;">
                        <asp:LinkButton ID="Btn_Previous" CommandName="Previous" OnCommand="ChangePage" Text="Previous" runat="server" CausesValidation="false"></asp:LinkButton>
                        <asp:LinkButton ID="Btn_Next" CommandName="Next" OnCommand="ChangePage" Text="Next" runat="server" CausesValidation="false"></asp:LinkButton>
                    </div>
                    <div class="red_heading">
                        <asp:Label ID="lblCurrentPage" runat="server"></asp:Label><span> of </span><asp:Label ID="lblTotalPages" runat="server"></asp:Label><span> Pages</span>
                    </div>
                </asp:Panel>
            </div>
        </div>       
        <div class="content_right_menu">
            <div class="log_right_view_menu">
                <table width="390" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
                    <tr>
                        <td bgcolor="#E3245A">
                            <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="388" border="0" cellspacing="0" cellpadding="0">
                                <tr align="right">
                                    <td colspan="3" align="left" class="red_heading">
                                        <img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{
                                        Add/Edit Product / Menu Item }
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="red_heading">
                                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text=""></asp:Label>                                        
                                        <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="138" align="right">
                                        Entry Date:
                                    </td>
                                    <td width="10">
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td width="225">
                                        <asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Item Name:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="log_textbox"></asp:TextBox>
                                        <%-- MBS-(03-30-10)
                    BUG ID - 1981--%>
                                        <asp:RegularExpressionValidator ID="REV_txtName" MaxLength="100" Display="None" runat="server"
                                            ControlToValidate="txtName" ErrorMessage="The value in field 'Item Name' is not valid."
                                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="reqValidateName" Enabled="false" ControlToValidate="txtName"
                                            Display="None" ErrorMessage="The value in field Item Name is required." runat="server"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Recipe Number:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRecipeNumber" Width="50px" MaxLength="50" runat="server" CssClass="log_textbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="REV2_txtRecipeNumber" runat="server" ControlToValidate="txtRecipeNumber"
                                            Font-Names="Verdana" Font-Size="10px" Display="None" EnableClientScript="true"
                                            ErrorMessage="Please enter a valid Recipe Number." ValidationExpression="[A-Za-z0-9]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Select Ingredient:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <%--<uc1:MultiCheckDropdown ID="MultiCheckDropdown1" runat="server" Width="150"  />--%>
                                        <asp:Panel ID="Panel111" runat="server" ScrollBars="Vertical" Width="230" Height="150" BackColor="AliceBlue" BorderColor="Gray" BorderWidth="1">
                                            <asp:Repeater ID="rptIngredients" runat="server" 
                                                onitemcommand="rptIngredients_ItemCommand">
                                            <HeaderTemplate>
                                            <table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <tr>
                                            <td>
                                            <asp:CheckBox ID="chkIngredient" Checked='<%# Eval("Selected").ToString() == "1"? true:false %>' oncheckedchanged="chkIngredient_CheckedChanged"  runat="server" AutoPostBack="true" />
                                            <asp:Label ID="lblIngredient" Text='<%# Eval("Name") %>' runat="server"></asp:Label>
                                            <asp:HiddenField ID="hfIngredientId" runat="server" Value='<%# Eval("IngredientID") %>' />
                                            </td>
                                            </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </table>
                                            </FooterTemplate>
                                            </asp:Repeater>
                                            <%--<asp:CheckBoxList ID="chkList" runat="server" Height="150" AutoPostBack="true" 
                                                onselectedindexchanged="chkList_SelectedIndexChanged"></asp:CheckBoxList>--%></asp:Panel>
                                        
                                       <%-- <asp:DropDownList ID="ddlIngredient" runat="server" Width="150px" CssClass="log_textbox"
                                            DataSourceID="ObjectDataSource4" DataTextField="Name" DataValueField="IngredientID"
                                            AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                        <asp:LinkButton ID="cmdSelect" Text="Add" runat="server" ForeColor="Blue" OnClientClick="SetValidator(0)"
                                            CssClass="log_textbox" OnClick="cmdSelect_Click"></asp:LinkButton>--%>
                                        <%--<asp:CustomValidator ID="vldCustom" runat="server" ClientValidationFunction="CustomValidation"
                                            ErrorMessage="" Display="None"></asp:CustomValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblInfo" runat="server" ForeColor="Red" CssClass="log_textbox" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Selected Ingredient(s):
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="lstIngredient" runat="server" CssClass="log_textbox" Width="150px"
                                            SelectionMode="Multiple" ></asp:ListBox>
                                        <%--<asp:LinkButton ID="cmdRemove" Text="Remove" runat="server" ForeColor="Blue" OnClientClick="SetValidator(0)"
                                            OnClick="cmdRemove_Click"></asp:LinkButton>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Preparation:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdbPreMade" Text="Pre-made (Vendor Supplied)" ValidationGroup="Prparation"
                                            runat="server" GroupName="PreparationType" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" alt="" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdbOnsite" Text="Prepared On-site by Recipe" ValidationGroup="Prparation"
                                            runat="server" GroupName="PreparationType" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Process:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rdlProcess" runat="server">
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="reqValidatePreparation" Enabled="false" ControlToValidate="rdlProcess"
                                            Display="None" ErrorMessage="The value in field Process is required." runat="server"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Ready to eat:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rdbYes" Text="Yes" ValidationGroup="ready" runat="server" GroupName="Ready" />
                                        <asp:RadioButton ID="rdbNo" Text="No" ValidationGroup="ready" runat="server" GroupName="Ready" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Instructions to Recipe and/or Instructions:
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRecipe" TextMode="MultiLine" MaxLength="240" Width="150px" runat="server"
                                            Height="60px"></asp:TextBox>
                                    </td>
                                </tr>
                                <%-- <tr>
                  <td align="right">Entry Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" CssClass="log_textbox" /></td>
                  <td><asp:TextBox ID="TextBox1" runat="server" Enabled="false" Width="150px" CssClass="log_textbox"></asp:TextBox></td>
                </tr>--%>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="cmdSubmit" runat="server" ImageUrl="~/images/buttons/ButtonUpdate.png"
                                            OnClientClick="SetValidator(1)" OnClick="cmdSubmit_Click" />
                                        <asp:ImageButton ID="cmdDelete" OnClick="cmdDelete_Click" runat="server" Visible="false"
                                            ImageUrl="~/images/buttons/ButtonDelete.png" />
                                        <asp:ImageButton ID="cmdAdd" runat="server" ImageUrl="~/images/buttons/ButtonAdd.png"
                                            OnClientClick="SetValidator(1)" OnClick="cmdAdd_Click" />
                                        <asp:ImageButton ID="cmdCancel" runat="server" ImageUrl="~/images/buttons/ButtonCancel.png"
                                            CausesValidation="false" OnClick="cmdCancel_Click" />
                                        <asp:HyperLink ImageUrl="~/images/buttons/ButtonFinishContinue.png" NavigateUrl="~/ControlPanel/Kitchen/ViewHACCPPlanNew.aspx"
                                            Target="_blank" runat="server" ID="HyperLink1"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#E3245A">
                            <img src="../../images/District Images/spacer.gif" width="5" height="5" />
                        </td>
                    </tr>
                </table>
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
        <asp:Label ID="lblCurrentPageNumber" runat="server" Visible="false" Text="1"></asp:Label>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetIngredientByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllFoodCategories" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategories">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetMenuItemNewByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <%-- <div class="grey_bg_form"><a href="InventoryItemManager.aspx">Terms Of Use</a>        
        <a href="InventoryItemManager.aspx"> Training Manual</a>
   </div> --%>
    </div>
</asp:Content>
