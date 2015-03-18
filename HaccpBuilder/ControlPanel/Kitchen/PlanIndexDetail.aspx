<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="PlanIndexDetail.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexDetailNew" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Plan Index</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
   <div class="ph-top">
    <asp:ValidationSummary ID="vldSummary" CssClass="msg-error" DisplayMode="List" ShowSummary="true" runat="server" />
    <asp:Label ID="lblError" runat="server" Text="" Visible="false" CssClass="msg-error"></asp:Label>    
  </div>
  <div class="clear"></div>
  <div class="form3">    
    <div class="left">      
      <label>Title: </label>
      <div class="input">
         <asp:TextBox ID="txtPlanTitle" runat="server" MaxLength="100"></asp:TextBox>
				      
      </div>  
      <div class="clear"></div>  
    </div>      
    <div class="left date-marginl"> 
        <label>&nbsp; </label>      
        <div class="input">
        <asp:LinkButton ID="lkbDefault" runat="server" Text="Revert to Default&nbsp;" CssClass="button blue"  oncommand="lkbDefault_Command"></asp:LinkButton>  
        </div>
    </div>   
    <div class="left date-marginl2">
        <label>Active:</label>
        <div class="input">
        	<asp:CheckBox ID="cbActive" runat="server" /></td>
        </div>
    </div>        
    <div class="clear"></div>
  </div>  
  <div class="form3">     
       <h2>Category:</h2>
       <div class="input left">
        <asp:DropDownList ID="ddlCategory" Width="200px" DataSourceID="odsCategory" CssClass="log_textbox" DataTextField="Name" DataValueField="PlanCategoryId" AppendDataBoundItems="false" runat="server" Visible="false">
            <asp:ListItem>Select Category</asp:ListItem>
        </asp:DropDownList>  
        <asp:Label ID="lblCategory" runat="server" CssClass="red_heading"></asp:Label>
        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" Display="None" ErrorMessage="Please Select Category" ControlToValidate="ddlCategory" CssClass="log_textbox" Enabled="false" Font-Names="Verdana"
         Font-Size="10px" InitialValue="Please Select Category" ></asp:RequiredFieldValidator>
       </div>
       <div class="clear"></div>  
   </div>
   <div class="form3">
    <h2 class="left h2margin-r">Content:</h2>
    <div class="input left">
           <FCKeditorV2:FCKeditor ID="txtPlanContent" runat="server" Height="600px"  BasePath="~/fckeditor/" Width="650px">
                </FCKeditorV2:FCKeditor>
    </div>
    <div class="clear"></div>    
  </div>  
   <div class="clear tenpx"></div>
  <div class="form3">
    <div class="right button-margin">        
        <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE"  />
        <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" />
        <asp:Button ID="cmdSubmit" runat="server" CausesValidation="false" OnClick="cmdSubmit_Click" CssClass="button blue" Text="SUBMIT" />          
        <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />          
    </div>
    <div class="clear"></div>
  </div> 
  <div class="clear"></div>
</div>
 <asp:HiddenField ID="hfPlanId" runat="server" />
<asp:HiddenField ID="hfCustom" runat="server" />
<asp:HiddenField ID="hfAdditional" runat="server" />
<asp:HiddenField ID="hfChildId" runat="server" />	
<asp:HiddenField ID="hfPlanCategoryId" runat="server" />
<asp:ObjectDataSource ID="odsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetKitchenPlanCategoryByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenPlanCategory">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>	
</asp:Content>
