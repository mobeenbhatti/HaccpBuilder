<%@ Control Language="C#" AutoEventWireup="true" Inherits="Controls_Answer" Codebehind="Answer.ascx.cs" %>
<asp:RadioButton ID="rdbAnswerYes" runat="server" GroupName="answer" 
    Text="Yes" />
<asp:RadioButton ID="rdbAnswerNo" runat="server" GroupName="answer" 
    oncheckedchanged="rdbAnswerNo_CheckedChanged" Text="No" />
<asp:TextBox ID="txtCorrectiveAnswer" runat="server" Enabled="False" 
    TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" 
    ControlToValidate="txtCorrectiveAnswer" Display="Dynamic" Enabled="False" 
    ErrorMessage="Please enter the corrective action"></asp:RequiredFieldValidator>
