<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true"  CodeBehind="ProcessHazardAnalysis.aspx.cs" Inherits="ProcessHazardAnalysis" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<style type="text/css">
        .DisplayDesc { word-wrap: break-word; }
        .DisplayDiv { overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width:150px;}
          
</style> 
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1><asp:Label ID="lblHazardTitle" runat="server" class="red_heading"></asp:Label></h1>
        </div>
      </div>
</div>
<div class="tenpx"></div>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<div class="container">
<asp:Repeater ID="rptHazardAnalysis" runat="server" 
        onitemcommand="rptHazardAnalysis_ItemCommand" 
        onitemdatabound="rptHazardAnalysis_ItemDataBound">
<HeaderTemplate>
    <table class="zebra">
    <tr  >
        <%--<tr style="background-image: url('images/buttons/bg_table_lightred.jpg'); color:#FFFFFF">--%>
        <th>                       
            <%= header[0].ColValue %></th>
        <th >
            <%= header[1].ColValue %></th>
        <th >
            <%= header[2].ColValue %></th>
        <th >
            <%= header[3].ColValue %></th>
        <th >
            <%= header[4].ColValue %></th>
        <th >
            <%= header[5].ColValue %></th>
        <th width="125px">
            <asp:LinkButton ID="lkbEditHeader" runat="server" Text="Edit Header" 
                CommandName="Edit" onclick="lkbEditHeader_Click" ></asp:LinkButton></th>
    </tr>
</HeaderTemplate>
<ItemTemplate>
<tr id="itemPanel" runat="server">
    <td>
        <asp:Label ID="lblProcessStep" runat="server" Text='<%# Eval("ProcessStep")  %>'></asp:Label>
        <asp:HiddenField ID="hfGroupItemId" runat="server" Value='<%# Eval("GroupId")  %>' />
    </td>
    <td>
        <div class="DisplayDiv">
            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryID").ToString() == "1"? "Biological - ": Eval("CategoryID").ToString() == "2"? "Chemical - " : "Physical - " %>'></asp:Label>
            <asp:Label ID="lblHazard"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FoodSafetyHazard") %>'></asp:Label>
        </div>
    </td>
    <td>
        <asp:Label ID="lblBasis" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Basis")  %>'></asp:Label>
    </td>
    <td>
         <asp:Label ID="lblReason" runat="server" Text='<%# Eval("Reason") %>'></asp:Label>
    </td>
    <td>
        <asp:Label ID="lblMeasures" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Measures")  %>'></asp:Label>
    </td>    
    <td>
         <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>
    </td>
    <td>
        <asp:ImageButton ID="lkbEdit" runat="server" ImageUrl="~/images/buttons/edit_icon.png" CommandName="Edit" CommandArgument='<%# Eval("GroupId") %>'></asp:ImageButton>
            <asp:ImageButton ID="lkbDelete" runat="server"  ImageUrl="~/images/buttons/delete_icon.gif" CommandName="Remove" CommandArgument='<%# Eval("GroupId") %>'></asp:ImageButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="lkbUp" ToolTip="Up" runat="server" CommandName="Up" AlternateText="Up" ImageUrl="~/images/buttons/up_arrow.gif" CommandArgument='<%# Eval("GroupId") %>' />             
            <asp:ImageButton ID="lkbDown" ToolTip="Down" runat="server" CommandName="Down" AlternateText="Down" ImageUrl="~/images/buttons/down_arrow.gif" CommandArgument='<%# Eval("GroupId") %>' />
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete"  ConfirmText="Are you sure about deleting this record" runat="server">
            </cc1:ConfirmButtonExtender>       
    </td>
</tr>
</ItemTemplate>
<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>   
<%--<table class="zebra">
<tr  >

    <th>                       
        <%= header[0].ColValue %></th>
    <th >
        <%= header[1].ColValue %></th>
    <th >
        <%= header[2].ColValue %></th>
    <th >
        <%= header[3].ColValue %></th>
    <th >
        <%= header[4].ColValue %></th>
    <th >
        <%= header[5].ColValue %></th>
    <th width="125px">
        <asp:LinkButton ID="lkbEditHeader" runat="server" Text="Edit Header" 
            CommandName="Edit" onclick="lkbEditHeader_Click" ></asp:LinkButton></th>
</tr>
</table>--%>
<%--<asp:GridView ID="grdHazardAnalysis" runat="server" AutoGenerateColumns="false" ShowHeader="false"
        onrowcommand="grdHazardAnalysis_RowCommand" DataKeyNames="GroupId" CssClass="zebra"
        onrowediting="grdHazardAnalysis_RowEditing" 
        onrowdatabound="grdHazardAnalysis_RowDataBound">
