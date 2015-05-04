<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ValidationReviewN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ValidationReviewN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Validation Checklist Review</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">

    <p class="mt30 mb30">
        <strong>Directions: </strong>
        Please review the answers to your questions.  If you would like to change an 
            answer please click on Back button to go back to the Validation Checklist.
    </p>

    <div class="row faculity mt30">

        <div class="col-sm-6">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Entry Date
                    </li>
                    <li>
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="users">
                <ul>
                    <li class="col-xs-12">
                        <div class="input-group" id="pnlObserver" runat="server">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            <asp:TextBox ID="lblObserverValue" ReadOnly="true" CssClass="form-control" placeholder="Name of person responsible for validation" runat="server"></asp:TextBox>

                        </div>
                        <span class="help-block"></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>



    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">Food Safety Checklist Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                    <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataSourceID="ObjectDataSource1"
                        OnRowDataBound="grdQuestion_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                                    <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Answers">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":Eval("Answer").ToString() == "2"?"NA":"No" %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Corrective Action">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" Text='<%# Eval("Remarks") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>
     <div class="mt30 mb30">
        <div class="btn-group">

            <asp:Button ID="btnContinue" runat="server" OnClick="cmdContinue_Click" Text="Confirm" CssClass="btn btn-primary btn-square" />
        </div>
        <div class="btn-group">

            <asp:Button ID="cmdBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Go Back" CssClass="btn btn-default btn-square" />
        </div>
            <asp:Label ID="lblStatus" Visible="false" Text="new" runat="server"></asp:Label>
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
