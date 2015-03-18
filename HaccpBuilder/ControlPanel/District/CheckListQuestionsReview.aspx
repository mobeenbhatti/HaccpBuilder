<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CheckListQuestionsReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CheckListQuestionsReview" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>CheckList Questions Review</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
     <div class="ph-top">      
      <asp:Label ID="lblError" runat="server" CssClass="msg-error" Visible="false"></asp:Label>
      </div>
    <div class="form3">
      Select Checklist Sectione: <asp:DropDownList ID="ddlChecklistSection" runat="server"  DataSourceID="EntityDataSource1"
	                        DataTextField="Name" DataValueField="CheckListSectionId" Height="30px" Width="250px" Font-Names="Verdana"
                            AutoPostBack="True" AppendDataBoundItems="true" onselectedindexchanged="ddlChecklistSection_SelectedIndexChanged">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                        </asp:DropDownList> 
    </div>
    <div class="form3">
        <div class="left">
           
        </div>
        <div class="clear"></div>
    </div>
    <div class="table">
         <div class="box-header"></div>
         <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra">
                <Columns>                                                  
                    <asp:TemplateField  HeaderText="Question" >
                        <ItemTemplate>  
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("ChecklistQuestionId") %>' />                                                   
                        <asp:Label ID="lblQuestion" Text='<%# Eval("Checklist").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Boolean Option Ative" >
                        <ItemTemplate>
                        <asp:Label ID="lblBool" Text='<%# Eval("BoolActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField  HeaderText="Corrective Action Active" >
                        <ItemTemplate>
                             <asp:Label ID="lblCorrective" Text='<%# Eval("CAActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Open Field Option Active" >
                        <ItemTemplate>
                             <asp:Label ID="lblOpen" Text='<%# Eval("OFActive").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                </Columns>                
            </asp:GridView>  
         <div class="box-bottom"> </div>     
    </div>
    <div class="clear tenpx"></div>
      <div class="form3">
          <div class="right button-margin">
                <asp:Button ID="cmdContinue" runat="server" OnClick="cmdContinue_Click" Text="CONTINUE" CssClass="blue button" />   
                 <asp:Button ID="cmdBack" align="right" Visible="false" Text="Back" runat="server" 
            onclick="cmdBack_Click1" />                   
            </div>
        <div class="clear"></div>
      </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedQuestionsByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChecklistSection" Name="nCheckListSectionId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
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