<Columns>                                       
    <asp:TemplateField HeaderText="Process Step">
        <ItemTemplate>
            <asp:Label ID="lblProcessStep" runat="server" Text='<%# Eval("ProcessStep")  %>'></asp:Label>
            <asp:HiddenField ID="hfGroupItemId" runat="server" Value='<%# Eval("GroupId")  %>' />
          
        </ItemTemplate>
    </asp:TemplateField>                    
    <asp:TemplateField HeaderText="Food Safety Hazard">
        <ItemTemplate>
        <div class="DisplayDiv">
            <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryID").ToString() == "1"? "Biological - ": Eval("CategoryID").ToString() == "2"? "Chemical - " : "Physical - " %>'></asp:Label>
            <asp:Label ID="lblHazard"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FoodSafetyHazard") %>'></asp:Label>
        </div>
        </ItemTemplate>
    </asp:TemplateField>  
    <asp:TemplateField HeaderText="Reasonably Likely To Occur?">
        <ItemTemplate>
            <asp:Label ID="lblReason" runat="server" Text='<%# Eval("Reason") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>                   
    <asp:TemplateField HeaderText="Basis">
        <ItemTemplate>
            <asp:Label ID="lblBasis" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Basis")  %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="If Yes in Column 3, What Measure Could be Applied to Prevent, Eliminate, or Reduce the Hazard to an Acceptable Level?">
        <ItemTemplate>
            <asp:Label ID="lblMeasures" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Measures")  %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Critical Control Point">
        <ItemTemplate>
            <asp:Label ID="lblCCP" runat="server" Text='<%# Eval("CCP")  %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
     <asp:TemplateField HeaderText="Edit">
	    <ItemTemplate>
	        
	        <asp:ImageButton ID="lkbEdit" runat="server" ImageUrl="~/images/buttons/edit_icon.png" CommandName="Edit" CommandArgument='<%# Eval("GroupId") %>'></asp:ImageButton>
            <asp:ImageButton ID="lkbDelete" runat="server"  ImageUrl="~/images/buttons/delete_icon.gif" CommandName="Remove" CommandArgument='<%# Eval("GroupId") %>'></asp:ImageButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="lkbUp" ToolTip="Up" runat="server" CommandName="Up" AlternateText="Up" ImageUrl="~/images/buttons/up_arrow.gif" CommandArgument='<%# Eval("GroupId") %>' />             
            <asp:ImageButton ID="lkbDown" ToolTip="Down" runat="server" CommandName="Down" AlternateText="Down" ImageUrl="~/images/buttons/down_arrow.gif" CommandArgument='<%# Eval("GroupId") %>' />
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete"  ConfirmText="Are you sure about deleting this record" runat="server">
            </cc1:ConfirmButtonExtender>                        
	    </ItemTemplate>
	</asp:TemplateField >
</Columns>
</asp:GridView>--%>
<div class="tenpx"></div>
<asp:Button ID="lkbAdd"  runat="server" Text="Add" onclick="lkbAdd_Click" /> &nbsp;
<asp:Button ID="lkbCancel"  runat="server" Text="Cancel" onclick="lkbCancel_Click" />
<%--<asp:LinkButton ID="lkbAdd" Text="Add/Edit"  runat="server" onclick="lkbAdd_Click"></asp:LinkButton>--%>


<asp:HiddenField ID="hfProcessId" runat="server" />
<asp:HiddenField ID="hfHazardId" runat="server" />
<asp:HiddenField ID = "hfGroupId" runat="server" />
<asp:HiddenField ID="hfBackGroundColor" runat="server" Value="LightGray" />
<!------------ POP UP CODE ------------------------>

            <asp:Button runat="server" ID="btnShowModalPopup" Style="display: none" />            
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp"  PopupDragHandleControlID="panelDragHandle"/>
            <br />
            <div class="popUpStyleNew" id="divPopup" style="display: none; width:1000px; height:600px;" runat="server">
                <asp:Panel runat="Server" ID="panelDragHandle1" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>
                <br />
               <table border="true" width="80%" height="60%" >
                <tr><td>HAZARD ANALYSIS</td></tr>
                   <caption>
                       Hazard Analysis:
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
                               <asp:TextBox ID="txtProcessStep" runat="server" TextMode="MultiLine" Width="100%" Height="70px"  ></asp:TextBox>
                           </td>
                           <td valign="top" >
                               <table>
                                   <tr>
                                       <td >
                                       Biological:
                                       <asp:TextBox ID="txtHazardBio" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>  
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                       Chemical:
                                       <asp:TextBox ID="txtHazardChem" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>                                       
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                        Physical:
                                        <asp:TextBox ID="txtHazardPhy" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
                           </td>
                           <td valign="top" >
                               <table>
                                   <tr>
                                       <td >
                                           <br />
                                           <asp:TextBox ID="txtReasonBio" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                           <br />
                                           <asp:TextBox ID="txtReasonChem" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                          <br />
                                           <asp:TextBox ID="txtReasonPhy" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
                           </td>
                           <td valign="top" >
                               <table>
                                   <tr>
                                       <td >
                                           <br />
                                           <asp:TextBox ID="txtBasisBio" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                          <br />
                                           <asp:TextBox ID="txtBasisChem" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                            <br />
                                           <asp:TextBox ID="txtBasisPhy" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
                           </td>
                           <td valign="top" >
                               <table>
                                   <tr>
                                       <td >
                                          <br />
                                           <asp:TextBox ID="txtMeasureBio" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                        <br />
                                           <asp:TextBox ID="txtMeasureChem" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                           <br />
                                           <asp:TextBox ID="txtMeasurePhy" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
                           </td>
                           <td valign="top" >
                               <table>
                                   <tr>
                                       <td >
                                        <br />
                                           <asp:TextBox ID="txtCCPBio" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                        <br />
                                           <asp:TextBox ID="txtCCPChem" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td >
                                        <br />
                                           <asp:TextBox ID="txtCCPPhy" runat="server" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                       </td>
                                   </tr>
                               </table>
                           </td>
                       </tr>
                   </caption>
               </table>
               <div class="tenpx"></div>
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
                         </table>  
                            <div class="tenpx"></div>
                                    <asp:Button ID="cmdSubmitHeader" runat="server" onclick="cmdSubmitHeader_Click" 
                                        Text="Submit" />
                                    <asp:Button ID="CmdCancel" runat="server" Text="Cancel" />
                       
                            <br />
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
</asp:Content>
