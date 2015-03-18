<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CustomChecklistQuestion.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CustomChecklistQuestion" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
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
          <h1>REATE A CUSTOM CHECK LIST QUESTION</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            Select Checklist Section:   <asp:DropDownList ID="ddlChecklistSection" runat="server"  DataSourceID="EntityDataSource1"
	DataTextField="Name" DataValueField="CheckListSectionId" AutoPostBack="True" AppendDataBoundItems="true" 
	onselectedindexchanged="ddlChecklistSection_SelectedIndexChanged" Height="30px" Width="250px" Font-Names="Verdana">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>       
        </div>
         <div class="right button-margin">       
         <asp:Button ID="cmdAdditionalQuestion" Text="Add Additional Question" runat="server" 
                                onclick="cmdAdditionalQuestion_Click" />
        <asp:Button ID="cmdContinue" align="right" Text="Continue"
                        OnClick="cmdContinue_Click" runat="server" /> 
       
        </div>
         <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>{  Creating editing and updating questions within your individual check lists with a group:  }</h2>
                <h1><b>CREATE A CUSTOM CHECK LIST QUESTION:</b> Click on ADD CUSTOM QUESTION button and you will see a pop-up window so you can create your first and many more questions.</h1><br />
              </div>
        <div class="clear"></div>
    </div>    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="ChecklistQuestionId" CssClass="zebra" onrowdatabound="grdQuestion_RowDataBound" onrowcommand="grdQuestion_RowCommand" >
                <Columns>                   
                    <asp:TemplateField  HeaderText="Question" >
                        <ItemTemplate>    
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("ChecklistQuestionId") %>' />                                              
                        <asp:Label ID="lblQuestion" Text='<%# Eval("Checklist").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField HeaderText="Boolean Option" >
                        <ItemTemplate>
                        <asp:Label ID="lblBool" Text='<%# Eval("BoolActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>	               
                    <asp:TemplateField  HeaderText="Open Field Option" >
                        <ItemTemplate>
                             <asp:Label ID="lblOpen" Text='<%# Eval("OFActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField  HeaderText="Corrective Action" >
                        <ItemTemplate>
                             <asp:Label ID="lblCorrective" Text='<%# Eval("CAActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField >
                    <ItemTemplate>
                        <asp:ImageButton ID="cmdUp" runat="server" ImageUrl="~/images/buttons/up.jpg" CommandName="Up" ToolTip="Up" AlternateText="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' />
                        <asp:ImageButton ID="cmdDown" runat="server" ImageUrl="~/images/buttons/down.jpg" CommandName="Down" ToolTip="Down" AlternateText="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' />
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField  HeaderText="Edit Corrective Action" >
                        <ItemTemplate>
                             <asp:HyperLink ID="hlCorrective" runat="server" Text="Corrective Action" NavigateUrl='<%# "~/ControlPanel/District/CheckListQuestionCorrectiveActions.aspx?CheckListId=" + Eval("ChecklistQuestionId").ToString() + "&SectionId=" + Eval("CheckListSectionId") + "&GroupId=" + Eval("ChecklistGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>                                   
                    <asp:TemplateField  HeaderText="Add/Edit Question" >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditSOP"  CommandName="EditQuestion" CommandArgument='<%# Eval("ChecklistQuestionId") %>' runat="server" Text="Add/Edit"></asp:LinkButton>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete Question" >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbDelete"  CommandName="DeleteQuestion" CommandArgument='<%# Eval("ChecklistQuestionId") %>' runat="server" Text="Delete"></asp:LinkButton>
                           <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete"  ConfirmText="Are you sure about deleting this record" runat="server">
                           </cc1:ConfirmButtonExtender>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>
   <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="overlay" PopupDragHandleControlID="panelDragHandle"></cc1:ModalPopupExtender>
            <br />
            <div class="popUpStyleNew" id="divPopup" style="display: none; width:1010px; height:500px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
               <table border="true" width="80%" > 
                       <tr>
                           <td valign="top"  width="16%">
                               Checklist Question
                           </td>
                           <td valign="top">
                               <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Width="100%" Height="220px"></asp:TextBox>
                                <asp:HiddenField ID="hfQuestionId" runat="server" />    
                           </td>
                        </tr>
                        <tr>
                           <td  valign="top"  width="16%">
                               Mark Active
                           </td>
                           <td valign="top" >
                               <asp:CheckBox ID="chkActive" runat="server" Checked="true"/>
                           </td>
                        </tr>
                        <tr>
                           <td valign="top" width="16%">                               
                              Activate Boolean Option                               
                           </td>
                           <td valign="top">
                               <asp:CheckBox ID="chkBoolean" runat="server" Checked="true"/>
                           </td>
                        </tr>
                        <tr>
                           <td valign="top" width="16%">                               
                                Activate Corrective Actions
                           </td>
                           <td valign="top">
                               <asp:CheckBox ID="chkCorrectiveAction" runat="server" Checked="true"/>
                           </td>
                       </tr>
                       <tr>
                           <td valign="top" width="16%">                               
                                Activate Open field 
                           </td>
                           <td valign="top">
                               <asp:CheckBox ID="chkOpenField" runat="server" Checked="true"/>
                           </td>
                       </tr>   
                       <tr>
                           <td valign="top" width="16%">                               
                                Mark Open field as Required
                           </td>
                           <td valign="top">
                               <asp:CheckBox ID="chkOpenRequired" runat="server" Checked="true"/>
                           </td>
                       </tr>   
                       <tr>
                        <td colspan="2">
                             <asp:Button ID="cmdGo" runat="server" Text="Submit" onclick="cmdGo_Click" />
                             <asp:Button ID="cmdCancel1" runat="server" Text="Cancel" />
                        </td>
                       </tr>               
               </table>
               
                <br />
                 <div class="clear tenpx"></div>
            </div>   
            </ContentTemplate>
            </asp:UpdatePanel>  
<asp:HiddenField ID="hfGroupId" runat="server" />
</div>
 <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                ConnectionString="name=Entities" ContextTypeName="DataModel.Entities"
                DefaultContainerName="Entities" EnableFlattening="False" 
                EntitySetName="ChecklistSections"
                Select="it.[Name], it.[CheckListSectionId],it.[CheckListGroupId]" 
            OrderBy="it.[CheckListGroupId]" 
            Where="it.[CheckListGroupId] = @CheckListGroupId && it.[CheckListSectionId] = @SectionId" EntityTypeFilter="ChecklistSection" >
                <WhereParameters>
                <asp:QueryStringParameter Name="ChecklistGroupId" QueryStringField="GroupId" DbType="Int32" />
                <asp:QueryStringParameter Name="SectionId" QueryStringField="SectionId" DbType="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
</asp:Content>
