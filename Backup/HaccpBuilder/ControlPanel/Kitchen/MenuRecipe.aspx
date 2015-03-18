<%@ Page Title="HACCP Builder | Menu Recipe" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="MenuRecipe.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.MenuRecipeNew" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Menu Recipe</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container"><!----CONTAINER-START----->
  <div class="ph-top">
    <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" ShowSummary="true" runat="server" />
    <asp:Label ID="lblError" runat="server" Text="" Visible="false" CssClass="msg-error"></asp:Label>    
  </div>
  <div class="clear"></div>
  <div class="form3">    
    <div class="left">      
      <label>Date: </label>
      <div class="input">
         <asp:TextBox ID="txtDate" runat="server" Enabled="false"></asp:TextBox>         
      </div>    
    </div>      
    <div class="left date-marginl">
        <label>Product</label>
        <div class="input">
        <asp:TextBox ID="txtMenu" runat="server" Enabled="false"></asp:TextBox>
        </div>
    </div>   
    <div class="left date-marginl2">
        <label>Portion Size</label>
        <div class="input">
        <asp:TextBox ID="txtPortion" runat="server"></asp:TextBox>
        </div>
    </div>        
    <div class="clear"></div>
  </div>      
  <div class="form3">    
    <div class="left">      
      <label>Yield: </label>
      <div class="input">
        <asp:TextBox ID="txtYield" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revYield" runat="server" ControlToValidate="txtYield"
		Display="None" EnableClientScript="true" ErrorMessage="In Yield field special characters are not allowed (@#$*&)."
		ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>      
      </div>    
    </div>      
    <div class="left date-marginl">
        <label>Written By:</label>
        <div class="input">
        <asp:TextBox ID="txtWrittenBy" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revWrittenBy" runat="server" ControlToValidate="txtWrittenBy"
		Display="None" EnableClientScript="true" ErrorMessage="In Written By field special characters are not allowed (@#$*&)."
		ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
        </div>
    </div>   
    <div class="right button-margin">
        <asp:HyperLink ID="hlPrint" runat="server" CssClass="button blue" Text="PRINT" Target="_blank"></asp:HyperLink>
    </div>        
    <div class="clear"></div>
  </div>       
   <div class="clear"></div>
  <a href="#" class="show_hide"><h2>Preparation</h2></a>
  <div class="slidingDiv" style="display: block;">
  <div class="form3">
    <h2 class="left h2margin-r"></h2>
    <div class="input left">
          <FCKeditorV2:FCKeditor ID="txtPreparation" FormatOutput="true"  BasePath="~/fckeditor/" runat="server"  Height="400px" Width="1100px">
                </FCKeditorV2:FCKeditor>   
    </div>
    <div class="clear"></div>    
  </div>  
   <div class="clear tenpx"></div>
  <div class="form3">
    <div class="right button-margin">        
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" />
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />          
    </div>
    <div class="clear"></div>
  </div>
  </div>
  <div class="clear"></div>
   <asp:ScriptManager ID="scpAjax" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="udpDistrict" runat="server">
    <ContentTemplate>
  <div class="table">
    <div class="box-header">
      <h4 class="left"></h4>
    </div>
   <asp:GridView ID="grdIngredient" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuRecipeDetailID" CssClass="zebra" onrowcommand="grdIngredient_RowCommand">
        <Columns>                                   
            <asp:TemplateField HeaderText="Inputs">
                <ItemTemplate>   
                    <asp:HiddenField ID="hfMenuRecipeDetailId" Value='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' runat="server" />                      
                    <asp:HiddenField ID="hfIngredientId" Value='<%# DataBinder.Eval(Container.DataItem, "IngredientID") %>' runat="server" />
                    <asp:HiddenField ID="hfSortOrder" Value='<%# DataBinder.Eval(Container.DataItem, "SortOrder") %>' runat="server" />
                    <asp:Label ID="lblIngredient" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>                           
                </ItemTemplate> 
            </asp:TemplateField> 
            <asp:TemplateField >
            <ItemTemplate>
                <asp:ImageButton ID="cmdUp" runat="server" ImageUrl="~/images/buttons/up.jpg" CommandName="Up" ToolTip="Up" AlternateText="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' />
                <asp:ImageButton ID="cmdDown" runat="server" ImageUrl="~/images/buttons/down.jpg" CommandName="Down" ToolTip="Down" AlternateText="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MenuRecipeDetailID") %>' />
            </ItemTemplate>
            </asp:TemplateField>                    
            <asp:TemplateField HeaderText="Specifications">
                <ItemTemplate>
                    <asp:TextBox ID="txtSpecs" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Specs") %>'></asp:TextBox>                          
                </ItemTemplate>                        
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edible Portion(EP) Weight or Volume" >
                <ItemTemplate>
                        <asp:TextBox ID="txtEpWeight" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPWeight") %>'></asp:TextBox>
                        <asp:TextBox ID="txtEpVolume" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPVolume") %>'></asp:TextBox>                           
                </ItemTemplate>                       
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EP Weight %">
                <ItemTemplate>                            
                    <asp:TextBox ID="txtEPPercent" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "EPPercentage") %>'></asp:TextBox>                           
                </ItemTemplate>                        
            </asp:TemplateField>                   
        </Columns>
    </asp:GridView>  
    <div class="box-bottom"> </div>  
  </div>
  </ContentTemplate>
            </asp:UpdatePanel>
</div>
<asp:HiddenField ID="hfMenuRecipeId" runat="server" />
  <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
         <ProgressTemplate>                     
         <div id="progress">
             <img src="../../images/buttons/ajax-loader1.gif" alt="" />
         </div>                    
         </ProgressTemplate>
         </asp:UpdateProgress>
</asp:Content>
