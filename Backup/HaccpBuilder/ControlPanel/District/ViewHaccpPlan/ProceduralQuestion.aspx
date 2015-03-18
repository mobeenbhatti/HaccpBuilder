<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_ProceduralQuestion" Codebehind="ProceduralQuestion.aspx.cs" %>

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
		
        <%-- Procedural Question --%>
        <tr>
			<td style="background-color:#99ccff; color: #000;">						
				<h2 >HACCP PROCEDURAL QUESTIONS AND ANSWERS</h2>									
			</td>		
		</tr>
		<tr>
		
		</tr>
		<%-- Buyes Specs --%>
		<tr>
		    <td style="background-color:#c0c0c0">
		       <h3> HACCP Procedural Questions:  Buyer Specifications</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <b>   Describe Establishment Requirements for Vendor Selection</b>
		    </td>
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion1" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		
		</tr>
		<%-- Allergen Management --%>
		<tr>
		    <td style="background-color:#c0c0c0">
		       <h3> HACCP Procedural Questions:  Allergen Management</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		       <p><b> Do any product/menu items contain potential allergen ingredients</b></p>
		       <p><asp:RadioButton ID="rdlAllergenYes" Enabled="false" runat="server" Text="Yes" />
		       <asp:RadioButton ID="rdlAllergenNo" Enabled="false" runat="server" Text="No" />
		        <asp:RadioButton ID="rdlAllergenNA" Enabled="false" runat="server" Text="NA" />
		       </p>
		    </td>		   
		</tr>
		<tr>
		    <td>
		       <b> If yes, describe allergen ingredients</b>
		    </td>
		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion2" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		    <td>
		       <b> Please describe procedures for allergen control:</b>
		    </td>		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion2b" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		
		</tr>
		<%-- Safety Hazard --%>
		<tr>
		    <td style="background-color:#c0c0c0">
		       <b> HACCP Procedural Questions:  Safety Hazard Procedures</b>
		    </td>
		</tr>
		<tr>
		    <td>
		      <b>Describe basic procedures to eliminate product/menu items from contamination  by biological, chemical and physical food safety hazards</b>
		    </td>
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion3" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		
		</tr>
		<%-- Soiled And Unsanitized --%>
		<tr>
		    <td style="background-color:#c0c0c0">
		       <b> HACCP Procedural Questions:  Soiled and Unsanitized Surfaces</b>
		    </td>
		</tr>
		<tr>
		    <td>
		       <b> Do soiled and unsanitized surfaces of equipment and utensils contact raw or cooked food</b>
		       </ br>
		        <asp:RadioButton ID="rdbSoilYes" Enabled="false" TextAlign="Right" runat="server" Text="Yes" />
		        <asp:RadioButton ID="rdbSoilNo" Enabled="false" TextAlign="Right"  runat="server" Text="No" />
		         <asp:RadioButton ID="rdbSoilNA" Enabled="false" TextAlign="Right"  runat="server" Text="NA" />
		    </td>		    
		</tr>
		<tr>
		    <td>
		       <b>If yes, describe how the raw or cooked food comes into contact with unclean or unsanitized surfaces</b>
		    </td>		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion4" Text="" runat="server"></asp:Label>
		    </td>
		</tr>		
		<tr>
		    <td style="background-color:#c0c0c0">
		       <b> HACCP Procedural Questions:  Daily Requirements (HACCP Builder will fulfill requirements daily)</b>
		    </td>
		</tr>
		<tr>
		    <td>
		        <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="false" DataSourceID="ObjectDataSource3" 
                    SkinID="gridviewHeadSkin" >
                <Columns>
                    <asp:TemplateField  ItemStyle-Width="10px">
                        <ItemTemplate>
                        <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />                    
                        </ItemTemplate>
                    </asp:TemplateField>               
                    <asp:BoundField DataField="Question" ItemStyle-Width="350px" HeaderText="Question" />                
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate >
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" Enabled="false" GroupName="Answer" runat="server" /> 
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" Enabled="false" GroupName="Answer"  runat="server" /> 
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" Enabled="false" GroupName="Answer"  runat="server" /> 
                            <asp:Label ID="lblValidateProcess" Text="" CssClass="ValidateLabel" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Detail if needed" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px" Height="30px"   runat="server" ></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Static" Enabled="false" 
                             ErrorMessage="You must supply a corrective action or select Yes." ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetQuestionsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetProceduralQuestion">        
        </asp:ObjectDataSource>	
		    </td>
		</tr>
			</table>
    </div>
    </div>
    </form>
</body>
</html>
