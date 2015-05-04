<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ChecklistQuestionN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistQuestionN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Question Checklist</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <script lang="javascript" type="text/javascript">
        function check(vldCorrectiveAction, enable, vldAnswerValidate, OfRequired) {
            if (enable == false) {

                if (vldCorrectiveAction != null)
                    ValidatorEnable(vldCorrectiveAction, false);
                if (OfRequired == "1") {
                    ValidatorEnable(vldAnswerValidate, true);
                }
                else {
                    if (vldAnswerValidate != null)
                        ValidatorEnable(vldAnswerValidate, false);
                }

            }
            else {
                if (vldAnswerValidate != null)
                    ValidatorEnable(vldAnswerValidate, true);
                if (vldCorrectiveAction != null)
                    ValidatorEnable(vldCorrectiveAction, true);
            }

        }
    </script>



    <div class="row faculity mt30">
        <div class="col-sm-6">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Report Date
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
                        <li class="col-sm-12">
                            <div class="col-xs-12 mb10">
                                <div class="row te">

                                    <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' runat="server" />
                                    <asp:HiddenField ID="hfIsBoolActive" Value='<%# DataBinder.Eval(Container.DataItem, "BoolActive") %>' runat="server" />
                                    <asp:HiddenField ID="hfIsOpenActive" Value='<%# DataBinder.Eval(Container.DataItem, "OFActive") %>' runat="server" />
                                    <asp:HiddenField ID="hfIsCorrectiveAction" Value='<%# DataBinder.Eval(Container.DataItem, "CAActive") %>' runat="server" />
                                    <asp:HiddenField ID="hfOfRequired" Value='<%# DataBinder.Eval(Container.DataItem, "OFRequired") %>' runat="server" />
                                    <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Checklist") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="">
                                <div class="col-sm-6 vAM">
                                    <div class="col-xs-4">

                                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />

                                    </div>

                                    <div class="col-xs-4">

                                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />

                                    </div>
                                    <div class="col-xs-4">

                                        <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer" runat="server" />

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtCorrectiveAction" Rows="3" CssClass="form-control" TextMode="MultiLine" 
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" CssClass="alert-danger"
                                        Enabled="true" ErrorMessage="You must supply a corrective action."
                                        ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-sm-6">
                                    <asp:RadioButtonList ID="rdlCorrectiveActions" runat="server"></asp:RadioButtonList>
                                    <hr />
                                    <asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" Display="Dynamic" ForeColor="Red"
                                        Enabled="true" ErrorMessage="You must select a corrective action"
                                        ControlToValidate="rdlCorrectiveActions"></asp:RequiredFieldValidator>
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

            <asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" Text="Continue" CssClass="btn btn-primary btn-square" />
        </div>
        <div class="btn-group">

            <asp:Button ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="Go Back" CssClass="btn btn-default btn-square" />
        </div>
         <asp:HiddenField ID="hfHistoryId" runat="server" />
        </div>
</asp:Content>
