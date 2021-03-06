﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationCheck2.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ValidationCheck2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../App_Themes/Mobile/bootstrap.css" type="text/css" />
        <link href="../../App_Themes/Mobile/bootstrap.min.css" type="text/css" />
        <script src="../../JScript/jquery-1.8.3.js" type="text/javascript"></script>
        <script src="../../JScript/bootstrap.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../../JScript/jquery-ui.css" type="text/css" />
        <script src="../../JScript/jquery-ui.js" type="text/javascript"></script>
        <script src="../../JScript/ui.combobox.js" type="text/javascript"></script>
         <style>
.ui-combobox {
position: relative;
display: inline-block;
}
.ui-combobox-toggle {
position: absolute;
top: 0;
bottom: 0;
margin-left: -1px;
padding: 0;
/* support: IE7 */
*height: 1.7em;
*top: 0.1em;
}
.ui-combobox-input {
margin: 0;
padding: 0.3em;
}
</style>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('[data-editableCombobox="true"]').each(function () {
            $(this).combobox();
        });
    });
    </script>
    <!--Header Start -->
    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="# ">Haccp Builder</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Default.aspx">Home</a></li>
            <li><a href="../LogOut.aspx">Logout</a></li>      
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container">
    <form id="form1" runat="server">
    <div>
    <h3>&nbsp;</h3> Observer: <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Error Testing" 
    CssClass="alert alert-danger" ControlToValidate="txtObserver">
    </asp:RequiredFieldValidator>
     <asp:Button ID="btnContinue" runat="server" OnClick="Button1_Click" Text="Continue"  CssClass="btn btn-primary" />
    </div>
    </form>
    </div>
     <div id="footer" align="center"><div id="footer_txt">© HACCP Builder </div>
    </div>  
</body>
</html>
