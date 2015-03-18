<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_MenuRecipe" Codebehind="MenuRecipeOld.aspx.cs" %>
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
                        	<td class="text_bold" align="right" width="180">Date :</td>
                            <td><asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Product/Menu Item :</td>
                            <td><asp:TextBox ID="txtMenu" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Portion Size :</td>
                            <td><asp:TextBox ID="txtPortion" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Yield :</td>
                            <td><asp:TextBox ID="txtYield" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                        	<td class="text_bold" align="right">Written By :</td>
                            <td><asp:TextBox ID="txtWrittenBy" runat="server"></asp:TextBox></td>
                        </tr>
                        
                    </table>
                </td>
                <td valign="bottom"><asp:ImageButton ID="cmdPrint" ImageUrl="~/images/buttons/bt-print.jpg" runat="server" /></td>
			</tr>
		</table>
        </div>      
        
        <div class="S-body-bottom">        	
            <div class="lt">
       	   <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin"
           DataSourceID="ObjectDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Ingredients" >
                        <ItemTemplate>
                            <%--<asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/RecievingLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'></asp:HyperLink>--%>
                            <asp:Label ID="lblIngredient" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
                            <asp:ImageButton ID="cmdUp" runat="server" ImageUrl="~/images/buttons/up.jpg" AlternateText="Up" />
                            <asp:ImageButton ID="cmdDown" runat="server" ImageUrl="~/images/buttons/down.jpg" AlternateText="Down" />
                            <asp:LinkButton ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                                 CommandName="Receiving" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                        </ItemTemplate> 
                    </asp:TemplateField>                     
                    <asp:TemplateField HeaderText="Specifications">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSpecs" runat="server"></asp:TextBox>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                             <asp:TextBox ID="txtEpWeight" runat="server"></asp:TextBox>
                             <asp:TextBox ID="txtEpVolume" runat="server"></asp:TextBox>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EP Weight %">
                        <ItemTemplate>
                            <asp:TextBox ID="txtEPPercent" runat="server"></asp:TextBox>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:BoundField DataField="CCP" HeaderText="CCP/CCL" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />
                    <asp:BoundField DataField="BiologicalHazards" HeaderText="Biological Hazards" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetReceivingLogByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetReceivingLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </div>
            <div class="rt">
           	  <div class="topbar">&nbsp;</div>
                <div class="data">
                	<div class="red_heading">{ Preparation }</div>
                <FCKeditorV2:FCKeditor ID="txtPreparation" FormatOutput="true"  BasePath="~/fckeditor/" runat="server"  Height="1000px" Width="60px">
                </FCKeditorV2:FCKeditor>                 

                </div>
            </div>
            
        </div>
        <div class="grey_bg_form">
          <asp:ImageButton ID="cmdAdd" ImageUrl="~/images/buttons/bt-add-update.jpg" runat="server" />
          <asp:ImageButton ID="cmdDelete" ImageUrl="~/images/buttons/bt-delete.jpg" runat="server" />         
        </div>
    </div>
</asp:Content>

