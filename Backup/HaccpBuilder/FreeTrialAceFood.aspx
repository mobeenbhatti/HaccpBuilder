<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeTrialAceFood.aspx.cs" Inherits="HaccpBuilder.FreeTrialAceFood" %>
<%@ Register src="Controls/FreeTrialGlenn.ascx" tagname="FreeTrialAceFood" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demonstration Ace Food Safety</title>
    <style>
    .imageDiv
    { float:left;width:32%; text-align:center; height:100%;}
     img{vertical-align:middle;}   
    </style>
    <link href="App_Themes/Facility/style.css" type="text/css"  rel="Stylesheet" />
</head>
<body>
   
    <form id="form1" runat="server">
        <center>
             <div style="width:600px; margin-top:20px;" class="form3">
             <div>
                <div class="left"><img src="App_Themes/Facility/Images/100_w_pixl_logo_small_03.gif" alt="" /></div>
                <div class="right"><img src="images/AceFoodSafety.png" alt=""  /> </div>
                <div class="clear"></div>
              </div>
              <hr />               
              <h2> HACCP Builder Demonstration Sign Up </h2>
              <uc1:FreeTrialAceFood ID="AceFoodSafety" runat="server" /> 
             </div> 
           </center>  
    </form>

</body>
</html>
