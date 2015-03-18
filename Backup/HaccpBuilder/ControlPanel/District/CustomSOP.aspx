<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CustomSOP" Title="HACCP Builder | Custom SOPs" Codebehind="CustomSOP.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
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
          <h1> CREATE CUSTOM SOP, SSOP & GMP's FOR A GROUP </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>Managing, adjusting and creating SOP, SSOP & GMP's with the SOP, SSOP & GMP manager is a simple task.  If you would like to adjust an existing SOP, SSOP & GMP or create a new SOP, SSOP & GMP you have three options:  }</h2>
                <h1><b>1.  REMOVE AN EXISTING SOP, SSOP & GMP:</b> Click on the box next to the SOP, SSOP & GMP you want to remove in the REMOVE column and the system will remove that SOP, SSOP & GMP</h1><br />
       <h1><b>2.  ADJUST/CHANGE AN EXISTING SOP, SSOP & GMP:</b>  Click on the box next to the SOP you want to adjust in the CREATE CUSTOM SOP, SSOP & GMP column and the system will enable you to adjust that SOP, SSOP & GMP</h1><br />
       <h1><b>3.  CREATE A COMPLETE CUSTOM SOP, SSOP & GMP:</b> Click on ADD CUSTOM button and the system will enable you to create a completely customized SOP, SSOP & GMP</h1><br />      
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Select Group: <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2" DataTextField="GroupName" DataValueField="KitchenGroupId" AppendDataBoundItems="true" onselectedindexchanged="ddlKitchen_SelectedIndexChanged" 
        AutoPostBack="True" Height="30px" Width="250px" Font-Names="Verdana">
        <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
        </asp:DropDownList>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">
            <asp:Button ID="cmdAdditionalSOP" Text="Add Additional SOP" onclick="cmdAdditionalSOP_Click" runat="server" />
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
     <asp:GridView ID="grdSOP" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" 
                PageSize="20" DataSourceID="ObjectDataSource1" 
                    onrowdatabound="grdSOP_RowDataBound" onrowcommand="grdSOP_RowCommand">
                <Columns>                  
                    <asp:TemplateField HeaderText="Standard USDA SOP, SSOP & GMP's" >
                        <ItemTemplate>
                        <asp:HiddenField ID="hfSOPId" runat="server" Value='<%# Eval("SOPId") %>' />
                        <asp:Label ID="lblTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Additional Custom">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("IsAdditional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="USDA Default">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDefault" runat="server" Checked='<%# Eval("CustomSOP").ToString() == "0"? true:false %>'
                            Text= '<%# Eval("SOPId") %>' CssClass="HiddenCheckBoxText" AutoPostBack="True" 
                                oncheckedchanged="chkDefault_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRemove" runat="server" Checked='<%# Eval("Removed").ToString() == "1"? true:false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Create Custom" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCustom" runat="server" 
                                Checked='<%# Eval("CustomSOP").ToString() == "1"? true:false %>'
                                 Text= '<%# Eval("SOPId") %>' CssClass="HiddenCheckBoxText"
                                AutoPostBack="True" oncheckedchanged="chkCustom_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Add/EditCustom" >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditSOP" CommandName='<%# Eval("SOPId")%>' Enabled='<%# Eval("CustomSOP").ToString() == "1"? true:false%>' runat="server" Text="Add/Edit"></asp:LinkButton>                            
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSOPByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOP">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKitchen" Name="nSOPGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOPGroup">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource> 
</asp:Content>

