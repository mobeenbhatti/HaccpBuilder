<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CustomQuestion" Title="HACCP Builder | Custom Food Safety List" Codebehind="CustomQuestion.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolder" Runat="Server">
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
          <h1> CREATE CUSTOM QUESTIONS FOR FOOD SAFETY CHECKLIST GROUP </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>{ Managing, adjusting and creating FSCL Questions with the FSCL manager is a simple task.  If you would like to adjust an existing FSCL Question or create a new FSCL Question you have three options: }</h2>
                <h1><b>1.  REMOVE AN EXISTING FOOD SAFETY CHECK LIST (FSCL) QUESTION</b> Click on the box next to the FSCL question you want to remove in the REMOVE FSCL column and the system will remove that FSCL</h1><br />
       <h1><b>2.  ADJUST/CHANGE AN EXISTING FSCL QUESTION: </b>  Click on the box next to the FSCL question you want to adjust in the CREATE CUSTOM FSCL column and the system will enable you to adjust that FSCL Question</h1><br />
       <h1><b>3.  CREATE A COMPLETE CUSTOM FSCL QUESTION:</b> Click on ADD CUSTOM FSCL QUESTION button and the system will enable you to create a completely customized FSCL Question</h1><br />      
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        Select Checklist Group: <asp:DropDownList ID="ddlChecklistGroup" runat="server"  DataSourceID="ObjectDataSource2" DataTextField="GroupName" DataValueField="CheckListGroupId" AutoPostBack="True" AppendDataBoundItems="true" 
	    onselectedindexchanged="ddlChecklistGroup_SelectedIndexChanged" Height="30px" Width="250px" Font-Names="Verdana">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">         
            <asp:Button ID="cmdAdditionalQuestion" Text="Add Additional Question"  onclick="cmdAdditionalQuestion_Click" runat="server" />   
            <asp:Button ID="cmdContinue" Text="Continue" OnClick="cmdContinue_Click" runat="server" />
            <asp:Button ID="cmdBack" Text="Back"  onclick="cmdBack_Click" runat="server" />
             <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>
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
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" onrowdatabound="grdQuestion_RowDataBound" onrowcommand="grdQuestion_RowCommand" >
                <Columns>
                    <asp:TemplateField  >
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                            <asp:HiddenField ID="hfSectionId" runat="server" Value='<%# Eval("SectionId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Category" >
                        <ItemTemplate>
                        <asp:Label ID="lblTitle" Text='<%# Eval("Section") %>' runat="server"></asp:Label>                       
                        </ItemTemplate>
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Check List (if you do not create a checklist, the default will appear in the kitchen)" >
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("Question").ToString():Eval("Question").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Additional Custom" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="USDA Default" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDefault" runat="server" Checked='<%# Eval("Custom").ToString() == "0"? true:false %>'
                            Text= '<%# Eval("QuestionId") %>' CssClass="HiddenCheckBoxText" AutoPostBack="True"
                             Enabled='<%# (Eval("Active").ToString() == "0" && Eval("Custom").ToString() == "1")? false:true %>'
                                oncheckedchanged="chkDefault_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Remove Questions" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRemove" runat="server" Checked='<%# Eval("Active").ToString() == "1"? false:true %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Create Custom" >
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCustom" runat="server" 
                                Checked='<%# Eval("Custom").ToString() == "1"? true:false %>'
                                 Text= '<%# Eval("QuestionId") %>' CssClass="HiddenCheckBoxText"
                                  Enabled='<%# (Eval("Active").ToString() == "0" && Eval("Custom").ToString() == "1")? false:true %>'
                                AutoPostBack="True"  oncheckedchanged="chkCustom_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Add/Edit Custom" >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditSOP" CommandName='<%# Eval("QuestionId")%>' runat="server" Enabled='<%# Eval("Custom").ToString() == "1"? true:false%>' Text="Add/Edit"></asp:LinkButton>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
            <%--  -----------------------------------------------------------------------------%>            
            </ContentTemplate>            
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetFoodSafetyQuestionByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChecklistGroup" Name="nCheckListGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="1" 
                Name="nPageIndex" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>          
            
</div>
     </ContentTemplate>            
    </asp:UpdatePanel>
</div>     
  <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetCheckListGroup">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource> 
</asp:Content>
