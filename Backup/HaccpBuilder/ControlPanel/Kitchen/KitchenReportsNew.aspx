<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="KitchenReportsNew.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.KitchenReports" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    $("#pnlReports").addClass('selected');
    $(document).ready(function () {     
        if ($('#<%=lblReport.ClientID%>').text() != '') {
            $('html, body').animate({
                scrollTop: $('#<%=lblReport.ClientID%>').offset().top
            }, 2000);            
        }
       
       // call dialog box
        $("#<%= grdDailyReports.ClientID %> #opener").click(function() {
            $("#multilines").dialog("open");
// ticker configuration
var multilines = $('#multilines .newsticker').newsTicker({
                row_height: 300,
                max_rows: 5,
                speed: 9999,
                prevButton: $('#multilines .prev-button'),
                nextButton: $('#multilines .next-button'),
                stopButton: $('#multilines .stop-button'),
                startButton: $('#multilines .start-button')
            });
// ajax call to bind data
             $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "KitchenReportsNew.aspx/CorrectiveActionFeed",
            data: "{}",
            dataType: "json",
            success: function (data) {
            //console.log(data.d);
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
               // setTimeout(autoUpdate, 50000);
            },
            error: function (result) {
                alert("Error:" + result.toString());
            }
        });  
});


// dialog configuration
         $( "#multilines" ).dialog({
            autoOpen: false,
            height: 800,
            width: 850,
            modal: false,
            buttons: {
             Cancel: function() {
                $( this ).dialog( "close" );
                }
            }
         });
    });

</script>

<div id="titlediv"><!----HEADER-TITLE-START----->
  <div class="container">
    <div class="page-title">
      <h1> Facility Reports</h1>
    </div>
  </div>
</div>
<!----HEADER-TITLE-END----->
<!---- DIALOG DIV ----->
<div id="multilines">
        <div class="ticker-container">
    <ul class="newsticker" id="dvData">
    </ul>  
    </div>
    <div class="controls">         
            <a class="prev-button" href="#/multilines" >Prev</a> - <a class="next-button" href="#/multilines" >Next</a> - <a class="stop-button" href="#/multilines" >Stop</a> - <a class="start-button" href="#/multilines" >Start</a> 
    </div>
