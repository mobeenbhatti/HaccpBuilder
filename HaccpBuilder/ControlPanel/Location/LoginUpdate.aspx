<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUpdate.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.LoginUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../../App_Themes/Facility/style.css" rel="stylesheet" />
    <script src="../../JScript/jquery-1.8.3.js" type="text/javascript"></script>
</head>
<body>
    <script type="text/javascript">
        function checkForm(form) {
            $('#errorMsg').text($('#txtUserName').val());
            if ($('#txtUserName').val() == "") {
                $('#errorMsg').text("Error: Username cannot be blank!"); $('#txtUserName').focus(); return false;
            }
            re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test($('#txtUserName').val())) {
                $('#errorMsg').text("Error: Email is not valid!"); $('#txtUserName').focus(); return false;
            }
            if ($('#txtPassword').val() != "" && $('#txtPassword').val() == $('#txtConfirmPassword').val()) {
                if ($('#txtPassword').val().length < 6) {
                    $('#errorMsg').text("Error: Password must contain at least six characters!"); $('#txtPassword').focus(); return false;
                }
                if ($('#txtPassword').val() == $('#txtUserName').value) {
                    $('#errorMsg').text("Error: Password must be different from Username!"); $('#txtPassword').focus(); return false;
                }
                re = /[0-9]/;
                if (!re.test($('#txtPassword').val())) {
                    $('#errorMsg').text("Error: password must contain at least one number (0-9)!"); $('#txtPassword').focus(); return false;
                }
                re = /[a-z]/;
                if (!re.test($('#txtPassword').val())) {
                    $('#errorMsg').text("Error: password must contain at least one lowercase letter (a-z)!"); $('#txtPassword').focus(); return false;
                }
                re = /[A-Z]/;
                if (!re.test($('#txtPassword').val())) {
                    $('#errorMsg').text("Error: password must contain at least one uppercase letter (A-Z)!"); $('#txtPassword').focus(); return false;
                }
            }
            else {
                $('#errorMsg').text("Error: Please check that you've entered and confirmed your password!"); $('#txtPassword').focus(); return false;
            }
            $('#errorMsg').text("You entered a valid password: " + $('#txtPassword').val());
            return true;
        }
    </script>
    
       
    <form id="Form1" runat="server" >        
             <div>
            <center>
                <div class="form3" style="width:300px; margin-top:150px">
            <div class="msg-error" id="errorMsg" runat="server">For security reasons, we have changed our login policy and we are requesting that you update your username and password.  Your username must be an email address you are able to access and your password must be at least eight characters in length and contain at least three of the following four character sets: English uppercase letters, English lowercase letters, Arabic numerals, and non-alphanumeric (“special”) characters.
            </div>
             <p class="left h1margin-r" >
                 Username: 
                 <input type="text" name="username" runat="server" id="txtUserName" class="small" >
             </p> 
             <div class="clear"></div>
            <p class="left h1margin-r">
                Password: 
                <input type="password" name="pwd1" runat="server" id="txtPassword" class="small">

            </p> 
            <div class="clear"></div>
            <p class="left h1margin-r">
                Confirm Password: 
                <input type="password" name="pwd2" runat="server" id="txtConfirmPassword" class="small">

            </p> 
            <div class="clear"></div>
            <p class="left h1margin-r">
               <asp:Button ID="cmdSubmit" runat="server" OnClientClick="return checkForm(this);" Text="Submit" CssClass="blue button" OnClick="cmdSubmit_Click" />
                <a href="../LogOut.aspx">Logout</a>
            </p>
            <div class="clear"></div>
            </div> 
         </center>
        </div>
        
    </form>
       
    
    
</body>
</html>