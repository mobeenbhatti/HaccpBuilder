<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" 
    AutoEventWireup="true" Inherits="ControlPanel_Location_FoodSafetyChecklist"
    Title="HACCP Builder | Food Safety Checklist" Codebehind="FoodSafetyChecklist.aspx.cs" %>

<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">

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

    
    <h3>Food Safety Checklist</h3>
   
    
    <p><b>Directions:</b> Use this checklist weekly to determine areas in your operations
                        requiring corrective action. Record corrective action taken and keep completed records
                        in a notebook for future reference.
    </p>
    
    <div class="clear tenpx"></div>
    <div class="row">
        <table class="table table-striped table-hover">
                <tr>
                    <td style="font-size:medium;">
                        Week Ending Report Date:
                    </td>                   
                    <td >
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="pnlObserver" runat="server">
                            <table>
                                <tr>
                                    <td style="font-size:medium">
                                        <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <img src="../../images/District Images/spacer.gif" width="10" height="25" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox>                                       
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
    </div>
    <h4> <asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></h4>
    <asp:Repeater ID="rptChecklist" runat="server" onitemdatabound="rptChecklist_ItemDataBound">
            <HeaderTemplate><table class="table table-striped table-hover"></HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td  colspan="2">
                          <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />                          
                        <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                        <b><asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Question") %>'></asp:Label></b>
                    </td>
                </tr>                
                <tr>
                    <td colspan="2">
                       <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                       <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                       <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false"
                               runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply a corrective action or select Yes/NA." 
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                        
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            </asp:Repeater>
<div class="cler tenpx"></div>

    <asp:Button ID="btnContinue" runat="server" OnClick="Button1_Click" Text="Continue" CssClass="btn btn-primary" />
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" Width="90px" Font-Size="Medium" OnClick="btnBack_Click" Text="Go Back" CssClass="btn btn-default"  />           
            <%--<asp:ImageButton ID="btnContinue" runat="server" OnClick="Button1_Click" ImageUrl="~/images/buttons/ButtonContinueBlack.png" />--%>
            <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>

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
