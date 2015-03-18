<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_Ingredients" Title="HACCP Builder | Ingredients" Codebehind="IngredientsOld.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../../Controls/Pager.ascx" tagname="Pager" tagprefix="uc2" %>
<%@ MasterType VirtualPath="~/ControlPanel/Kitchen/MasterPage2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function SetValidator(status)
{
     
     var vldNameControl = document.getElementById('PlaceHolder_RequiredFieldValidator1');
     var vldContactControl = document.getElementById('PlaceHolder_RequiredFieldValidator2');
     var vldPhoneControl = document.getElementById('PlaceHolder_RequiredFieldValidator3');
    
     
//     var vldVerifiedControl = document.getElementById('PlaceHolder_RequiredFieldValidator4');
//     var vldCorrectiveControl = document.getElementById('PlaceHolder_reqValidateCorrectiveAction');
//     var vldTrainingControl = document.getElementById('PlaceHolder_reqValidateTraining');
     
     if(status == 1)
     {
         ValidatorEnable(vldNameControl, true);
         ValidatorEnable(vldContactControl, true);
         ValidatorEnable(vldPhoneControl, true);
        
//         ValidatorEnable(vldVerifiedControl, true);
//         ValidatorEnable(vldCorrectiveControl, true);
//         ValidatorEnable(vldTrainingControl, true);
     }
     else
     {
         ValidatorEnable(vldNameControl, false);
         ValidatorEnable(vldContactControl, false);
         ValidatorEnable(vldPhoneControl, false);
         
//         ValidatorEnable(vldVerifiedControl, false);
//         ValidatorEnable(vldCorrectiveControl, false);
//         ValidatorEnable(vldTrainingControl, false);
     }
 }
