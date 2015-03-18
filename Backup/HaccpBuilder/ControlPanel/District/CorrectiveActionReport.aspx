<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true" CodeBehind="CorrectiveActionReport.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.CorrectiveActionReport" %>
<%@ Register assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI.Compatibility" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script src="../../JScript/jquery-1.8.3.js" type="text/javascript" ></script>
<%--<script src="../../JScript/jquery.easing.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../JScript/jquery.easy-ticker.js"></script>--%>
<script src="../../JScript/newsTicker.js" type="text/javascript"></script>
<link href="../../App_Themes/Facility/newsTicker.css" />
<%-- Old Ticker
<script type="text/javascript">
    $(document).ready(function () {

        var dd = $('#dvTicker').easyTicker({
            direction: 'up',
            easing: 'easeInOutBack',
            speed: 'slow',
            interval: 2000,
            height: 'auto',
            visible: 10,
            mousePause: 0,
            controls: {
                up: '.up',
                down: '.down',
                toggle: '.toggle',
                stopText: 'Stop !!!'
            }
        }).data('easyTicker');

        cc = 1;
        $('.aa').click(function () {
            $('.vticker ul').append('<li>' + cc + ' Triangles can be made easily using CSS also without any images. This trick requires only div tags and some</li>');
            cc++;
        });

        $('.vis').click(function () {
            dd.options['visible'] = 3;

        });

        $('.visall').click(function () {
            dd.stop();
            dd.options['visible'] = 0;
            dd.start();
        });
</script> --%>
<script type="text/javascript">
           

            var oneliner = $('#oneliner .newsticker').newsTicker({
                row_height: 44,
                max_rows: 1,
                time: 5000,
                nextButton: $('#oneliner .header')
            });

            // Pause newsTicker on .header hover
            $('#oneliner .header').hover(function() {
                oneliner.newsTicker('pause');
            }, function() {
                oneliner.newsTicker('unpause');
            });
            $(document).ready(function () {
            autoUpdate();
            });

            function autoUpdate()
            {           
          var multilines = $('#multilines .newsticker').newsTicker({
                row_height: 200,
                max_rows: 5,
                speed: 800,
                prevButton: $('#multilines .prev-button'),
                nextButton: $('#multilines .next-button'),
                stopButton: $('#multilines .stop-button'),
                startButton: $('#multilines .start-button'),
            });

             $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "CorrectiveActionReport.aspx/CorrectiveActionFeed",
            data: "{}",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.d.length; i++) {
                    $("#dvData").append("<li><table class='ticker'>"
                    + "<tr><td><b>Facility Name:</b></td><td>" + data.d[i].Kitchen + "</td></tr>"
                    + "<tr><td><b>Log/Checklist:</b></td><td>" + data.d[i].Name + "</td></tr>"
                    + "<tr><td><b>Question:</b></td><td>" + data.d[i].Question  + "</td></tr>"
                    + "<tr><td><b>Corrective Action:</b></td><td>" + data.d[i].CorrectiveAction + "</td></tr>"
                    + "<tr><td><b>Staff:</b></td><td>" + data.d[i].Staff  + "</td></tr>"
                    + "<tr><td><b>Date:</b></td><td>" + data.d[i].EntryDate + "</td></tr>"
                    + "<tr><td><b>Time:</b></td><td>" + data.d[i].EntryTime + "</td></tr>"
                    +  "</tr><table></li>");
                }
                setTimeout(autoUpdate, 50000);
            },
            error: function (result) {
                alert("Error:" + result.toString());
            }
        });
    }
        </script>
<script type="text/javascript">
       
</script>
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> REPORTS</h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
      
    </div>
    <div class="form3">
        <div class="grey_bg_dis" id="multilines">
         <div class="controls"> 
        
            <a class="prev-button" href="#/multilines" >Prev</a> - <a class="next-button" href="#/multilines" >Next</a> - <a class="stop-button" href="#/multilines" >Stop</a> - <a class="start-button" href="#/multilines" >Start</a> 
        </div>
        <div class="container">
            <ul class="newsticker" id="dvData">
            </ul>  
        </div>     
       
        </div> 
        <div class="clear"></div>
    </div>
	<div class="form3">
	<table  border="0" cellspacing="0" cellpadding="0"> 
                 <tr>
                   <td colspan="11">&nbsp;</td>                  
                </tr>                  
                <tr>
                  <td >Select Facility:</td>
                  <td  ><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td  > 
                  <asp:DropDownList ID="ddlKitchenName" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Name" DataValueField="KitchenId" AppendDataBoundItems="true">
                  <asp:ListItem Text="All Facilities" Value="1"> </asp:ListItem>
                  </asp:DropDownList></td>                  
               </tr>
               <tr><td colspan="5">&nbsp;</td></tr>
               <tr>                 
                  <td >Start Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td> <cc1:CalendarPopup ID="cldStartDate" runat="server" CommandName="Calendar" 
                     ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png"></cc1:CalendarPopup>
                 </td>                 
                </tr>
                 <tr><td colspan="3">&nbsp;</td></tr>
                <tr>                 
                  <td >End Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><cc1:CalendarPopup ID="cldEndDate" runat="server" CommandName="Calendar" 
                     ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png"></cc1:CalendarPopup></td>                 
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                 <tr><td colspan="3"><asp:ImageButton ID="cmdSubmit" runat="server" 
                 ImageUrl="~/images/District Images/ButtonGO.png" onclick="cmdSubmit_Click" /></td></tr>                       
              </table>
    <div class="clear"></div>
	</div>
	 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetKitchenByDistrictId" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchen">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource> 
       
   
     <div class="clear"></div>
    <div class="table">
    <div class="box-header">
      <h4 class="left"> </h4>
    </div>
    <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" onrowcommand="grdReport_RowCommand" PageSize="20"
                 onpageindexchanging="grdReport_PageIndexChanging">                
                <Columns>   
                     <asp:BoundField DataField="CorrectiveAction" HeaderText="Corrective Action"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                       
                    </asp:BoundField> 
                    <asp:BoundField DataField="Kitchen" HeaderText="Facility Name"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                       
                        </asp:BoundField>                        
                    <asp:BoundField DataField="Staff" HeaderText="Staff Name"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                        
                    </asp:BoundField> 
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                        
                    </asp:BoundField> 
                    <asp:BoundField DataField="Name" HeaderText="Log/Checklist"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                        
                    </asp:BoundField>  
                     <asp:BoundField DataField="Question" HeaderText="Question"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                       
                    </asp:BoundField> 	 
                     <asp:BoundField DataField="OpenField" HeaderText="Open Entry Field"  HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="100px" >	                    
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>                       
                    </asp:BoundField> 	 
                </Columns>
            </asp:GridView>
    </div>
</div>

   
</asp:Content>
