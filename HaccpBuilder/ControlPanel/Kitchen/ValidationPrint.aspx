<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationPrint.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ValidationPrintNew" Title="HACCP Builder | Validation Checklist" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
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
            <asp:RegularExpressionValidator ID="REV_txtResponsiblePerson" Display="Dynamic" runat="server" ControlToValidate="txtResponsiblePerson" ErrorMessage="The value in field 'Name of person responsible for validation' is not valid."
                Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Title:</label>
        <div class="input">
            <asp:TextBox ID="txtTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ErrorMessage="Please fill Person Responsible for Validation field." runat="server" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            <%-- MBS-(03-22-10) BUG ID - 1895--%>
            <asp:RegularExpressionValidator ID="REV_txtTitle" Display="Dynamic" runat="server" ControlToValidate="txtTitle" ErrorMessage="The value in field 'Title' is not valid."
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please fill Frequency field."
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
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Date of last validation (mm/dd/yyyy):</label>
        <div class="input">
           <ew:CalendarPopup ID="cldVerifiedDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />                  </div>        
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
        </div>
    </div>   
    <div class="clear"></div>
</div>
<div class="form3">
    <div class="left">
        <label>Validation Verified By Manager - Name:</label>
        <div class="input">
            <asp:TextBox ID="txtVerifiedBy" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ErrorMessage="Please fill Validation verified by Manager field." runat="server" ControlToValidate="txtVerifiedBy"></asp:RequiredFieldValidator>
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Title:</label>
        <div class="input">
            <asp:TextBox ID="txtManagerTitle" CssClass="ChecklistTextBox" runat="server"></asp:TextBox>          
        </div>        
    </div>
    <div class="left">
        <label> Manager Validation Date (mm/dd/yyyy):</label>
        <div class="input">
            <ew:CalendarPopup ID="cldEntryDate" runat="server" CssClass="log_textbox" CommandName="Calendar"
                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" />          
        </div>
    </div>   
    <div class="clear"></div>
</div>
<div class="table">
    <div class="box-header">
      <h2 class="left">Validation Checklist</h2>
    </div>
    <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="SqlDataSource1">
                <Columns>                                                     
                    <asp:TemplateField HeaderText="Question" ItemStyle-Width="70%">
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>                     
                    <asp:TemplateField  HeaderText="Answers" ItemStyle-Width="15%">
                        <ItemTemplate>
                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" />
                        <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                        <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />          
                        </ItemTemplate>                        
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="200px" Height="30px"   runat="server" ></asp:TextBox>                             
                        </ItemTemplate>                       
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
 
</div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetAllValidationQuestions" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
