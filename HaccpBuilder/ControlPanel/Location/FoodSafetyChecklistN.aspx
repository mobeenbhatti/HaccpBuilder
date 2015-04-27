<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="FoodSafetyChecklistN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.FoodSafetyChecklistN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Food Saftey Checklist</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <script language="javascript" type="text/javascript">
        function check(txtobj, vldObj, enable) {
            if (enable == false) {

                ValidatorEnable(vldObj, false);
                // vldObj.enabled = false;
                txtobj.disabled = true;
                txtobj.value = "";
            }
            else {

                ValidatorEnable(vldObj, true);
                // vldObj.enabled = true;
                txtobj.disabled = false;
            }

        }
    </script>
    <p class="mt30 mb30">
        <strong>Drirections: </strong>
        Nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas.
    </p>

    <div class="row faculity mt30">
        <div class="col-sm-6">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Week Ending Report Date
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
                            <asp:TextBox ID="txtObserver" CssClass="form-control" placeholder="Observer" runat="server"></asp:TextBox>

                        </div>
                        <span class="help-block"></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>
                <asp:Label ID="lblSection" runat="server"></asp:Label>
            </div>
            <div class="panel-body tasks">
                <asp:Repeater ID="rptChecklist" runat="server" OnItemDataBound="rptChecklist_ItemDataBound">
                    <HeaderTemplate>
                        <ul class="questionaire">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-xs-12 mb10">
                                <div class="row te">
                                    <i class="fa fa-question-circle"></i>
                                    <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />
                                    <asp:HiddenField ID="hfChecklisthistory" runat="server" />

                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="">
                                <div class="col-sm-6 vAM">
                                    <label>
                                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                                    </label>
                                    <label>
                                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                                    </label>
                                    <label>
                                        <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer" runat="server" />
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtCorrectiveAction" Rows="3" CssClass="form-control" TextMode="MultiLine" Enabled="false"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" CssClass="alert-danger"
                                        Enabled="true" ErrorMessage="You must supply a corrective action or select Yes/NA."
                                        ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </li>


                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
    <div class="mt30 mb30">
        <div class="btn-group">

            <asp:Button ID="btnContinue" runat="server" OnClick="Button1_Click" Text="Continue" CssClass="btn btn-primary btn-square" />
        </div>
        <div class="btn-group">

            <asp:Button ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Go Back" CssClass="btn btn-default btn-square" />
        </div>
        <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>
    </div>



    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetQuestionsDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="0" Name="tnPageIndex"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetResponsesDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nHistoryId" SessionField="HistoryId"
                Type="Int32" />
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="1" Name="nPageIndex"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
