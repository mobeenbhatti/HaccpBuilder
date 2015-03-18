<%@ Page Title="HACCP Builder | Validation Checklist" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="ValidationChecklist.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ValidationChecklistNew" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 <div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1>Validation Checklist</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<div class="container">
<div class="ph-top">    
</div>
<div class="form3">
    <div class="left">
        <label>Name of person responsible for validation:</label>
        <div class="input">
            <asp:TextBox ID="txtResponsiblePerson" MaxLength="50" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field."
                runat="server" ControlToValidate="txtResponsiblePerson"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:RegularExpressionValidator ID="REV_txtResponsiblePerson" Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="txtResponsiblePerson" ErrorMessage="The value in field 'Name of person responsible for validation' is not valid."
                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Title:</label>
        <div class="input">
            <asp:TextBox ID="txtTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field." runat="server" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:RegularExpressionValidator ID="REV_txtTitle" Display="Dynamic" runat="server" ControlToValidate="txtTitle" ForeColor="Red" ErrorMessage="The value in field 'Title' is not valid."
                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
        </div>        
    </div>
    <div class="left">
        <label> Frequency at which the validation is done(Per Year):</label>
        <div class="input">
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please fill Frequency field." ForeColor="Red"
                runat="server" ControlToValidate="ddlFrequency"></asp:RequiredFieldValidator>
        </div>
    </div>   
    <div class="clear"></div>
</div>
<div class="form3">
    <div class="left">
        <label>Any other reason than frequency for doing the validation:</label>
        <div class="input">
            <asp:TextBox ID="txtReason" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="Red" ErrorMessage="Please fill Reason other than frequency field." runat="server" ControlToValidate="txtReason"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:RegularExpressionValidator ID="REV_txtReason" Display="Dynamic" runat="server" ForeColor="Red" ControlToValidate="txtReason" ErrorMessage="The value in field 'Any other reason than frequency for doing the validation' is not valid."
                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Date of last validation (mm/dd/yyyy):</label>
        <div class="input">
           <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ErrorMessage="Please fill Date of last validation field." ForeColor="Red"
                runat="server" ControlToValidate="cldVerifiedDate"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" Display="Dynamic" ControlToValidate="cldVerifiedDate" ForeColor="Red"
                ErrorMessage="Validation date should not be future date" Operator="LessThanEqual"
                Type="Date"></asp:CompareValidator>
        </div>        
    </div>
    <div class="left">
        <label>  The length of time this record is kept on file (i.e. #years):</label>
        <div class="input">
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Please fill Length of time field field." ForeColor="Red"
                runat="server" ControlToValidate="ddlTimePeriod"></asp:RequiredFieldValidator>
        </div>
    </div>   
    <div class="clear"></div>
</div>
<div class="form3">
    <div class="left">
        <label>Validation Verified By Manager - Name:</label>
        <div class="input">
            <asp:TextBox ID="txtVerifiedBy" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ForeColor="Red" ErrorMessage="Please fill Validation verified by Manager field." runat="server" ControlToValidate="txtVerifiedBy"></asp:RequiredFieldValidator>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Title:</label>
        <div class="input">
            <asp:TextBox ID="txtManagerTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" ForeColor="Red" ErrorMessage="Please fill Manager Title field." runat="server" ControlToValidate="txtManagerTitle"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:RegularExpressionValidator ID="REV_txtManagerTitle" Display="Dynamic" runat="server" ForeColor="Red"
                ControlToValidate="txtManagerTitle" ErrorMessage="The value in field 'Title' is not valid."
                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'-_]+$"></asp:RegularExpressionValidator>
        </div>        
    </div>
    <div class="left">
        <label> Manager Validation Date (mm/dd/yyyy):</label>
        <div class="input">
            <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" ErrorMessage="Please fill Manager Validation Date field." ForeColor="Red"
                runat="server" ControlToValidate="cldEntryDate"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:CompareValidator ID="CV_cldEntryDate" Display="Dynamic" runat="server" ControlToValidate="cldEntryDate" ForeColor="Red"
                ErrorMessage="Manager validation date should not be future date" Operator="LessThanEqual"
                Type="Date"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator1" Display="Dynamic" runat="server" ControlToCompare="cldVerifiedDate" ForeColor="Red"
                ControlToValidate="cldEntryDate" ErrorMessage="Manager validationn date should be greater then or equal to Last validation date."
                Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
        </div>
    </div>   
    <div class="clear"></div>
</div>
<div class="table">
    <div class="box-header">
      <h4 class="left"><asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></h4>
    </div>
    <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="false" CssClass="zebra" OnRowDataBound="grdValidation_RowDataBound">
                <Columns>                   
                    <asp:BoundField DataField="Question" HeaderText="Question" ItemStyle-Width="70%" />
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="15%" >
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" />
                             <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>'
                                runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detail if needed" ItemStyle-Width="15%" >
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px" Height="30px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="false" ErrorMessage="You must supply a corrective action or select Yes."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>  
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
  <div class="form3">
      <div class="right button-margin">
            <asp:Button ID="btnContinue" runat="server" Text="CONTINUE" OnClick="btnContinue_Click" CssClass="button blue" />
            <asp:Button ID="btnBack" runat="server" CausesValidation="false" OnClick="btnBack_Click" Text="BACK" CssClass="button"  /> 
        </div>
    <div class="clear"></div>
  </div>
</div>
<asp:Label ID="lblStatus" Visible="false" Text="new" runat="server"></asp:Label>
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
