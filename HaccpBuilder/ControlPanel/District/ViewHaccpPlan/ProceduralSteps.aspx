<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_ProceduralSteps" Codebehind="ProceduralSteps.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div id="container">
    <div style="overflow:visible; height:50%;">
    <div class="GirdDiv">
        <table >
        <tr>
			<td valign="top" >						
				<span style="font-size: 20pt; color:Red; padding-bottom: 20px; padding-top: 20px; font-weight: bold;">HACCP PLAN FOR <asp:Label ID="lblKitchen" runat="server" Text=""></asp:Label> </span>
				<br/>		
			</td>
			<td>
			</td>
			<td>
			</td>
		</tr>
		<%--<tr>
		    <td>
		        <asp:ImageButton ID="cmdPrint" runat="server" ImageUrl="~/images/buttons/ButtonPrint-Test.GIF" OnClientClick="PrintPage();" />
		    </td>
		</tr>--%>
		<%-- Kitchen Details --%>
		<tr>		    
		         <td align="left" class="BackGround1">
		             
                       <b>DESCRIPTION OF PROGRAM OVERVIEW AND FACILITY:</b>
                      
                 </td>		    
		</tr>
		<tr></tr>
		<tr>
		    <td>		
		        <asp:DetailsView ID="dtvKitchenDetails" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDSKitchenDetails"  >    
    <Fields>
         <asp:TemplateField >
                <ItemTemplate >
                    <table  >                    
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
                        </tr>
                        <tr>                    
                             <td>
                                 <asp:Label ID="lblManager" Text='<%# "Manager: " + DataBinder.Eval(Container.DataItem,"Manager") %>' runat="server"></asp:Label>
                             </td> 
                        </tr>
                         <tr>
                        </tr>
                        <tr>                       
                            <td>
                                <asp:Label ID="lblMail2" Text='<%# "Email: " + DataBinder.Eval(Container.DataItem,"EmailAddress") %>' runat="server"></asp:Label>
                            </td>                            
                        </tr>
                         <tr>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblKitchenAddress" Text='<%# "Address: " + DataBinder.Eval(Container.DataItem,"Address").ToString().Trim() %>' runat="server"></asp:Label>
                            </td>  
                       </tr>
                        <tr>
                        </tr>
                      <tr>
                            <td>
                                <asp:Label ID="Label1" Text='<%# "County: " + DataBinder.Eval(Container.DataItem,"County") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                         <tr>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text='<%# "City: " +  DataBinder.Eval(Container.DataItem,"City") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                        </tr>
                        <tr>                    
                            <td>
                                <asp:Label ID="lblPhone2" Text='<%# "Phone: " +   DataBinder.Eval(Container.DataItem,"Phone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                        </tr>
                        <tr>                  
                            <td>
                                <asp:Label ID="lblAltPhone" Text='<%# "Alternate Phone: " + DataBinder.Eval(Container.DataItem,"AltPhone") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                        </tr>
                        <tr>                  
                            <td>
                                <asp:Label ID="lblFax" Text='<%# "Fax: " + DataBinder.Eval(Container.DataItem,"Fax") %>' runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                        </tr>
                    </table>
               </ItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
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
		<td>
		
		
		    <hr />
		   
		    
		</td>

		</tr>
		<%-- Procedural Steps --%>
	</table>
	<div style="page-break-after:always"></div>
	<table>
		<tr >
			<td>						
				<h2 class="BackGround1">HACCP BUILDER PROCEDURAL STEPS</h2>									
			</td>		
		</tr>
		<%-- Step One --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> One&#45;Develop Prerequisite Programs</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Develop Prerequisite Programs</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        Prerequisite programs may include such things as:
		        <li>Vendor certification and training programs (food safety training, yearly certifications of staff and facility, etc.)</li>
