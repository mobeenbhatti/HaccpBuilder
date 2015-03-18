<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_safetycheck" Title="Untitled Page" Codebehind="safetycheck.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTopLeft" Runat="Server">
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
								<tr>
									<td width="100%">
										&nbsp;</td>
								</tr>

								<tr>
									<td width="100%">
										<h3>Food Safety Checklist</h3></td>
								</tr>
	                            <tr>
	                                <td valign="top">
										<p><b>Directions:</b> Use this checklist weekly to determine areas in 
							            your operations requiring corrective action.&nbsp; Record corrective action 
							            taken and keep completed records in a notebook for future reference.</p>&nbsp;</td>

		                        </tr>
								<tr>
								    <td width="100%">
								        <h4><span style="color: #56895E;">Personal Hygiene</span></h4>
								    </td>
								</tr>
		                        <tr>
									<td valign="top" width="100%">

									
									<form method="post" action="safetycheck.aspx?ccsForm=SearchHistory" name="SearchHistory">
									<table>
										
										<tr>
											<td valign="bottom">Select History&nbsp;
												<select name="week">
													<option value="">Select Value</option>
													<option value="2">2008-01-14</option>

<option value="45">2008-11-11</option>

												</select> </td>
										</tr>
										<tr>
											<td>
												
												<input name="Button_DoSearch" type="image" border="0" src="b_b_2a.gif" value="Search" />
												&nbsp;&nbsp;
												<a href="safetycheck.aspx">Clear history selection</a> </td>

										</tr>
									</table>
									</form>
									<form name="FoodSafetyChecklist" action="safetycheck.aspx?ccsForm=FoodSafetyChecklist" method="post">
									    <input type="hidden" name="FormState" value="13;0;ResponseId;fsq_QuestionId;;1;;2;;3;;4;;5;;6;;7;;8;;9;;10;;11;;12;;13">
									    <table width="100%">
											
											<tr>
												<td colspan="3">
													<table border="0">

														<tr>
															<td>Observer: </td>
															<td>
																<input type="text" name="Observer" value=""/></td>
														</tr>
													</table> </td>
											</tr>
											
									        
									        <tr>

									            <th>
									            <a href="safetycheck.aspx?FoodSafetyChecklistOrder=Sorter_QuestionId&amp;FoodSafetyChecklistDir=ASC">Question</a></th>

									            <th>
									            <a href="safetycheck.aspx?FoodSafetyChecklistOrder=Sorter_Answer&amp;FoodSafetyChecklistDir=ASC">Answer</a></th>

									            <th>Corrective Action</th>
 
									        </tr>

 
									        
									        
									        <tr>
									            <td>1.&nbsp; Employees wear clean and proper uniform including shoes.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_1" value="1"/>Yes <input  type="radio" name="Answer_1" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_1" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_1" value="1"/>

													<input type="hidden" name="ResponseWeek_1" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>
											
									        
									        <tr>
									            <td>2.&nbsp; Effective hair restraints are properly worn.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_2" value="1"/>Yes<input  type="radio" name="Answer_2" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_2" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_2" value="2"/>
													<input type="hidden" name="ResponseWeek_2" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"/></td> 
									        </tr>

											
									        
									        <tr>
									            <td>3.&nbsp; Fingernails are short, unpolished,  and clean (no artificial nails).&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_3" value="1"/>Yes<input  type="radio" name="Answer_3" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_3" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_3" value="3"/>

													<input type="hidden" name="ResponseWeek_3" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"/></td> 
									        </tr>
											
									        
									        <tr>
									            <td>4.&nbsp; Jewelry is limited to a plain ring,  such as a wedding band and a watch no bracelets.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_4" value="1"/>Yes<input  type="radio" name="Answer_4" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_4" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_4" value="4"/>
													<input type="hidden" name="ResponseWeek_4" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>

											
									        
									        <tr>
									            <td>5.&nbsp; Hands are washed properly, frequently,  and at appropriate times.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_5" value="1"/>Yes<input  type="radio" name="Answer_5" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_5" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_5" value="5/">

													<input type="hidden" name="ResponseWeek_5" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>
											
									        
									        <tr>
									            <td>6.&nbsp; Burns,  wounds,  sores or scabs,  or splints and water-proof bandages on hands are bandaged and completely covered with a foodservice glove while handling food.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_6" value="1"/>Yes<input  type="radio" name="Answer_6" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_6" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_6" value="6"/>
													<input type="hidden" name="ResponseWeek_6" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>

											
									        
									        <tr>
									            <td>7.&nbsp; Eating, drinking,  chewing gum,  smoking,  or using tobacco are allowed only in designated areas away from preparation,  service,  storage,  and ware washing areas.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_7" value="1"/>Yes<input  type="radio" name="Answer_7" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_7" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_7" value="7"/>

													<input type="hidden" name="ResponseWeek_7" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>
											
									        
									        <tr>
									            <td>8.&nbsp; Employees use disposable tissues when coughing or sneezing and then immediately wash hands.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_8" value="1"/>Yes<input  type="radio" name="Answer_8" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_8" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_8" value="8"/>
													<input type="hidden" name="ResponseWeek_8" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>

											
									        
									        <tr>
									            <td>9.&nbsp; Employees appear in good health.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_9" value="1"/>Yes<input  type="radio" name="Answer_9" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_9" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_9" value="9"/>

													<input type="hidden" name="ResponseWeek_9" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>
											
									        
									        <tr>
									            <td>10.&nbsp; Hand sinks are unobstructed,  operational,  and clean.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_10" value="1"/>Yes<input  type="radio" name="Answer_10" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_10" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_10" value="10"/>
													<input type="hidden" name="ResponseWeek_10" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>

											
									        
									        <tr>
									            <td>11.&nbsp; Hand sinks are stocked with soap, disposable towels,  and warm water.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_11" value="1"/>Yes<input  type="radio" name="Answer_11" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_11" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_11" value="11"/>

													<input type="hidden" name="ResponseWeek_11" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>
											
									        
									        <tr>
									            <td>12.&nbsp; A handwashing reminder sign is posted.&nbsp;</td> 
									            <td style="white-space: nowrap;">

									                <input  type="radio" name="Answer_12" value="1"/>Yes<input  type="radio" name="Answer_12" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_12" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_12" value="12"/>
													<input type="hidden" name="ResponseWeek_12" value="03"/> </td> 
									        </tr>
											
									        <tr>
									            <td colspan="3"><img border="0" src="../Styles/SchoolHaccp/Images/Spacer.gif"></td> 
									        </tr>

											
									        
									        <tr>
									            <td>13.&nbsp; Employee restrooms are operational and clean.&nbsp;</td> 
									            <td style="white-space: nowrap;">
									                <input  type="radio" name="Answer_13" value="1"/>Yes<input  type="radio" name="Answer_13" value="0"/>No</td> 
									            <td>
													<textarea name="CorrectiveAction_13" cols="30" rows="2"></textarea>
													<input type="hidden" name="hidQuestionId_13" value="13"/>

													<input type="hidden" name="ResponseWeek_13" value="03"/> </td> 
									        </tr>
											
									        
									        
									        <tr>
									            <td style="text-align:right;" colspan="3">
													
									                <input name="Button_Submit" type="image" border="0" src="b_b_2a.gif"value="Submit"/></td> 
									        </tr>
									    </table>
									</form>
									
									<br>&nbsp;</td>

								</tr>
								<tr>
								    <td colspan="2">       
								    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tr>
                                            <td align="center" bgcolor="#778888">
											    <span style="COLOR: white">
											    &copy; HACCP Builder 2007</span>&nbsp;</td>

                                        </tr>
                                    </table>
								<br />
								<%--<a href="../termsofuse.html" target="_blank" style="font-family: Verdana;">Terms of Use</a>
								<span style="padding-left: 25px;"><a href="/controlpanel/SchoolHACCPTrainingManual.doc" target="_blank" style="font-family: Verdana;">Training Manual</a></span>--%>

</td>
							</tr>
							</table>

						
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTopRight" Runat="Server">
    <p>
        Top Right</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" Runat="Server">
    <p>
        Main Content</p>
</asp:Content>

