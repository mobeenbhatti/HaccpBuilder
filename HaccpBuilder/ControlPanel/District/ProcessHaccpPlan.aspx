<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true"  CodeBehind="ProcessHaccpPlan.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.ProcessHaccpPlan" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1><asp:Label ID="lblHazardTitle" runat="server"></asp:Label></h1>
        </div>
      </div>
</div>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<div class="container">
<div class="ph-top"></div>  

<table border="1">
<tr class="zebra">
<%--<tr style="background-image: url('images/buttons/bg_table_lightred.jpg'); color:#FFFFFF">--%>
    <th width="120px">                       
        <%= header[0].ColValue %></th>
    <th width="155px">
        <%= header[1].ColValue %></th>
    <th width="155px">
        <%= header[2].ColValue %></th>
    <th width="125px">
        <%= header[3].ColValue %></th>
    <th width="125px">
        <%= header[4].ColValue %></th>
    <th width="125px">
        <%= header[5].ColValue %></th>
    <th width="125px">
        <asp:LinkButton ID="lkbEditHeader" runat="server" Text="Edit Header" 
            CommandName="Edit" onclick="lkbEditHeader_Click" ></asp:LinkButton></th>
</tr>
</table>
<asp:GridView ID="grdHaccpCategory" runat="server" AutoGenerateColumns="false" ShowHeader="false"
        onrowcommand="grdHaccpCategory_RowCommand" DataKeyNames="HaccpCategoryID" CssClass="zebra"
        onrowediting="grdHaccpCategory_RowEditing">
<Columns>                                       
    <asp:TemplateField HeaderText="CCP">
        <ItemTemplate>
            <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>           
        </ItemTemplate>
        <ItemStyle Width="120px" VerticalAlign="Top" />
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>                    
    <asp:TemplateField HeaderText="Critical Limits">
        <ItemTemplate>            
            <asp:Label ID="lblCriticalLimits" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CriticalLimits") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="150px" VerticalAlign="Top"/>
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>  
    <asp:TemplateField HeaderText="Monitoring">
        <ItemTemplate>
            <asp:Label ID="lblMonitoring" runat="server" Text='<%# Eval("Monitoring") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="150px" VerticalAlign="Top"/>
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>                   
    <asp:TemplateField HeaderText="Haccp Records">
        <ItemTemplate>
            <asp:Label ID="lblHaccpRecords" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "HaccpRecords")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" VerticalAlign="Top"/>
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Verification">
        <ItemTemplate>
            <asp:Label ID="lblVerification" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Verification")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" VerticalAlign="Top"/>
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Corrective Actions">
        <ItemTemplate>
            <asp:Label ID="lbCorrectiveActions" runat="server" Text='<%# Eval("CorrectiveActions")  %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="120px" VerticalAlign="Top"/>
        <HeaderStyle CssClass="gridheaderline" />
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Edit">
	    <ItemTemplate>
	        <%-- <asp:HyperLink ID="hlName" runat="server"  NavigateUrl='<%#"~/ControlPanel/Kitchen/Ingredients.aspx?Id=" + DataBinder.Eval(Container.DataItem, "IngredientID") %>' Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:HyperLink>	--%>
	        <asp:ImageButton ID="lkbEdit" runat="server" ImageUrl="~/images/buttons/edit_icon.png" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'></asp:ImageButton>
            <asp:ImageButton ID="lkbDelete" runat="server"  ImageUrl="~/images/buttons/delete_icon.gif" CommandName="Remove" CommandArgument='<%# Eval("ID") %>'></asp:ImageButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="lkbUp" ToolTip="Up" runat="server" CommandName="Up" AlternateText="Up" ImageUrl="~/images/buttons/up_arrow.gif" CommandArgument='<%# Eval("ID") %>' />             
            <asp:ImageButton ID="lkbDown" ToolTip="Down" runat="server" CommandName="Down" AlternateText="Down" ImageUrl="~/images/buttons/down_arrow.gif" CommandArgument='<%# Eval("ID") %>' />
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete"  ConfirmText="Are you sure about deleting this record" runat="server">
            </cc1:ConfirmButtonExtender>                        
	    </ItemTemplate>
	    <ItemStyle Width="120px" />
	    <HeaderStyle CssClass="gridheaderline" />
	</asp:TemplateField >
</Columns>
</asp:GridView>
<div class="tenpx"></div>
<asp:Button ID="lkbAdd"  runat="server" Text="Add" onclick="lkbAdd_Click" /> &nbsp;
<asp:Button ID="lkbCancel"  runat="server" Text="Cancel"  onclick="lkbCancel_Click" />
<%--<asp:LinkButton ID="lkbAdd" Text="Add/Edit"  runat="server" onclick="lkbAdd_Click"></asp:LinkButton>--%>


