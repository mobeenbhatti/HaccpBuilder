<%@ Page Language="C#"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_AutoComplete" Title="Untitled Page" Codebehind="AutoComplete.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


    
    <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="MainHeading">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionListElementID="pnlVendor" TargetControlID="TextBox1"  ServiceMethod="GetCompletionList" ScriptPath="AutoComplete.asmx" MinimumPrefixLength="2"  runat="server">
    </cc1:AutoCompleteExtender>
    <asp:Panel ID="pnlVendor" runat="server" Visible="false"></asp:Panel>
    </div>
    </div>
    </form>
</body>
</html>
    


