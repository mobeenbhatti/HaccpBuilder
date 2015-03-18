<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_QuestionsReview" Title="HACCP Builder | Questions Review" Codebehind="QuestionsReview.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> Food Safety Questions Review</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
        <asp:Label ID="lblMeassage" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
             Select Checklist Group::   <asp:DropDownList ID="ddlChecklistGroup" runat="server"  DataSourceID="ObjectDataSource2"
	                        DataTextField="GroupName" DataValueField="CheckListGroupId" Height="30px" Width="250px" Font-Names="Verdana"
                            AutoPostBack="True" AppendDataBoundItems="true" onselectedindexchanged="ddlChecklistGroup_SelectedIndexChanged">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                        </asp:DropDownList>  
           
        </div>
         <div class="clear"></div>
    </div>
    <div class="form3">
        <div class="right button-margin">
             <asp:Button ID="cmdContinue" Text="Continue" OnClick="cmdContinue_Click" runat="server" />
             <asp:Button ID="cmdBack" Visible="false" Text="Back"  runat="server"   onclick="cmdBack_Click1" />
             <asp:HyperLink id="hlPrint" Text="Print"   NavigateUrl="~/ControlPanel/District/FoodSafetyChecklistPrint.aspx" Target="_blank"  runat="server"></asp:HyperLink>
        </div>
         <div class="clear"></div>
    </div>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1"
               onrowdatabound="grdQuestion_RowDataBound" 
               onrowcommand="grdQuestion_RowCommand" ondatabound="grdQuestion_DataBound" >
                <Columns>                   
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                         <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                        <asp:LinkButton ID="lkbCategory" Text="Category" CommandName='<%# Eval("Section") %>'  runat="server"></asp:LinkButton>
                        <%--<asp:Label ID="lblTitle" Text='<%# Eval("Section") %>' runat="server"></asp:Label>   --%>                    
                        </ItemTemplate>
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Question">
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("Question").ToString():Eval("Question").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Additional Custom Questions" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField  HeaderText="Question Type">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Custom").ToString() == "0"? "USDA Default":"Custom" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>
</div>  
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedQuestionsByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChecklistGroup" Name="nCheckListGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCheckListGroup">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>           
</asp:Content>

