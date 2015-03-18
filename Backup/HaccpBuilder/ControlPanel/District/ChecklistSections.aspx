<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="ChecklistSections.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.ChecklistSections" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1>CREATING CUSTOM CHECK LIST GROUPS</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
            Select Checklist Group:  <asp:DropDownList ID="ddlChecklistGroup" runat="server"  DataSourceID="EntityDataSource2"
	DataTextField="GroupName" DataValueField="CheckListAddonGroupId" AutoPostBack="True" AppendDataBoundItems="true" 
	onselectedindexchanged="ddlChecklistGroup_SelectedIndexChanged" Height="30px" Width="250px" Font-Names="Verdana">
    <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
    </asp:DropDownList>  
        </div>
         <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="left">
        Add/Create New Checklist Section: <asp:TextBox ID="txtSectionName" runat="server" CssClass="district_TextBox"></asp:TextBox>
        <asp:Button ID="cmdSearch"  runat="server" Text="Go"  onclick="cmdSearch_Click"/>
        </div>
        <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="left">            
            <h2>{  CREATING CUSTOM CHECK LIST GROUPS:  }</h2>
                <h1><b>Type in the name you want to call the Custom Check List Group that you wish to create and then click GO</h1><br />
       <h1><b>{ TO EDIT AND CUSTOMIZE CHECK LIST QUESTIONS IN GROUP:  }</h1><br />
       <h1><b>Now, to create questions in the group, simply click on the Add/Edit hotlink to the right of the GROUP name you created and begin entering your questions for your individual Check List<br /> </h1><br />      
        </div>
        <div class="clear"></div>
    </div>    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Sections</h4>
    </div>
     <asp:GridView ID="grdChecklistAddOnGroup" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" 
                PageSize="20" onrowcommand="grdChecklistAddOnGroup_RowCommand" >                
                <Columns>    
                    <asp:TemplateField HeaderText="Checklist Add On Section Name" HeaderStyle-HorizontalAlign="Center"  >
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEdit"  CommandName="EditSection" CommandArgument='<%# Eval("CheckListSectionId") %>' runat="server" Text='<%# Eval("Name") %>'></asp:LinkButton>                            
                        </ItemTemplate>
                    </asp:TemplateField>             
                    
	                <asp:TemplateField HeaderText="Add/Edit Checklist Questions" >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditQuestion" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/CustomChecklistQuestion.aspx?SectionId=" + DataBinder.Eval(Container.DataItem, "CheckListSectionId") + "&GroupId=" +  DataBinder.Eval(Container.DataItem, "CheckListGroupId") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="View Checklist Questions"  >
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="View Questions" NavigateUrl='<%# "~/ControlPanel/District/ChecklistQuestionsReview.aspx?SectionId=" + DataBinder.Eval(Container.DataItem,"CheckListSectionId") + "&GroupId=" +  DataBinder.Eval(Container.DataItem, "CheckListGroupId") %>' ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>
    <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="overlay" PopupDragHandleControlID="panelDragHandle" ></cc1:ModalPopupExtender>
            <br />
            <div class="popUpStyleNew" id="divPopup" style="display: none; width:1010px; height:200px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
               <table border="true" width="100%" height="50%" > 
                       <tr>
                           <td valign="top"  width="16%">
                               Edit Section Name
                           </td>
                           <td valign="top">
                               <asp:TextBox ID="txtSection" runat="server" Width="100%"></asp:TextBox>
                                <asp:HiddenField ID="hfSectionId" runat="server" />    
                           </td>
                        </tr>                        
               </table>
                <asp:Button ID="cmdGo" runat="server" Text="Submit" onclick="cmdGo_Click" />
                 <asp:Button ID="cmdCancel1" runat="server" Text="Cancel" />
                <br />
            </div>   
            </ContentTemplate>
            </asp:UpdatePanel>  
</div>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" 
        ConnectionString="name=Entities" ContextTypeName="DataModel.Entities"
        DefaultContainerName="Entities" EnableFlattening="False" 
        EntitySetName="CheckListAddonGroups"
        Select="it.[CheckListAddonGroupId], it.[GroupName], it.[DistrictId]" OrderBy="it.[CheckListAddonGroupId]" Where="it.[DistrictId] = @DistrictId"
        >
        <WhereParameters>
        <asp:SessionParameter DbType="Int32" Name="DistrictId" SessionField="DistrictId" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