<li>Allergen management (custom info procedures should be allowed here)</li>
<li>Buyer specifications (Establishment requirements for vendors &#45; I would leave this open ended so custom info can be entered)</li>
<li>Recipe/process instructions (we have this already)</li>
<li>Standard Operating Procedures (SOPs) &#45; (we have this already &#45; template and custom capability)
</li>
<%--<br /><br />--%>
Basic prerequisite programs should be in place to:
<li>Protect products from contamination by biological, chemical, and physical food safety hazards (custom procedures can be entered here)</li>

<li>Control bacterial growth that can result from temperature abuse</li>

<li>Maintain equipment (add maintenance section under equipment survey section)</li>

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Prerequisite Programs to Control Contamination of Food</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        These procedures ensure that:
		        <li>Soiled and unsanitized surfaces of equipment and utensils do not contact raw or cooked (ready&#45;to&#45;eat) food</li>
<li>Workers with certain symptoms, such as vomiting or diarrhea, are restricted or excluded</li>
<li>Raw animal foods do not contaminate cooked (ready&#45;to&#45;eat) food</li>
<li>Effective handwashing is practiced</li>
<li>Eating, smoking, and drinking in food preparation areas are prohibited</li>
<li>Water in contact with food and food&#45;contact surfaces and used in the manufacture of ice is potable</li>
<li>Toxic compounds are properly labeled, stored, and safely used</li>
<li>Contaminants such as condensate, lubricants, pesticides, cleaning compounds, sanitizing agents, and additional toxic materials do not contact food, food&#45;packaging materials, and food&#45;contact surfaces</li>
<li>Food, food&#45;packaging materials, and food&#45;contact surfaces are not contaminated by physical hazards such as broken glass from light fixtures, jewelry, etc.</li>
<li>An effective pest control system is in place</li>
<li>Hair restraints are used</li>
<li>Clean clothing is worn</li>
<li>The wearing of jewelry (other than a wedding ring) is prohibited</li>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Prerequisite Programs to Control Bacterial Growth</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       These procedures ensure that all potentially hazardous food is received and stored at a refrigerated temperature of 41 &#176;F or below. Note that the Food Code makes some allowances for specific foods that may be received at higher temperatures.  The items addressed by this procedural step are the foundation by which your entire food safety management system is based. The success of any food safety  management system is dependent on how well you control these basic sanitation issues in your establishment.  With this in mind, consider how you can actively monitor the activities associated with the prerequisite programs to ensure that they are being implemented properly. If you decide to control certain items in your food safety management system through prerequisite programs, monitoring of the programs is recommended. Just as monitoring allows you to prevent, eliminate, or reduce hazards in your HACCP plans, monitoring may also allow you an opportunity to detect weaknesses in your prerequisite programs.  If you see areas needing improvement, you should take corrective actions immediately.
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Prerequisite Programs to Maintain Equipment</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        These procedures ensure that:
		        <li>Food&#45;contact surfaces, including utensils, are cleaned, sanitized, and maintained in good condition</li>
<li>Temperature measuring devices (e.g., thermometer or temperature recording device) are calibrated regularly</li>
<li>Cooking and hot holding equipment (grills, ovens, steam tables, conveyer cookers, etc.) are routinely checked, calibrated, and operated to ensure correct product temperature</li>
<li>Cold holding and cooling equipment (refrigerators, rapid chill units, freezers, salad bars, etc.) are routinely checked, calibrated, and operated to ensure correct product temperature</li>
<li>Ware washing equipment is operated according to manufacturer&rsquo;s specifications</li>
<li>Toilet facilities are accessible to employees and maintained</li>
		    </td>
		</tr>
		</table></td>
		</tr>
	</table>
	<div style="page-break-after:always"></div>
	<table>
		<%-- Step Two --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3>Two&#45;Group Your Products/Menu</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Group Your Products/Menu</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        To begin grouping your products/menu, you should review how your product/menu flow through your operation. You should note whether they undergo a cook step for same day service, receive additional cooling and reheating following a cook step, or have no cook step involved. You may refer to Chapter 2 for organizing your product/menu items or products by Process 1, 2, and 3.  Looking at your products/menu or food list, you should place each item into the appropriate food preparation process. You may discover that more than one food preparation process is conducted within your operation. You may also need to consult the annexes of this Manual to identify product/menu items or products that need special consideration.

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Prerequisite Programs to Control Contamination of Food</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        These procedures ensure that:
		        <li>Soiled and unsanitized surfaces of equipment and utensils do not contact raw or cooked (ready&#45;to&#45;eat) food</li>
<li>Workers with certain symptoms, such as vomiting or diarrhea, are restricted or excluded</li>
<li>Raw animal foods do not contaminate cooked (ready&#45;to&#45;eat) food</li>
<li>Effective handwashing is practiced</li>
<li>Eating, smoking, and drinking in food preparation areas are prohibited</li>
<li>Water in contact with food and food&#45;contact surfaces and used in the manufacture of ice is potable</li>
<li>Toxic compounds are properly labeled, stored, and safely used</li>
<li>Contaminants such as condensate, lubricants, pesticides, cleaning compounds, sanitizing agents, and additional toxic materials do not contact food, food&#45;packaging materials, and food&#45;contact surfaces</li>
<li>Food, food&#45;packaging materials, and food&#45;contact surfaces are not contaminated by physical hazards such as broken glass from light fixtures, jewelry, etc.</li>
<li>An effective pest control system is in place</li>
<li>Hair restraints are used</li>
<li>Clean clothing is worn</li>
<li>The wearing of jewelry (other than a wedding ring) is prohibited</li>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>TABLE 1: PROCESS&#45;SPECIFIC LISTS</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Example product/menu items or products that belong to each of the three food preparation processes can be found in the following table. Note that the same product/menu item can appear in more than one category depending on how it is prepared:
		    </td>
		</tr>
		<tr>
		    <td>
		    <table border="1">
		    <tr>
		    <th>PROCESS #0
No Food Preparation with No Cook Step
</th>
		    <th>PROCESS #1
Food Preparation with No Cook Step
</th>
		    <th>PROCESS #2
Food Preparation for Same Day Service
</th>
		    <th>PROCESS #3
Complex Food Preparation
</th>
		    </tr>
		    <tr>
		    <td>Bread Cookies Crackers Etc. </td>
		    <td>raw meat and seafood (to be cooked by consumer)salad greens fish for raw consumption fresh vegetables oysters or clams served raw tuna salad Caesar salad dressing Cole slaw sliced sandwich meats sliced cheese chicken salad (made from canned chicken) </td>
		    <td>fried chicken broiled fish fried oysters hamburgers soup du jour hot vegetables cooked eggs </td>
		    <td>soups gravies sauces large roasts chili taco filling egg rolls chicken salad (made from raw chicken)
</td>
		    </tr>
		    </table>
		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>
		<%-- Step Three --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3>Three&#45;Conduct a Hazard Analysis</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Conduct a Hazard Analysis</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       In developing a food safety management system, you should identify the food safety hazards that exist in the flow of food in your operation from receiving to service or sale.  By identifying the food safety hazards present in your system, you should then be able to determine the possible control measures that may be implemented to achieve active managerial control of the foodborne illness risk factors leading to out&#45;of&#45;control hazards
<br /><br />
Control measures are any actions or activities that can be used to prevent, eliminate, or reduce an identified hazard.  While the hazard analysis in the process approach to HACCP is probably less complicated than in traditional HACCP, this section is not intended to provide all the information you will need to conduct a hazard analysis of your products. In addition, FDA strongly recommends that you consult your health inspector or other food safety professional during this and all other phases of your food safety management system development.  As described, the specific food safety hazards for each of the products within a particular food preparation process may be varied, but the recommended control measures for each of the products in each process will generally be the same.  As you conduct the hazard analysis, you will most likely find that regardless of the specific food safety hazards present in the products in any particular food preparation process, the foods within each of the food preparation processes share common categories of hazards. This is why the control measures you apply to the products in each of the three food preparation processes will generally be the same.  Because of this, you may use general categories to designate the types of food safety hazards present in your operation.
<br /><br />
For example, in process 2 you may have baked chicken, fried fish, grilled hamburgers, and baked meatloaf that are all cooked and hot held before service. While each of these foods may have unique food safety hazards, they all share general categories of hazards and therefore the control measures that you may implement are basically the same.  Vegetative bacteria are controlled through proper cooking, spore&#45;forming or toxin&#45;forming bacteria are controlled through proper hot holding, and fecal&#45;oral route pathogens such as Shigella,  Salmonellae, and viruses are controlled through good hygienic practices such as proper handwashing, no bare hand contact with ready&#45;to&#45;eat food, and implementation of employee health policies. In addition, pathogens resulting from cross&#45;contamination may be controlled by proper sanitization and storage practices.  Other hazard categories and control measures may exist in this example.  The categories listed below are not all&#45;inclusive and there may be overlap between them.  You may use different terminology from what is outlined in this Manual. The category names that you use are unimportant as long as you know what hazards are present in your system. Examples of general hazard categories that you may use to fill in your tables are as follows:
<br /><br />
<b>BIOLOGICAL</b><br />
1.	Vegetative bacteria (such as Salmonella, Campylobacter, E.coli, and Vibrio)<br />
2.	Spore&#45;forming or toxin&#45;forming bacteria (such as Bacillus cereus, Clostridium perfringens, Clostridium botulinum, and Staphylococcus aureus)<br />
3.	Fecal&#45;oral route pathogens (such as parasites, various bacteria, and viruses)<br />
4.	Viruses (such as Hepatitis A and Noroviruses)<br />
5.	Bacteria, parasites, or viruses from cross&#45;contamination [applies to the transfer of disease&#45;causing microorganisms to ready&#45;to&#45;eat food by hands, food&#45;contact surfaces, sponges, cloth towels and utensils that are contaminated with disease&#45;causing microorganisms. Also applies to the transfer of disease&#45;causing microorganisms from raw animal foods with higher cook temperatures (i.e. chicken) to raw animal foods of less or cooking temperatures (i.e. pork)]<br />
<b>CHEMICAL</b><br />

6.	General chemical contamination (cleaning compounds, sanitizers, allergens, etc.)<br />
7.	Scombroid toxin (histamine production in certain fish)<br />
8.	Ciguatera toxin (natural toxin in certain fish)<br />
<b>PHYSICAL</b><br />

9.	General physical hazards such as bone or metal fragments, bandages, jewelry, etc.<br />

Some questions to ask yourself as you evaluate the food safety hazards present in your products include:

<li>Are there any ingredients or product/menu items of special concern such as those associated with seafood?</li>

<li>Is this a potentially hazardous food requiring specific temperature controls?</li>

<li>How will it be served? Immediately? Held on a buffet?</li>

<li>Does this food have a history of being associated with illnesses?</li>

<li>Will this require a great deal of preparation, making preparation time, employee health, and bare hand contact with ready&#45;to&#45;eat food a special concern?</li>

<li>How will employees exhibiting symptoms such as diarrhea or vomiting be handled?</li>

<li>Are you serving food to a population that is known to be highly susceptible to foodborne illness (e.g., residents of health care facilities, persons in child or adult day care facilities, etc.)?</li>
<br /><br />
If you already have a working knowledge of the hazards associated with products in your establishment, you can fulfill the hazard analysis step by identifying the control measures in the Food Code that are associated with each operational step in your food preparation processes. You may consult the FDA Food Code to help you in understanding the public health rationale behind the control measures and critical limits.  In the next procedural step, you should determine which of the control measures identified in your hazard analysis are essential to the food&rsquo;s safety, i.e. cooking. You may choose to implement control measures in your HACCP plans at CCPs or through your prerequisite programs.
		    </td>
		</tr>
		</table>
		</td>
		</tr>	
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Four --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Four&#45;Implement Control Measures in Prerequisite Programs or at CCPs in Your HACCP</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Plans and Establish Critical Limits</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        The objective of procedural step 4 is to implement control measures in your food safety management system to prevent, eliminate, or reduce hazards to acceptable levels. Once control measures have been identified in Procedural Step 3 &#45; Hazard Analysis, you should determine how you will achieve active managerial control. Control may be achieved at Critical Control Points (CCPs) in your HACCP plans or through prerequisite programs.  By definition, a CCP is an operational step at which control can be applied and is essential to prevent or eliminate a hazard or reduce it to an acceptable level. If an operational step is the last step at which control can be applied to prevent or eliminate a hazard or reduce it to an acceptable level, then you should consider controlling it as a CCP. If a step later in the process will control the hazards of concern, that step, rather than the one in question, will most likely be a CCP.  Depending on your operation, control measures may be effectively implemented in your prerequisite programs
<br />
For instance, you may decide that cold holding during storage is best controlled through prerequisite programs rather than through your HACCP plans. It is important to consider the flow of food as you make this determination.  The Food Code provides specific measurable criteria referred to as critical limits designed to prevent, eliminate, or reduce hazards in foods. The critical limits are based on the best available science and pertain to control measures applied within operational steps. Common examples might be time/temperature standards and no bare hand contact with ready&#45;to&#45;eat food.  You should make sure that you have established the appropriate critical limits to control the identified hazards. It is recommended that you refer to the most recent version of the Food Code or your state, local, or tribal regulations for help with determining the appropriate critical limits for the identified control measures.

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>COMMON OPERATIONAL STEPS USED IN RETAIL AND FOOD SERVICE</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        The following information about the common operational steps conducted at retail is provided to assist in your decision&#45;making as you move through the procedural steps presented in this document. Common operational steps conducted at retail include, but are not limited to, receiving, storing, preparing, cooking, cooling, reheating, hot and cold holding, assembly/set&#45;up/packing, serving, and selling.
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Prerequisite Programs to Control Bacterial Growth</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       These procedures ensure that all potentially hazardous food is received and stored at a refrigerated temperature of 41 &#176;F or below. Note that the Food Code makes some allowances for specific foods that may be received at higher temperatures.  The items addressed by this procedural step are the foundation by which your entire food safety management system is based. The success of any food safety  management system is dependent on how well you control these basic sanitation issues in your establishment.  With this in mind, consider how you can actively monitor the activities associated with the prerequisite programs to ensure that they are being implemented properly. If you decide to control certain items in your food safety management system through prerequisite programs, monitoring of the programs is recommended. Just as monitoring allows you to prevent, eliminate, or reduce hazards in your HACCP plans, monitoring may also allow you an opportunity to detect weaknesses in your prerequisite programs.  If you see areas needing improvement, you should take corrective actions immediately.
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>RECEIVING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Two recommended control measures of importance during this operational step include:

<li>Receiving the food at proper temperatures and getting perishable food into cold storage quickly</li>

<li>Obtaining food, ingredients, and packaging materials from approved sources (suppliers who are regulated and inspected by appropriate regulatory authorities)</li>

Ready&#45;to&#45;eat, potentially hazardous food is a special concern at receiving. Because this food will not be cooked before service, pathogenic bacterial growth could be considered a significant hazard during this step for refrigerated, ready&#45;to&#45;eat foods.<br />
Having prerequisite programs in place to control product temperature is generally adequate to control the hazards present at receiving of most of these products. Besides checking the product temperature, you should check the appearance, odor, color, and condition of the packaging.  Seafood, whether ready&#45;to&#45;eat or not, requires special attention during receiving.  Federal regulations require processors of seafood and seafood products for interstate distribution to have a HACCP plan.  These processors are the only approved sources for seafood sold in interstate commerce; therefore, you may ask your interstate seafood supplier for documentation that the firm has a HACCP plan in place. Processors of seafood and seafood products that are sold or distributed only within a state may or may not be required to have a HACCP plan, depending on the state, local, or tribal regulations.<br />
In order to destroy parasites in certain species of fish intended for raw consumption, either you or the seafood processor should freeze the fish at a given time and temperature. You should ask to see specifications on these species of fish to be sure that they have been frozen to destroy the parasites.<br />
Molluscan shellfish (oysters, clams, mussels, and scallops) that are received raw in the shell or shucked should be purchased from suppliers who are listed on the FDA Interstate Certified Shellfish Shippers&rsquo; List or on a list maintained by your state shellfish control authority. Shellfish received in the shell should bear a tag (or a label for shucked shellfish) that states the date and location of harvest, in addition to other specific information.  Finfish harvested from certain areas may naturally contain a toxin called ciguatera.  Other finfish may develop a toxin after harvest if strict temperature control is not maintained. This toxin is called scombrotoxin (histamine). For finfish, temperature control and approved sources are important at receiving because cooking will not eliminate these toxins. For more information on toxins and parasites in fish, you may refer to the FDA Food Code.<br 
</td>
		</tr>
		<tr>
		    <td>
		     <h4>STORAGE</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       When food is in refrigerated storage, your food safety management system should focus on:

<li>Maintaining temperature control to limit the growth of pathogenic bacteria that may be present in a ready&#45;to&#45;eat product</li>
<li>Storing food so that cross&#45;contamination of ready&#45;to&#45;eat food with raw animal foods is prevented</li>
When determining the storage temperature and monitoring frequency of products in cold storage, you may decide to set the temperature lower than what is required by your local regulations. By setting the temperature lower than what is required by your regulations, small upward deviations in temperature that you detect through frequent monitoring can be quickly corrected before bacteria begin to grow.  For example, if you are storing potentially hazardous, ready&#45;to&#45;eat foods under refrigeration, you may decide to set a critical limit for the refrigeration units to operate at 38 &#176;F. This provides a safety cushion that allows you the opportunity to see a trend toward exceeding 41 &#176;F and to intervene with appropriate corrective actions before bacteria begin to grow to dangerous levels.<br />
Monitoring procedures for ready&#45;to&#45;eat food ideally include internal product temperature checks. You should assess whether it is realistic and practical for you to do this depending on the volume of food you are storing.  You may choose to base your monitoring system on the air temperature of the refrigerated equipment as a prerequisite program.<br />
How often you should monitor the air temperature depends on:

<li>Whether the air temperature of the refrigerator accurately reflects the internal product temperature &#45; (Remember, your food safety refrigeration temperature must be based on the internal product temperature of the food stored within a refrigeration unit, not the ambient air temperature)</li>
<li></li>The capacity and use of your refrigeration equipment</li>
<li></li>The volume and type of food products stored in your cold storage units</li>
<li></li>The prerequisite programs that support monitoring this process</li>
<li></li>Shift changes, volume of business, and other operational considerations</li>

Special consideration should be given to the storage of scombroid toxin&#45;forming fish due to the potential formation of histamine.  To control histamine formation in scombroid toxin&#45;forming fish, the critical limit temperature of 41 &#176;F should be managed either through your HACCP plan as a CCP or through your prerequisite programs.  Also, your HACCP plan or prerequisite programs should ensure that reduced oxygen packaged smoked fish is maintained at 38 &#176;F to prevent the outgrowth of Clostridium botulinum Type E.  Separating raw foods from ready&#45;to&#45;eat products in your operation&rsquo;s refrigeration and storage facilities can control the potential for cross&#45;contamination.  When determining how you will arrange foods in your storage units to prevent cross&#45;contamination, you should consider the flow of food. For example, if chicken and beef are stored side&#45;by&#45;side on a shelf, consider whether or not employee practices will allow the raw chicken to drip onto the beef. Also, you should consider storing ready&#45;to&#45;eat, potentially hazardous food away from the door, in the coolest part of the walk&#45;in cooler. These products will not undergo any further kill step; thus, preventing the growth of spore&#45;forming bacteria is especially important for these products.<br />

</td>
		</tr>
		<tr>
		    <td>
		     <h4>PREPARATION</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Of all the operational steps, preparation has the greatest variety of activities that should be controlled, monitored, and in some cases, documented. It is  impossible to include in this Manual a summary that covers the diversity of product/menu, employee skills, and facility designs that impact the preparation of food. The preparation step may involve several processes, including thawing, mixing together ingredients, cutting, chopping, slicing, or breading.  At the preparation step, prerequisite programs can be developed to control some hazards and assist in the implementation of a food safety management system that minimizes:
<li>bacterial growth</li>

<li>contamination from employees and equipment</li>

<li>Small batch preparation is an important tool for controlling bacterial growth because limiting the amount of food prepared minimizes the time the food is kept at a temperature that allows for growth. Pre&#45;planning the volume of food and the time needed for preparation minimizes the time food is in the temperature danger zone at this operational step.</li>
<li>When thawing frozen foods, maintaining proper product temperature and managing time are the primary controls for minimizing bacterial growth. Procedures should be in place to minimize the potential for microbial, chemical, and physical contamination during thawing.</li>
<li>Use of pre&#45;chilled ingredients to prepare a cold product such as tuna salad may assist you in maintaining temperature control for this process.</li>
<li>Front&#45;line employees will most likely have the greatest need to work with the food.  A well&#45;designed and managed personal hygiene program that has been communicated to all employees will minimize the potential for bacterial, parasitic, and viral contamination.</li>
It is suggested that your program include instructions to your employees as to when and how to wash their hands. It is also very important to identify and restrict or exclude ill employees from working with food, especially if they have diarrhea, vomiting, fever, or jaundice.  Special consideration should be given to eliminating bare hand contact in the preparation of ready&#45;to&#45;eat foods.  How will you accomplish controlling the hazards presented by hand contact with ready&#45;to&#45;eat foods? Does the time of day, frequency, or duration of the preparation step allow for easy monitoring? You should review your operation to determine whether this operational step will be controlled as a CCP in your HACCP plans or as a prerequisite program.  Procedures should be in place to prevent cross&#45;contamination from utensils and equipment. Designated areas or procedures that separate the preparation of raw foods from ready&#45;to&#45;eat foods minimize the potential for bacterial contamination. Proper cleaning and sanitizing of food&#45;contact surfaces is recommended in this operational step.<br />

</td>
		</tr>
		<tr>
		    <td>
		     <h4>COOKING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       This operational step only applies to foods listed in Processes #2 and #3.  Cooking foods of animal origin is the most effective operational step for reducing or eliminating biological contamination. Cooking to proper temperatures for a specified time will kill most harmful bacteria and parasites.  Therefore, frequent monitoring of cooking temperatures is highly recommended.  You should determine the best system to use for ensuring that the proper cooking temperature and time are reached. Checking the internal product temperature is the desirable monitoring method. However, when large volumes of food are cooked, a temperature check of each individual item may not be practical. For instance, a quick service operation may cook several hundred hamburgers during lunch. Since checking the temperature of each hamburger will probably not be reasonable for you to do, you should routinely verify that the specific process and cooking equipment are capable of attaining a final internal product temperature at all locations in or on the cooking equipment.  Once a specific process has been shown to work for you, the frequency of record keeping (to be discussed in Procedural Step 7) may be reduced. In these instances, a record keeping system should be established to provide scheduled product temperature checks to ensure that the process is working.  Special consideration should be given to time and temperature when cooking raw animal foods.  In developing your HACCP plans or prerequisite programs, it is important to understand that the critical limits are product&#45;specific during the cooking step.  For example, the safe cooking temperature/time for poultry is 165 &#176;F for 15 seconds, while 155 &#176;F for 15 seconds is the safe cooking temperature for ground beef.  To ensure adequate destruction of pathogens by heat, the cooking operational step should be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code. Consult the latest edition of the Food Code available on the FDA/CFSAN &#45; website (http://www.cfsan.fda.gov/~dms/foodcode.html) or your local or state regulations for further guidance.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>COOLING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       One of the most labor&#45;intensive operational steps is rapidly cooling foods to control bacterial growth. Improper cooling of potentially hazardous foods has been consistently identified as one of the factors contributing to foodborne illness. Foods that have been cooked and held at improper temperatures provide an excellent environment for the growth of spore&#45;forming bacteria.  Recontamination of a cooked food item by poor employee practices or cross&#45;contamination from other food products, utensils, and equipment is also a concern at this operational step.  Improperly cooling food can begin a snowball effect that cannot be reversed. Even with proper reheating, toxins released by toxin&#45;producing bacteria after cooking and improper cooling may not be destroyed to levels safe enough for human consumption. Special consideration should be given to large food items such as roasts, turkeys, thick soups, stews, chili, and large containers of rice or refried beans. These foods take a long time to cool because of their mass and volume. If the hot food container is tightly covered, the cooling rate will be further slowed. By reducing the volume of the food in an individual container and leaving an opening for heat to escape by keeping the cover loose, the rate of cooling can be dramatically increased.  Commercial refrigeration equipment is designed to hold cold food at the proper temperature, not cool large masses of food. Some alternatives for cooling foods include:
<li>Using rapid chill refrigeration equipment designed to cool the food to acceptable temperatures quickly by using increased compressor capacity and high rates of air circulation.

<li>Avoiding the need to cool large masses by preparing smaller batches closer to periods of service.</li>
<li>Stirring hot food while the food container is in an ice water bath</li>
<li>In soups or stews, redesigning your recipe so that you cook a concentrated base and add enough cold water or ice to make up the volume that you need.</li>
<li>Pre&#45;chilling ingredients used to make products such as chicken and tuna salad</li>
Whichever cooling method you choose, you should verify that the process works. A record keeping system should be established to provide scheduled product temperature checks to ensure the process is working.  If a specific process has been shown to work for you, the frequency of record keeping may be re&#45;evaluated.  To control biological hazards, it is recommended that the cooling operational step be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code.<br />

</td>
		</tr>
		<tr>
		    <td>
		     <h4>REHEATING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       This operational step applies only to those foods that you listed in Process #3. If food is held at improper temperatures for enough time, pathogens have the opportunity to multiply to dangerous numbers. Proper reheating provides an important control for eliminating some of these organisms.  Remember that although proper reheating will kill most organisms of concern, it will not eliminate toxins such as those produced by Staphylococcus aureus and Bacillus cereus or foodborne viruses.  Special consideration should be given to the time and temperature in the reheating of cooked foods.  To control biological hazards, it is recommended that reheating be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>HOLDING (HOT, COLD, OR TIME)</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      All three processes may involve the holding of foods, i.e. hot and cold holding or use of time alone as public health control. When there is a cooking step to eliminate bacteria, all but the spore&#45;forming bacteria should be destroyed.  If cooked food is not held at the proper temperature or, absent temperature control, for the appropriate time, the rapid growth of these spore&#45;forming bacteria is a major concern.  When food is held, cooled, and reheated in a food establishment there is an increased risk from contamination caused by personnel, equipment, procedures, or other factors.  Harmful bacteria that are introduced into a product that is not held at proper temperature have the opportunity to multiply to large numbers in a short period of time.  Once again, management of personal hygiene and the prevention of cross&#45;contamination impact the safety of the food at this operational step.  Keeping food products at 135 &#176;F or above during hot holding and keeping food products at or below 41 &#176;F is effective in preventing microbial growth.  As an alternative to temperature control, the Food Code details actions when time alone is used as a control, including a comprehensive monitoring and food marking system to ensure food safety.  How often you monitor the temperature of foods during hot holding determines what type of corrective action you are able to take when 135 &#176;F is not met. If the critical limit is not met, your options for corrective action may include evaluating the time the food is out of temperature to determine the likelihood of hazards, and based on that evaluation, reheating or discarding the food.  Your frequency of monitoring during this operational step may mean the difference between reheating the food to 165 &#176;F or discarding it.  When determining the monitoring frequency of cold product temperatures, it is recommended that the interval between temperature checks is established to ensure that hazards are being controlled and time is allowed for an appropriate corrective action. For example, if you are holding potentially hazardous ready&#45;to&#45;eat foods under refrigeration, such as potato salad at a salad bar, you may decide to set a critical limit at 41 &#176;F or below.  You may also want to set a target, or operating limit, less than 41 &#176;F in order to provide a safety cushion that allows you the opportunity to see a trend toward exceeding 41 &#176;F and to intervene with appropriate corrective actions.  To control biological hazards, it is recommended that hot or cold holding or use of time alone as a public health control be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>SET UP, ASSEMBLY, AND PACKING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      Set up, assembly, and packing are operational steps used by some retail food establishments, including caterers [e.g., restaurant&#45;caterers, interstate  conveyance caterers, commissaries, grocery stores (for display cases), schools, nursing homes, hospitals, or food delivery services].  Set up, assembly, and packing may involve wrapping food items, assembling these items onto trays, and packing them into a transportation carrier or display case. An example would be an airline flight kitchen where food entrees are wrapped, assembled, and placed into portable food carts that are taken to a final holding cooler.  Hospital kitchens would be another example where patient trays are assembled and placed into carriers for transportation to nursing stations.  Food may be placed in bulk containers for transportation to another site where it is served.  Your food safety management system should address the potential for bacterial contamination and growth, bare hand contact with ready&#45;to&#45;eat foods, and proper handwashing.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>SERVING/SELLING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      This is the final operational step before the food reaches the customer. When employees work with food and food&#45;contact surfaces, they can easily spread bacteria parasites, and viruses. Managing personal hygiene is important to controlling these hazards.  It is recommended that a management program for employee personal hygiene be implemented that addresses the following:

<li>Procedures for proper handwashing</li>
<li>The appropriate use of gloves and dispensing utensils</li>
<li>Control of bare hand contact with ready&#45;to&#45;eat foods</li>
<li>Exclusion and restriction of ill employees</li>

Specific procedures are recommended for customer self&#45;service displays such as salad bars and buffet lines to protect food from contamination.  Special consideration should be given to preventing cross&#45;contamination from soiled utensils and equipment and minimizing contamination from the customer.<br />

</td>
		</tr>		
		</table>
		</td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Five --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Five&#45;Establish Monitoring Procedures</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Establish Monitoring Procedures</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Monitoring is observing or measuring specific operational steps in the food process to determine if your critical limits are being met. This activity is recommended to make sure your critical control points are under control. Monitoring will identify when there is a loss of control or a trend toward a loss of control so that corrective actions (discussed in Procedural Step 6) can be taken.
Consideration should be given to determining answers to the following questions:<br />

What will you monitor?<br />
How will you monitor?<br />
When and how often will you monitor?<br />
Who will be responsible for monitoring?<br /> 

In your food safety management system, certain processes have been identified as requiring active managerial control. What you are going to monitor depends on the critical limits you have established. Final temperature and time measurements are very important, and you should determine how you will effectively monitor the critical limits for them.  Determining the appropriate means for monitoring is an important factor in developing your food safety management system. If equipment is selected to monitor a specific CCP, you should ensure that it is accurate and routinely calibrated to ensure critical limits are met. The equipment you choose should also be appropriate for the monitoring that is being done. For example, a thermocouple with a thin probe is the most appropriate tool for measuring the final product temperature of thin hamburger patties.  When deciding how often you will monitor, you should ensure that the monitoring
interval will be reliable enough to ensure hazards are being controlled. Your procedure for monitoring should be simple and easy to follow.  Individuals chosen to be responsible for a monitoring activity may be a manager, line supervisor, or other reliable employee. FDA recommends that employees be given the training and equipment necessary to properly perform the monitoring activities.

		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Six --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Six&#45;Develop Corrective Actions</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Develop Prerequisite Programs</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       You should decide what type of corrective action to take if a critical limit is not met by asking yourself the following questions:
<li>What measures do you expect employees to take to correct the problem?</li>
<li>Do your employees understand the corrective action?</li>
<li>Can the corrective action be easily implemented?</li>
<li>Are different options needed for the appropriate corrective actions depending on the process and monitoring frequency?</li>
<li>How will these corrective actions be documented and communicated to management so the system can be modified to prevent the problem from occurring again?</li>
Whenever a critical limit is not met, a corrective action must be carried out immediately.  A corrective action may be simply continuing to heat food to the required temperature.  Other corrective actions may be more complicated, such as rejecting a shipment of raw oysters that does not have the required tags or segregating and holding a product until an evaluation is done.  In the event that a corrective action is taken, you should review and modify your food safety management system, if necessary.  Even with the best of systems, errors occur during food storage and preparation.  A food safety management system based on the HACCP principles is designed to detect errors and correct them before a hazard occurs.  A benefit to both you and your regulator is the ability to show that immediate corrective action was taken to ensure that no unsafe food was served or sold to the consumer.  It is important to communicate to management all corrective actions in writing or electronically.<br />
		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Seven --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Seven&#45;Conduct Ongoing Verification</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Conduct Ongoing Verification</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Because HACCP is a system to maintain continuous control of food safety practices, implementation of the system should to be verified. Verification is simply making sure that you are performing the activities as described in your food safety management system.<br />
<b>Routine monitoring should not be confused with verification. Verification is making sure that all the activities carried out in the implementation of your food safety management system are being done properly and at the required frequency. Monitoring is one of the many activities that needs to be verified. This is a vital step in ensuring that you have established active managerial control of identified hazards.</b><br />
Verification should be conducted by someone other than the person who is directly responsible for performing the activities specified in the food safety management system.  That person might be a manager, supervisor, designated individual, food safety professional, or even your health inspector.  If involved in the verification process, your inspector can offer suggestions for how you can strengthen your food safety management system.  Verification activities are conducted frequently, such as daily, weekly, monthly, etc., and may include:<br />
<li>Observing that person(s) are carrying out the critical procedures correctly</li>
<li>Observing the person doing the monitoring and determining whether monitoring is being done as planned</li>
<li>Reviewing the monitoring records to determine if they are completed accurately and consistently</li>
<li>Determining whether the records show that the frequency of monitoring stated in the plan is being followed</li>
<li>Ensuring that corrective action was taken when the person monitoring found and recorded that the critical limit was not met</li>
<li>Confirming that all equipment, including equipment used for monitoring, was operated, maintained and calibrated properly</li>
		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Frequency of Verification</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        Verification should occur at a frequency that can ensure the food safety
management system is being followed <b>continuously</b> to:<br />

<li>Prevent unsafe food from reaching the consumer</li>
<li>Take corrective action without loss of product</li>
<li>Confirm that prescribed personnel practices are followed</li>
<li>Ensure that personnel have the tools for proper personal hygiene and sanitary practices (e.g., handwashing facilities, sanitizing equipment, cleaning supplies, temperature measuring devices, etc.)</li>
<li>Comply with the established control procedures</li>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Verification &#45; Examples</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        Listed below are four examples of verification procedures:<br />
&#45;	Receiving logs: The manager reviews temperature logs of refrigerated products at various intervals, such as on a weekly basis, or even daily if:
<li>Receiving a high volume</li>
<li>Products received include scombroid toxin&#45;forming fish such as fresh tuna</li>
<br />
&#45;	Cooling logs: The location manager checks that the "cooling log'' is maintained for leftover foods on a weekly basis. The location manager checks to see that the time the food is placed in the cooler, its initial temperature, and  measurements of the time and temperature as the food is cooled are recorded and initialed on the log sheet.
<li>Handwashing and no bare hand contact logs: Nightly, the closing manager checks to see if the logs maintained at the handwashing sinks and preparation areas are complete.</li>
<li>Cooking: The manager checks the time/temperature monitoring records for cooking nightly to see that the required number of temperature measurements were taken during each shift.</li>

		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Eight --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Eight&#45;Keep Records</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Keep Records</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       As the manager of your operation, you may have several duties to perform in addition to making sure that the activities in your food safety management system are being performed at the proper frequency and with the proper method. Documenting these activities provides one mechanism for verifying that the activities were properly completed.  While record keeping is voluntary in most retail and food service operations, maintaining documentation of the activities in your food safety management system may be vital to its success.  Remember that by keeping records you are going above and beyond what your regulations normally require. Records provide documentation that appropriate corrective actions were taken when critical limits were not met. In the event your establishment is implicated in a foodborne illness, documentation of activities related to monitoring and corrective actions can provide proof that reasonable care was exercised in the operation of your establishment. Records may also show that on&#45;going verification was conducted on the food safety management system. In many cases, your records can serve a dual purpose of ensuring quality and food safety. In order to develop the most effective record keeping system for your operation, you should determine what documented information will assist you in managing the control of food safety hazards. A record keeping system can be simple and needs to be designed to meet the needs of your individual establishment. You do not necessarily need to develop new records to document the actions in the system.  Some recorded information like shellfish tags should already be part of your food safety management system, and an additional record may not be needed. Your record keeping system may use existing paperwork such as delivery invoices for documenting product temperature. Many retail and food service establishments have implemented comprehensive record keeping systems without having to generate a mountain of paperwork.<br />
Employees are an important source for developing simple and effective record keeping procedures. You should ask employees how they are currently monitoring CCPs or prerequisite programs and discuss with them the types of corrective actions they are currently taking when a critical limit is not met. Managers are responsible for designing the system, but effective day&#45;to&#45;day implementation involves every employee.  The simplest record keeping system that lends itself to integration into existing operations is always best.  A simple, yet effective, system is easier to use and communicate to your employees.<br />
Record keeping systems designed to document process rather than product information may be more useful in a retail and food service establishment, especially if you frequently change product/menu items or products. Accurately documenting processes like cooking, cooling, and reheating provides a mechanism for ensuring that you have active managerial control of risk factors. There are at least 5 types of records that may be maintained to support your food safety management system:
<li>Records documenting the activities related to the prerequisite programs</li>
<li>Monitoring records</li>
<li>Corrective action records</li>
<li>Verification and validation records</li>
<li>Calibration records</li><br />
Once a specific process has been shown to work for you, such as an ice bath method for cooling certain foods, the frequency of record keeping may be modified.  This approach is extremely effective for labor&#45;intensive processes related to:
<li>Cooking large volumes of food where a temperature check of each individual item is impractical</li>
<li>Implementing a verified process that will allow employees to complete the procedure in a scheduled workday</li>
<li>Cooling foods or leftovers at the end of the business day</li>
<li>Maintaining cold holding temperatures of ready&#45;to&#45;eat, potentially hazardous foods in walk&#45;in refrigeration units</li>

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Special Considerations Regarding Records</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       You are encouraged to periodically obtain feedback from your regulatory authority regarding how well your system is working.  You can invite your regulatory authority to review or verify your voluntarily&#45;implemented food safety management system.  This allows them the opportunity to offer suggestions for problems that they find in the operation of your system, including discrepancies with the monitoring and record keeping procedures.  Remember that the maintenance of records is required in the Food Code only in a limited number of cases. When your food safety management system is voluntary, their review of your system is by invitation only and they can only document violations that they observe as they would during routine inspections.  Records generated in support of a voluntary food safety management systems may not to be used to verify compliance with your regulations unless the records are specifically required by your regulations.  An example of when records may be used to verify compliance with your regulations would be the maintenance of shellstock tags. If there is a requirement in your regulations that shellstock tags be maintained in chronological order for at least 90 days, a health inspector may verify this requirement using your records.  In contrast, if your health inspector finds documented cases of inadequately cooked or hot held foods being sold to consumers, he or she cannot take regulatory action against you based on the documentation. Documentation of hot holding and cooking, like most processes in your regulations, is probably not required. The fact that you are keeping records of these processes means that you are probably going above and beyond what is required by your regulations. Of course, your health inspector may point out discrepancies and offer recommendations to you in hopes of preventing the problems from happening again.  Of course, if during the review of your system evidence is found that a product still in circulation poses a serious health threat to the public, the health inspector may initiate an appropriate regulatory investigation as dictated by your regulatory agency.  If it is known by your health inspector or you that a product still on the market poses a health threat to consumers, both of you should play your respective roles to remove the product immediately.  This may involve voluntary recall of the suspected products.<br />

		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Step Nine --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Nine&#45;Conduct Periodic Validation</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Conduct Periodic Validation</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Once your food safety management system is established, you should periodically review it to determine whether the food safety hazards are controlled when the system is implemented properly. In this program, this review is known as validation.  Changes in suppliers, products, or preparation procedures may prompt a revalidation of your food safety management system.  A small change could result in a drastically different outcome from what you expect.  You may benefit from both internal (quality assurance) and external validations that may involve assistance from the regulatory authority or other consultants.  Validation is conducted less frequently (e.g., yearly) than on&#45;going verification. It is a review or audit of the plan to determine if:<br />
<li>Any new product/processes/menu items have been added to the product/menu</li>
<li>Suppliers, customers, equipment, or facilities have changed</li>
<li>Prerequisite programs are current and implemented</li>
<li>Worksheets are still current</li>
<li>CCPs are still valid, or if new CCPs are needed</li>
<li>Critical limits are set realistically and are adequate to control the hazard (e.g., the time needed to cook a turkey to meet the Food Code internal temperature requirement)</li>
<li>Monitoring equipment has been calibrated as planned</li>

Validation helps you to:

<li>Improve the system and HACCP plan by identifying weaknesses</li>
<li>Eliminate unnecessary or ineffective controls</li>
<li>Determine if the HACCP plan needs to be modified or updated</li><br />
You can use the Validation Worksheet that follows to assist with the validation
process.
		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Seafood Reference Table --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3>Seafood Reference Tables</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Seafood References</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       This seafood reference is provided to assist those segments of the retail and food service industry that deal with seafood. It is suggested that the tables that follow be used during the hazard analysis procedural step.
		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Table 1. Natural Toxins1 in Seafood</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       <table border="1">
		    <tr>
		    <th>Natural Toxins</th>
		    <th>Type of fish (species</th>
		    <th>Control</th>		    
		    </tr>
		    <tr>
		    <td>Paralytic Shellfish Poisoning (PSP)</td>
		    <td>Molluscan Shellfish N.E. and N.W. coastal regions of N. America</td>
		    <td>NSSP approved waters (tags)2 (FDA ICSSL listing)</td>		    
		    </tr>
		    
		    <tr>
		    <td>Neurotoxic Shellfish Poisoning (NSP)</td>
		    <td>Molluscan Shellfish harvested along coast of Gulf of Mexico</td>
		    <td>NSSP approved waters (tags)2 (FDA ICSSL listing)</td>		    
		    </tr>
		    <tr>
		    <td>Diarrhetic Shellfish Poisoning (DSP)</td>
		    <td>Molluscan Shellfish</td>
		    <td>NSSP approved waters (tags)2 (FDA ICSSL listing)</td>		    
		    </tr>
		    <tr>
		    <td>Amnesic Shellfish Poisoning (ASP)</td>
		    <td>Molluscan Shellfish	N.E. & N.W. coasts of N. America</td>
		    <td>NSSP approved waters (tags)2 (FDA ICSSL listing)</td>		    
		    </tr>
		    <tr>
		    <td>Ciguatera Fish Poisoning (CFP)</td>
		    <td>fin fish from extreme S.E. U.S., Hawaii, Subtropical and Tropical areas:
<br />barracuda
<br />amberjack
<br />horse&#45;eye jack
<br />black jack
<br />other larger species of jack
<br />king mackerel
<br />large groupers
<br />large snappers
</td>
		    <td>Purchase from approved sources:
<li>get fish from areas that are not
subject of an adverse advisory, or</li>
<li>get fish from a reef area known to
be monitored for toxicity and not
covered by an adverse advisory.</li>
</td>		    
		    </tr>
		    <tr>
		    <td>Gempylotoxin, a strong purgative oil (can cause severe diarrhea)</td>
		    <td>Escolar</td>
		    <td>FDA recommendation: Escolar should not be marketed in interstate commerce</td>		    
		    </tr>
		    <tr>
		    <td>Etrodotoxin</td>
		    <td>Puffer Fish or Fugu, usually from Indo&#45;Pacific ocean, however some noted from Atlantic Ocean, Gulf of Mexico and Gulf of California</td>
		    <td>Illegal to import or receive (exemption:
an agreement with one N.Y. importer)</td>		    
		    </tr>
		    </table>
		    </td>
		</tr>		
		</table></td>
		</tr>
		</table>
	<div style="page-break-after:always"></div>
	<table>	
		<%-- Glossary --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Glossary</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Glossary</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      The definitions cited in Chapter 1 of the latest edition of the FDA Food Code should be used to supplement this Glossary. In some cases, this Glossary condenses those definitions for the purposes of this particular document.<br />
<b>ACCEPTABLE LEVEL</b> means the presence of a food safety hazard at levels low enough not to cause an illness or injury.<br />
<b>APPROVED SOURCE</b> means an acceptable supplier to the regulatory authority based on a determination of conformity with principles, practices, and generally recognized standards that protect public health.<br />
<b>ACTIVE MANAGERIAL CONTROL </b>means the purposeful incorporation of specific actions or procedures by industry management into the operation of their business to attain control over foodborne illness risk factors.<br />
<b>BACTERIA </b>means single&#45;cell microorganisms without distinct nuclei or organized cell structures.<br />
<b>CCP </b>means Critical Control Point.<br /> 
<b>CONTAMINATION </b>means the unintended presence in food of potentially harmful substances, including microorganisms, chemicals, and physical objects.<br />
<b>CONTROL MEASURE</b> means any action or activity that can be used to prevent,eliminate or reduce an identified hazard. Control measures determined to be essential for food safety are applied at critical control points in the flow of food.<br />
<b>CORRECTIVE ACTION</b> means an activity that is taken by a person whenever a critical limit is not met.<br />
<b>CRITICAL CONTROL POINT (CCP)</b> means an operational step in a food preparation process at which control can be applied and is essential to prevent or eliminate a hazard or reduce it to an acceptable level.<br />
<b>CRITICAL LIMIT</b> means one or more prescribed parameters that must be met to ensure that a CCP effectively controls a hazard.<br />
<b>CROSS&#45;CONTAMINATION</b> means the transfer of harmful substances or disease causing microorganisms to food by hands, food&#45;contact surfaces, sponges, cloth towels and utensils that touch raw food, are not cleaned, and then touch ready&#45;to&#45;eat foods.  Cross&#45;contamination can also occur when raw food touches or drips onto cooked or ready&#45;to&#45;eat foods.<br />
<b>DEVIATION</b> means the failure to meet a required critical limit for a critical control point.<br />
<b>DANGER ZONE</b> means the temperature range between 5 &#176;C (41 &#176;F) and 57 &#176;C (135 &#176;F) that favors the growth of pathogenic microorganisms.<br />
<b>EXCLUDE</b> means to prevent a person from working as a food employee or entering a food establishment except for those areas open to the general public.<br />
<b>FISH</b> means fresh or saltwater finfish, crustaceans and other forms of aquatic life
(including alligator, frog, aquatic turtle, jellyfish, sea cucumber, sea urchin and
the roe of such animals) other than birds or mammals, and all mollusks, if such
life is intended for human consumption; and includes an edible human food product derived in whole or in part from fish, including fish that have been processed in any manner.<br />
<b>FOOD </b>means raw, cooked, or processed edible substance, ice, beverage, chewing gum, or ingredient used or intended for use or for sale in whole or in part for human consumption.<br />
<b>FOOD ESTABLISHMENT</b>means an operation at the retail or food service level, i.e., that serves or offers food directly to the consumer and that, in some cases, includes a production, storage, or distributing operation that supplies the direct&#45;to&#45;consumer operation. Refer to Chapter 1, Defining Retail Food and Food Service Industries, for examples.<br />
<b>FOOD PREPARATION</b> PROCESS means a series of operational steps conducted to produce a food ready to be consumed.<br />
<b>FOODBORNE ILLNESS </b>means sickness resulting from the consumption of foods or beverages contaminated with disease&#45;causing microorganisms, chemicals, or other harmful substances.<br />
<b>FOODBORNE OUTBREAK</b> means the occurrence of two or more cases of a similar illness resulting from the ingestion of a common food.<br />
<b>HACCP</b> means Hazard Analysis and Critical Control Point.<br />
<b>HACCP PLAN </b>means, for the purposes of this document, a written document that is based on the principles of HACCP and describes the procedures to be followed to ensure the control of a specific process or procedure.<br />
<b>HACCP SYSTEM </b>means the result of implementing the HACCP principles in an operation that has foundational comprehensive, prerequisite programs in place. A HACCP system includes the HACCP plan and all prerequisite programs.<br />
<b>HAZARD </b>means a biological, physical, or chemical property that may cause a food to be unsafe for human consumption.<br />
<b>HAZARD ANALYSIS AND CRITICAL CONTROL POINT (HACCP) </b>means a prevention&#45;based food safety system that identifies and monitors specific food safety hazards that can adversely affect the safety of food products.<br />
<b>INTERNAL TEMPERATURE</b> means the temperature of the internal portion of a food product.<br />
<b>MEAT</b> means the flesh of animals used as food including the dressed flesh of cattle, swine, sheep, or goats and other edible animals, except fish, poultry, and wild game animals.<br />
<b>MICROORGANISM</b>means a form of life that can be seen only with a microscope; including bacteria, viruses, yeast, and single&#45;celled animals.<br />
<b>MOLLUSCAN SHELLFISH </b>means any edible species of raw fresh or frozen oysters, clams, mussels, and scallops or edible portions thereof, except when the scallop product consists only of the shucked adductor muscle.<br />
<b>MONITORING</b> means the act of observing and making measurements to help determine if critical limits are being met and maintained.<br />
<b>NATIONAL SHELLFISH SANITATION PROGRAM (NSSP) </b>means the voluntary system by which regulatory authorities for shellfish harvesting waters and shellfish processing and transportation and the shellfish industry implement specified controls to ensure that raw and frozen shellfish are safe for human consumption.<br />
<b>NSSP </b>means National Shellfish Sanitation Program.<br />
<b>OPERATIONAL STEP </b>means an activity or stage in the flow of food through a food establishment, such as receiving, storage, preparation, cooking, etc.<br />
<b>PARASITE</b> means an organism that lives on or in another, usually larger, host organism in a way that harms or is of no advantage to the host.<br />
<b>PATHOGEN </b>means a microorganism (bacteria, parasites, viruses, or fungi) that causes disease in humans.<br />
<b>PERSONAL HYGIENE </b>means individual cleanliness and habits.<br />
<b>pH</b> means the measure of the acidity of a product.<br />
<b>POTENTIALLY HAZARDOUS FOOD: </b>Means a food that is natural or synthetic and that requires temperature control because it is capable of supporting:<br />
<li>the rapid and progressive growth of infectious or toxigenic microorganisms,</li>
<li>the growth and toxin production of Clostridium botulinum, or</li>
<li>in raw shell eggs, the growth of Salmonella Enteritidis; and includes foods of animal origin that are raw or heat&#45;treated; foods of plant origin that are heat&#45;treated or consists of raw seed sprouts, cut melons, and garlic in oil mixtures that are not acidified or otherwise modified at a processing plant in a way that results in mixtures that do not support growth of pathogenic microorganisms as described above.</li><br />
<b>PREREQUISITE PROGRAMS</b> means procedures, including Standard Operating Procedures (SOPs), that address basic operational and sanitation conditions in an establishment.<br />
<b>PROCEDURAL STEP </b>means an individual activity in applying this Manual to a food establishment’s operations.<br />
<b>PROCESS APPROACH </b>means a method of categorizing food operations into one of three categories:<br />

<li>Process O: No food preparation with no cook step wherein ready&#45;to&#45;eat food is received, stored, held and served.</li>
<li>Process 1: Food preparation with no cook step wherein ready&#45;to&#45;eat food is received, stored, prepared, held and served;</li>
<li>Process 2: Food preparation for same day service wherein food is received, stored, prepared, cooked, held and served; or</li>
<li>Process 3: Complex food preparation wherein food is received, stored, prepared, cooked, cooled, reheated, hot held, and served.</li><br />
<b>READY&#45;TO&#45;EAT (RTE) FOOD </b>means:<br />
<li>raw animal foods that have been properly cooked;</li>
<li>fish intended for raw consumption that has been frozen to destroy parasites;</li>
<li>raw fruits and vegetables that are washed;</li>
<li>fruits and vegetables that are cooked for hot holding;</li>
<li>plant food for which further washing, cooking, or other processing is not required for food safety, and from which rinds, peels, husks, or shells, if naturally present, are removed;</li>
<li>substances derived from plants such as spices, seasonings, and sugar; a bakery item such as bread, cakes, pies, fillings, or icing for which further cooking is not required for food safety;</li>
<li>dry, fermented sausages, such as dry salami or pepperoni;</li>
<li>salt&#45;cured meat and poultry products, such as prosciutto ham, country&#45;cured ham, and Parma ham; and</li>
<li>dried meat and poultry products, such as jerky or beef sticks; and low acid foods that have been thermally processed and packaged in hermetically sealed containers.</li><br />

<b>RECORD </b>means a documentation of monitoring observations and verification activities.<br />
<b>REGULATORY AUTHORITY </b>means a federal, state, local, or tribal enforcement body or authorized representative having jurisdiction over the food establishment.<br />
<b>RESTRICT</b> means to limit the activities of a food employee so that there is no risk of transmitting a disease that is transmissible through food and the food employee does not work with exposed food, clean equipment, utensils, linens, and unwrapped single service or single&#45;use articles.<br />
<b>RISK FACTOR</b> means one of the broad categories of contributing factors to foodborne illness outbreaks, as identified in the Centers for Disease Control and Prevention (CDC) Surveillance Report for 1993&#45;1997, that directly relates to foodborne safety concerns within retail and food service establishments. The factors are Food from Unsafe Sources, Inadequate Cooking Temperatures, Improper Holding Temperatures, Contaminated Equipment, and Poor Personal Hygiene.<br />
<b>SEVERITY </b>means the seriousness of the effect(s) of a hazard.<br />
<b>SOP</b> means Standard Operating Procedure.<br />
<b>SHELLFISH </b>means bivalve molluscan shellfish.<br />
<b>SPORE</b> means a very tough, dormant form of certain bacterial cells that is very resistant to desiccation, heat, and a variety of chemical and radiation treatments that are otherwise lethal to vegetative cells.<br />
<b>SPORE&#45;FORMER</b> means a bacterium capable of producing spores under adverse conditions.<br />
<b>STANDARD OPERATING PROCEDURE (SOP) </b>means a written method of controlling a practice in accordance with predetermined specifications to obtain a desired outcome.<br />
<b>TEMPERATURE MEASURING DEVICE </b>means a thermometer, thermocouple, thermistor, or other device for measuring the temperature of food, air, or water.<br />
<b>TOXIGENIC MICROORGANISMS </b>means pathogenic bacteria that cause foodborne illness in humans due to the ingestion of poisonous toxins produced in food.<br />
<b>VALIDATION</b> means that element of verification focused on collecting and evaluating scientific and technical information to determine if the HACCP plan, when properly implemented, will effectively control the hazards.<br />
<b>VEGETATIVE CELL</b> means a bacterial cell which is capable of actively growing.<br />
<b>VERIFICATION </b>means, for the purpose of this document, ensuring that monitoring and other functions of a HACCP plan are being properly implemented.<br />
<b>VIRUS </b>means a submicroscopic parasite consisting of nucleic acid (DNA or RNA) surrounded by a protein coat, and sometimes also encased in a lipid and glycoprotein envelope. Viruses are completely dependent on a living host cell to survive and multiply, and therefore can not multiply in or on food.<br />
<b>WATER ACTIVITY (Aw)</b> means the quotient of the water vapor pressure of the substance, divided by the vapor pressure of pure water at the same temperature.<br />Generally speaking, it is the amount of water available in the product to allow bacteria to live and grow.

		    </td>
		</tr>
		</table></td>
		</tr>
		</table>
 </div>
    </div>
    </div>
    </form>
</body>
</html>