function OnClientPopulating(sender, e) {
    sender._element.className = "loading";
}
function OnClientCompleted(sender, e) {
    sender._element.className = "";
}
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp1"
                BackgroundCssClass="popUpStyle"
                PopupDragHandleControlID="panelDragHandle1"
                DropShadow="true"
                />
            <br />
             
            <div class="popUpStyle" id="divPopUp1" style="display:none;" runat="server">
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
               <%--<div style="position: absolute; top: -12px; right: -5px;">
                    <asp:ImageButton runat="server" ID="Btn_POPUpClose" ImageUrl="~/images/District Images/POPUP_Close.png" />
                </div>
               <br />--%>
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
           <%-- </div> --%>
            </asp:Panel>
     </ContentTemplate>
    </asp:UpdatePanel>          
    <div class="bdy_contents">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <div class="log_form_left">
    <div class="grey_bg_left">
	    <table  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="red_heading" colspan="3">{ INPUT IDENTIFICATION: <span class="SecondaryHeading"> STEP <span style="color:Black;">EIGHT</span> OF NINE BUILDING YOUR HACCP PLAN </span> }</td>                                  
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr> 
                 <tr>
                  <td colspan="3"><asp:HyperLink ImageUrl="~/images/buttons/ButtonBackToProduct.png" Width="180" Height="30"
                                  NavigateUrl="~/ControlPanel/Kitchen/MenuItemManager.aspx" runat="server" ID="HyperLink2"></asp:HyperLink></td>                                  
                </tr>                            
              </table>
	</div>		
    <div class="discp_left_bg">
	    <table  border="0" cellspacing="0" cellpadding="1">
                <tr>
                  <td align="center" >Input Name:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtSearch" runat="server"  ></asp:TextBox>
                   <asp:Panel ID="dropdown" Height="100px" ScrollBars="Vertical" runat="server"></asp:Panel>
                   <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" CompletionListElementID="dropdown" MinimumPrefixLength="1" 
                         ServiceMethod="GetIngredients" ServicePath="~/AutoCompleteService.asmx" TargetControlID="txtSearch"
                         OnClientHiding="OnClientCompleted" OnClientPopulated="OnClientCompleted" OnClientPopulating="OnClientPopulating">  
                   </cc1:AutoCompleteExtender> 
                  </td>
                   <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <asp:ImageButton ID="cmdSearch"  runat="server"  ImageUrl="~/images/District Images/ButtonGo.png"
                        OnClientClick="SetValidator(0)" onclick="cmdSearch_Click" ImageAlign="AbsMiddle" /></td>
                  <td>
                       <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                  </td>
                   <td>
                       <asp:ImageButton ID="cmdBack" runat="server" ImageUrl="~/images/District Images/ButtonBackToList.png"
                            OnClientClick="SetValidator(0)" OnClick="cmdBackToList_Click" ImageAlign="AbsMiddle" Visible="false" />
                  </td>                 
                </tr>                            
              </table>
	</div>
	 
	<div class="grid_left">	  	  
        <asp:GridView ID="grdHotHolding"  runat="server" SkinID="gridviewSkin" AutoGenerateColumns="False" OnRowCommand="grdHotHolding_RowCommand"  >                
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
	                    <asp:TemplateField HeaderText="Input ">
	                        <ItemTemplate>
	                           <%-- <asp:HyperLink ID="hlName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Ingredients.aspx?Id=" + DataBinder.Eval(Container.DataItem, "IngredientID") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>	--%>
	                           <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                           <%--<asp:HyperLink ID="hlFoodCategory" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Ingredients.aspx?Id=" + DataBinder.Eval(Container.DataItem, "IngredientID") %>' Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:HyperLink>--%>
	                           <asp:LinkButton ID="hlFoodCategory" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>	                           
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
        <asp:GridView ID="grdSearch" runat="server" SkinID="gridviewSkin" AutoGenerateColumns="False" 
                     Visible="false" OnRowCommand="grdHotHolding_RowCommand"  >                
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
	                    <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                            <%--<asp:HyperLink ID="hlName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Ingredients.aspx?Id=" + DataBinder.Eval(Container.DataItem, "IngredientID") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>--%>
	                            <asp:LinkButton ID="hlName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton> 	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                   <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                          <%-- <asp:HyperLink ID="hlFoodCategory" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Ingredients.aspx?Id=" + DataBinder.Eval(Container.DataItem, "IngredientID") %>' Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:HyperLink>--%>
	                           <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>' CommandName="Ingredient" CommandArgument='<%# Eval("IngredientID") %>'></asp:LinkButton>	                           
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
	                    <%-- <asp:TemplateField HeaderText="View Food Categories">
	                        <ItemTemplate>
	                             <asp:LinkButton ID="lkbHazard" Text="View" CommandName="Hazard" CommandArgument='<%# Eval("FoodCategoryId") %>'  runat="server" 
                               ></asp:LinkButton>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	--%>
	                     <asp:TemplateField HeaderText="View Hazards & CCP/CP">
	                        <ItemTemplate>
	                             <asp:LinkButton ID="lkbHazard" Text="View" Enabled='<%# Eval("FoodCategory").ToString()== ""? false: true%>' CommandName="Hazard" CommandArgument='<%# Eval("FoodCategoryId") %>'  runat="server" 
                               ></asp:LinkButton>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%--<asp:TemplateField HeaderText="View CCP">
	                        <ItemTemplate>
	                            <asp:LinkButton ID="lkbCCP" Text="View CCP" CommandName="CCP" CommandArgument='<%# Eval("CCPId") %>'  runat="server" 
                               ></asp:LinkButton>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	--%>	
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
            <uc2:Pager ID="custPager" runat="server" OnPageChanged="custPager_PageChanged"/>
           <%-- <asp:LinkButton ID="Btn_Previous" CommandName="Previous" OnCommand="ChangePage" Text="Previous" runat="server"></asp:LinkButton>
            <asp:LinkButton ID="Btn_Next" CommandName="Next" OnCommand="ChangePage" Text="Next" runat="server"></asp:LinkButton>--%>
        </div>
       <%-- <div class="red_heading">
            <asp:Label ID="lblCurrentPage" runat="server"></asp:Label><span> of </span><asp:Label ID="lblTotalPages" runat="server"></asp:Label><span> Pages</span>
        </div>--%></asp:Panel>
    </div>
   
	</div> 
	<div class="content_right"> 
    <div class="grey_bg_right">
    <table  border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td>&nbsp;</td>
            </tr>
            <tr>
              <td align="right" width="138" >Upload Inputs from file: </td> 
              <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
              <td width="220"><asp:FileUpload ID="File1" runat="server"  /></td>                                 
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
            <td ><asp:Button ID="cmdDownload" Text="Get Food Categories" runat="server" Width="150px" 
            OnClientClick="SetValidator(0)" onclick="cmdDownload_Click" />
            <asp:Button ID="cmdGetFormat" runat="server" Text="Get Upload Format" OnClientClick="SetValidator(0)" Width="150px"
                  onclick="cmdGetFormat_Click" />
            <asp:Button ID="cmdUpload" Text="Upload" runat="server" 
            OnClientClick="SetValidator(0)" onclick="cmdUpload_Click" /></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>                                       
    </table>
    </div>
    <div class="log_right_view">
          <table width="370" border="0" cellpadding="0" cellspacing="0" class="table_form_view">
            <tr>
              <td bgcolor="#E3245A"><img src="../../images/District Images/spacer.gif" width="5" height="5" /></td>
            </tr>
            <tr>
              <td><table width="368" border="0" cellspacing="0" cellpadding="0">
                <tr align="right">
                  <td colspan="3" align="left" class="red_heading"><img src="../../images/District Images/spacer.gif" width="10" height="30" align="absmiddle" />{ Add/Edit Input }</td>
                </tr>
                <tr>
                <td colspan="3" class="red_heading">
                <asp:ValidationSummary ID="vldSummary" DisplayMode="List" ShowSummary="true" runat="server" />
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:HyperLink ID="hlDownLoadInvalidIngredient" Visible="false" NavigateUrl="~/ControlPanel/Kitchen/Data/csvInValidIngredient.csv" runat="server">Click Here</asp:HyperLink>
                <asp:HiddenField ID="hfIngredientId" runat="server" />
                </td>
                </tr>
                <tr>
                  <td width="138" align="right">Entry Date:</td>
                  <td width="10"><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td width="225"><asp:TextBox ID="txtEntryDate" runat="server" Enabled="false" CssClass="log_textbox" ></asp:TextBox></td>
                </tr>
                <tr>
                  <td align="right">Input Name:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:TextBox ID="txtIngredientName" runat="server" CssClass="log_textbox"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="false" runat="server" Display="None" 
                    ErrorMessage="The value in field Ingredient Name is required" ControlToValidate="txtIngredientName"  Font-Names="Verdana" Font-Size="10px" ></asp:RequiredFieldValidator> 
                  </td>
                </tr>
                <tr>
                  <td align="right">Vendor Name</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlVendor" runat="server" Width="250px" CssClass="log_textbox" DataSourceID="ObjectDataSource2" DataTextField="VendorName" DataValueField="VendorID" AppendDataBoundItems="true">
                    <asp:ListItem>Select Vendor</asp:ListItem>
                     </asp:DropDownList>                     
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="false" runat="server" Display="None" 
                      InitialValue="Select Vendor"  ErrorMessage="The value in field Vendor Name is required" ControlToValidate="ddlVendor"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                  <td align="right">Related Food Category:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:DropDownList ID="ddlFoodCategory" runat="server" Width="250px" CssClass="log_textbox" DataSourceID="ObjectDataSource3" DataTextField="FoodCategory" DataValueField="FoodCategoryId" AppendDataBoundItems="true">
                            <asp:ListItem>Select Food Category</asp:ListItem>
                         </asp:DropDownList>
                     <asp:Label ID="lblFoodCategory" runat="server" Text="NA"></asp:Label>                     
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Enabled="false" runat="server" Display="None" 
                      InitialValue="Select Food Category"  ErrorMessage="The value in field Food Category is required" ControlToValidate="ddlFoodCategory"  Font-Names="Verdana" Font-Size="10px"
                             ></asp:RequiredFieldValidator>
                  </td>
                </tr>
                
                <tr>
                  <td align="right">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>
                   <asp:ImageButton ID="cmdSubmit" runat="server" 
                         ImageUrl="~/images/buttons/ButtonUpdate.png"  OnClientClick="SetValidator(1)"  onclick="cmdSubmit_Click" />
                    <asp:ImageButton ID="cmdDelete"  onclick="cmdDelete_Click" runat="server" Visible="false" ImageUrl="~/images/buttons/ButtonDelete.png" />
                    <asp:ImageButton ID="cmdAdd" runat="server" 
                         ImageUrl="~/images/buttons/ButtonAdd.png" OnClientClick="SetValidator(1)"  onclick="cmdAdd_Click" />
                    <asp:ImageButton ID="cmdCancel" runat="server" 
                         ImageUrl="~/images/buttons/ButtonCancel.png" OnClientClick="SetValidator(0)"  onclick="cmdCancel_Click" />                  
                   <asp:ImageButton ID="cmdContinue" runat="server" OnClientClick="SetValidator(0)" 
                         ImageUrl="~/images/buttons/ButtonFinishContinue.png" onclick="cmdContinue_Click"/>
                  </td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
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
  <%--  <div class="grey_bg_form"><a href="InventoryItemManager.aspx">Terms Of Use</a>        
        <a href="InventoryItemManager.aspx"> Training Manual</a>
    </div>--%>
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
    </div>
   
</asp:Content>

