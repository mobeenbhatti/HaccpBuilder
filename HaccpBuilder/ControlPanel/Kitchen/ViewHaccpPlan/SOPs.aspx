<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_SOPs" Codebehind="SOPs.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div id="container">
    <div style="overflow:visible; height:50%;">
    	<table>
        <tr>
            <!-- PLACE SOP DETAILVIEW HERE -->
            <td style="background-color:#99ccff;">
                <h2><font face="Arial">HACCP-Based SOPs</font></h2>
            </td>
        </tr>
        <tr>
            <td>
            
           <%-- <hr color="red"/>--%>
            <asp:Repeater ID="Repeater2" runat="server" 
                DataSourceID="SqlDataSource1" onitemdatabound="Repeater2_ItemDataBound">
  
                <ItemTemplate>
               
             <tr>        
                <td>
             
             
                
                    <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%">    
                            <Fields>
                                 <asp:TemplateField >
                                        <ItemTemplate>
                                            <table>
                                            <tr>
                                            <td class="SOPHeading2" style="font-size:larger">
                                            <b>  <%# DataBinder.Eval(Container.DataItem, "Title")%> </b>
                                            </td>
                                            </tr>
                                            <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> PURPOSE: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "Purpose")%>
                                            
                                            </td>
                                            </tr>
                                             <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> SCOPE: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "Scope")%>
                                            
                                            </td>
                                            </tr>
                                             <tr>
                                            
                                            <td class="SOPHeading1">
                                            <b> KEYWORDS: </b>
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td class="SOPList">
                                            <%#  DataBinder.Eval(Container.DataItem, "KeyWords")%>
                                            
                                            </td>
                                            </tr>
                                            
                                            
                                            
                                                <%--<div class="SOPHeading2">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                                 </div>
                                                 <div class="SOPHeading1"> <b> PURPOSE: </b> </div>
                                                   <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Purpose")%>
                                                  </div>
                                                  <div class="SOPHeading1"><b> SCOPE: </b> </div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Scope")%>
                                                  </div>
                                                  <div class="SOPHeading1"><b> KEYWORDS: </b></div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "KeyWords")%>
                                                  </div>
                                                  --%>
                                                  
                                                  <tr>
                                                  <td class="SOPHeading1">
                                                <b> INSTRUCTIONS: </b>
                                                  </td>
                                                  </tr >
                                                  <tr id="Tr1" runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr2"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions2")%>
                                                  </td>
                                                  </tr>
                                                  
                                                   
                                                    <tr id="Tr3"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions3")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr4"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions3").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions4")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr5"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions5")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr6"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions6").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions6")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr7"   runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions7").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions7")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr8"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions8").ToString()) ? false : true%> '>
                                                  <td class="SOPList">
                                                 <%# (Eval("Instructions9").ToString() != "" ? "8. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions8")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr9"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions9").ToString() != "" ? "9. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions9")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr10"  runat="server"  visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions10").ToString() != "" ? "10. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions10")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr11"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions11").ToString() != "" ? "11. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions11")%>
                                                  </td>
                                                  </tr>
                                                   <tr visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions12").ToString() != "" ? "12. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions12")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr12"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions13").ToString() != "" ? "13. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions13")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr13"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions14").ToString() != "" ? "14. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions14")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr14"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions15").ToString() != "" ? "15. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions15")%>
                                                  </td>
                                                  </tr>
                                                     <tr visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions16").ToString() != "" ? "16. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions16")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr15"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions17").ToString() != "" ? "17. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions17")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr16"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions18").ToString() != "" ? "18. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions18")%>
                                                  </td>
                                                  </tr>
                                                     <tr id="Tr17"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions19").ToString() != "" ? "19. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions19")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr18"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Instructions20").ToString() != "" ? "20. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions20")%>
                                                  </td>
                                                  </tr>
                                                
                                                  
                                                  
                                                 <%-- <div class="SOPHeading1"> <b> INSTRUCTIONS: </b></div>
                                                    <div class="SOPList"  visible='<%# string.IsNullOrEmpty(Eval("Instructions1").ToString()) ? false : true%>' ><%# (Eval("Instructions1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions1")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions2").ToString()) ? false : true%>'><%# (Eval("Instructions2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions2")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions3").ToString()) ? false : true%>'><%# (Eval("Instructions3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions3")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions4").ToString()) ? false : true%>'><%# (Eval("Instructions4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions4")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions5").ToString()) ? false : true%>'><%# (Eval("Instructions5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions5")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions6").ToString()) ? false : true%>'><%# (Eval("Instructions6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions6")%></div>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions7").ToString()) ? false : true%>'><%# (Eval("Instructions7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions7")%></div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions8").ToString()) ? false : true%>'>
                                                    <div class="SOPList"><%# (Eval("Instructions8").ToString() != "" ? "8. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions8")%></div>
                                                    </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'>
                                                  
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions9").ToString()) ? false : true%>'><%# (Eval("Instructions9").ToString() != "" ? "9. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions9")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions10").ToString()) ? false : true%>'><%# (Eval("Instructions10").ToString() != "" ? "10. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions10")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions11").ToString()) ? false : true%>'><%# (Eval("Instructions11").ToString() != "" ? "11. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions11")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'>
                                                    
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions12").ToString()) ? false : true%>'><%# (Eval("Instructions12").ToString() != "" ? "12. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions12")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions13").ToString()) ? false : true%>'><%# (Eval("Instructions13").ToString() != "" ? "13. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions13")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions14").ToString()) ? false : true%>'><%# (Eval("Instructions14").ToString() != "" ? "14. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions14")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions15").ToString()) ? false : true%>'><%# (Eval("Instructions15").ToString() != "" ? "15. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions15")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions16").ToString()) ? false : true%>'><%# (Eval("Instructions16").ToString() != "" ? "16. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions16")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions17").ToString()) ? false : true%>'><%# (Eval("Instructions17").ToString() != "" ? "17. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions17")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions18").ToString()) ? false : true%>'><%# (Eval("Instructions18").ToString() != "" ? "18. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions18")%></div>
                                                   </div>
                                                    <div visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions19").ToString()) ? false : true%>'><%# (Eval("Instructions19").ToString() != "" ? "19. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions19")%></div>
                                                    </div>
                                                     <div visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'>
                                                    <div class="SOPList" visible='<%# string.IsNullOrEmpty(Eval("Instructions20").ToString()) ? false : true%>'><%# (Eval("Instructions20").ToString() != "" ? "20. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions20")%></div>
                                                  </div>--%>
                                                 
                                                    <tr>
                                                  <td class="SOPHeading1">
                                                 <b> MONITORING:</b>
                                                 </td>
                                                  </tr>
                                                    <tr id="Tr19"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr20"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring2")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr21"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring3")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr22"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring4")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr23"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring5")%>
                                                  </td>
                                                  </tr>
                                                      <tr id="Tr24"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring6").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring6")%>
                                                  </td>
                                                  </tr>
                                                  <tr id="Tr25"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("Monitoring7").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("Monitoring7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring7")%>
                                                  </td>
                                                  </tr>
                                                  
                                                     <tr>
                                                  <td class="SOPHeading1">
                                                 <b> CORRECTIVE ACTIONS:</b>
                                                 </td>
                                                  </tr>
                                                    <tr id="Tr26"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction1").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction1")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr27"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction2").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction2")%>
                                                  </td>
                                                  </tr>
                                                    <tr id="Tr28"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction3").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction3")%>
                                                  </td>
                                                  </tr>
                                                    <tr visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction4").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction4")%>
                                                  </td>
                                                  </tr>
                                                   <tr id="Tr29"  runat="server" visible='<%# string.IsNullOrEmpty(Eval("CorrectiveAction5").ToString()) ? false : true%>'>
                                                  <td class="SOPList">
                                                  <%# (Eval("CorrectiveAction5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction5")%>
                                                  </td>
                                                  </tr>
                                                  
                                                  
                                                 <%-- <div class="SOPHeading1"><b> MONITORING: </b></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring1")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring2")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring3")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring4")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring5")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring6")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring7")%></div>                                            
                                                  
                                                  <div class="SOPHeading1"> <b> CORRECTIVE ACTIONS: </b> </div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction1")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction2")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction3")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction4")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction5")%></div>                                        --%>    
                                                      <tr>
                                                  <td class="SOPHeading1">
                                                 <b> VERIFICATION AND RECORD KEEPING:</b>
                                                 </td>
                                                  </tr>
                                                     <tr>
                                                  <td class="SOPList">
                                                <%# "" + DataBinder.Eval(Container.DataItem, "Verification")%>
                                                  </td>
                                                  </tr>
                                                    </table>
                                                <%--  <div class="SOPHeading1"> <b> VERIFICATION AND RECORD KEEPING: </b></div>
                                                    <div class="SOPList"><%# "" + DataBinder.Eval(Container.DataItem, "Verification")%>
                                                  </div>
                                                  <div class="SOPHeading1"></div>--%>
                                                  <table align="center">
                                                    <tr>
	                                                    <td><strong>DATE IMPLEMENTED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
                                                    </tr>
                                                    <tr>
	                                                    <td><strong>DATE REVIEWED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>

                                                    </tr>
                                                    <tr>
	                                                    <td><strong>DATE REVISED: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; BY: &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;</strong></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                <tr>
                                                <td>
                                                 <div style="page-break-after:always"></div>
                                                </td>
                                                </tr>
                                                </table>
                                       </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                     
           
                 
                </td>
                

                <td><asp:HiddenField ID="hfSOPId" Value='<%# Eval("SOPId") %>' runat="server" />
                <%--<asp:Label ID="lblSOPId" Text='<%# Eval("SOPId") %>' runat="server"></asp:Label>--%>
                </td>
            </tr>


        </ItemTemplate>
           
            </asp:Repeater>
             </td>
		</tr>
		</table>
		   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetSOPsBykitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource> 
                    
                    <div style="page-break-after:always"></div>

	<%--<div style="page-break-after:always"></div>--%>
	<table>
        
        <tr>
            <td align="center" style="background-color:#99ccff; >
               <span style="font-size:larger;"> HACCP Plan Built by HACCP BUILDER </span>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
		    <td>		
		        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDSKitchenDetails" Height="50px" Width="125px">    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate>
                    <table >                    
                        <%--<tr>                                               
                            <td width="80%">
                                <asp:Label ID="lblDistrict" Text='<%# "School District: " + DataBinder.Eval(Container.DataItem,"DistrictName") %>' runat="server"></asp:Label>                
                            </td>                    
                            
                        </tr>--%>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblKitchenCity" Text='<%# "Site Location Name: " + DataBinder.Eval(Container.DataItem,"KitchenName") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>                    
                             <td>
                                 <asp:Label ID="lblManager" Text='<%# "Manager: " + DataBinder.Eval(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                             </td> 
                        </tr>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblMail2" Text='<%# "Email: " + DataBinder.Eval(Container.DataItem,"EmailAddress") %>' runat="server"></asp:Label>
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblKitchenAddress" Text='<%# "Address: " + DataBinder.Eval(Container.DataItem,"Address").ToString().Trim() %>' runat="server"></asp:Label>
                            </td>  
                       </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" Text='<%# "County: " + DataBinder.Eval(Container.DataItem,"County") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text='<%# "City: " +  DataBinder.Eval(Container.DataItem,"City") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                       
                        <tr>                    
                            <td>
                                <asp:Label ID="lblPhone2" Text='<%# "Phone: " +   DataBinder.Eval(Container.DataItem,"Phone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                        
                        <tr>                  
                            <td>
                                <asp:Label ID="lblAltPhone" Text='<%# "Alternate Phone: " + DataBinder.Eval(Container.DataItem,"AltPhone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>                  
                            <td>
                                <asp:Label ID="lblFax" Text='<%# "Fax: " + DataBinder.Eval(Container.DataItem,"Fax") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
               </ItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetFoodCategoriesByKitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource>
                                 <asp:SqlDataSource ID="SqlDSKitchenDetails" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetKitchenDetailByKitchenId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
            SessionField="KitchenId" Type="Int32" />        
    </SelectParameters>
</asp:SqlDataSource>
            </td>
		</tr>
		<tr>
		</tr>
        <tr>
            <td align="center">
                HACCP BUILDER * 186 Washington Street * Saint Paul, MN * 55102 * Phone 612 296 2486 * Email 
                s.schany@haccpbuilder.com * Website www.haccpbuilder.com <br />
                Creators of HBflex, HBflex with Reporting and Command Central<br />
                Application Service Provider as well as Software Solutions
            </td>
        </tr> 
	</table> 
    </div>
    </div>
    </form>
</body>
</html>
