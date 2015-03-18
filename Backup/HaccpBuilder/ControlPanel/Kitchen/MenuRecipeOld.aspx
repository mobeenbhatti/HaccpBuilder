<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuRecipe" Codebehind="MenuRecipeOld.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="bdy_contents">
        <div class="grey_bg_dis">        
        <table width="957" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF"
        style="border:1px solid #e0e0e0;">
        	<tr>
            	<td width="750">
                	<table border="0" cellpadding="0" cellspacing="8">
                	    <tr>
                	    <td>
                	    <asp:ValidationSummary runat="server" />
                	    </td>
                	    </tr>
                    	<tr>
                        	<td class="text_bold" align="right" width="180">Date :</td>
                            <td><asp:HiddenField ID="hfMenuRecipeId" runat="server" />
                            <asp:TextBox ID="txtDate" runat="server" Enabled="false"></asp:TextBox></td>                              
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Product :</td>
                            <td><asp:TextBox ID="txtMenu" runat="server" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Portion Size :</td>
                            <td><asp:TextBox ID="txtPortion" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Yield :</td>
                            <td><asp:TextBox ID="txtYield" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revYield" runat="server" ControlToValidate="txtYield"
				            Display="None" EnableClientScript="true" ErrorMessage="In Yield field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Written By :</td>
                            <td><asp:TextBox ID="txtWrittenBy" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revWrittenBy" runat="server" ControlToValidate="txtWrittenBy"
				            Display="None" EnableClientScript="true" ErrorMessage="In Written By field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>                        
                    </table>
                </td>
                <td valign="bottom"><asp:HyperLink ID="hlPrint" runat="server" ImageUrl="~/images/buttons/bt-print.jpg" Target="_blank"></asp:HyperLink>
               </td>
			</tr>
		</table>
        </div>      
        
        <div class="S-body-bottom">        	
            <div class="lt">
           <asp:ScriptManager ID="scpAjax" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="udpDistrict" runat="server">
            <ContentTemplate>
       	   <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuRecipeDetailID" SkinID="gridviewSkin"
           onrowcommand="grdIngredient_RowCommand">
                <Columns>                                   
                    <asp:TemplateField HeaderText="Inputs" ItemStyle-Width="70px">
                        <ItemTemplate>   
                            <asp:HiddenField ID="hfMenuRecipeDetailId" Value='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' runat="server" />                      
                            <asp:HiddenField ID="hfIngredientId" Value='<%# DataBinder.Eval(Container.DataItem, "IngredientID") %>' runat="server" />
                            <asp:HiddenField ID="hfSortOrder" Value='<%# DataBinder.Eval(Container.DataItem, "SortOrder") %>' runat="server" />
                            <asp:Label ID="lblIngredient" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>                           
                        </ItemTemplate> 
                    </asp:TemplateField> 
                    <asp:TemplateField ItemStyle-Width="25px">
                    <ItemTemplate>
                        <asp:ImageButton ID="cmdUp" runat="server" ImageUrl="~/images/buttons/up.jpg" CommandName="Up" ToolTip="Up" AlternateText="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' />
                        <asp:ImageButton ID="cmdDown" runat="server" ImageUrl="~/images/buttons/down.jpg" CommandName="Down" ToolTip="Down" AlternateText="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' />
                    </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Specifications" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSpecs" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Specs") %>'></asp:TextBox>
                           <%-- <asp:RegularExpressionValidator ID="revSpecs" runat="server" ControlToValidate="txtSpecs"
				            Display="Static" EnableClientScript="true" ErrorMessage="In Specifications field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>--%>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="130px">
                        <ItemTemplate>
                             <asp:TextBox ID="txtEpWeight" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPWeight") %>'></asp:TextBox>
                             <asp:TextBox ID="txtEpVolume" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPVolume") %>'></asp:TextBox>
                            <%-- <asp:RegularExpressionValidator ID="revEPWeight" runat="server" ControlToValidate="txtEpWeight"
				            Display="Static" EnableClientScript="true" ErrorMessage="In EP Weight field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
				            <asp:RegularExpressionValidator ID="revVolume" runat="server" ControlToValidate="txtEpVolume"
				            Display="Static" EnableClientScript="true" ErrorMessage="In EP volume field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>--%>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EP Weight %" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                        <ItemTemplate>                            
                            <asp:TextBox ID="txtEPPercent" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPPercentage") %>'></asp:TextBox>
                            <%--<asp:RegularExpressionValidator ID="revPercent" runat="server" ControlToValidate="txtEpVolume"
				            Display="Static" EnableClientScript="true" ErrorMessage="In EP Weight % field special characters are not allowed (@#$*&)."
				            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>--%>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="CCP" HeaderText="CCP/CCL"  ItemStyle-Width="80px" />--%>
                    <%--<asp:BoundField DataField="BiologicalHazard" HeaderText="Biological Hazards" ItemStyle-Width="100px" />--%>
                </Columns>
            </asp:GridView> 
            </ContentTemplate>
            </asp:UpdatePanel>           
            </div>
            <div class="rt">
           	  <div class="topbar">&nbsp;</div>
                <div class="data">
                	<div class="red_heading">{ Preparation }</div>
                <FCKeditorV2:FCKeditor ID="txtPreparation" FormatOutput="true"  BasePath="~/fckeditor/" runat="server"  Height="600px" Width="250px">
                </FCKeditorV2:FCKeditor>  
                </div>
            </div>
        </div>
        <div class="grey_bg_form">
          <asp:ImageButton ID="cmdAdd" ImageUrl="~/images/buttons/bt-add-update.jpg" 
                runat="server" onclick="cmdAdd_Click" />
          <asp:ImageButton ID="cmdDelete" ImageUrl="~/images/buttons/bt-delete.jpg" 
                runat="server" onclick="cmdDelete_Click" /> 
          <asp:ImageButton ID="cmdCancel" ImageUrl="~/images/buttons/ButtonCancel.png" 
                runat="server" onclick="cmdCancel_Click" />         
        </div>
         <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
         <ProgressTemplate>                     
         <div id="progress">
             <img src="../../images/buttons/ajax-loader1.gif" alt="" />
         </div>                    
         </ProgressTemplate>
         </asp:UpdateProgress>
    </div>
</asp:Content>

