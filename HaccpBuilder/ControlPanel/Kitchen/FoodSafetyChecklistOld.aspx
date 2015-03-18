<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master" 
    AutoEventWireup="true" Inherits="ControlPanel_Kitchen_FoodSafetyChecklist"
    Title="HACCP Builder | Food Safety Checklist" Codebehind="FoodSafetyChecklistOld.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">

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
                                                { FOOD SAFETY CHECKLIST }
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
                    <td colspan="3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <b>Directions:</b> Use this checklist weekly to determine areas in your operations
                        requiring corrective action. Record corrective action taken and keep completed records
                        in a notebook for future reference.
                    </td>
                </tr>
            </table>
        </div>
        <div class="grey_bg_dis">
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Report Date:
                    </td>
                    <td>
                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                    </td>
                    <td>
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="pnlObserver" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtObserver" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Observer field" ForeColor="Red" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
        <div class="grey_bg_dis">
            <div class="red_heading">
                <asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
            </div>
        </div>
        <div class="table_view">
            <asp:GridView ID="grdSafetyChecklist" runat="server" AutoGenerateColumns="false"
                SkinID="gridviewSkin" OnRowDataBound="grdSafetyChecklist_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="10px">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>'
                                runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField  ItemStyle-Width="10px">
                    <ItemTemplate>
                    <asp:Label ID="lblQuestionId" Text = '<%# DataBinder.Eval(Container.DataItem, "SortOrder") %>' runat="server"></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>--%>
                    <asp:BoundField DataField="Question" ItemStyle-Width="350px" HeaderText="Question" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px"
                                Height="30px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply a corrective action or select Yes/NA."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator ID="REV_txtCorrectiveAction" Display="Dynamic" runat="server" ForeColor="Red"
                                ControlToValidate="txtCorrectiveAction" ErrorMessage="Please enter valid corrective action."
                                ValidationExpression="^[A-Za-z0-9.\-_,.]+$"></asp:RegularExpressionValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <%--<asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal" onitemdatabound="DataList1_ItemDataBound" >
        <    
        <ItemTemplate >        
       <asp:Label ID="lblQuestionId" Text = '<%#  DataBinder.Eval(Container.DataItem, "QuestionId")%>' runat="server"></asp:Label> 
        <%# DataBinder.Eval(Container.DataItem,"Question") %></td> 
        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
       <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
      
        <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false"   runat="server" ></asp:TextBox> </td>
   <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" 

Display="Static"  Enabled="true" 
        ErrorMessage="You must supply a corrective action or select Yes." 

ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
        
 
    </ItemTemplate>   
    
    </asp:DataList>--%>
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
        </div>
        <div class="grey_bg_form">
            <asp:ImageButton ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click"
                ImageUrl="~/images/buttons/ButtonGoBack.png" />
            <asp:ImageButton ID="btnContinue" runat="server" OnClick="Button1_Click" ImageUrl="~/images/buttons/ButtonContinueBlack.png" />
            <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>
        </div>
    </div>
</asp:Content>
