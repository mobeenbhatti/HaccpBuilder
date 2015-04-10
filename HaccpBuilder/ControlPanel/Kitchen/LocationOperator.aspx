<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Kitchen/Facility.Master" AutoEventWireup="true" CodeBehind="LocationOperator.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.LocationOperatorNew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript" src="../../JScript/overlibmws.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //////////////// dialog box configuration        
            var dlg = $("#alertSettings").dialog({
                autoOpen: false,
                height: 600,
                width: 980,
                modal: false,
                buttons: {
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                }

            });
            dlg.parent().appendTo(jQuery("form:first"));
            ////////////////////dialog box for form
            var dlg2 = $(".slidingDiv").dialog({
                autoOpen: false,
                height: 800,
                width: 1095,
                modal: false,
                buttons: {
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                }

            });
            dlg2.parent().appendTo(jQuery("form:first"));
            ////////////////// DatePicker
            $("#<%=txtAlertDate.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'mm/dd/yy'
            });

            ////////////////AlertButton
<%--              $("#<%= cmdAddAlert.ClientID %>").click(function () {
-
                $("#<%= hfAlertID.ClientID %>").val("");
                ResetAlertFields();
                $("#alertSettings").dialog("open");
                return false;
            });--%>
            ///////////////// Function Save Alert Data
            $('#<%=cmdSaveAlerts.ClientID%>').click(function () {

                if (!Page_ClientValidate("AlertInput")) {
                    // do something                  
                    return false;
                }
                var obj = {};

                obj.AlertID = $("#<%= hfAlertID.ClientID %>").val();
                obj.AccountID = $("#<%= hfMobileId.ClientID %>").val();
                obj.AlertMessage = $("#<%= txtAlertMessage.ClientID %>").val();
                obj.ManagerMessage = $("#<%= txtManagerMessage.ClientID %>").val();
                obj.ReminderMeesage = $("#<%= txtReminderMessage.ClientID %>").val();
                obj.Reminder = $("#<%= txtReminderTime.ClientID %>").val();
                obj.ManagerAlert = $("#<%= txtManagerTime.ClientID %>").val();
                obj.hours = $("#<%= tpHour1.ClientID %>").val();
                obj.minutes = $("#<%= tpMinute1.ClientID %>").val();
                obj.ampm = $("#<%= tpTime1.ClientID %>").val();
                obj.Time = $("#<%= txtAlertDate.ClientID %>").val();
                obj.Mon = $("#<%= chkMon.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Tue = $("#<%= chkTue.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Thu = $("#<%= chkThu.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Fri = $("#<%= chkFri.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Sat = $("#<%= chkSat.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Sun = $("#<%= chkSun.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.Wed = $("#<%= chkWed.ClientID %>").attr('checked') == "checked" ? 1 : 0;
                obj.LogID = $("#<%= ddlLogs.ClientID %>").val();
                obj.LogName = $("#<%= ddlLogs.ClientID %> option:selected").text();
                obj.BccEmailAddresses = $("#<%= txtAlertEmail.ClientID %>").val();
                obj.AlertDate = $("#<%= txtAlertDate.ClientID %>").val();

                if ($("#<%= rdlAlertType.ClientID %>" + "_0").attr('checked') == "checked") {
                    obj.TypeId = 1;
                }
                if ($("#<%= rdlAlertType.ClientID %>" + "_1").attr('checked') == "checked") {
                    obj.TypeId = 2;
                }
                if ($("#<%= rdlAlertType.ClientID %>" + "_2").attr('checked') == "checked") {
                    obj.TypeId = 3;
                }
                if ($("#<%= rdlAlertType.ClientID %>" + "_3").attr('checked') == "checked") {
                    obj.TypeId = 4;
                }
                console.log(obj);

                $.ajax({
                    type: "POST",
                    url: "LocationOperator.aspx/SaveAlertSettings",
                    data: '{settingObj: ' + JSON.stringify(obj) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("Data has been updated successfully.");
                        //window.location.reload();
                        window.location.href = window.location.pathname;
                        //__doPostBack($('#<%=cmdSaveAlerts.ClientID %>'), "");
                        //__doPostBack('#<%=cmdSaveAlerts.ClientID %>', "");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //alert("Error:" + result.toString());
                        alert('Error: ' + errorThrown + ", " + jqXHR.responseText + ", " + textStatus);
                    }
                });
                return false;
            });
            ////////////////Show form
            $("#showForm").click(function () {

                $(".slidingDiv").dialog("open");
                return false;
            });
            if ($('#<%=hfEdit.ClientID %>').val() == "Y") {
                $(".slidingDiv").dialog("open");
            }
            ///////////////Alert Types Handling
            $('#weekdays').hide();
            $('#alertDate').hide();

            $('#<%=rdlAlertType.ClientID %>').click(function () {
                var alertType = $('#<%=rdlAlertType.ClientID %> input:checked').val();
                if (alertType == 'Daily' || alertType == 'Weekly') {
                    $('#alertDate').hide();
                    $("#weekdays").show();
                }
                if (alertType == 'Monthly' || alertType == 'Yearly') {
                    $('#weekdays').hide();
                    $("#alertDate").show();
                }

            });

            //  $(".slidingDiv").hide();
            $(".show_hide").show();

            $('.show_hide').click(function () {
                //    $(".slidingDiv").slideToggle();
            });
            ////////////////// Parent Child Grid Feature
            $("[src*=expand]").live("click", function () {
                $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
                $(this).attr("src", "../../App_Themes/Facility/images/collapse.png");
            });
            $("[src*=collapse]").live("click", function () {
                $(this).attr("src", "../../App_Themes/Facility/images/expand.png");
                $(this).closest("tr").next().remove();
            });
        });
        // End Ready method
        // call dialog box

        function ResetAlertFields() {
            var date1 = new Date();
            var hours = date1.getHours(); //returns 0-23  
            var minutes = date1.getMinutes(); //returns 0-59                     
            var ampm = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12;
            hours = hours ? hours : 12;
            $("#<%= hfAlertID.ClientID %>").val('');
            $("#<%= txtAlertMessage.ClientID %>").val('');
            $("#<%= txtManagerMessage.ClientID %>").val("");
            $("#<%= txtReminderMessage.ClientID %>").val("");
            $("#<%= txtReminderTime.ClientID %>").val("");
            $("#<%= txtManagerTime.ClientID %>").val("");
            $("#<%= tpHour1.ClientID %>").val(hours);
            $("#<%= tpMinute1.ClientID %>").val(minutes);
            $("#<%= tpTime1.ClientID %>").val(ampm);
            $("#<%= txtAlertDate.ClientID %>").val((date1.getMonth() + 1) + '/' + date1.getDate() + '/' + date1.getFullYear());
            //$("#<%= txtAlertDate.ClientID %>").val(date1);
            $("#<%= chkMon.ClientID %>").prop('checked', false);
            $("#<%= chkTue.ClientID %>").prop('checked', false);
            $("#<%= chkThu.ClientID %>").prop('checked', false);
            $("#<%= chkFri.ClientID %>").prop('checked', false);
            $("#<%= chkSat.ClientID %>").prop('checked', false);
            $("#<%= chkSun.ClientID %>").prop('checked', false);
            $("#<%= chkWed.ClientID %>").prop('checked', false);
            // $("#<%= ddlLogs.ClientID %>").val(obj.LogID);
            $("#<%= txtAlertEmail.ClientID %>").val("");


        }
        function EditAlertSettings(ID) {
            //alert(ID);
            var sendInfo = { alertID: ID };
            var random = new Date().getTime();
            // ajax call to bind data
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "LocationOperator.aspx/GetAlertDataByID?d=" + Math.random(),
                data: JSON.stringify(sendInfo),
                dataType: "json",
                cache: false,
                success: function (data) {

                    var mainObj = JSON.parse(data.d);
                    var obj = mainObj.obj;
                    var loglist = mainObj.logList
                    var date1 = new Date(obj.AlertTime.match(/\d+/)[0] * 1);
                    // alert(obj.AlertTime);
                    //                    var date = Date.parse(obj.AlertTime);
                    //alert(date1);
                    //                    var date1 = new Date(obj.AlertTime);
                    var hours = mainObj.hours; //returns 0-23  
                    var minutes = mainObj.minutes; //returns 0-59    
                    if (minutes.length == 1)
                        minutes = "0" + minutes;
                    var ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12; // the hour '0' should be '12'  
                    var myCombo = $("#<%= ddlLogs.ClientID %>");
                    var myOptions = { 1: 'Suganthar', 2: 'Suganthar2' };

                    myCombo.empty();
                    myCombo.append(new Option('Select Log / Check List', 0));
                    $.each(loglist, function (val, text) {
                        myCombo.append(new Option(text.Name, text.LogID));
                    });

                    $("#<%= hfAlertID.ClientID %>").val(obj.AlertID);
                    $("#<%= hfMobileId.ClientID %>").val(obj.AccountID);
                    $("#<%= txtAlertMessage.ClientID %>").val(obj.AlertMessage);
                    $("#<%= txtManagerMessage.ClientID %>").val(obj.ManagerMessage);
                    $("#<%= txtReminderMessage.ClientID %>").val(obj.ReminderMeesage);
                    $("#<%= txtReminderTime.ClientID %>").val(obj.Reminder);
                    $("#<%= txtManagerTime.ClientID %>").val(obj.ManagerAlert);
                    $("#<%= tpHour1.ClientID %>").val(hours);
                    $("#<%= tpMinute1.ClientID %>").val(minutes);
                    $("#<%= tpTime1.ClientID %>").val(ampm);
                    $("#<%= txtAlertDate.ClientID %>").val((date1.getMonth() + 1) + '/' + date1.getDate() + '/' + date1.getFullYear());
                    //$("#<%= txtAlertDate.ClientID %>").val(date1);
                    $("#<%= chkMon.ClientID %>").prop('checked', obj.Mon);
                    $("#<%= chkTue.ClientID %>").prop('checked', obj.Tue);
                    $("#<%= chkThu.ClientID %>").prop('checked', obj.Thu);
                    $("#<%= chkFri.ClientID %>").prop('checked', obj.Fri);
                    $("#<%= chkSat.ClientID %>").prop('checked', obj.Sat);
                    $("#<%= chkSun.ClientID %>").prop('checked', obj.Sun); $("#<%= chkWed.ClientID %>").prop('checked', obj.Wed);
                    $("#<%= ddlLogs.ClientID %>").val(obj.LogID);
                    $("#<%= txtAlertEmail.ClientID %>").val(obj.BccEmailAddresses);
                    if (obj.TypeId == 1) {

                        $("#<%= rdlAlertType.ClientID %>" + "_0").prop('checked', true);
                        $('#alertDate').hide();
                        $("#weekdays").show();
                    }
                    if (obj.TypeId == 2) {

                        $("#<%= rdlAlertType.ClientID %>" + "_1").prop('checked', true);
                        $('#alertDate').hide();
                        $("#weekdays").show();
                    }
                    if (obj.TypeId == 3) {

                        $("#<%= rdlAlertType.ClientID %>" + "_2").prop('checked', true);
                        $('#weekdays').hide();
                        $("#alertDate").show();
                    }
                    if (obj.TypeId == 4) {

                        $("#<%= rdlAlertType.ClientID %>" + "_3").prop('checked', true);
                        $('#weekdays').hide();
                        $("#alertDate").show();
                    }



                    $("#alertSettings").dialog("open");
                    // setTimeout(autoUpdate, 50000);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //alert("Error:" + result.toString());
                    alert('Error: ' + errorThrown + ", " + jqXHR.responseText + ", " + textStatus);
                }
            });
            //End AJAX call
            //            });
        }
        //End click function
        //////////////////Add Alert Function
        function AddAlertSettings(MobileID) {
            $("#<%= hfMobileId.ClientID %>").val(MobileID);
            ResetAlertFields();
            $("#<%= hfMobileId.ClientID %>").val();
            var sendInfo = { MobileID: MobileID };
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "LocationOperator.aspx/GetLogsList?d=" + Math.random(),
                data: JSON.stringify(sendInfo),
                dataType: "json",
                cache: false,
                success: function (data) {
                    var mainObj = JSON.parse(data.d);
                    var loglist = mainObj.logList;
                    var myCombo = $("#<%= ddlLogs.ClientID %>");
                    myCombo.empty();
                    myCombo.append(new Option('Select Log / Check List', 0));
                    $.each(loglist, function (val, text) {
                        myCombo.append(new Option(text.Name, text.LogID));
                    });
                    $("#alertSettings").dialog("open");
                    // setTimeout(autoUpdate, 50000);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //alert("Error:" + result.toString());
                    alert('Error: ' + errorThrown + ", " + jqXHR.responseText + ", " + textStatus);
                }
            });
            //End AJAX call
            return false;
        }


    </script>
    <script type="text/javascript">$("#pnlMobileAccount").addClass('selected');</script>
    <script type="text/javascript" language="javascript">
        function SetAlerts(nLogId) {

            if (nLogId == 1) {
                var rdbColdHoldingLogOff = document.getElementById('<%=rdbColdHoldingLogOff.ClientID%>');
                var rdbColdHoldingLogOn = document.getElementById('<%=rdbColdHoldingLogOn.ClientID%>');
                var rdbColdHoldingLogAlertOn = document.getElementById('<%=rdbColdHoldingLogAlertOn.ClientID%>');
                var rdbColdHoldingLogAlertOff = document.getElementById('<%=rdbColdHoldingLogAlertOff.ClientID%>');

                if (rdbColdHoldingLogOff.checked == true) {

                    rdbColdHoldingLogAlertOn.disabled = true;
                    rdbColdHoldingLogAlertOff.disabled = true;
                    rdbColdHoldingLogAlertOff.checked = true;
                }
                if (rdbColdHoldingLogOn.checked == true) {
                    rdbColdHoldingLogAlertOn.disabled = false;
                    rdbColdHoldingLogAlertOff.disabled = false;
                }
            }
            if (nLogId == 2) {
                var rdbFreezerLogOff = document.getElementById('<%=rdbFreezerLogOff.ClientID%>');
                var rdbFreezerLogOn = document.getElementById('<%=rdbFreezerLogOn.ClientID%>');
                var rdbFreezerLogAlertOn = document.getElementById('<%=rdbFreezerLogAlertOn.ClientID%>');
                var rdbFreezerLogAlertOff = document.getElementById('<%=rdbFreezerLogAlertOff.ClientID%>');

                if (rdbFreezerLogOff.checked == true) {
                    rdbFreezerLogAlertOn.disabled = true;
                    rdbFreezerLogAlertOff.disabled = true;
                    rdbFreezerLogAlertOff.checked = true;
                }
                if (rdbFreezerLogOn.checked == true) {
                    rdbFreezerLogAlertOn.disabled = false;
                    rdbFreezerLogAlertOff.disabled = false;
                }
            }
            if (nLogId == 3) {
                var rdbFoodSafetyOff = document.getElementById('<%=rdbFoodSafetyOff.ClientID%>');
            var rdbFoodSafetyOn = document.getElementById('<%=rdbFoodSafetyOn.ClientID%>');
            var rdbFoodSafetyAlertOn = document.getElementById('<%=rdbFoodSafetyAlertOn.ClientID%>');
            var rdbFoodSafetyAlertOff = document.getElementById('<%=rdbFoodSafetyAlertOff.ClientID%>');

            if (rdbFoodSafetyOff.checked == true) {
                rdbFoodSafetyAlertOn.disabled = true;
                rdbFoodSafetyAlertOff.disabled = true;
                rdbFoodSafetyAlertOff.checked = true;
            }
            if (rdbFoodSafetyOn.checked == true) {
                rdbFoodSafetyAlertOn.disabled = false;
                rdbFoodSafetyAlertOff.disabled = false;
            }
        }
        if (nLogId == 4) {
            var rdbHotHoldingLogOff = document.getElementById('<%=rdbHotHoldingLogOff.ClientID%>');
            var rdbHotHoldingLogOn = document.getElementById('<%=rdbHotHoldingLogOn.ClientID%>');
            var rdbHotHoldingLogAlertOn = document.getElementById('<%=rdbHotHoldingLogAlertOn.ClientID%>');
            var rdbHotHoldingLogAlertOff = document.getElementById('<%=rdbHotHoldingLogAlertOff.ClientID%>');

            if (rdbHotHoldingLogOff.checked == true) {
                rdbHotHoldingLogAlertOn.disabled = true;
                rdbHotHoldingLogAlertOff.disabled = true;
                rdbHotHoldingLogAlertOff.checked = true;
            }
            if (rdbHotHoldingLogOn.checked == true) {
                rdbHotHoldingLogAlertOn.disabled = false;
                rdbHotHoldingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 5) {
            var rdbReceivingLogOff = document.getElementById('<%=rdbReceivingLogOff.ClientID%>');
            var rdbReceivingLogOn = document.getElementById('<%=rdbReceivingLogOn.ClientID%>');
            var rdbReceivingLogAlertOn = document.getElementById('<%=rdbReceivingLogAlertOn.ClientID%>');
            var rdbReceivingLogAlertOff = document.getElementById('<%=rdbReceivingLogAlertOff.ClientID%>');

            if (rdbReceivingLogOff.checked == true) {
                rdbReceivingLogAlertOn.disabled = true;
                rdbReceivingLogAlertOff.disabled = true;
                rdbReceivingLogAlertOff.checked = true;
            }
            if (rdbReceivingLogOn.checked == true) {
                rdbReceivingLogAlertOn.disabled = false;
                rdbReceivingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 6) {
            var rdbRefrigerationLogOff = document.getElementById('<%=rdbRefrigerationLogOff.ClientID%>');
            var rdbRefrigerationLogOn = document.getElementById('<%=rdbRefrigerationLogOn.ClientID%>');
            var rdbRefrigerationLogAlertOn = document.getElementById('<%=rdbRefrigerationLogAlertOn.ClientID%>');
            var rdbRefrigerationLogAlertOff = document.getElementById('<%=rdbRefrigerationLogAlertOff.ClientID%>');

            if (rdbRefrigerationLogOff.checked == true) {
                rdbRefrigerationLogAlertOn.disabled = true;
                rdbRefrigerationLogAlertOff.disabled = true;
                rdbRefrigerationLogAlertOff.checked = true;
            }
            if (rdbRefrigerationLogOn.checked == true) {
                rdbRefrigerationLogAlertOn.disabled = false;
                rdbRefrigerationLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 7) {
            var rdbTemperatureLogOff = document.getElementById('<%=rdbTemperatureLogOff.ClientID%>');
            var rdbTemperatureLogOn = document.getElementById('<%=rdbTemperatureLogOn.ClientID%>');
            var rdbTemperatureLogAlertOn = document.getElementById('<%=rdbTemperatureLogAlertOn.ClientID%>');
            var rdbTemperatureLogAlertOff = document.getElementById('<%=rdbTemperatureLogAlertOff.ClientID%>');

            if (rdbTemperatureLogOff.checked == true) {
                rdbTemperatureLogAlertOn.disabled = true;
                rdbTemperatureLogAlertOff.disabled = true;
                rdbTemperatureLogAlertOff.checked = true;
            }
            if (rdbTemperatureLogOn.checked == true) {
                rdbTemperatureLogAlertOn.disabled = false;
                rdbTemperatureLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 8) {
            var rdbThermometerOff = document.getElementById('<%=rdbThermometerOff.ClientID%>');
            var rdbThermometerOn = document.getElementById('<%=rdbThermometerOn.ClientID%>');
            var rdbThermometerAlertOn = document.getElementById('<%=rdbThermometerAlertOn.ClientID%>');
            var rdbThermometerAlertOff = document.getElementById('<%=rdbThermometerAlertOff.ClientID%>');

            if (rdbThermometerOff.checked == true) {
                rdbThermometerAlertOn.disabled = true;
                rdbThermometerAlertOff.disabled = true;
                rdbThermometerAlertOff.checked = true;
            }
            if (rdbThermometerOn.checked == true) {
                rdbThermometerAlertOn.disabled = false;
                rdbThermometerAlertOff.disabled = false;
            }
        }
        if (nLogId == 9) {
            var rdbValidationOff = document.getElementById('<%=rdbValidationOff.ClientID%>');
            var rdbValidationOn = document.getElementById('<%=rdbValidationOn.ClientID%>');
            var rdbValidationAlertOn = document.getElementById('<%=rdbValidationAlertOn.ClientID%>');
            var rdbValidationAlertOff = document.getElementById('<%=rdbValidationAlertOff.ClientID%>');

            if (rdbValidationOff.checked == true) {
                rdbValidationAlertOn.disabled = true;
                rdbValidationAlertOff.disabled = true;
                rdbValidationAlertOff.checked = true;
            }
            if (rdbValidationOn.checked == true) {
                rdbValidationAlertOn.disabled = false;
                rdbValidationAlertOff.disabled = false;
            }
        }
        if (nLogId == 10) {

            var rdbFreezerNewLogOff = document.getElementById('<%=rdbFreezerNewLogOff.ClientID%>');
            var rdbFreezerNewLogOn = document.getElementById('<%=rdbFreezerNewLogOn.ClientID%>');
            var rdbFreezerNewLogAlertOn = document.getElementById('<%=rdbFreezerNewLogAlertOn.ClientID%>');
            var rdbFreezerNewLogAlertOff = document.getElementById('<%=rdbFreezerNewLogAlertOff.ClientID%>');

            if (rdbFreezerNewLogOff.checked == true) {
                rdbFreezerNewLogAlertOn.disabled = true;
                rdbFreezerNewLogAlertOff.disabled = true;
                rdbFreezerNewLogAlertOff.checked = true;
            }
            if (rdbFreezerNewLogOn.checked == true) {
                rdbFreezerNewLogAlertOn.disabled = false;
                rdbFreezerNewLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 11) {

            var rdbShippingLogOff = document.getElementById('<%=rdbShippingLogOff.ClientID%>');
            var rdbShippingLogOn = document.getElementById('<%=rdbShippingLogOn.ClientID%>');
            var rdbShippingLogAlertOn = document.getElementById('<%=rdbShippingLogAlertOn.ClientID%>');
            var rdbShippingLogAlertOff = document.getElementById('<%=rdbShippingLogAlertOff.ClientID%>');

            if (rdbShippingLogOff.checked == true) {
                rdbShippingLogAlertOn.disabled = true;
                rdbShippingLogAlertOff.disabled = true;
                rdbShippingLogAlertOff.checked = true;
            }
            if (rdbShippingLogOn.checked == true) {
                rdbShippingLogAlertOn.disabled = false;
                rdbShippingLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 12) {

            var rdbPhLogOff = document.getElementById('<%=rdbPhLogOff.ClientID%>');
            var rdbPhLogOn = document.getElementById('<%=rdbPhLogOn.ClientID%>');
            var rdbPhLogAlertOn = document.getElementById('<%=rdbPhLogAlertOn.ClientID%>');
            var rdbPhLogAlertOff = document.getElementById('<%=rdbPhLogAlertOff.ClientID%>');

            if (rdbPhLogOff.checked == true) {
                rdbPhLogAlertOn.disabled = true;
                rdbPhLogAlertOff.disabled = true;
                rdbPhLogAlertOff.checked = true;
            }
            if (rdbPhLogOn.checked == true) {
                rdbPhLogAlertOn.disabled = false;
                rdbPhLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 13) {

            var rdbPestLogOff = document.getElementById('<%=rdbPestLogOff.ClientID%>');
            var rdbPestLogOn = document.getElementById('<%=rdbPestLogOn.ClientID%>');
            var rdbPestLogAlertOn = document.getElementById('<%=rdbPestLogAlertOn.ClientID%>');
            var rdbPestLogAlertOff = document.getElementById('<%=rdbPestLogAlertOff.ClientID%>');

            if (rdbPestLogOff.checked == true) {
                rdbPestLogAlertOn.disabled = true;
                rdbPestLogAlertOff.disabled = true;
                rdbPestLogAlertOff.checked = true;
            }
            if (rdbPestLogOn.checked == true) {
                rdbPestLogAlertOn.disabled = false;
                rdbPestLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 14) {

            var rdbMaintenanceLogOff = document.getElementById('<%=rdbMaintenanceLogOff.ClientID%>');
            var rdbMaintenanceLogOn = document.getElementById('<%=rdbMaintenanceLogOn.ClientID%>');
            var rdbMaintenanceLogAlertOn = document.getElementById('<%=rdbMaintenanceLogAlertOn.ClientID%>');
            var rdbMaintenanceLogAlertOff = document.getElementById('<%=rdbMaintenanceLogAlertOff.ClientID%>');

            if (rdbMaintenanceLogOff.checked == true) {
                rdbMaintenanceLogAlertOn.disabled = true;
                rdbMaintenanceLogAlertOff.disabled = true;
                rdbMaintenanceLogAlertOff.checked = true;
            }
            if (rdbMaintenanceLogOn.checked == true) {
                rdbMaintenanceLogAlertOn.disabled = false;
                rdbMaintenanceLogAlertOff.disabled = false;
            }
        }
        if (nLogId == 15) {

            var rdbCleaningLogOff = document.getElementById('<%=rdbCleaningLogOff.ClientID%>');
            var rdbCleaningLogOn = document.getElementById('<%=rdbCleaningLogOn.ClientID%>');
            var rdbCleaningLogAlertOn = document.getElementById('<%=rdbCleaningLogAlertOn.ClientID%>');
            var rdbCleaningLogAlertOff = document.getElementById('<%=rdbCleaningLogAlertOff.ClientID%>');

            if (rdbCleaningLogOff.checked == true) {
                rdbCleaningLogAlertOn.disabled = true;
                rdbCleaningLogAlertOff.disabled = true;
                rdbCleaningLogAlertOff.checked = true;
            }
            if (rdbCleaningLogOn.checked == true) {
                rdbCleaningLogAlertOn.disabled = false;
                rdbCleaningLogAlertOff.disabled = false;
            }
        }
    }

    </script>


    <div id="titlediv">
        <!----HEADER-TITLE-START----->
        <div class="container">
            <div class="page-title">
                <a href="#" class="button" id="showForm">Add/Edit Mobile Login</a>
            </div>
        </div>
    </div>
    <!----HEADER-TITLE-END----->
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div class="container">
        <!----CONTAINER-START----->
        <asp:ValidationSummary ID="vldSummary" DisplayMode="List" CssClass="msg-error" ShowSummary="true" runat="server" />
        <asp:Label ID="LogError" CssClass="msg-error" Visible="false" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblInfo" runat="server" Text="" CssClass="msg-error" Visible="false"></asp:Label>
        <div class="slidingDiv">
            <div class="ph-top">
            </div>

            <div class="alert alert-info">

                <strong>Password:</strong> Length must be 8 characters or more, must contain one or more UPPER CASE letters, LOWER CASE letters, NUMERIC value and Special Character.
            </div>
            <div class="clear"></div>
            <div class="form3">
                <div class="left">
                    <label>Employee Name: </label>
                    <div class="input">
                        <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="The value in field Employee Name is required." ControlToValidate="txtEmployeeName" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmployeeName" EnableClientScript="true" ErrorMessage="Please enter a name without special characters (@#$*&)." Text="*"
                            ValidationExpression="^[a-zA-Z0-9'.\s\,\.\']{1,100}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="left margin-lr">
                    <%--<label>Employee Email:</label>
          <div class="input">
            <asp:TextBox ID="txtEmail" runat="server" Width="200px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Text="*"
            ErrorMessage="The value in field Employee Email is required." ControlToValidate="txtEmail"  Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator> 
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Text="*"
			EnableClientScript="true" ErrorMessage="Please enter a valid email.<br />" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
          </div>--%>
                </div>
                <div class="clear"></div>
            </div>
            <div class="form3">
                <div class="left">
                    <label>Enter User’s Email Address: </label>
                    <div class="input">
                        <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*"
                            ErrorMessage="The value in field User ID is required." ControlToValidate="txtUserId" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="REV_txtUser" Style="display: block;" runat="server" ControlToValidate="txtUserId" Text="Please enter a valid user name."
                            EnableClientScript="true" ErrorMessage="Please enter a valid user name.<br />" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="left margin-lr">
                    <label>Password:</label>
                    <div class="input">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        <img id="Img_passwordhelp" style="vertical-align: middle" alt="" runat="server"
                            src="~/App_Themes/Control/images/board_help.gif" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="*"
                            ErrorMessage="The value in field Password is required." ControlToValidate="txtPassword" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Style="display: block;" ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPassword"
                            EnableClientScript="true" Text="Please Enter a valid password." ErrorMessage="Please enter a valid password.<br />"
                             ValidationExpression="(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="left">
                    <label>Initials: </label>
                    <div class="input">
                        <asp:TextBox ID="txtInitials" runat="server" Width="200px" MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*"
                            ErrorMessage="The value in field Initials is required." ControlToValidate="txtInitials" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtInitials"
                            EnableClientScript="true" ErrorMessage="Please enter a valid user name." Text="*" ValidationExpression="^[a-zA-Z0-9.\s\,\.\-_ ]{1,40}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            <div class="form4b left marginright">
                <h2 class="left h2margin-r">Address Line One:</h2>
                <div class="input left">
                    <asp:TextBox ID="txtAddress1" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>Address Line 2:</h4>
                <div class="input">
                    <asp:TextBox ID="txtAddress2" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>City:</h4>
                <div class="input">
                    <asp:TextBox ID="txtCity" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>State:</h4>
                <div class="input">
                    <asp:TextBox ID="txtState" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>TiimeZone:</h4>
                <div class="input">
                    <asp:TextBox ID="txtTimeZone" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>TiimeZone:</h4>
                <div class="input">
                    <asp:TextBox ID="txtZipCode" runat="server" Enabled="false" MaxLength="10"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="reVldZipCode" runat="server" ControlToValidate="txtZipCode" Font-Names="Verdana" Font-Size="10px"
                        EnableClientScript="true" Text="*" ErrorMessage="Please enter valid Zip code." ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="clear"></div>
                <br />
                <h4>Main Phone Number:</h4>
                <div class="input">
                    <asp:TextBox ID="txtPhone1" runat="server" MaxLength="13" Width="200px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone1" EnableClientScript="true" ErrorMessage="Please enter a valid Phone Number."
                        ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'\-]{1,100}$"></asp:RegularExpressionValidator>
                </div>
                <div class="clear"></div>
                <br />
                <h4>Alternate Phone Number:</h4>
                <div class="input">
                    <asp:TextBox ID="txtPhone2" runat="server" MaxLength="13" Width="200px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhone2"
                        EnableClientScript="true" ErrorMessage="Please enter a valid Alt Phone Number."
                        ValidationExpression="^[a-zA-Z0-9'.\s\,\.\'\-]{1,100}$"></asp:RegularExpressionValidator>
                </div>
                <div class="clear"></div>
                <br />
                <h4>Fax:</h4>
                <div class="input">
                    <asp:TextBox ID="txtFax" runat="server" Width="200px"></asp:TextBox>
                </div>
                <div class="clear"></div>
                <br />
                <h4>Active:</h4>
                <div class="input">
                    <asp:CheckBox ID="chkActive" runat="server" />
                </div>
            </div>
            <div class="form4 left">
                <table width="390" style="padding-left: 5px; padding-bottom: 5px;" class="zebra">
                    <tr>
                        <th width="200" align="left">LOGS AND REPORTING</th>
                        <th colspan="2" align="center">ACTIVATION</th>
                        <th colspan="2" align="center">E-ALERTS</th>
                    </tr>
                    <tr>
                        <th width="200" align="left">LOGS:</th>
                        <th align="center">ON</th>
                        <th align="center">OFF</th>
                        <th align="center">ON</th>
                        <th align="center">OFF</th>
                    </tr>
                    <tr id="pnlCleaningLog" runat="server">
                        <td width="200">Cleaning and Sanitization Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbCleaningLogOn" runat="server" onClick="SetAlerts(15)" GroupName="CleaningLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbCleaningLogOff" runat="server" onClick="SetAlerts(15)" GroupName="CleaningLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbCleaningLogAlertOn" runat="server" onClick="SetAlerts(15)" GroupName="CleaningLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbCleaningLogAlertOff" runat="server" GroupName="CleaningLogAlert" /></td>
                    </tr>
                    <tr id="pnlColdHoldingLog" runat="server">
                        <td width="200">Cold Holding Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbColdHoldingLogOn" runat="server" onClick="SetAlerts(1)" GroupName="ColdHoldingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbColdHoldingLogOff" runat="server" onClick="SetAlerts(1)" GroupName="ColdHoldingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbColdHoldingLogAlertOn" runat="server" onClick="SetAlerts(1)" GroupName="ColdHoldingLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbColdHoldingLogAlertOff" runat="server" GroupName="ColdHoldingLogAlert" /></td>
                    </tr>
                    <tr id="pnlCloolingLog" runat="server">
                        <td width="200">Cooling Temperature Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerLogOn" runat="server" onClick="SetAlerts(2)" GroupName="FreezerLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerLogOff" runat="server" onClick="SetAlerts(2)" GroupName="FreezerLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerLogAlertOn" runat="server" onClick="SetAlerts(2)" GroupName="FreezerLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerLogAlertOff" runat="server" GroupName="FreezerLogAlert" /></td>
                    </tr>
                    <tr id="pnlFreezerLog" runat="server">
                        <td width="200">Freezer Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerNewLogOn" runat="server" onClick="SetAlerts(10)" GroupName="FreezerNewLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerNewLogOff" runat="server" onClick="SetAlerts(10)" GroupName="FreezerNewLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerNewLogAlertOn" runat="server" onClick="SetAlerts(10)" GroupName="FreezerNewLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFreezerNewLogAlertOff" runat="server" GroupName="FreezerNewLogAlert" /></td>
                    </tr>
                    <tr id="pnlTemperatureLog" runat="server">
                        <td width="200">End Point Temperature Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbTemperatureLogOn" runat="server" onClick="SetAlerts(7)" GroupName="TemperatureLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbTemperatureLogOff" runat="server" onClick="SetAlerts(7)" GroupName="TemperatureLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbTemperatureLogAlertOn" runat="server" onClick="SetAlerts(7)" GroupName="TemperatureLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbTemperatureLogAlertOff" runat="server" GroupName="TemperatureLogAlert" /></td>
                    </tr>
                    <tr id="pnlHotHoldingLog" runat="server">
                        <td width="200">Hot Holding Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbHotHoldingLogOn" runat="server" onClick="SetAlerts(4)" GroupName="HotHoldingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbHotHoldingLogOff" runat="server" onClick="SetAlerts(4)" GroupName="HotHoldingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbHotHoldingLogAlertOn" runat="server" onClick="SetAlerts(4)" GroupName="HotHoldingLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbHotHoldingLogAlertOff" runat="server" GroupName="HotHoldingLogAlert" /></td>
                    </tr>
                    <tr id="pnlPhLog" runat="server">
                        <td width="200">Ph Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPhLogOn" runat="server" onClick="SetAlerts(12)" GroupName="PhLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPhLogOff" runat="server" onClick="SetAlerts(12)" GroupName="PhLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPhLogAlertOn" runat="server" onClick="SetAlerts(12)" GroupName="PhLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPhLogAlertOff" runat="server" GroupName="PhLogAlert" /></td>
                    </tr>
                    <tr id="pnlPestLog" runat="server">
                        <td width="200">Pest Control Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPestLogOn" runat="server" onClick="SetAlerts(13)" GroupName="PestLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPestLogOff" runat="server" onClick="SetAlerts(13)" GroupName="PestLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPestLogAlertOn" runat="server" onClick="SetAlerts(13)" GroupName="PestLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbPestLogAlertOff" runat="server" GroupName="PestLogAlert" /></td>
                    </tr>
                    <tr id="pnlMaintenanceLog" runat="server">
                        <td width="200">Maintenance Control Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbMaintenanceLogOn" runat="server" onClick="SetAlerts(14)" GroupName="MaintenanceLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbMaintenanceLogOff" runat="server" onClick="SetAlerts(14)" GroupName="MaintenanceLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbMaintenanceLogAlertOn" runat="server" onClick="SetAlerts(14)" GroupName="MaintenanceLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbMaintenanceLogAlertOff" runat="server" GroupName="MaintenanceLogAlert" /></td>
                    </tr>
                    <tr id="pnlReceivingLog" runat="server">
                        <td width="200">Receiving Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbReceivingLogOn" runat="server" onClick="SetAlerts(5)" GroupName="ReceivingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbReceivingLogOff" runat="server" onClick="SetAlerts(5)" GroupName="ReceivingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbReceivingLogAlertOn" runat="server" onClick="SetAlerts(5)" GroupName="ReceivingLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbReceivingLogAlertOff" runat="server" GroupName="ReceivingLogAlert" /></td>
                    </tr>
                    <tr id="pnlRefrigrationLog" runat="server">
                        <td width="200">Refrigeration Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbRefrigerationLogOn" runat="server" onClick="SetAlerts(6)" GroupName="RefrigerationLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbRefrigerationLogOff" runat="server" onClick="SetAlerts(6)" GroupName="RefrigerationLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbRefrigerationLogAlertOn" runat="server" onClick="SetAlerts(6)" GroupName="RefrigerationLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbRefrigerationLogAlertOff" runat="server" GroupName="RefrigerationLogAlert" /></td>
                    </tr>
                    <tr id="pnlShippingLog" runat="server">
                        <td width="200">Shipping Log</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbShippingLogOn" runat="server" onClick="SetAlerts(11)" GroupName="ShippingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbShippingLogOff" runat="server" onClick="SetAlerts(11)" GroupName="ShippingLog" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbShippingLogAlertOn" runat="server" onClick="SetAlerts(11)" GroupName="ShippingLogAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbShippingLogAlertOff" runat="server" GroupName="ShippingLogAlert" /></td>
                    </tr>
                    <tr id="pnlThermometerLog" runat="server">
                        <td width="200">Thermometer Calibration</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbThermometerOn" runat="server" onClick="SetAlerts(8)" GroupName="Thermometer" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbThermometerOff" runat="server" onClick="SetAlerts(8)" GroupName="Thermometer" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbThermometerAlertOn" runat="server" onClick="SetAlerts(8)" GroupName="ThermometerAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbThermometerAlertOff" runat="server" GroupName="ThermometerAlert" /></td>
                    </tr>
                    <tr>
                        <th width="200" align="left">REPORTS:</th>
                    </tr>
                    <tr id="pnlFscl" runat="server">
                        <td width="200">Food Safety Checklist</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFoodSafetyOn" runat="server" onClick="SetAlerts(3)" GroupName="FoodSafetChecklist" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFoodSafetyOff" runat="server" onClick="SetAlerts(3)" GroupName="FoodSafetChecklist" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFoodSafetyAlertOn" runat="server" onClick="SetAlerts(3)" GroupName="FoodSafetChecklistAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbFoodSafetyAlertOff" runat="server" GroupName="FoodSafetChecklistAlert" /></td>
                    </tr>
                    <asp:Repeater ID="rptChecklist" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td width="200"><%# Eval("Name")%></td>
                                <asp:HiddenField ID="hfKitchenChecklist" runat="server" Value='<%# Eval("CheckListSectionId") %>' />
                                <td align="center">
                                    <asp:RadioButton ID="rdbChecklistOn" runat="server" GroupName="Checklist" /></td>
                                <td align="center">
                                    <asp:RadioButton ID="rdbChecklistOff" runat="server" GroupName="Checklist" /></td>
                                <td align="center">
                                    <asp:RadioButton ID="rdbChecklistAlertOn" runat="server" onClick="SetAlerts(16)" GroupName="ChecklistAlert" /></td>
                                <td align="center">
                                    <asp:RadioButton ID="rdbChecklistAlertOff" runat="server" GroupName="ChecklistAlert" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsChecklist" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetchecklistSectionsByKitchenId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetWeeklyReport">
                        <SelectParameters>
                            <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <tr id="pnlValidation" runat="server">
                        <td width="200">Validation Checklist</td>
                        <td align="center">
                            <asp:RadioButton ID="rdbValidationOn" runat="server" onClick="SetAlerts(9)" GroupName="Validation" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbValidationOff" runat="server" onClick="SetAlerts(9)" GroupName="Validation" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbValidationAlertOn" runat="server" GroupName="ValidationAlert" /></td>
                        <td align="center">
                            <asp:RadioButton ID="rdbValidationAlertOff" runat="server" onClick="SetAlerts(9)" GroupName="ValidationAlert" /></td>
                    </tr>
                </table>

            </div>
            <div class="clear tenpx"></div>
            <div class="form3">
                <div class="right button-margin">
                    <asp:Button ID="cmdSubmit" runat="server" CssClass="blue button" OnClick="cmdSubmit_Click" Text="SUBMIT" />
                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" OnClick="cmdDelete_Click" runat="server" CssClass="button" Text="DELETE" />
                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" CssClass="blue button" Text="ADD" />
                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" OnClick="cmdCancel_Click" CssClass="button" Text="CANCEL" />
                    <%--<asp:Button ID="cmdAddAlert" runat="server" CssClass="blue button" Text="ADD ALERT" CausesValidation="false"  />  --%>
                </div>
                <div class="clear"></div>
            </div>
            <asp:HiddenField ID="hfEdit" runat="server" />
            <div class="clear"></div>
        </div>
        <!--------- End  Entry form -------------->
        <asp:UpdatePanel ID="updAlertGrid" runat="server">
            <ContentTemplate>
                <%--<div class="table">
    <div class="box-header">
      <h4 class="left">Alerts Settings</h4>
    </div>
    <asp:GridView ID="grdAlerts" runat="server" AutoGenerateColumns="False" 
          CssClass="zebra" EnableModelValidation="True" 
          onrowcommand="grdAlerts_RowCommand" 
          onrowdatabound="grdAlerts_RowDataBound">
        <Columns>                   
            <asp:TemplateField HeaderText="Log Name">
                <ItemTemplate>
                <asp:HiddenField ID="hfAlertItemID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "AlertID")  %>' />
                    <asp:Label ID="lblLogName" runat="server"
                        Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>                   
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alert Type">
                <ItemTemplate>
                    <asp:Label ID="lblAlertType" runat="server"
                        Text='<%# Eval("TypeID").ToString() == "1"?"Daily":Eval("TypeID").ToString() == "2"?"Weekly":Eval("TypeID").ToString() == "3"?"Monthly":Eval("TypeID").ToString() == "4"?"Yearly":"None"  %>'></asp:Label>                   
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Time Setting">
                <ItemTemplate>
                    <asp:Label ID="lblTime" runat="server"
                        Text='<%# DataBinder.Eval(Container.DataItem, "AlertTime","{0:t}")  %>'></asp:Label>                   
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Days Of Week">
                <ItemTemplate>
                <table><tr>
                  <td ><asp:RadioButton ID="rdbMon" Checked ='<%# Eval("Mon").ToString() == "1" ? true : false %>' runat="server" Text="Mon" TextAlign="Right" Enabled="false"  /></td>
                  <td ><asp:RadioButton ID="rdbTue" Checked ='<%# Eval("Tue").ToString() == "1" ? true : false %>' runat="server" Text="Tue" TextAlign="Right" Enabled="false" /></td>
                  <td ><asp:RadioButton ID="rdbWed" Checked ='<%# Eval("Wed").ToString() == "1" ? true : false %>' runat="server" Text="Wed" TextAlign="Right" Enabled="false" /></td>
                  <td ><asp:RadioButton ID="rdbThu" Checked ='<%# Eval("Thu").ToString() == "1" ? true : false %>' runat="server" Text="Thu" TextAlign="Right" Enabled="false" /></td>
                  <td ><asp:RadioButton ID="rdbFri" Checked ='<%# Eval("Fri").ToString() == "1" ? true : false %>' runat="server" Text="Fri" TextAlign="Right" Enabled="false" /></td>
                  <td ><asp:RadioButton ID="rdbSat" Checked ='<%# Eval("Sat").ToString() == "1" ? true : false %>' runat="server" Text="Sat" TextAlign="Right" Enabled="false" /></td>
                  <td ><asp:RadioButton ID="rdbSun" Checked ='<%# Eval("Sun").ToString() == "1" ? true : false %>' runat="server" Text="Sun" TextAlign="Right" Enabled="false" /></td>
                  </tr></table>                
                </ItemTemplate>                
            </asp:TemplateField>
            <asp:BoundField DataField="Reminder" HeaderText="Alert Reminder" />
            <asp:BoundField DataField="ManagerAlert" HeaderText="Manager Alert Reminder" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <a href="#" id="edit" runat="server">Edit </a>
                    <%--<asp:LinkButton ID="lkbEdit"  CommandName="Edit" CommandArgument='<%# Eval("AlertID") %>' runat="server" Text="Edit"></asp:LinkButton>--%>
                <%--  </ItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>

                    <asp:LinkButton ID="lkbDelete"  CommandName="Remove" CommandArgument='<%# Eval("AlertID") %>' runat="server" Text="Delete" CausesValidation="false"></asp:LinkButton>
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete"  ConfirmText="Are you sure about deleting this record" runat="server">
                    </cc1:ConfirmButtonExtender>                            
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
            </asp:TemplateField>           
            </Columns>
    </asp:GridView>  
  </div>
  
  <div class="clear" style="margin-bottom:5px;"></div>--%>
                <div class="table">
                    <div class="box-header">
                        <h4 class="left">List of Emplyee Logins</h4>
                    </div>
                    <asp:GridView ID="grdHotHolding" runat="server" AutoGenerateColumns="False"
                        CssClass="zebra" DataSourceID="ObjectDataSource1" AllowPaging="True"
                        EnableModelValidation="True" OnRowDataBound="grdHotHolding_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Open/Edit Alerts" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Panel runat="server" ID="pnlAlerts" Style="text-align: left">
                                        <img src="../../App_Themes/Facility/images/expand.png" alt="variants" onclick="ChildBlock(this,document.getElementById('pvGrid<%#Eval("MobileId") %>'));" />
                                        <div id='pvGrid<%#Eval("MobileId") %>' style="display: none">
                                            <asp:GridView ID="grdAlerts" runat="server" AutoGenerateColumns="False" CssClass="zebra" EnableModelValidation="True"
                                                OnRowCommand="grdAlerts_RowCommand" OnRowDataBound="grdAlerts_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Log Name">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hfAlertItemID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "AlertID")  %>' />
                                                            <asp:Label ID="lblLogName" runat="server"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Alert Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAlertType" runat="server"
                                                                Text='<%# Eval("TypeID").ToString() == "1"?"Daily":Eval("TypeID").ToString() == "2"?"Weekly":Eval("TypeID").ToString() == "3"?"Monthly":Eval("TypeID").ToString() == "4"?"Yearly":"None"  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Time Setting">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTime" runat="server"
                                                                Text='<%# DataBinder.Eval(Container.DataItem, "AlertTime","{0:t}")  %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Days Of Week">
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbMon" Checked='<%# Eval("Mon").ToString() == "1" ? true : false %>' runat="server" Text="Mon" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbTue" Checked='<%# Eval("Tue").ToString() == "1" ? true : false %>' runat="server" Text="Tue" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbWed" Checked='<%# Eval("Wed").ToString() == "1" ? true : false %>' runat="server" Text="Wed" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbThu" Checked='<%# Eval("Thu").ToString() == "1" ? true : false %>' runat="server" Text="Thu" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbFri" Checked='<%# Eval("Fri").ToString() == "1" ? true : false %>' runat="server" Text="Fri" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbSat" Checked='<%# Eval("Sat").ToString() == "1" ? true : false %>' runat="server" Text="Sat" TextAlign="Right" Enabled="false" /></td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbSun" Checked='<%# Eval("Sun").ToString() == "1" ? true : false %>' runat="server" Text="Sun" TextAlign="Right" Enabled="false" /></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Reminder" HeaderText="Alert Reminder" />
                                                    <asp:BoundField DataField="ManagerAlert" HeaderText="Manager Alert Reminder" />
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <a href="#" id="edit" runat="server">Edit </a>
                                                            <%--<asp:LinkButton ID="lkbEdit"  CommandName="Edit" CommandArgument='<%# Eval("AlertID") %>' runat="server" Text="Edit"></asp:LinkButton>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lkbDelete" CommandName="Remove" CommandArgument='<%# Eval("AlertID") %>' runat="server" Text="Delete" CausesValidation="false"></asp:LinkButton>
                                                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbDelete" ConfirmText="Are you sure about deleting this record" runat="server">
                                                            </cc1:ConfirmButtonExtender>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee/Edit Login">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Kitchen/LocationOperator.aspx?Id=" + DataBinder.Eval(Container.DataItem, "MobileId") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "Employee")  %>'></asp:HyperLink>
                                    <asp:HiddenField ID="hfMobileId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "MobileId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Add New Alert">
                                <ItemTemplate>
                                    <a href="#" id="addAlert" runat="server">Add Alert </a>
                                    <%--<asp:LinkButton ID="lkbEdit"  CommandName="Edit" CommandArgument='<%# Eval("AlertID") %>' runat="server" Text="Edit"></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
                            <asp:TemplateField HeaderText="Account Status">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Eval("Active").ToString() == "1"? true:false %>'
                                        CssClass="HiddenCheckBoxText" AutoPostBack="True" OnCheckedChanged="chkActive_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" HeaderText="User Name" />
                            <%--<asp:BoundField DataField="Password" HeaderText="Password" />--%>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!----- Alert Input Form --------->
    <div id="alertSettings">
        <asp:HiddenField ID="hfAlertID" runat="server" />
        <div class="form3">
            <h2>Create Your Employee Alert</h2>
            <div class="left">
                <h4>Log / Check List : </h4>
                <div class="input">
                    <asp:DropDownList ID="ddlLogs" runat="server" DataTextField="Name" DataValueField="LogID" AppendDataBoundItems="true" ValidationGroup="AlertInput">
                        <%--<asp:ListItem>Select Log / Check List</asp:ListItem>--%>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvLog" Enabled="true" runat="server" InitialValue="Select Log / Check List" ValidationGroup="AlertInput" ErrorMessage="Please select a log/checklist" ControlToValidate="ddlLogs" Font-Names="Verdana" Font-Size="10px"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="left margin-lr">
                <h4>Bcc Email Addresses: </h4>
                <div class="input">
                    <asp:TextBox ID="txtAlertEmail" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="form3">
            <div class="left">
                <h4>Alert Type : </h4>
                <div class="input">
                    <%--<asp:DropDownList ID="ddlCategory" runat="server">
            <asp:ListItem Text="Daily" Value="1"></asp:ListItem>
            <asp:ListItem Text="Weekly" Value="2"></asp:ListItem>
            <asp:ListItem Text="Monthly" Value="3"></asp:ListItem>
            <asp:ListItem Text="Yearly" Value="4"></asp:ListItem>
        </asp:DropDownList>  --%>
                    <asp:RadioButtonList ID="rdlAlertType" runat="server" RepeatDirection="Horizontal" ValidationGroup="AlertInput">
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Weekly</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Yearly</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvAlertType" ControlToValidate="rdlAlertType" Text="Please select alert type"
                        ValidationGroup="AlertInput">
                    </asp:RequiredFieldValidator>
                    <%--<asp:RadioButton ID="rdbDaily" Text="Daily" runat="server" GroupName="AlertType" />
        <asp:RadioButton ID="rdbWeekly" Text="Weekly" runat="server" GroupName="AlertType" />
        <asp:RadioButton ID="rdbMonthly" Text="Monthly" runat="server" GroupName="AlertType" />
        <asp:RadioButton ID="rdbYearly" Text="Yearly" runat="server" GroupName="AlertType" /> --%>
                </div>
            </div>
            <div class="left margin-lr">
                <div id="alertDate">
                    <h4>Alert Date: </h4>
                    <div class="input">
                        <asp:TextBox ID="txtAlertDate" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="weekdays">
                    <h4>Week Days: </h4>
                    <div class="input">
                        <asp:CheckBox ID="chkMon" runat="server" Text="Mon" />
                        <asp:CheckBox ID="chkTue" runat="server" Text="Tue" />
                        <asp:CheckBox ID="chkWed" runat="server" Text="Wed" />
                        <asp:CheckBox ID="chkThu" runat="server" Text="Thu" />
                        <asp:CheckBox ID="chkFri" runat="server" Text="Fri" />
                        <asp:CheckBox ID="chkSat" runat="server" Text="Sat" />
                        <asp:CheckBox ID="chkSun" runat="server" Text="Sun" />
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="form3">
            <div class="left">
                <h4>Alert Time: </h4>
                <div class="input">
                    <asp:TextBox ID="tpHour1" MaxLength="2" runat="server" Width="20"></asp:TextBox>:
        <asp:TextBox ID="tpMinute1" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                    <asp:DropDownList ID="tpTime1" runat="server" Width="50">
                        <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                        <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RegularExpressionValidator ID="rdlVaildateTemp1Time" runat="server" ControlToValidate="tpHour1" ValidationGroup="AlertInput"
                        Display="Dynamic" ErrorMessage="The value in field Hour is not valid. Please enter value les then or equal to 12"
                        ValidationExpression="^([0]?[1-9]|[1][0-2])$" Font-Names="Verdana"
                        Font-Size="10px"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tpMinute1" ValidationGroup="AlertInput"
                        Display="Dynamic" ErrorMessage="The value in field Minute is not valid."
                        ValidationExpression="^([0-5][0-9]|[1-9])$" Font-Names="Verdana"
                        Font-Size="10px"></asp:RegularExpressionValidator>
                </div>
                <div class="clear"></div>
                <h4>Alert Message: </h4>
                <div class="input">
                    <asp:TextBox ID="txtAlertMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="left date-marginl">
                <h4>Reminder Time (In Minutes): </h4>
                <div class="input">
                    <asp:TextBox ID="txtReminderTime" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtReminderTime" ValidationGroup="AlertInput"
                        Display="Dynamic" ErrorMessage="The value in field Reminder Time is not valid."
                        ValidationExpression="^([0-9][0-9]|[1-9])$" Font-Names="Verdana"
                        Font-Size="10px"></asp:RegularExpressionValidator>
                </div>
                <h4>Reminder Message: </h4>
                <div class="input">
                    <asp:TextBox ID="txtReminderMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="left date-marginl2">
                <h4>Manager Reminder Time (In Minutes): </h4>
                <div class="input">
                    <asp:TextBox ID="txtManagerTime" MaxLength="2" runat="server" Width="20"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtManagerTime" ValidationGroup="AlertInput"
                        Display="Dynamic" ErrorMessage="The value in field Manager Reminder Time is not valid."
                        ValidationExpression="^([0-9][0-9]|[1-9])$" Font-Names="Verdana"
                        Font-Size="10px"></asp:RegularExpressionValidator>
                </div>
                <h4>Manager Message: </h4>
                <div class="input">
                    <asp:TextBox ID="txtManagerMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

            </div>
            <div class="clear"></div>
        </div>
        <div class="right button-margin">
            <asp:Button ID="cmdSaveAlerts" runat="server" Text="Save" CausesValidation="true" ValidationGroup="AlertInput" OnClick="cmdSaveAlerts_Click" />
        </div>
        <div class="clear"></div>
    </div>
    </div>
  <!-- End Alert Inout Form -->
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetMobileByKitchenId"
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMobile">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:EntityDataSource ID="edsLogs" runat="server" ContextTypeName="DataModel.Entities"
        ConnectionString="name=Entities"
        DefaultContainerName="Entities" EnableFlattening="False"
        EntitySetName="Logs"
        Select="it.[LogID], it.[Name]">
    </asp:EntityDataSource>

    <asp:HiddenField ID="hfStateId" runat="server" />
    <asp:HiddenField ID="hfContactId" runat="server" />
    <asp:HiddenField ID="hfAddressId" runat="server" />
    <asp:HiddenField ID="hfMobileId" runat="server" />
    <asp:HiddenField ID="hfTimeZone" runat="server" />
    <asp:HiddenField ID="hfCountry" runat="server" />
</asp:Content>