</div>
<!---- END DIALOG DIV ---->
<div class="container">
    <div class="ph-top"></div>
    <div class="table">
        <div class="box-header">
            <h4 class="left">LOCATION REPORTS</h4>
        </div>                
        <asp:GridView ID="grdDailyReports" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowCommand="grdDailyReports_RowCommand" CssClass="zebra">
                <Columns>
                    <asp:TemplateField HeaderText="Report Name">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlTableName" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/Default2.aspx?task=" + DataBinder.Eval(Container.DataItem, "TableName")%>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
                            </asp:HyperLink>
                            <asp:HiddenField ID="hfSectionId" Value='<%# DataBinder.Eval(Container.DataItem, "Report")  %>' runat="server" />
                            <asp:HiddenField ID="hfTypeId" Value='<%# DataBinder.Eval(Container.DataItem, "TypeId")  %>' runat="server" />
                        </ItemTemplate>                       
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <ew:CalendarPopup ID="cldStartDate" runat="server"
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <ew:CalendarPopup ID="cldEndDate" runat="server" CommandName="Calendar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>'
                                ControlDisplay="TextBoxImage" ImageUrl="~/images/Calendar_scheduleHS.png" Width="80px" />
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="View Report">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbView" Text="View" CommandName="View" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>'></asp:LinkButton>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Export to Excel">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbExport" Text="Export" CommandName="Export" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "TableName") %>' ></asp:LinkButton>
                        </ItemTemplate>                      
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Ticker">
                        <ItemTemplate>                        
                             <a href="#" id="opener" visible='<%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Corrective Action Report"? "true": "false" %>'><%# DataBinder.Eval(Container.DataItem, "TableName").ToString() == "Corrective Action Report"? "Ticker": "" %></a>
                        </ItemTemplate>                      
                    </asp:TemplateField>                   
                </Columns>
            </asp:GridView>
        <div class="box-bottom"> </div>
    </div>
    <div class="clear tenpx"></div>
    <div class="form3">
        <asp:Label ID="lblReport" runat="server"></asp:Label>
    </div>
    <div class="table">
        <div class="box-header">
            <h4 class="left"></h4>
        </div>
        <asp:GridView ID="grdColdHoldingLog" runat="server" AutoGenerateColumns="False" CssClass="zebra" onselectedindexchanging="grdColdHoldingLog_SelectedIndexChanging"  onpageindexchanging="grdColdHoldingLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>	                       
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>	                    
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>	                      
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>   
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>                     
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ></asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date"></asp:BoundField>
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>
                </Columns>
            </asp:GridView>
         <asp:GridView ID="grdHotHoldingLog" runat="server" AutoGenerateColumns="False"  CssClass="zebra" onselectedindexchanging="grdHotHoldingLog_SelectedIndexChanging"  onpageindexchanging="grdHotHoldingLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>	                      
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>	                       
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>	                      
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                     
                    </asp:TemplateField>   
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ></asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date"></asp:BoundField>
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" CssClass="zebra" onselectedindexchanging="grdReport_SelectedIndexChanging"  onpageindexchanging="grdReport_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblServiceDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                     
                    </asp:TemplateField>                     
	                <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="llbCategory" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>	                     
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblOutput" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>	                     
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblInput" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>	                     
	                    </asp:TemplateField >
                    <asp:TemplateField HeaderText="Internal Temp1">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField> 
                     <asp:TemplateField HeaderText="Corrective Action1">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction1" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction1")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Internal Temp2">
                        <ItemTemplate>
                            <asp:Label ID="lblInternalTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Internaltemp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action2">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction2" Text='<%# DataBinder.Eval(Container.DataItem, "CorrectiveAction2")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>     
                    <asp:BoundField DataField="BatchNo" HeaderText="Batch No" />
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" />
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                     
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFreezerLog" runat="server" AutoGenerateColumns="False" CssClass="zebra"
                 onpageindexchanging="grdFreezerLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#Eval("FoodItem").ToString() == "2"? "Output":Eval("FoodItem").ToString() == "1"?"Input":"No Ingredient/Menu Item"%>'></asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Output">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "MenuItem") %>'></asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField >
	                <asp:TemplateField HeaderText="Input">
	                        <ItemTemplate>
	                           <asp:Label ID="lblFoodItem" runat="server"  Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>
	                        </ItemTemplate>
	                    </asp:TemplateField >                 
                     <asp:TemplateField HeaderText="Temp 1">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp1").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 1 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp1Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp1Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                      <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action 1" />
                     <asp:TemplateField HeaderText="Temp 2">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 2 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp2Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:BoundField DataField="CorrectiveAction2" HeaderText="Corrective Action 2" >                   
                    </asp:BoundField>                   
                     <asp:TemplateField HeaderText="Temp 3">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3" Text='<%# DataBinder.Eval(Container.DataItem, "Temp3").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temp3").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Temp 3 Time">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3Time" Text='<%# DataBinder.Eval(Container.DataItem, "Temp3Time","{0:T}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:BoundField DataField="CorrectiveAction3" HeaderText="Corrective Action 3" ></asp:BoundField>                   
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" />
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdReceivingLog" runat="server" AutoGenerateColumns="False"  CssClass="zebra"  onpageindexchanging="grdReceivingLog_PageIndexChanging" PageSize="20"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" />     
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Vendor" HeaderText="Vendor" />
                     <asp:BoundField DataField="BatchNumber" HeaderText="Batch/Lot No." />
                    <asp:BoundField DataField="Volume" HeaderText="Volume" />
                    <asp:BoundField DataField="Ingredient" HeaderText="Ingredient" />
                      <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" />
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" />
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" />
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdRefrigerationLog" runat="server" AutoGenerateColumns="False" 
                 CssClass="zebra"
                onpageindexchanging="grdRefrigerationLog_PageIndexChanging"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>                      
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Unit/Device" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                       
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" ></asp:BoundField>
                    <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>                    
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdShippingLog" runat="server" AutoGenerateColumns="False" 
                 CssClass="zebra"
                onpageindexchanging="grdShippingLog_PageIndexChanging" PageSize="20"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="Customer" HeaderText="Company Name" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="BatchNumber" HeaderText="Batch/Lot No." 
                        ItemStyle-Width="100px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Volume" HeaderText="Volume" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="MenuItem" HeaderText="Output" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>       
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFreezerNewLog" runat="server" AutoGenerateColumns="False" 
                 CssClass="zebra"
                onpageindexchanging="grdFreezerNewLog_PageIndexChanging"  >                
                <Columns>                     
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Unit/Device" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CorrectiveAction1" HeaderText="Corrective Action" 
                        ItemStyle-Width="150px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdThermoCaliberationLog" runat="server" AutoGenerateColumns="False" 
                 CssClass="zebra"
                onpageindexchanging="grdThermoCaliberationLog_PageIndexChanging"  >                
                <Columns>                    
                    <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundField>                    
                    <asp:TemplateField HeaderText="Service Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "MealDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />	                    
                    </asp:TemplateField>
                    <asp:BoundField DataField="Thermometer" HeaderText="Thermometer" 
                        ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Temperature">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>       
                    </asp:TemplateField>   
                         <asp:TemplateField HeaderText="Temperature 2">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp2" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature2").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature2").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                      <asp:TemplateField HeaderText="Temperature 3">
                        <ItemTemplate>
                            <asp:Label ID="lblTemp3" Text='<%# DataBinder.Eval(Container.DataItem, "Temperature3").ToString() == "99999.00" ? "NA":DataBinder.Eval(Container.DataItem, "Temperature3").ToString()  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:BoundField DataField="VerifiedBy" HeaderText="Verified By" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                            <asp:Label ID="lblMealDate" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'
                             runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EntryDate" HeaderText="Entry Date" ItemStyle-Width="100px" 
                        HeaderStyle-CssClass="gridheaderline" >
                    </asp:BoundField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdFoodSafety" runat="server" AutoGenerateColumns="False" 
                 onrowdatabound="grdFoodSafety_RowDataBound" CssClass="zebra"
                onpageindexchanging="grdFoodSafety_PageIndexChanging"  >                
                <Columns>  
                    <asp:TemplateField ItemStyle-Width="5px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                           <asp:HiddenField ID="hfHistoryId" Value='<%# DataBinder.Eval(Container.DataItem, "HistoryId")  %>' runat="server" />
                        </ItemTemplate>                       
	                    
                    </asp:TemplateField>          
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>                       
	                    
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Observer" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblObserver" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Observer")  %>'></asp:Label>
                        </ItemTemplate>                        
	                    
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="View / Print" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" Text="View/Print" Target="_blank" runat="server"></asp:HyperLink>
                        </ItemTemplate>  
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>   
                </Columns>
            </asp:GridView>
           <asp:GridView ID="grdValidation" runat="server" AutoGenerateColumns="False" CssClass="zebra"
                >                
                <Columns>           
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>                       
	                    
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="View / Print " ItemStyle-Width="200px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlView" Text="View/Print" NavigateUrl='<%# "~/ControlPanel/Kitchen/PrintValidation.aspx?date=" + DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>' Target="_blank" runat="server"></asp:HyperLink>
                        </ItemTemplate>                        
	                    
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdPhLog" runat="server" AutoGenerateColumns="False" 
                 CssClass="zebra"
                onselectedindexchanging="grdPhLog_SelectedIndexChanging" 
                onpageindexchanging="grdPhLog_PageIndexChanging"  >                
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                           <asp:Label ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/PhLog.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Category">
                        <ItemTemplate>
                            <asp:Label ID="lblFoodItem" runat="server" Text='<%#Eval("[CategoryName]")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="Ph Level Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction1" runat="server" Text='<%# Eval("CorrectiveActionPhLevel")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Water Temp Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction2" runat="server" Text='<%# Eval("CorrectiveActionWaterTemp")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Contact Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction3" runat="server" Text='<%# Eval("CorrectiveActionContact")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>                        
                    <asp:TemplateField HeaderText="Entry Date">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdPest" runat="server" AutoGenerateColumns="False" CssClass="zebra"
                  onselectedindexchanging="grdPestLog_SelectedIndexChanging" 
                onpageindexchanging="grdPestLog_PageIndexChanging" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" >
                        <ItemTemplate>
                            <asp:Label ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                       
                        
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Clean">
                        <ItemTemplate>
                             <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>                      
                    <asp:TemplateField HeaderText="Entry Date" >
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdMaintenance" runat="server" AutoGenerateColumns="False" CssClass="zebra"
                 onpageindexchanging="grdMaintenance_PageIndexChanging" 
                onselectedindexchanging="grdMaintenance_SelectedIndexChanging">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label  ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                       
                        
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Correct">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsCorrect").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Describe what was done">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("Comments")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdCleaning" runat="server" AutoGenerateColumns="False" CssClass="zebra"  
                onpageindexchanging="grdCleaning_PageIndexChanging" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />                    
                    <asp:TemplateField HeaderText="Service Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                       
                        
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText=" Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>  
                    <asp:TemplateField HeaderText="Is Clean">
                        <ItemTemplate>
                            <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>                   
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("CorrectiveAction")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Describe what was done">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("Comments")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Verified By">
                        <ItemTemplate>
                             <asp:Label ID="lblcorrectiveAction" runat="server" Text='<%# Eval("VarifiedBy")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Verified Date">
                        <ItemTemplate>
                              <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "VerifiedDate","{0:d}")  %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                        
                    </asp:TemplateField>                  
                    <asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate")  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField>     
                </Columns>
            </asp:GridView>
            <%--<asp:GridView ID="grdCheckList" runat="server" AutoGenerateColumns="false"  CssClass="zebra">
                    <Columns>                 
                        <asp:BoundField DataField="Name" HeaderText="Checklist Add On Section Name" ItemStyle-Width="50px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
	                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId")  %>'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField> 
                         <asp:BoundField DataField="Observer" HeaderText="Observer" ItemStyle-Width="150px" 
                            HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField ItemStyle-Width="50px" HeaderText="Account Type" HeaderStyle-CssClass="gridheaderline">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountType" Text='<%# DataBinder.Eval(Container.DataItem, "AccountType").ToString() == "1"? "Location Level":"Mobile Level"  %>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                            <ItemStyle  Width="50px"></ItemStyle>
                        </asp:TemplateField>  
                    </Columns>
               </asp:GridView>--%>
               <asp:GridView ID="grdCheckList" runat="server"  AutoGenerateColumns="false" CssClass="zebra" onrowdatabound="grdCheckList_RowDataBound" >
                <Columns>   
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Section Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField> 
	                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEntryDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}") %>' NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId")  %>'></asp:HyperLink>
                        </ItemTemplate>                       
                    </asp:TemplateField> 
                     <asp:TemplateField ItemStyle-Width="50px" HeaderText="Observer">
                        <ItemTemplate>
                            <asp:Label ID="lblObserver" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Observer") %>' ></asp:Label>
                        </ItemTemplate>                       
                    </asp:TemplateField>               
                    <asp:BoundField DataField="Checklist" ItemStyle-Width="250px" HeaderText="Question" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="250px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:Label ID="lblAnswer" Text='<%# Eval("BoolResponse") != null ? Eval("BoolResponse").ToString() == "1"? "Yes":Eval("BoolResponse").ToString() == "2"?"NA":"No" : "" %>'  runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="80px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OFResponse" ItemStyle-Width="200px" HeaderText="Remarks">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="200px"></ItemStyle>
                    </asp:TemplateField>
                     <asp:BoundField DataField="FilledBy" HeaderText="Filled By" ></asp:BoundField> 
                      <asp:TemplateField ItemStyle-Width="50px" HeaderText="Entry Date">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" NavigateUrl='<%# "~/ControlPanel/Kitchen/ChecklistQuestion.aspx?Edit=1&HistoryId=" + DataBinder.Eval(Container.DataItem, "CheckListHistoryId")  %>'></asp:HyperLink>
                        </ItemTemplate>                       
                    </asp:TemplateField> 
                </Columns>
            </asp:GridView>
            <asp:GridView ID="grdCorrectiveAciton" runat="server" AutoGenerateColumns="False" CssClass="zebra" AllowPaging="True" PageSize="20"
                 onpageindexchanging="grdCorrectiveAciton_PageIndexChanging">                
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
         <div class="box-bottom"> </div>
    </div>
</div>
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetKitchenReports" TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>           
            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
