<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeTrialTomFood.aspx.cs" Inherits="HaccpBuilder.FreeTrialTomFood" %>
<%@ Register src="Controls/FreeTrialGlenn.ascx" tagname="FreeTrialTomFood" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Free Trial Tom Food Safe</title>
    <style>
    .imageDiv
    { float:left;width:32%; text-align:center; height:100%;}
     img{vertical-align:middle;}   
    </style>
</head>
<body>
<table style="margin:100px auto; width:600px; border:1px solid #666;">
    <form id="form1" runat="server">
    
         
               <tr style="border:solid 1px black; width:100%; overflow:auto; height:100%">
                    <td class="imageDiv">&nbsp;<img src="App_Themes/Grid/Images/100_w_pixl_logo_small_03.gif" alt="" /></td>
                    <td class="imageDiv" valign="middle">&nbsp;</td>
                     <td class="imageDiv" valign="middle">&nbsp;<img src="images/TomFoodSafe.png" alt=""  /> </td>                   
              </tr>
              
              <tr style="border:solid 1px black; text-align:center; width:100%;">
                   <td><h1> HACCP Builder Free Trial Sign Up </h1> </td>
              </tr> 
                 
               <tr style="border:solid 1px black; text-align:left; background-color:#dcdcdc; width:100%;">
                    <td><uc1:FreeTrialTomFood ID="TomFoodSafe" runat="server" /> </td>
                </tr>
                
       
    
    </form>
</table>  
</body>
</html>
