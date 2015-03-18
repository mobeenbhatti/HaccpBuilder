<%@ Page Language="C#" AutoEventWireup="true" Inherits="_PasswordRecovery" Codebehind="PasswordRecovery.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:White;">
    <form id="form1" runat="server">
    <div>
    <center>
    <div style="margin-top:150px; border:solid 1px black; width:300px; ">
         <img src="../../App_Themes/Grid/Images/100_w_pixl_logo_small_03.gif" alt=""  />
    </div>       
    <div style="border:solid 1px black; width:300px; text-align:left; background-color:#dcdcdc;">
        <p>
		    The PasswordRecovery control allows you to recover your password based on the security
		    question and answer you provided when you signed up.
	    </p>
	    <div>
		    <asp:PasswordRecovery runat="server" ID="PasswordRecovery1" UserNameTitleText="Step 1"
			    QuestionTitleText="Step 2" />
	    </div>
	</div>
    </div>
    </form>
</body>
</html>
