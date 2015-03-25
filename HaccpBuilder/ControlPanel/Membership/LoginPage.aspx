<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Membership_LoginPage"
    Title="HACCP Builder | Login" CodeBehind="LoginPage.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="Link1" runat="server" rel="Shortcut Icon" href="~/App_Themes/Grid/favicon.ico"
        type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="~/App_Themes/Grid/favicon.ico" type="image/ico" />
    <link type="text/css" href="../../App_Themes/Facility/style.css" rel="stylesheet" />
</head>
<body style="background-color: White;">
    <form id="form1" runat="server">
        <div>
            <center>

                <div class="form3" style="width: 300px; margin-top: 150px">
                    <img src="../../App_Themes/Facility/Images/100_w_pixl_logo_small_03.gif" alt="" /><hr />
                    <asp:Login ID="Login1" TextBoxStyle-Width="140px" RememberMeSet="true"  CheckBoxStyle-HorizontalAlign="Left" runat="server"  PasswordRecoveryText="Forgot Your Password?"  PasswordRecoveryUrl="PasswordRecovery.aspx"
                        OnLoggedIn="Login1_LoggedIn1">
                    </asp:Login>

                </div>
            </center>
        </div>
    </form>
</body>
</html>
