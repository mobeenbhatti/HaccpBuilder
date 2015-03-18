<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" CodeBehind="ChecklistQuestion.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistQuestion" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">
<script language="javascript" type="text/javascript">
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
<div class="bdy_contents">
       <h3><asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></h3>
       <div class="row">
        <table class="table table-striped table-hover">
                <tr>
                    <td>
                        Report Date:  <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlObserver" runat="server">
                            <table>
                                <tr>
                                    <td>
                                         <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label> <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox>                                      
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
       </div>
        <div class="row">
               
            <asp:Repeater ID="rptChecklist" runat="server" onitemdatabound="rptChecklist_ItemDataBound">
            <HeaderTemplate><table CssClass="table table-striped table-hover"></HeaderTemplate>
            <ItemTemplate>
                <tr>
                <td>
                <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' runat="server" />
                            <asp:HiddenField ID="hfIsBoolActive" Value='<%# DataBinder.Eval(Container.DataItem, "BoolActive") %>' runat="server" />
                            <asp:HiddenField ID="hfIsOpenActive" Value='<%# DataBinder.Eval(Container.DataItem, "OFActive") %>' runat="server" />
                            <asp:HiddenField ID="hfIsCorrectiveAction" Value='<%# DataBinder.Eval(Container.DataItem, "CAActive") %>' runat="server" />
                            <asp:HiddenField ID="hfOfRequired" Value='<%# DataBinder.Eval(Container.DataItem, "OFRequired") %>' runat="server" />
                <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                <b><asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Checklist") %>'></asp:Label></b></td></tr>                
                <tr><td colspan="2">
                <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                </td></tr>
                <tr><td colspan="2">
                <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="220px"
                                Height="60px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply a corrective action."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator ID="REV_txtCorrectiveAction" Display="Dynamic" runat="server" ForeColor="Red"
                                ControlToValidate="txtCorrectiveAction" ErrorMessage="Please enter valid corrective action."
                                ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>--%>
                </td></tr>
                <tr><td colspan="2">
                    <asp:RadioButtonList ID="rdlCorrectiveActions" runat="server"></asp:RadioButtonList>
                    <hr />
                    <asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" Display="Dynamic" ForeColor="Red"
                     Enabled="true" ErrorMessage="You must select a corrective action"
                     ControlToValidate="rdlCorrectiveActions"></asp:RequiredFieldValidator>
                </td></tr>
                
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            </asp:Repeater>               
        </div>
        <div class="grey_bg_form">
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" Text="Back" CssClass="btn btn-default" onclick="btnBack_Click" />
            <asp:Button ID="btnContinue" runat="server" onclick="btnContinue_Click" CssClass="btn btn-primary" Text="Continue" />
            <asp:HiddenField ID="hfHistoryId" runat="server" />
        </div>
    </div>
</asp:Content>
