<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CustomFoodCategory" Title="HACCP Builder | Custom Food Category" Codebehind="CustomFoodCategory.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function checkDefault(chkDefault, chkCustom, chkRemove) {

        if (chkDefault.checked == true) {
            // chkCustom.checked = false;
            chkRemove.checked = false;
            // lkbEdit.disabled = true;
        }
        else {
            if (chkRemove.checked == false && chkCustom.checked == false) {
                chkDefault.checked = true;
            }
        }

    }
    function checkRemove(chkDefault, chkCustom, chkRemove) {
        if (chkRemove.checked == true) {
            chkCustom.checked = false;
            chkDefault.checked = false;

        }
        else {

            if (chkCustom.checked == false && chkDefault.checked == false) {
                chkRemove.checked = true;
            }
        }

    }
    function checkCustom(chkDefault, chkCustom, chkRemove) {

        if (chkCustom.checked == true) {
            chkRemove.checked = false;
            chkDefault.checked = false;

        }
        else {
            if (chkRemove.checked == false && chkDefault.checked == false) {
                chkCustom.checked = true;
            }
        }

    }
  
</script>
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1>CREATE CUSTOM FOOD CATAGORIES FOR A GROUP </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>{ Managing, adjusting and creating Food Category and Hazards is a simple task.  If you would like to adjust an existing Food Categroy and/or Hazard requirement you have three options:  }</h2>
                <h1><b>1.  REMOVE AN EXISTING FOOD CATEGORY:</b>  Click on the box next to the Food Category you want to remove in the REMOVE Category column and the system will remove that CCP</h1><br />
       <h1><b>2.  ADJUST/CHANGE AN EXISTING FOOD CATEGORY: </b>  Click on the box next to the Food Category you want to adjust in the CREATE CUSTOM CATEGORY column and the system will enable you to adjust that Food Category and/or Hazards</h1><br />
       <h1><b>3.  CREATE A COMPLETE CUSTOM FOOD CATEGORY:</b>  Click on ADD CUSTOM FOOD CATEGORY AND HAZARDS button and the system will enable you to create a completely customized Food Category and Hazards</h1><br />      
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Select Food Category Group: <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2"  DataTextField="GroupName" DataValueField="FoodCategoryGroupId" AppendDataBoundItems="true" Height="30px" Width="250px" Font-Names="Verdana"
    onselectedindexchanged="ddlKitchen_SelectedIndexChanged" AutoPostBack="True">
    <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
    </asp:DropDownList>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">
            <asp:Button ID="cmdAdditionalFoodCategory" Text="Add Additional Food Category" onclick="cmdAdditionalFoodCategory_Click" runat="server" />
            <asp:Button ID="cmdContinue" Text="Continue" OnClick="cmdContinue_Click" runat="server" />
         </div>
        <div class="clear"></div>
    </div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdFoodCategory" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" 
                    onrowdatabound="grdFoodCategory_RowDataBound" onrowcommand="grdFoodCategory_RowCommand">
                <Columns>
                    <asp:TemplateField  HeaderText="Standard USDA" >
                        <ItemTemplate>
                        <asp:HiddenField ID="hfFoodCategoryId" runat="server" Value='<%# Eval("FoodCategoryId") %>' />
                        <asp:Label ID="lblTitle" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("FoodCategory").ToString():Eval("FoodCategory").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                                     
                    <asp:TemplateField HeaderText="Critical Limits"  >
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "~/ControlPanel/District/FoodCategoryCriticalLimit.aspx?GroupId=" + Eval("FoodCategoryGroupId") + "&FoodCategoryId=" + Eval("FoodCategoryId") %>' runat="server" Text="Add/Edit"></asp:HyperLink>                                              
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Additional Custom" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="USDA Default" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDefault" runat="server" Checked='<%# Eval("Custom").ToString() == "0"? true:false %>'
                            Text= '<%# Eval("FoodCategoryId") %>' CssClass="HiddenCheckBoxText" AutoPostBack="True" 
                                oncheckedchanged="chkDefault_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRemove" runat="server" Checked='<%# Eval("Active").ToString() == "1"? false:true %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Create Custom">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCustom" runat="server" 
                                Checked='<%# Eval("Custom").ToString() == "1"? true:false %>'
                                 Text= '<%# Eval("FoodCategoryId") %>' CssClass="HiddenCheckBoxText"
                                AutoPostBack="True" oncheckedchanged="chkCustom_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField  HeaderText="Add/Edit Custom"  >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditFoodCategory" CommandName='<%# Eval("FoodCategoryId")%>' Enabled='<%# Eval("Custom").ToString() == "1"? true:false%>' runat="server" Text="Add/Edit"></asp:LinkButton>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
            
</div>
     </ContentTemplate>            
    </asp:UpdatePanel>
</div>   
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetFoodCategoryByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategory">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKitchen" Name="nFoodCategoryGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategoryGroup">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>       
</asp:Content>

