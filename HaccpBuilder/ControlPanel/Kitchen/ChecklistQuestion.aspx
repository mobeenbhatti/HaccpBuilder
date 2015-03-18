<%@ Page Title="Haccp Builder | Checklist Question" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ChecklistQuestion.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ChecklistQuestionNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Checklist Question</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
<div class="ph-top">  
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Observer field" CssClass="msg-error" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
</div>
<div class="clear"></div>
<div class="form3">
   <b>Directions:</b> Use this checklist weekly to determine areas in your operations
   requiring corrective action. Record corrective action taken and keep completed records
   in a notebook for future reference.
</div>
<div class="form3">
    <div class="left">
        <label> Report Date:</label><div class="input"><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></div> 
    </div>
    <div class="left margin-lr" id="pnlObserver" runat="server">
        <label> <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label></label>
        <div class="input">
            <asp:TextBox ID="txtObserver" runat="server"></asp:TextBox>
        </div>        
    </div>   
    <div class="clear"></div>
</div>
<div class="table">
    <div class="box-header">
      <h4 class="left"><asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></h4>
    </div>
    <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false" CssClass="zebra" OnRowDataBound="grdChecklist_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="5%">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' runat="server" />
                            <asp:HiddenField ID="hfIsBoolActive" Value='<%# DataBinder.Eval(Container.DataItem, "BoolActive") %>' runat="server" />
                            <asp:HiddenField ID="hfIsOpenActive" Value='<%# DataBinder.Eval(Container.DataItem, "OFActive") %>' runat="server" />
                            <asp:HiddenField ID="hfOfRequired" Value='<%# DataBinder.Eval(Container.DataItem, "OFRequired") %>' runat="server" />
                            <asp:HiddenField ID="hfIsCorrectiveAction" Value='<%# DataBinder.Eval(Container.DataItem, "CAActive") %>' runat="server" />
                            <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>                  
                    <asp:BoundField DataField="Checklist" ItemStyle-Width="45%" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="220px"
                                Height="60px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply remarkss."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                          
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="rdlCorrectiveActions" runat="server"></asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must select a corrective action"
                                ControlToValidate="rdlCorrectiveActions"></asp:RequiredFieldValidator>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
  <div class="form3">
      <div class="right button-margin">
            <asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" Text="CONTINUE" CssClass="blue button" />
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="BACK" CssClass="button"  />            
            <asp:HiddenField ID="hfHistoryId" runat="server" />     
        </div>
        <div class="clear"></div>
  </div>
</div>
</asp:Content>
