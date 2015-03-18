<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_Location_ValidationReview" Title="HACCP Builder | Validation Checklist Review" Codebehind="ValidationReview.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
     
    <h3>Validation Checklist Review</h3>

    <div class="clear tenpx"></div>
    
    <p><b>Directions:</b>  Please review the answers to your questions.  If you would like to change an 
            answer please click on Back button to go back to the Validation Checklist.</p>
    <div class="row">
       
        <div class="grey_bg_dis">
            <table class="table table-striped table-hover">
                <tr>
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td >
                        Name of person responsible for validation:
                    </td>                  
                    <td >
                        <asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                        Entry Date:
                    </td>
                   
                    <td >
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear tenpx"></div>
        <div class="row">
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
             DataSourceID="ObjectDataSource1" 
                 onrowdatabound="grdQuestion_RowDataBound">
                <Columns>                                  
                    <asp:TemplateField  HeaderText="Question" >
                        <ItemTemplate>       
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />                                                                 
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Answers">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField  HeaderText="Corrective Action">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Remarks") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
        </div>
        
        <asp:Label ID="lblStatus" Visible="false" Text="new" runat="server"></asp:Label>
        <div class="row">
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="btn btn-default" OnClick="btnBack_Click" Text="Go Back"  />
            <asp:Button ID="btnContinue" runat="server" OnClick="cmdContinue_Click" CssClass="btn btn-primary" Text="Continue" />
        </div>
    </div>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetResponsesByHistoryId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationResponse">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="nHistoryId" 
                        SessionField="HistoryId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
</asp:Content>

