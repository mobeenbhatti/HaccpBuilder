<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ValidationChecklistN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ValidationChecklistN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Validation Checklist</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <script lang="javascript" type="text/javascript">
        function check(txtobj, vldObj, enable) {
            if (enable == false) {

                ValidatorEnable(vldObj, false);
                txtobj.disabled = true;
                txtobj.value = "";
            }
            else {

                ValidatorEnable(vldObj, true);
                txtobj.disabled = false;
            }

        }

    </script>

    <div class="row faculity mt30">
        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Name of person responsible for validation:
                    </li>
                    <li>
                        <asp:TextBox ID="txtResponsiblePerson" MaxLength="50" CssClass="span3"
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field."
                            runat="server" ControlToValidate="txtResponsiblePerson"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtResponsiblePerson" Display="Dynamic" runat="server"
                            ControlToValidate="txtResponsiblePerson" ErrorMessage="The value in field 'Name of person responsible for validation' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Title:
                    </li>
                    <li>
                        <asp:TextBox ID="txtTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field."
                            runat="server" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtTitle" Display="Dynamic" runat="server"
                            ControlToValidate="txtTitle" ErrorMessage="The value in field 'Title' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Frequency at which the validation is done(Per Year):
                    </li>
                    <li>
                        <asp:DropDownList ID="ddlFrequency" runat="server" Font-Size="Small" CssClass="DropDown">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:TextBox ID="txtFrequency" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Please fill Frequency field."
                            runat="server" ControlToValidate="ddlFrequency"></asp:RequiredFieldValidator>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Any other reason than frequency for doing the validation:
                    </li>
                    <li>
                        <asp:TextBox ID="txtReason" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ErrorMessage="Please fill Reason other than frequency field."
                            runat="server" ControlToValidate="txtReason"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtReason" Display="Dynamic" runat="server"
                            ControlToValidate="txtReason" ErrorMessage="The value in field 'Any other reason than frequency for doing the validation' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Date of last validation (mm/dd/yyyy):
                    </li>
                    <li>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox CssClass="form-control" runat="server" ID="cldVerifiedDate"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>

                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ErrorMessage="Please fill Date of last validation field."
                            runat="server" ControlToValidate="cldVerifiedDate"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" Display="Dynamic" ControlToValidate="cldVerifiedDate"
                            ErrorMessage="Validation date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>The length of time this record is kept on file (i.e. #years):
                    </li>
                    <li>
                        <asp:DropDownList ID="ddlTimePeriod" Font-Size="Small" runat="server" CssClass="DropDown">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:TextBox ID="txtFileTime" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Please fill Length of time field field."
                            runat="server" ControlToValidate="ddlTimePeriod"></asp:RequiredFieldValidator>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">Validation list</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                    <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover table-bordered"
                        OnRowDataBound="grdValidation_RowDataBound">

                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Question" ItemStyle-Width="550px" HeaderText="Question" />
                            <asp:TemplateField HeaderText="Answer" ItemStyle-Width="120px">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                                    <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                                    <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Detail if needed" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic"
                                        Enabled="false" ErrorMessage="You must supply a corrective action or select Yes."
                                        ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REV_txtCorrectiveAction" Display="Dynamic" runat="server"
                                        ControlToValidate="txtCorrectiveAction" ErrorMessage="Please enter valid corrective action."
                                        ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>

    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>
                Check list
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
                                    <i class="fa fa-question-circle"></i>
                                    <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />
                                    <asp:HiddenField ID="hfChecklisthistory" runat="server" />

                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
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
                                    <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red" Enabled="true" ErrorMessage="You must supply a corrective action or select Yes."
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
            <div class="box-bottom"></div>
        </div>
    </div>

    <div class="row faculity mt30">
        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Validation Verified By Manager - Name:
                    </li>
                    <li>
                        <asp:TextBox ID="txtVerifiedBy" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" Display="Dynamic"
                            ControlToValidate="txtVerifiedBy" ErrorMessage="The value in field 'Validation verified by manager - name' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Title:
                    </li>
                    <li>
                        <asp:TextBox ID="txtManagerTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ErrorMessage="Please fill Manager Title field."
                            runat="server" ControlToValidate="txtManagerTitle"></asp:RequiredFieldValidator>--%>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtManagerTitle" Display="Dynamic" runat="server"
                            ControlToValidate="txtManagerTitle" ErrorMessage="The value in field 'Title' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="users">
                <ul>
                    <li>Manager Validation Date (mm/dd/yyyy):
                    </li>
                    <li>
                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                            <asp:TextBox CssClass="form-control" runat="server" ID="cldEntryDate"></asp:TextBox>

                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" ErrorMessage="Please fill Manager Validation Date field."
                            runat="server" ControlToValidate="cldEntryDate"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:CompareValidator ID="CV_cldEntryDate" Display="Dynamic" runat="server" ControlToValidate="cldEntryDate"
                            ErrorMessage="Manager validation date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>
                        <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" runat="server" ControlToCompare="cldVerifiedDate"
                            ControlToValidate="cldEntryDate" ErrorMessage="Manager validationn date should be greater then or equal to Last validation date."
                            Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                    </li>
                </ul>
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
        <asp:Label ID="lblStatus" Visible="false" Text="new" runat="server"></asp:Label>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
        SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetQuestions" TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationQuestions">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetResponsesDataSet" TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationResponse">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nHistoryId" SessionField="HistoryId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
