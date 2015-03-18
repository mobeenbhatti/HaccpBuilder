<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CheckListQuestionCorrectiveActions.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CheckListQuestionCorrectiveActions1" %>
<%@ Register Src="../../Controls/DistrictAddrssNew.ascx" TagName="DistrictAddrssNew"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>CREATE CORRECTIVE ACTIONS FOR CHECKLIST ADD-ON QUESTION</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
     <div class="ph-top">      
      <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false"></asp:Label>
      </div>
   
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="table">
         <div class="box-header"></div>
         <asp:GridView ID="grdCorrectiveAction" runat="server" AutoGenerateColumns="False" CssClass="zebra" OnRowCommand="grdCorrectiveAction_RowCommand">
             <Columns>
                <asp:TemplateField HeaderText="Corrective Action Name" >
                    <ItemTemplate>
                        <asp:HiddenField ID="hfCorrectiveActionId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "CorrectiveActionID")  %>' />
                        <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active" >
                    <ItemTemplate>
                        <asp:Label ID="lblActive" Text='<%# Eval("Active").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" >
                    <ItemTemplate>
                        <asp:LinkButton ID="lkbedit" Text="Edit" CommandName="EditData" CommandArgument='<%# Eval("CorrectiveActionID") %>'
                            runat="server"></asp:LinkButton>
                         <asp:LinkButton ID="lkbdelete" Text="Delete" CommandName="DeleteData" CommandArgument='<%# Eval("CorrectiveActionID") %>'
                            runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>  
         <div class="box-bottom"> </div>     
    </div>
     <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="overlay" PopupDragHandleControlID="panelDragHandle" ></cc1:ModalPopupExtender>
            <br />
            <div class="popUpStyleNew" id="divPopup" style="display: none; width:1010px; height:500px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
               <table border="true" width="100%" height="80%" > 
                       <tr>
                           <td valign="top"  width="16%">
                              Corrective Action
                           </td>
                           <td valign="top">
                               <asp:TextBox ID="txtCorrectiveAction" runat="server" TextMode="MultiLine" Width="100%" Height="220px"></asp:TextBox>
                                <asp:HiddenField ID="hfCorrectiveActionId" runat="server" />    
                           </td>
                        </tr>
                        <tr>
                           <td  valign="top"  width="16%">
                               Mark Active
                           </td>
                           <td valign="top" >
                               <asp:CheckBox ID="chkActive" runat="server" Checked="true" />
                           </td>
                        </tr>                               
               </table>
                <asp:Button ID="cmdGo" runat="server" Text="Submit" onclick="cmdGo_Click" />
                 <asp:Button ID="cmdCancel1" runat="server" Text="Cancel" />
                <br />
            </div>   
            </ContentTemplate>
            </asp:UpdatePanel>      
    <div class="clear tenpx"></div>
      <div class="form3">
          <div class="right button-margin">
                <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Add Corrective Action" CssClass="blue button" />  
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" CssClass="button"  NavigateUrl="~/ControlPanel/District/CustomCheckListQuestion.aspx"></asp:HyperLink>                    
            </div>
        <div class="clear"></div>
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
</div>
</asp:Content>
