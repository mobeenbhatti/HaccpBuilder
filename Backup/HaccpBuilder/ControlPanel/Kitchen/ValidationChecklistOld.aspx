<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" EnableEventValidation="true"
     AutoEventWireup="true"
    Inherits="ControlPanel_Kitchen_ValidationChecklist" Title="HACCP Builder | Validation Checklist" Codebehind="ValidationChecklistOld.aspx.cs" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="Server">

    <script language="javascript" type="text/javascript">
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

    <div class="bdy_contents">
        <div class="grey_bg">
            <table width="690" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table width="690" border="0" cellspacing="0" background="../../images/District Images/table_bg.gif">
                            <tr>
                                <td height="165" valign="top">
                                    <table width="690" border="0" cellspacing="5">
                                        <tr>
                                            <td class="red_heading">
                                                { VALIDATION CHECKLIST }
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Contact:Detail ID="cd" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td height="54" background="../../images/District Images/bg_btns_strip.gif">
                        <table width="690" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" width="10" height="12" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="690" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td width="180">
                                            </td>
                                            <td width="10">
                                                <img src="../../images/District Images/spacer.gif" width="10" height="10" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../../images/District Images/spacer.gif" alt="" width="10" height="12" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons_bg">
        </div>
        <div class="grey_bg_dis">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Name of person responsible for validation:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtResponsiblePerson" MaxLength="50" CssClass="ChecklistTextBox"
                            runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field."
                            runat="server" ControlToValidate="txtResponsiblePerson"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtResponsiblePerson" Display="Dynamic" runat="server"
                            ControlToValidate="txtResponsiblePerson" ErrorMessage="The value in field 'Name of person responsible for validation' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Title:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field."
                            runat="server" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtTitle" Display="Dynamic" runat="server"
                            ControlToValidate="txtTitle" ErrorMessage="The value in field 'Title' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Frequency at which the validation is done(Per Year):
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFrequency" runat="server" CssClass="DropDown">
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
                    </td>
                </tr>
                <tr>
                    <td>
                        Any other reason than frequency for doing the validation:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtReason" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ErrorMessage="Please fill Reason other than frequency field."
                            runat="server" ControlToValidate="txtReason"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtReason" Display="Dynamic" runat="server"
                            ControlToValidate="txtReason" ErrorMessage="The value in field 'Any other reason than frequency for doing the validation' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of last validation (mm/dd/yyyy):
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                            ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ErrorMessage="Please fill Date of last validation field."
                            runat="server" ControlToValidate="cldVerifiedDate"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" Display="Dynamic" ControlToValidate="cldVerifiedDate"
                            ErrorMessage="Validation date should not be future date" Operator="LessThanEqual"
                            Type="Date"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        The length of time this record is kept on file (i.e. #years):
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTimePeriod" runat="server" CssClass="DropDown">
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
                    </td>
                </tr>
                <tr>
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div class="table_view">
            <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="false" SkinID="gridviewSkin"
                OnRowDataBound="grdValidation_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="10px">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>'
                                runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Question" ItemStyle-Width="350px" HeaderText="Question" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detail if needed" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px"
                                Height="30px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic"
                                Enabled="false" ErrorMessage="You must supply a corrective action or select Yes."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="grey_bg_dis">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Validation Verified By Manager - Name:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtVerifiedBy" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ErrorMessage="Please fill Validation verified by Manager field."
                            runat="server" ControlToValidate="txtVerifiedBy"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <%--<asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" Display="Dynamic"
                            ControlToValidate="txtVerifiedBy" ErrorMessage="The value in field 'Validation verified by manager - name' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator--%>>
                    </td>
                </tr>
                <tr>
                    <td>
                        Title:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtManagerTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ErrorMessage="Please fill Manager Title field."
                            runat="server" ControlToValidate="txtManagerTitle"></asp:RequiredFieldValidator>
                        <%-- MBS-(03-22-10)
                    BUG ID - 1895--%>
                        <asp:RegularExpressionValidator ID="REV_txtManagerTitle" Display="Dynamic" runat="server"
                            ControlToValidate="txtManagerTitle" ErrorMessage="The value in field 'Title' is not valid."
                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Manager Validation Date (mm/dd/yyyy):
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                            ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
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
                    </td>
                </tr>
                <tr>
                    <td colspan="11">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="lblStatus" Visible="false" Text="new" runat="server"></asp:Label>
        <div class="grey_bg_form">
            <asp:ImageButton ID="btnBack" CausesValidation="false" runat="server" OnClick="btnBack_Click"
                ImageUrl="~/images/buttons/ButtonGoBack.png" />
            <asp:ImageButton ID="btnContinue" runat="server" ImageUrl="~/images/buttons/ButtonContinueBlack.png"
                OnClick="btnContinue_Click" />
            <%--<asp:Button ID="Button1" Text="Continue >>" runat="server" 
          CssClass="Button" onclick="cmdContinue_Click" />--%>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>"
        SelectCommand="uspAdm_GetValidationDates" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
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
