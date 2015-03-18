<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_Kitchen_ProcessDetail" Title="HACCP BUilder | Process Description" Codebehind="ProcessDetail.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
        function SetDiv()
        {
            var ProcessID = getQuerystring('Id',null);
            if(ProcessID == 1)
            {
                 document.getElementById('Process0').style.display = 'block';
            }
             if(ProcessID == 2)
            {
                 document.getElementById('Process1').style.display = 'block';
            }
             if(ProcessID == 3)
            {
                 document.getElementById('Process2').style.display = 'block';
            }
             if(ProcessID == 4)
            {
                 document.getElementById('Process3').style.display = 'block';
            }
            
        }
        function getQuerystring(key, default_)
        {
          if (default_==null) default_="";
          key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
          var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
          var qs = regex.exec(window.location.href);
          if(qs == null)
            return default_;
          else
            return qs[1];
        } 
    </script>
</head>
<body onload="SetDiv()" id="container">
    <form id="form1" runat="server">
    <div >
        <div class="MainHeading">
        
        </div>
        <div class="Clearer"></div>
        <div class="GirdDiv">
             <%-- Process 0 --%>	
        <div id="Process0" style="width:400px; display:none; margin-top:30px;" visible="false">
        <table>
        <tr>
		    <td>
		        <h4>Process 0 - No Cook - No Process</h4>	
			    <table>
				    <tr>
					    <td height="352" valign="top">
						    <table border="0" cellpadding="0" cellspacing="0" >
							    <tr>
							  	    <td height="21" width="51">									    
									 </td>
								    <td bgcolor="#99ccff" rowspan="3" valign="top">
									    <p align="center">
										    <strong>RECIEVE</strong><br>
										    Control Measures: Known and Approved Source, Confirm Expiration Dates</p>
								    </td>
								    <td width="40">

								    </td>
								    <td width="3">
								    </td>
							    </tr>
							    <tr>
								    <td height="3">
								    </td>
								    <td rowspan="5" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td rowspan="3" valign="top">
									    <img height="42" src="../../StaticContent/Images/cal_51x42.gif" width="51"></td>
								    <td height="19">
								    </td>
							    </tr>

							    <tr>
								    <td height="10">
								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td bgcolor="#99ffcc" rowspan="3" valign="top">
									    <p align="center">

										    <strong>CCP: EXPIRATION DATE STAMP</strong><br>
										    Check and Record Expiration Dates</p>
								    </td>
								    <td height="13">
								    </td>
							    </tr>
							    <tr>
								    <td height="5">

								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td height="21">
								    </td>
								    <td>
								    </td>

							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="52">
								    </td>

								    <td bgcolor="#99ccff" valign="top">
									    <p align="center">
										    <strong>STORE</strong><br>
										    Control Measures: Proper Storage, Prevention of Cross-Contamination, Store Away
										    from Chemicals</p>
								    </td>
								    <td>
								    </td>
								    <td>

								    </td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="39">

								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <strong>PREPARE</strong><br>
										    Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>
								    </td>
								    <td>
									    &nbsp;</td>

								    <td>
									    &nbsp;</td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="42" valign="top">
									    <img height="42" src="../../StaticContent/Images/cal_51x42.gif" width="51"></td>
								    <td bgcolor="#99ffcc" rowspan="2" valign="top">
									    <div align="center">
										    <p>
											    <strong>CCP: EXPIRATION DATE STAMP</strong><br>
											    Check and Record Expiration Dates</p>
									    </div>

								    </td>
								    <td rowspan="2" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td height="8">
								    </td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="4" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <strong>SERVE</strong><br>
										    Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										    Restrict Ill Employees</div>
								    </td>
								    <td>

								    </td>
								    <td>
								    </td>
							    </tr>
						    </table>
						</td>
					</tr>
			</table>
		    <p>

			    <b>Example: </b>No Process - No Cook (Vendor supplied bread, cookies, etc.)</p>
		    <p>
			    <img height="30" src="../../StaticContent/Images/cal_36x30.gif" width="36">
			    = Calendar Icon means that checking for an expiration date is required.
		    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
		    means that recording data (reporting) is required.</p>
		    <p>
			    * From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
			    Food Code)</p>

		    <p>
			    &nbsp;</p>&nbsp;
			  </td>
		</tr>
		</table>
		</div>
        <%-- Process 1 --%>	
       <div id="Process1" style="width:400px; display:none; margin-top:30px;" >
            <table>
            <tr>
			    <td>
			        <h4>Process 1 - No Cook</h4>			
				    <table>
							    <tr>
								    <td height="21" width="20">
								    </td>
								    <td bgcolor="#99ccff" height="22" rowspan="2" valign="top">
									    <p align="center">
										    <strong>RECIEVE</strong><br>
										    Control Measures: Known and Approved Source, Receiving Temperatures</p>

								    </td>
								    <td width="40">
								    </td>
							    </tr>
							    <tr>
								    <td rowspan="3" valign="top">
									    <img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								    <td rowspan="3" valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

							    </tr>
							    <tr>
								    <td height="10">
								    </td>
							    </tr>
							    <tr>
								    <td bgcolor="#99ffcc" height="18" rowspan="2" valign="top">
									    <p align="center">
										    <strong>CCP: COLD RECIEPT</strong><br>

										    Critical Limit: Hold at 41&deg; F or Below*<br>
										    Check and Record Temperatures</p>
								    </td>
							    </tr>
							    <tr>
								    <td height="21">
								    </td>

								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>
							    <tr>

								    <td height="1">
								    </td>
								    <td bgcolor="#99ccff" rowspan="3" valign="top">
									    <p align="center">
										    <strong>STORE</strong><br>
										    Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										    Store Away from Chemicals</p>
								    </td>
								    <td>

								    </td>
							    </tr>
							    <tr>
								    <td height="50">
								    </td>
								    <td valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							    </tr>
							    <tr>

								    <td height="1">
								    </td>
								    <td>
								    </td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>

							    </tr>
							    <tr>
								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <strong>PREPARE</strong><br>
										    Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>

								    </td>
								    <td>
									    &nbsp;</td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">
									    <hr>
								    </td>
							    </tr>

							    <tr>
								    <td height="50" valign="top">
									    <img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								    <td bgcolor="#99ffcc" valign="top">
									    <div align="center">
										    <p>
											    <strong>CCP: COLD HOLDING</strong><br>
											    Critical Limit: Hold at 41&deg; F or Below*<strong></strong><br>

											    Check and Record Temperatures</p>
									    </div>
								    </td>
								    <td valign="top">
									    <img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							    </tr>
							    <tr>
								    <td colspan="3" height="20" valign="top">

									    <hr>
								    </td>
							    </tr>
							    <tr>
								    <td height="39">
								    </td>
								    <td bgcolor="#99ccff" valign="top">
									    <div align="center">
										    <strong>SERVE</strong><br>

										    Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										    Restrict Ill Employees</div>
								    </td>
								    <td>
								    </td>
							    </tr>
						    </table>
				    <p>
					    <b>Example: </b>Process 1 - No Cook (Milk, yogurt, etc.)</p>

				    <p>
					    <img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
					    = Thermometer Icon means that taking a temperature is required.<br>
					    <img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
					    means that recording data (reporting) is required.</p>
				    <p>
					    * From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
					    Food Code)</p>
				    <p class="breakhere">

					    &nbsp;</p>&nbsp;
			    </td>
		    </tr>
		    </table>
	    </div>
        <%-- Process 2 --%>
         <div id="Process2" style="width:400px; display:none; margin-top:30px;" >
            <table>  
            <tr>
			<td>
						<h4>
							Process 2 - Same Day Service</h4>

						<table>
							<tr>
								<td height="21" width="20">
								</td>
								<td bgcolor="#99ccff" height="22" rowspan="2" valign="top">
									<p align="center">
										<strong>RECIEVE</strong><br>
										Control Measures: Known and Approved Source, Receiving Temperatures</p>

								</td>
								<td width="40">
								</td>
							</tr>
							<tr>
								<td rowspan="3" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td rowspan="3" valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>

							</tr>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td bgcolor="#99ffcc" height="18" rowspan="2" valign="top">
									<p align="center">
										<strong>CCP: COLD RECIEPT</strong><br>

										Critical Limit: Hold at 41&deg; F or Below*<br>
										Check and Record Temperatures</p>
								</td>
							</tr>
							<tr>
								<td height="21">
								</td>

								<td>
								</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>
							<tr>

								<td height="1">
								</td>
								<td bgcolor="#99ccff" rowspan="3" valign="top">
									<p align="center">
										<strong>STORE</strong><br>
										Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
										Store Away from Chemicals</p>
								</td>
								<td>

								</td>
							</tr>
							<tr>
								<td height="50">
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>
							<tr>

								<td height="1">
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>

							</tr>
							<tr>
								<td height="39">
								</td>
								<td bgcolor="#99ccff" valign="top">
									<div align="center">
										<strong>PREPARE</strong><br>
										Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>

								</td>
								<td>
									&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>

							<tr>
								<td height="50" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td bgcolor="#99ffcc" valign="top">
									<div align="center">
										<strong>CCP: COOK</strong><br>
										Critical Limit: Internal Temperature of 165&deg; F or greater for no less than 15 seconds*<br>

										Check and Record Temperatures</div>
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>
							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>

								</td>
							</tr>
							<tr>
								<td height="50" valign="top">
									<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
								<td bgcolor="#99ffcc" valign="top">
									<div align="center">
										<p>
											<strong>CCP: HOT HOLDING</strong><br>

											Critical Limit: Hold at no less than 135&deg; F*<br>
											Check and Record Temperatures</p>
									</div>
								</td>
								<td valign="top">
									<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
							</tr>

							<tr>
								<td colspan="3" height="20" valign="top">
									<hr>
								</td>
							</tr>
							<tr>
								<td height="39">
								</td>
								<td bgcolor="#99ccff" valign="top">

									<div align="center">
										<strong>SERVE</strong><br>
										Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
										Restrict Ill Employees</div>
								</td>
								<td>
								</td>
							</tr>
						</table>

						<p>
							<b>Example: </b>Process 2 - Same Day Service (Mac and Cheeze, burgers, etc.)</p>
						<p>
							<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
							= Thermometer Icon means that taking a temperature is required.<br>
							<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
							means that recording data (reporting) is required.</p>
						<p>

							* From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
							Food Code)</p>
						<p class="breakhere">
							&nbsp;</p>
			</td>
		</tr>
		</table>
		</div>	
        <%-- Process 3 --%>
        <div id="Process3" style="width:400px; display:none; margin-top:30px;" >
            <table>    
            <tr>
			<td>
				<h4>Process 3 - Complex Food Preparation	</h4>		
							<table>

								<tr>
									<td height="50" valign="top" width="20">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<p align="center">
											<strong>RECIEVE</strong><br>
											Control Measures: Known and Approved Source, Receiving Temperatures</p>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="50">
									</td>
									<td bgcolor="#99ccff" colspan="2" rowspan="2" valign="top">
										<p align="center">
											<strong>STORE</strong><br>
											Control Measures: Proper Storage, Temperatures, Prevention of Cross-Contamination,
											Store Away from Chemicals</p>
									</td>
									<td width="70">

										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>
									<td height="39">

									</td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<strong>PREPARE</strong><br>
											Control Measures: Personal Hygiene, Restrict Ill Employees, Prevention of Cross-Contamination</div>
									</td>
									<td>
										&nbsp;</td>

								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>
									<td height="52" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>

									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">
											<strong>CCP: COOK</strong><br>
											Critical Limit: Cook to 165&deg; F or greater for no less than 15 seconds*<br>
											Check and Record Temperatures</div>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="50" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" rowspan="2" valign="top">
										<div align="center">
											<strong>CCP: COOL</strong><br>
											Critical Limit: Cool to 70&deg; F within 2 hours and from 70&deg; F to 41&deg; F
											or lower within an additional 4 hours*<br>

											Check and Record Temperatures</div>
									</td>
									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>

									</td>
								</tr>
								<tr>
									<td height="52" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">
											<strong>CCP: REHEAT</strong><br>

											Critical Limit: Heat to 165&deg; F or greater for no less than 15 seconds*<br>
											Check and Record Temperatures</div>
									</td>
									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>

									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>
									<td height="50" valign="top">
										<img height="50" src="../../StaticContent/Images/Therm-20x50.gif" width="20"></td>
									<td bgcolor="#99ffcc" colspan="2" valign="top">
										<div align="center">

											<p>
												<strong>CCP: HOT HOLDING</strong><br>
												Critical Limit: Hold at no less than 135&deg; F*<br>
												Check and Record Temperatures</p>
										</div>
									</td>

									<td valign="top">
										<img height="50" src="../../StaticContent/Images/clipboard-40x50.gif" width="40"></td>
								</tr>
								<tr>
									<td colspan="4" height="20" valign="top">
										<hr>
									</td>
								</tr>
								<tr>

									<td height="39">
									</td>
									<td bgcolor="#99ccff" colspan="2" valign="top">
										<div align="center">
											<strong>SERVE</strong><br>
											Control Measures: No Bare Hand Contact and Ready to Eat Food, Personal Hygiene,
											Restrict Ill Employees</div>
									</td>
									<td>

									</td>
								</tr>
							</table>
							<p>
								<b>Example: </b>Process 3 - Complex Food Prep (Scratch materials used in recipe
								and made at the school)</p>
							<p>
								<img height="30" src="../../StaticContent/Images/Therm-12x30.gif" width="12">
								= Thermometer Icon means that taking a temperature is required.<br>

								<img height="30" src="../../StaticContent/Images/clipboard-24x30.gif" width="24">= Clipboard Icon
								means that recording data (reporting) is required.</p>
							<p>
								* From the 2001 FDA Food Code (as amended 08-29-03 in the Supplement to the 2001
								Food Code)</p>
							<p class="breakhere">
								&nbsp;</p>
					</td>
		</tr>
		</table>
		</div>
		<asp:Repeater ID="rptProcess" runat="server" >
		<ItemTemplate>
		<div class="LogHeading">
		    <asp:Label ID="lblProcessName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ProcessName") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="lblProcessShortName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ProcessShortName") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field1") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field2") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field3") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label4" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field4") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label5" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field5") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label6" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field6") %>'></asp:Label>
		</div>
		<div class="FloatLeft">
		    <asp:Label ID="Label7" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field7") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label8" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field8") %>'></asp:Label>
		</div>
		<div class="FloatLeft">
		    <asp:Label ID="Label9" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field9") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		<div class="FloatLeft">
		    <asp:Label ID="Label10" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Field10") %>'></asp:Label>
		</div>
		<div class="Clearer"></div>
		</ItemTemplate>
		
		</asp:Repeater>
		<asp:DetailsView ID="dtvProcess" runat="server" AutoGenerateRows="False" Height="50px" Width="100%" DataSourceID="odsProcess">    
                       <HeaderTemplate>
                        <table width="100%"> 
                        <tr > 
                            <td>                    
                            </td>            
                            <td></td>             
                        </tr> 
                       </HeaderTemplate>     
                            <Fields>
                                 <asp:TemplateField >
                                  <ItemTemplate>
                   <tr>
                    <td>
                        <h4><asp:Label ID="lblHeading" runat="server" Text='<%# Eval("ProcessName") %>'></asp:Label></h4>                	
                     </td>             
                   </tr>                  
                   <tr><td>
                    <%# Eval("ProcessText") %>
                   </td></tr> 
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterTemplate>
                            </table>
                            </FooterTemplate>
                        </asp:DetailsView>
		<asp:ObjectDataSource ID="odsProcess" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetProcessByID" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetProcess">
                <SelectParameters>
                    <asp:QueryStringParameter Name="nProcessId" QueryStringField="ProcessId" 
                        Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource> 
        </div>
    </div>
    </form>
</body>
</html>
