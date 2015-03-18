// Menu Script
// ----------------------------------------------------------------

var secs2
var timerID2 = null
var timerRunning2 = false
var delay2 = 1000

function InitializeTimer2()
{
    secs2 = 20
    StopTheClock2()
    StartTheTimer2()
}

function StopTheClock2()
{
    if(timerRunning2)
        clearTimeout(timerID2)
    timerRunning2 = false
}

function StartTheTimer2()
{
    if (secs2==0)
    {
        StopTheClock2()
        resetMenu()
    }
    else
    {
        secs2 = secs2 - 1
        timerRunning2 = true
        timerID2 = self.setTimeout("StartTheTimer2()", delay2)
    }
}


function resetMenu()
{
  // Reset Menu
  setMenuPos("mnuHome");document.getElementById("mnuHome").style.visibility="Hidden";
  setMenuPos("mnuLearnMore");document.getElementById("mnuLearnMore").style.visibility="Hidden";
  setMenuPos("mnuRequirements");document.getElementById("mnuRequirements").style.visibility="Hidden";
  setMenuPos("mnuRequestInformation");document.getElementById("mnuRequestInformation").style.visibility="Hidden";
  setMenuPos("mnuHelp");document.getElementById("mnuHelp").style.visibility="Hidden";
  setMenuPos("mnuDemo");document.getElementById("mnuDemo").style.visibility="Hidden";
}

function setMenuPos(sMenuItem)
{
  var winW = 630, winH = 460;
  var iFactor;

  if (parseInt(navigator.appVersion)>3) {
   if (navigator.appName=="Netscape") {
    winW = window.innerWidth;
    winH = window.innerHeight;
   }
   if (navigator.appName.indexOf("Microsoft")!=-1) {
    winW = document.body.offsetWidth;
    winH = document.body.offsetHeight;
   }
  }
  // Set New Menu  
  switch (sMenuItem)
  {
     case "mnuHome" : iFactor=0;break;
     case "mnuLearnMore" : iFactor=1;break;
     case "mnuRequirements" : iFactor=2;break;
     case "mnuRequestInformation" : iFactor=3;break;
     case "mnuHelp" : iFactor=4;break;
     case "mnuDemo" : iFactor=5;break;
  }
  iFactor = iFactor * 80;
  document.getElementById(sMenuItem).style.left=parseInt((winW/2)-400)-10+iFactor-1;
}

function menu(sMenuItem,sStatus)
{
  resetMenu();
  document.getElementById(sMenuItem).style.visibility=sStatus;
  InitializeTimer2();
}

function subMenu(oSubMenuItem, sStatus)
{
  // Set Sub Menu Color
  if (sStatus=='on')
  {
    oSubMenuItem.style.backgroundColor="#B4BABF";
  }
  else
  {
    oSubMenuItem.style.backgroundColor="#74808C";
  } 
}

