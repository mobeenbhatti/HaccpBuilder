<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CustomCtpat.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CustomCtpat" %>
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
          <h1>CREATE CUSTOM C-TPAT's FOR A GROUP </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>{ Managing, adjusting and creating C-TPAT's with the C-TPAT manager is a simple task.  If you would like to adjust an existing C-TPAT or create a new C-TPAT you have three options:  }</h2>
                <h1><b>1.  REMOVE AN EXISTING C-TPAT:</b> Click on the box next to the C-TPAT you want to remove in the REMOVE column and the system will remove that C-TPAT</h1><br />
       <h1><b>2.  ADJUST/CHANGE AN EXISTING C-TPAT:</b>  Click on the box next to the Ctpat you want to adjust in the CREATE CUSTOM C-TPAT column and the system will enable you to adjust that C-TPAT</h1><br />
       <h1><b>3.  CREATE A COMPLETE CUSTOM C-TPAT:</b> Click on ADD CUSTOM button and the system will enable you to create a completely customized C-TPAT</h1><br />      
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Select Group: <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2"
	 DataTextField="GroupName" DataValueField="GroupId" AppendDataBoundItems="true" onselectedindexchanged="ddlKitchen_SelectedIndexChanged" 
    AutoPostBack="True" Height="30px" Width="250px" Font-Names="Verdana">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>     
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">
            <asp:Button ID="cmdAdditionalCtpat" Text="Add Additional C-Tpat" onclick="cmdAdditionalCtpat_Click" runat="server" />
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
     <asp:GridView ID="grdCtpat" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" 
                PageSize="20" DataSourceID="ObjectDataSource1" 
                    onrowdatabound="grdCtpat_RowDataBound" onrowcommand="grdCtpat_RowCommand">
                <Columns>
                    <asp:TemplateField  HeaderText="Standard  C-TPAT's" >
                        <ItemTemplate>
                         <asp:HiddenField ID="hfCtpatId" runat="server" Value='<%# Eval("CtpatId") %>' />
                        <asp:Label ID="lblTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>        
                    <asp:TemplateField    HeaderText="Additional Custom" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("IsAdditional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField    HeaderText=" Default" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDefault" runat="server" Checked='<%# Eval("CustomCtpat").ToString() == "0"? true:false %>'
                            Text= '<%# Eval("CtpatId") %>' CssClass="HiddenCheckBoxText" AutoPostBack="True" 
                                oncheckedchanged="chkDefault_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Remove"   >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRemove" runat="server" Checked='<%# Eval("Removed").ToString() == "1"? true:false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Create Custom"   >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCustom" runat="server" 
                                Checked='<%# Eval("CustomCtpat").ToString() == "1"? true:false %>'
                                 Text= '<%# Eval("CtpatId") %>' CssClass="HiddenCheckBoxText"
                                AutoPostBack="True" oncheckedchanged="chkCustom_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField   HeaderText="Add/EditCustom"   >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditCtpat" CommandName='<%# Eval("CtpatId")%>' Enabled='<%# Eval("CustomCtpat").ToString() == "1"? true:false%>' runat="server" Text="Add/Edit"></asp:LinkButton>                            
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCtpatByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCtpat">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKitchen" Name="nCtpatGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetCtpatGroup">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource> 
</asp:Content>