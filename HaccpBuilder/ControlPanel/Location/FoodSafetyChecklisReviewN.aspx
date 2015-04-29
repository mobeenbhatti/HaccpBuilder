<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="FoodSafetyChecklisReviewN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.FoodSafetyChecklisReviewN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Food Safety Checklist Review</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <p class="mt30 mb30">
        <strong>Directions: </strong>
        Record product name, time, the two temperatures/times, and any corrective
                action taken on this form. If no foods are cold held on any working day, indicate
                "No Ingredient/No Menu Item" in the form. The foodservice manager will verify that
                foodservice employees have taken the required cooking temperatures by visually monitoring
                foodservice employees and preparation procedures during the shift and reviewing,
                initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>

    <div class="mt30 mb30">
        <div class="btn-group">

            <asp:Button ID="btnContinue" runat="server" OnClick="cmdContinue_Click" Text="Confirm" CssClass="btn btn-primary btn-square" />
        </div>
        <div class="btn-group">

            <asp:Button ID="cmdBack" runat="server" CausesValidation="false" Text="Go Back" CssClass="btn btn-default btn-square" />
        </div>
        <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>
    </div>


    <div class="row faculity mt30">
        <div class="col-sm-4">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Report Date
                    </li>
                    <li>
                        <asp:Label ID="lblWeekDate" Text="" runat="server"></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-4">
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
        <div class="col-sm-4">
            <div class="users">
                <ul>
                    <li class="col-xs-12">
                        <div class="input-group" id="pnlObserver" runat="server">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            <asp:TextBox ID="lblObserverValue" ReadOnly="true" CssClass="form-control" placeholder="Observer" runat="server"></asp:TextBox>

                        </div>
                        <span class="help-block"></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">List of Cooling Temperature Log Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                     <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered"
                        DataSourceID="ObjectDataSource1"  OnRowDataBound="grdQuestion_RowDataBound">
                 
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                                    <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%--<asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>--%>
                                    <%-- MBS-(03-19-10)
                    BUG ID - 1877--%>
                                    <asp:HyperLink ID="hlCategory" Text='<%# Eval("Section") %>' runat="server"></asp:HyperLink>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
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
                                    <asp:Label ID="lblType" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetResponsesByHistoryId"
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="nHistoryId"
                SessionField="HistoryId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