function displayMenu()
{
  var sIndent    = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  var sSeparator = "<tr><td height='1' bgcolor='#59636C'></td></tr>";

  // --- Main Pull Down Menu
  document.write("<table width='100%' cellspacing='0' cellpadding='0' bgcolor='#52606A'>");
  document.write("<tr align='left' valign='bottom'>");
  document.write("<td><a href=\"index.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Home','','images/btnHome2.jpg',1);menu('mnuHome','visible')\"><img src=\"images/btnHome.jpg\" alt=\"Home\" name=\"Home\" border=\"0\"></a></td>");
  document.write("<td><a href=\"products.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('LearnMore','','images/btnproducts2.jpg',1);menu('mnuLearnMore','visible')\"><img src=\"images/btnproducts.jpg\" alt=\"LearnMore\" name=\"LearnMore\" border=\"0\"></a></td>");
  document.write("<td><a href=\"services.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Requirements','','images/btnservices2.jpg',1);menu('mnuRequirements','visible')\"><img src=\"images/btnservices.jpg\" alt=\"Requirements\" name=\"Requirements\" border=\"0\"></a></td>");
  document.write("<td><a href=\"pricing.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('RequestInformation','','images/btnorder2.jpg',1);menu('mnuRequestInformation','visible')\"><img src=\"images/btnorder.jpg\" alt=\"RequestInformation\" name=\"RequestInformation\" border=\"0\"></a></td>");
  document.write("<td><a href=\"http://www.apexpacific.com/knowledgebase/sitestats/index.asp\" target=\"_blank\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Help','','images/btnhelp2.jpg',1);menu('mnuHelp','visible')\"><img src=\"images/btnhelp.jpg\" alt=\"Help\" name=\"Help\"  border=\"0\"></a></td>");
  document.write("<td><a href=\"clients.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Demo','','images/btnclients2.jpg',1);menu('mnuDemo','visible')\"><img src=\"images/btnclients.jpg\" alt=\"Demo\" name=\"Demo\"  border=\"0\"></a></td>");
  document.write("<td><a href=\"login.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Login','','images/btnlogin2.jpg',1);resetMenu();\"><img src=\"images/btnlogin.jpg\" alt=\"Login\" name=\"Login\" border=\"0\"></a></td>");
  document.write("<td width='500' align='right'></td>");
  document.write("</tr>");
  document.write("</table>");

  // --- Home Sub Menu
  document.write("<div id=\"mnuHome\" style=\"position:absolute; left:41px; top:100px; width:168px; z-index:2; visibility:hidden; float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuHome','visible')\" >");
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"aboutus.html\">About Dynamic SiteStats</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/aboutus.html\" target=\"_blank\">About ApexPacific</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/news.asp\" target=\"_blank\">News & Press Release</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/awards.html\" target=\"_blank\">Awards & Achivements</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/newsletters/index.html\" target=\"_blank\">NetMarketer Newsletter</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"contactus.html\">Contact Us</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  // --- LearnMore Sub Menu
  document.write("<div id=\"mnuLearnMore\" style=\"position:absolute; left:57px; top:100px; width:168px; z-index:2; visibility:hidden float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuLearnMore','visible')\" >"); 
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"enterprise.html\">Enterprise Editions</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"ebusiness.html\">E-Business Editions</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"premium.html\">Premium Editions</a></td></tr>");
  document.write(sSeparator);
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"ebusiness_rtca.html\">Live Cost Analysis</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"pathexplorer.html\">Path Explorer</a></td></tr>");
  document.write(sSeparator);
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"features.html\">Features & Benefits</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"technology.html\">How it works</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/action/signupwizard.UserProcess/resid/209576880\">Free Trial</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/action/Login?userid=demo01&password=demo01&bsp_id=1000&resid=209576880&eventSubmit_doLogin=1&Login=1\">Demo</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/action/Login?userid=demottc&password=demottc&bsp_id=1000&resid=209576880&eventSubmit_doLogin=1&Login=1\">Demo - Dashboard</a></td></tr>");
  document.write(sSeparator);
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/products.html\" target=\"_blank\">SEO LearnMore</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  // --- Requirements Sub Menu
  document.write("<div id=\"mnuRequirements\" style=\"position:absolute; left:41px; top:100px; width:168px; z-index:2; visibility:hidden; float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuRequirements','visible')\" >");
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/services.html\" target=\"_blank\">SEO Requirements</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  // --- RequestInformation Sub Menu
  document.write("<div id=\"mnuRequestInformation\" style=\"position:absolute; left:41px; top:100px; width:168px; z-index:2; visibility:hidden; float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuRequestInformation','visible')\" >");
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"order.html\">Enterprise Editions</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/action/signupwizard.UserProcess/resid/209576880/edition_id/STAT3\">E-Business Editions</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/action/signupwizard.UserProcess/resid/209576880/edition_id/STAT20\">Premium Editions</a></td></tr>");
  document.write(sSeparator);
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"pricing.html\">Pricing</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  // --- Help Sub Menu
  document.write("<div id=\"mnuHelp\" style=\"position:absolute; left:57px; top:100px; width:168px; z-index:2; visibility:hidden float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuHelp','visible')\" > ");
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/knowledgebase/sitestats/index.asp\" target=\"_blank\">Knowledge Base</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"support.html\">Technical Support</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://statistics.dynamicsitestats.com/servlet/template/support,lostpassword.vm\">Lost Password?</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  // --- Demo Sub Menu
  document.write("<div id=\"mnuDemo\" style=\"position:absolute; left:57px; top:100px; width:168px; z-index:2; visibility:hidden float:left;filter:alpha(opacity=90);-moz-opacity:0.9;opacity:0.9;\" onMouseOver=\"menu('mnuDemo','visible')\" > ");
  document.write("  <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#59636C\">");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"clients.html\">Client List</a></td></tr>");
  document.write("    <tr><td height=20 bgcolor=\"#74808C\" class=\"PanelItem\"  onMouseOver=\"subMenu(this,'on')\" onMouseOut=\"subMenu(this,'off')\"><a class=\"SubMenu\" href=\"http://www.apexpacific.com/subtestimonial.asp?pd=dss\" target=\"_blank\">Testimonials</a></td></tr>");
  document.write("  </table>");
  document.write("</div>");

  resetMenu();
}