<asp:HiddenField ID="hfProcessId" runat="server" />
<asp:HiddenField ID="hfHaccpCategoryId" runat="server" />
<asp:HiddenField ID = "hfGroupId" runat="server" />
<asp:HiddenField ID="hfBackGroundColor" runat="server" Value="LightGray" />
<!------------ POP UP CODE ------------------------>

            <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp" BackgroundCssClass="overlay" PopupDragHandleControlID="panelDragHandle"/>
            <br />
            <div class="popUpStyleNew" id="divPopup" style="display: none; width:1000px; height:600px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
               <table border="true" width="80%" height="60%" >
                <tr><td>Process Haccp Plan</td></tr>
                   <caption>                      
                       <asp:Label ID="lblTitle" runat="server"></asp:Label>
                       </tr>
                       <%--<tr>
                           <td>
                               Process Step</td>
                           <td>
                               Food Safety Hazard</td>
                           <td>
                               Reasonably Likely To Occur?</td>
                           <td>
                               Basis</td>
                           <td>
                               If Yes in Column 3, What Measure Could be Applied to Prevent, Eliminate, or 
                               Reduce the Hazard to an Acceptable Level?</td>
                           <td>
                               Critical Control Point</td>
                       </tr>--%>
                       <tr>
                           <th>
                       
                               <%= header[0].ColValue %></th>
                           <th>
                               <%= header[1].ColValue %></th>
                           <th>
                               <%= header[2].ColValue %></th>
                           <th>
                               <%= header[3].ColValue %></th>
                           <th>
                               <%= header[4].ColValue %></th>
                           <th>
                               <%= header[5].ColValue %></th>
                       </tr>
                       <tr>
                           <td rowspan="3" valign="top">
                               <asp:TextBox ID="txtCCP" runat="server" TextMode="MultiLine" Width="100%" Height="420px"  ></asp:TextBox>
                           </td>
                           <td valign="top" width="16%">
                               <asp:TextBox ID="txtCriticalLimits" runat="server" TextMode="MultiLine" Width="100%" Height="420px"></asp:TextBox>
                           </td>
                           <td valign="top" width="16%">                               
                               <asp:TextBox ID="txtMonitoring" runat="server" TextMode="MultiLine" Width="100%" Height="420px"></asp:TextBox>                                
                           </td>
                           <td valign="top" width="16%">
                               <asp:TextBox ID="txtHaccpRecords" runat="server" TextMode="MultiLine" Width="100%" Height="420px"></asp:TextBox>
                           </td>
                           <td valign="top" width="16%">                               
                                <asp:TextBox ID="txtVerification" runat="server" TextMode="MultiLine" Width="100%" Height="420px"></asp:TextBox>
                           </td>
                           <td valign="top" width="16%">
                                <asp:TextBox ID="txtCorrectiveActions" runat="server" TextMode="MultiLine" Width="100%" Height="420px"></asp:TextBox>
                           </td>
                       </tr>
                   </caption>
               </table>
                <asp:Button ID="cmdGo" runat="server" Text="Submit" onclick="cmdGo_Click" />
                 <asp:Button ID="cmdCancel1" runat="server" Text="Cancel" />
                <br />
            </div>
            <div class="popUpStyleNew" id="divPopupHeader" style="display: none; width:1010px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle2" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
                <table width="100%">
                <tr>
                <td width="20%">Edit Header Columns</td>
                <td width="80%"></td>
                </tr>
                    <tr>
                        <td>
                            Hazard Anaysis Title</td>
                        <td>
                            <asp:TextBox ID="txtHazardTitle" runat="server" TextMode="MultiLine" 
                                Width="100%"></asp:TextBox>
                            <tr>
                                <td>
                                    Column 1</td>
                                <td>
                                    <asp:TextBox ID="txtCol1" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Column 2</td>
                                <td>
                                    <asp:TextBox ID="txtCol2" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Column 3</td>
                                <td>
                                    <asp:TextBox ID="txtCol3" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol3" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Column 4</td>
                                <td>
                                    <asp:TextBox ID="txtCol4" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol4" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Column 5</td>
                                <td>
                                    <asp:TextBox ID="txtCol5" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol5" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Column 6</td>
                                <td>
                                    <asp:TextBox ID="txtCol6" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    <asp:HiddenField ID="hfCol6" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="cmdSubmitHeader" runat="server" onclick="cmdSubmitHeader_Click" 
                                        Text="Submit" />
                                    <asp:Button ID="CmdCancel" runat="server" Text="Cancel" />
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>                
                <br />
            </div>
</div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
