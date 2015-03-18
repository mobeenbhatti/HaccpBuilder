<%@ Page Language="C#" AutoEventWireup="true" Theme="Default" Inherits="ControlPanel_Kitchen_PrintTest" Codebehind="PrintHaccpPlanSOP.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link rel="Stylesheet" href="../../App_Themes/Default/Default.css" type="text/css" media="print" />--%>
    <title>HACCP Plan</title>
    <script language="javascript" type="text/javascript">
    function PrintPage()
    {
    window.print();
    }
    </script>
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    <div id="container">
    <div style="overflow:visible; height:50%;">
    <div class="GirdDiv">
        <table style="margin-left:10px;">
        <tr>
			<td valign="top">						
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
		         <td >
		              <p class="BackGround1">
                      <b>DESCRIPTION OF PROGRAM OVERVIEW AND FACILITY:</b>
                      </p>
                 </td>		    
		</tr>
		<tr>
		    <td>		
		        <asp:DetailsView ID="dtvKitchenDetails" runat="server" AutoGenerateRows="False" 
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
                                <asp:Label ID="lblKitchenAddress" Text='<%#  DataBinder.Eval(Container.DataItem,"Address") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" Text='<%#  DataBinder.Eval(Container.DataItem,"County") %>' runat="server"></asp:Label>
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text='<%#  DataBinder.Eval(Container.DataItem,"City") + " " + DataBinder.Eval(Container.DataItem,"PostalCode")  %>' runat="server"></asp:Label>
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
                <asp:SqlDataSource ID="SqlDSKitchenDetails" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
    SelectCommand="uspAdm_GetKitchenDetailsByUserId" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="&quot;&quot;" Name="vchEmail" 
            SessionField="Username" Type="String" />
        <asp:SessionParameter DefaultValue="" Name="vchPassword" 
            SessionField="Password" Type="String" />
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
		<tr>
			<td>						
				<h2 class="BackGround1">HACCP BUILDER PROCEDURAL STEPS</h2>									
			</td>		
		</tr>
		<%-- Step One --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> One-Develop Prerequisite Programs</h3>
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
<li>Buyer specifications (Establishment requirements for vendors – I would leave this open ended so custom info can be entered)</li>
<li>Recipe/process instructions (we have this already)</li>
<li>Standard Operating Procedures (SOPs) – (we have this already – template and custom capability)
</li>
<br /><br />
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
		        <li>Soiled and unsanitized surfaces of equipment and utensils do not contact raw or cooked (ready-to-eat) food</li>
<li>Workers with certain symptoms, such as vomiting or diarrhea, are restricted or excluded</li>
<li>Raw animal foods do not contaminate cooked (ready-to-eat) food</li>
<li>Effective handwashing is practiced</li>
<li>Eating, smoking, and drinking in food preparation areas are prohibited</li>
<li>Water in contact with food and food-contact surfaces and used in the manufacture of ice is potable</li>
<li>Toxic compounds are properly labeled, stored, and safely used</li>
<li>Contaminants such as condensate, lubricants, pesticides, cleaning compounds, sanitizing agents, and additional toxic materials do not contact food, food-packaging materials, and food-contact surfaces</li>
<li>Food, food-packaging materials, and food-contact surfaces are not contaminated by physical hazards such as broken glass from light fixtures, jewelry, etc.</li>
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
		       These procedures ensure that all potentially hazardous food is received and stored at a refrigerated temperature of 41 ºF or below. Note that the Food Code makes some allowances for specific foods that may be received at higher temperatures.  The items addressed by this procedural step are the foundation by which your entire food safety management system is based. The success of any food safety  management system is dependent on how well you control these basic sanitation issues in your establishment.  With this in mind, consider how you can actively monitor the activities associated with the prerequisite programs to ensure that they are being implemented properly. If you decide to control certain items in your food safety management system through prerequisite programs, monitoring of the programs is recommended. Just as monitoring allows you to prevent, eliminate, or reduce hazards in your HACCP plans, monitoring may also allow you an opportunity to detect weaknesses in your prerequisite programs.  If you see areas needing improvement, you should take corrective actions immediately.
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
		        <li>Food-contact surfaces, including utensils, are cleaned, sanitized, and maintained in good condition</li>
<li>Temperature measuring devices (e.g., thermometer or temperature recording device) are calibrated regularly</li>
<li>Cooking and hot holding equipment (grills, ovens, steam tables, conveyer cookers, etc.) are routinely checked, calibrated, and operated to ensure correct product temperature</li>
<li>Cold holding and cooling equipment (refrigerators, rapid chill units, freezers, salad bars, etc.) are routinely checked, calibrated, and operated to ensure correct product temperature</li>
<li>Ware washing equipment is operated according to manufacturer’s specifications</li>
<li>Toilet facilities are accessible to employees and maintained</li>
		    </td>
		</tr>
		</table></td>
		</tr>
		<%-- Step Two --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3>Two-Group Your Products/Menu</h3>
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
		        <li>Soiled and unsanitized surfaces of equipment and utensils do not contact raw or cooked (ready-to-eat) food</li>
<li>Workers with certain symptoms, such as vomiting or diarrhea, are restricted or excluded</li>
<li>Raw animal foods do not contaminate cooked (ready-to-eat) food</li>
<li>Effective handwashing is practiced</li>
<li>Eating, smoking, and drinking in food preparation areas are prohibited</li>
<li>Water in contact with food and food-contact surfaces and used in the manufacture of ice is potable</li>
<li>Toxic compounds are properly labeled, stored, and safely used</li>
<li>Contaminants such as condensate, lubricants, pesticides, cleaning compounds, sanitizing agents, and additional toxic materials do not contact food, food-packaging materials, and food-contact surfaces</li>
<li>Food, food-packaging materials, and food-contact surfaces are not contaminated by physical hazards such as broken glass from light fixtures, jewelry, etc.</li>
<li>An effective pest control system is in place</li>
<li>Hair restraints are used</li>
<li>Clean clothing is worn</li>
<li>The wearing of jewelry (other than a wedding ring) is prohibited</li>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>TABLE 1: PROCESS-SPECIFIC LISTS</h4>
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
		<%-- Step Three --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3>Three-Conduct a Hazard Analysis</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Conduct a Hazard Analysis</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       In developing a food safety management system, you should identify the food safety hazards that exist in the flow of food in your operation from receiving to service or sale.  By identifying the food safety hazards present in your system, you should then be able to determine the possible control measures that may be implemented to achieve active managerial control of the foodborne illness risk factors leading to out-of-control hazards
<br /><br />
Control measures are any actions or activities that can be used to prevent, eliminate, or reduce an identified hazard.  While the hazard analysis in the process approach to HACCP is probably less complicated than in traditional HACCP, this section is not intended to provide all the information you will need to conduct a hazard analysis of your products. In addition, FDA strongly recommends that you consult your health inspector or other food safety professional during this and all other phases of your food safety management system development.  As described, the specific food safety hazards for each of the products within a particular food preparation process may be varied, but the recommended control measures for each of the products in each process will generally be the same.  As you conduct the hazard analysis, you will most likely find that regardless of the specific food safety hazards present in the products in any particular food preparation process, the foods within each of the food preparation processes share common categories of hazards. This is why the control measures you apply to the products in each of the three food preparation processes will generally be the same.  Because of this, you may use general categories to designate the types of food safety hazards present in your operation.
<br /><br />
For example, in process 2 you may have baked chicken, fried fish, grilled hamburgers, and baked meatloaf that are all cooked and hot held before service. While each of these foods may have unique food safety hazards, they all share general categories of hazards and therefore the control measures that you may implement are basically the same.  Vegetative bacteria are controlled through proper cooking, spore-forming or toxin-forming bacteria are controlled through proper hot holding, and fecal-oral route pathogens such as Shigella,  Salmonellae, and viruses are controlled through good hygienic practices such as proper handwashing, no bare hand contact with ready-to-eat food, and implementation of employee health policies. In addition, pathogens resulting from cross-contamination may be controlled by proper sanitization and storage practices.  Other hazard categories and control measures may exist in this example.  The categories listed below are not all-inclusive and there may be overlap between them.  You may use different terminology from what is outlined in this Manual. The category names that you use are unimportant as long as you know what hazards are present in your system. Examples of general hazard categories that you may use to fill in your tables are as follows:
<br /><br />
<b>BIOLOGICAL</b><br />
1.	Vegetative bacteria (such as Salmonella, Campylobacter, E.coli, and Vibrio)<br />
2.	Spore-forming or toxin-forming bacteria (such as Bacillus cereus, Clostridium perfringens, Clostridium botulinum, and Staphylococcus aureus)<br />
3.	Fecal-oral route pathogens (such as parasites, various bacteria, and viruses)<br />
4.	Viruses (such as Hepatitis A and Noroviruses)<br />
5.	Bacteria, parasites, or viruses from cross-contamination [applies to the transfer of disease-causing microorganisms to ready-to-eat food by hands, food-contact surfaces, sponges, cloth towels and utensils that are contaminated with disease-causing microorganisms. Also applies to the transfer of disease-causing microorganisms from raw animal foods with higher cook temperatures (i.e. chicken) to raw animal foods of less or cooking temperatures (i.e. pork)]<br />
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

<li>Will this require a great deal of preparation, making preparation time, employee health, and bare hand contact with ready-to-eat food a special concern?</li>

<li>How will employees exhibiting symptoms such as diarrhea or vomiting be handled?</li>

<li>Are you serving food to a population that is known to be highly susceptible to foodborne illness (e.g., residents of health care facilities, persons in child or adult day care facilities, etc.)?</li>
<br /><br />
If you already have a working knowledge of the hazards associated with products in your establishment, you can fulfill the hazard analysis step by identifying the control measures in the Food Code that are associated with each operational step in your food preparation processes. You may consult the FDA Food Code to help you in understanding the public health rationale behind the control measures and critical limits.  In the next procedural step, you should determine which of the control measures identified in your hazard analysis are essential to the food’s safety, i.e. cooking. You may choose to implement control measures in your HACCP plans at CCPs or through your prerequisite programs.
		    </td>
		</tr>
		</table>
		</td>
		</tr>		
		<%-- Step Four --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Four-Implement Control Measures in Prerequisite Programs or at CCPs in Your HACCP</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Plans and Establish Critical Limits</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        The objective of procedural step 4 is to implement control measures in your food safety management system to prevent, eliminate, or reduce hazards to acceptable levels. Once control measures have been identified in Procedural Step 3 – Hazard Analysis, you should determine how you will achieve active managerial control. Control may be achieved at Critical Control Points (CCPs) in your HACCP plans or through prerequisite programs.  By definition, a CCP is an operational step at which control can be applied and is essential to prevent or eliminate a hazard or reduce it to an acceptable level. If an operational step is the last step at which control can be applied to prevent or eliminate a hazard or reduce it to an acceptable level, then you should consider controlling it as a CCP. If a step later in the process will control the hazards of concern, that step, rather than the one in question, will most likely be a CCP.  Depending on your operation, control measures may be effectively implemented in your prerequisite programs
<br />
For instance, you may decide that cold holding during storage is best controlled through prerequisite programs rather than through your HACCP plans. It is important to consider the flow of food as you make this determination.  The Food Code provides specific measurable criteria referred to as critical limits designed to prevent, eliminate, or reduce hazards in foods. The critical limits are based on the best available science and pertain to control measures applied within operational steps. Common examples might be time/temperature standards and no bare hand contact with ready-to-eat food.  You should make sure that you have established the appropriate critical limits to control the identified hazards. It is recommended that you refer to the most recent version of the Food Code or your state, local, or tribal regulations for help with determining the appropriate critical limits for the identified control measures.

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>COMMON OPERATIONAL STEPS USED IN RETAIL AND FOOD SERVICE</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        The following information about the common operational steps conducted at retail is provided to assist in your decision-making as you move through the procedural steps presented in this document. Common operational steps conducted at retail include, but are not limited to, receiving, storing, preparing, cooking, cooling, reheating, hot and cold holding, assembly/set-up/packing, serving, and selling.
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Prerequisite Programs to Control Bacterial Growth</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       These procedures ensure that all potentially hazardous food is received and stored at a refrigerated temperature of 41 ºF or below. Note that the Food Code makes some allowances for specific foods that may be received at higher temperatures.  The items addressed by this procedural step are the foundation by which your entire food safety management system is based. The success of any food safety  management system is dependent on how well you control these basic sanitation issues in your establishment.  With this in mind, consider how you can actively monitor the activities associated with the prerequisite programs to ensure that they are being implemented properly. If you decide to control certain items in your food safety management system through prerequisite programs, monitoring of the programs is recommended. Just as monitoring allows you to prevent, eliminate, or reduce hazards in your HACCP plans, monitoring may also allow you an opportunity to detect weaknesses in your prerequisite programs.  If you see areas needing improvement, you should take corrective actions immediately.
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

Ready-to-eat, potentially hazardous food is a special concern at receiving. Because this food will not be cooked before service, pathogenic bacterial growth could be considered a significant hazard during this step for refrigerated, ready-to-eat foods.<br />
Having prerequisite programs in place to control product temperature is generally adequate to control the hazards present at receiving of most of these products. Besides checking the product temperature, you should check the appearance, odor, color, and condition of the packaging.  Seafood, whether ready-to-eat or not, requires special attention during receiving.  Federal regulations require processors of seafood and seafood products for interstate distribution to have a HACCP plan.  These processors are the only approved sources for seafood sold in interstate commerce; therefore, you may ask your interstate seafood supplier for documentation that the firm has a HACCP plan in place. Processors of seafood and seafood products that are sold or distributed only within a state may or may not be required to have a HACCP plan, depending on the state, local, or tribal regulations.<br />
In order to destroy parasites in certain species of fish intended for raw consumption, either you or the seafood processor should freeze the fish at a given time and temperature. You should ask to see specifications on these species of fish to be sure that they have been frozen to destroy the parasites.<br />
Molluscan shellfish (oysters, clams, mussels, and scallops) that are received raw in the shell or shucked should be purchased from suppliers who are listed on the FDA Interstate Certified Shellfish Shippers’ List or on a list maintained by your state shellfish control authority. Shellfish received in the shell should bear a tag (or a label for shucked shellfish) that states the date and location of harvest, in addition to other specific information.  Finfish harvested from certain areas may naturally contain a toxin called ciguatera.  Other finfish may develop a toxin after harvest if strict temperature control is not maintained. This toxin is called scombrotoxin (histamine). For finfish, temperature control and approved sources are important at receiving because cooking will not eliminate these toxins. For more information on toxins and parasites in fish, you may refer to the FDA Food Code.<br 
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

<li>Maintaining temperature control to limit the growth of pathogenic bacteria that may be present in a ready-to-eat product</li>
<li>Storing food so that cross-contamination of ready-to-eat food with raw animal foods is prevented</li>
When determining the storage temperature and monitoring frequency of products in cold storage, you may decide to set the temperature lower than what is required by your local regulations. By setting the temperature lower than what is required by your regulations, small upward deviations in temperature that you detect through frequent monitoring can be quickly corrected before bacteria begin to grow.  For example, if you are storing potentially hazardous, ready-to-eat foods under refrigeration, you may decide to set a critical limit for the refrigeration units to operate at 38 ºF. This provides a safety cushion that allows you the opportunity to see a trend toward exceeding 41 ºF and to intervene with appropriate corrective actions before bacteria begin to grow to dangerous levels.<br />
Monitoring procedures for ready-to-eat food ideally include internal product temperature checks. You should assess whether it is realistic and practical for you to do this depending on the volume of food you are storing.  You may choose to base your monitoring system on the air temperature of the refrigerated equipment as a prerequisite program.<br />
How often you should monitor the air temperature depends on:

<li>Whether the air temperature of the refrigerator accurately reflects the internal product temperature – (Remember, your food safety refrigeration temperature must be based on the internal product temperature of the food stored within a refrigeration unit, not the ambient air temperature)</li>
<li></li>The capacity and use of your refrigeration equipment</li>
<li></li>The volume and type of food products stored in your cold storage units</li>
<li></li>The prerequisite programs that support monitoring this process</li>
<li></li>Shift changes, volume of business, and other operational considerations</li>

Special consideration should be given to the storage of scombroid toxin-forming fish due to the potential formation of histamine.  To control histamine formation in scombroid toxin-forming fish, the critical limit temperature of 41 ºF should be managed either through your HACCP plan as a CCP or through your prerequisite programs.  Also, your HACCP plan or prerequisite programs should ensure that reduced oxygen packaged smoked fish is maintained at 38 ºF to prevent the outgrowth of Clostridium botulinum Type E.  Separating raw foods from ready-to-eat products in your operation’s refrigeration and storage facilities can control the potential for cross-contamination.  When determining how you will arrange foods in your storage units to prevent cross-contamination, you should consider the flow of food. For example, if chicken and beef are stored side-by-side on a shelf, consider whether or not employee practices will allow the raw chicken to drip onto the beef. Also, you should consider storing ready-to-eat, potentially hazardous food away from the door, in the coolest part of the walk-in cooler. These products will not undergo any further kill step; thus, preventing the growth of spore-forming bacteria is especially important for these products.<br />

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

<li>Small batch preparation is an important tool for controlling bacterial growth because limiting the amount of food prepared minimizes the time the food is kept at a temperature that allows for growth. Pre-planning the volume of food and the time needed for preparation minimizes the time food is in the temperature danger zone at this operational step.</li>
<li>When thawing frozen foods, maintaining proper product temperature and managing time are the primary controls for minimizing bacterial growth. Procedures should be in place to minimize the potential for microbial, chemical, and physical contamination during thawing.</li>
<li>Use of pre-chilled ingredients to prepare a cold product such as tuna salad may assist you in maintaining temperature control for this process.</li>
<li>Front-line employees will most likely have the greatest need to work with the food.  A well-designed and managed personal hygiene program that has been communicated to all employees will minimize the potential for bacterial, parasitic, and viral contamination.</li>
It is suggested that your program include instructions to your employees as to when and how to wash their hands. It is also very important to identify and restrict or exclude ill employees from working with food, especially if they have diarrhea, vomiting, fever, or jaundice.  Special consideration should be given to eliminating bare hand contact in the preparation of ready-to-eat foods.  How will you accomplish controlling the hazards presented by hand contact with ready-to-eat foods? Does the time of day, frequency, or duration of the preparation step allow for easy monitoring? You should review your operation to determine whether this operational step will be controlled as a CCP in your HACCP plans or as a prerequisite program.  Procedures should be in place to prevent cross-contamination from utensils and equipment. Designated areas or procedures that separate the preparation of raw foods from ready-to-eat foods minimize the potential for bacterial contamination. Proper cleaning and sanitizing of food-contact surfaces is recommended in this operational step.<br />

</td>
		</tr>
		<tr>
		    <td>
		     <h4>COOKING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       This operational step only applies to foods listed in Processes #2 and #3.  Cooking foods of animal origin is the most effective operational step for reducing or eliminating biological contamination. Cooking to proper temperatures for a specified time will kill most harmful bacteria and parasites.  Therefore, frequent monitoring of cooking temperatures is highly recommended.  You should determine the best system to use for ensuring that the proper cooking temperature and time are reached. Checking the internal product temperature is the desirable monitoring method. However, when large volumes of food are cooked, a temperature check of each individual item may not be practical. For instance, a quick service operation may cook several hundred hamburgers during lunch. Since checking the temperature of each hamburger will probably not be reasonable for you to do, you should routinely verify that the specific process and cooking equipment are capable of attaining a final internal product temperature at all locations in or on the cooking equipment.  Once a specific process has been shown to work for you, the frequency of record keeping (to be discussed in Procedural Step 7) may be reduced. In these instances, a record keeping system should be established to provide scheduled product temperature checks to ensure that the process is working.  Special consideration should be given to time and temperature when cooking raw animal foods.  In developing your HACCP plans or prerequisite programs, it is important to understand that the critical limits are product-specific during the cooking step.  For example, the safe cooking temperature/time for poultry is 165 ºF for 15 seconds, while 155 ºF for 15 seconds is the safe cooking temperature for ground beef.  To ensure adequate destruction of pathogens by heat, the cooking operational step should be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code. Consult the latest edition of the Food Code available on the FDA/CFSAN - website (http://www.cfsan.fda.gov/~dms/foodcode.html) or your local or state regulations for further guidance.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>COOLING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       One of the most labor-intensive operational steps is rapidly cooling foods to control bacterial growth. Improper cooling of potentially hazardous foods has been consistently identified as one of the factors contributing to foodborne illness. Foods that have been cooked and held at improper temperatures provide an excellent environment for the growth of spore-forming bacteria.  Recontamination of a cooked food item by poor employee practices or cross-contamination from other food products, utensils, and equipment is also a concern at this operational step.  Improperly cooling food can begin a snowball effect that cannot be reversed. Even with proper reheating, toxins released by toxin-producing bacteria after cooking and improper cooling may not be destroyed to levels safe enough for human consumption. Special consideration should be given to large food items such as roasts, turkeys, thick soups, stews, chili, and large containers of rice or refried beans. These foods take a long time to cool because of their mass and volume. If the hot food container is tightly covered, the cooling rate will be further slowed. By reducing the volume of the food in an individual container and leaving an opening for heat to escape by keeping the cover loose, the rate of cooling can be dramatically increased.  Commercial refrigeration equipment is designed to hold cold food at the proper temperature, not cool large masses of food. Some alternatives for cooling foods include:
<li>Using rapid chill refrigeration equipment designed to cool the food to acceptable temperatures quickly by using increased compressor capacity and high rates of air circulation.

<li>Avoiding the need to cool large masses by preparing smaller batches closer to periods of service.</li>
<li>Stirring hot food while the food container is in an ice water bath</li>
<li>In soups or stews, redesigning your recipe so that you cook a concentrated base and add enough cold water or ice to make up the volume that you need.</li>
<li>Pre-chilling ingredients used to make products such as chicken and tuna salad</li>
Whichever cooling method you choose, you should verify that the process works. A record keeping system should be established to provide scheduled product temperature checks to ensure the process is working.  If a specific process has been shown to work for you, the frequency of record keeping may be re-evaluated.  To control biological hazards, it is recommended that the cooling operational step be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code.<br />

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
		      All three processes may involve the holding of foods, i.e. hot and cold holding or use of time alone as public health control. When there is a cooking step to eliminate bacteria, all but the spore-forming bacteria should be destroyed.  If cooked food is not held at the proper temperature or, absent temperature control, for the appropriate time, the rapid growth of these spore-forming bacteria is a major concern.  When food is held, cooled, and reheated in a food establishment there is an increased risk from contamination caused by personnel, equipment, procedures, or other factors.  Harmful bacteria that are introduced into a product that is not held at proper temperature have the opportunity to multiply to large numbers in a short period of time.  Once again, management of personal hygiene and the prevention of cross-contamination impact the safety of the food at this operational step.  Keeping food products at 135 ºF or above during hot holding and keeping food products at or below 41 ºF is effective in preventing microbial growth.  As an alternative to temperature control, the Food Code details actions when time alone is used as a control, including a comprehensive monitoring and food marking system to ensure food safety.  How often you monitor the temperature of foods during hot holding determines what type of corrective action you are able to take when 135 ºF is not met. If the critical limit is not met, your options for corrective action may include evaluating the time the food is out of temperature to determine the likelihood of hazards, and based on that evaluation, reheating or discarding the food.  Your frequency of monitoring during this operational step may mean the difference between reheating the food to 165 ºF or discarding it.  When determining the monitoring frequency of cold product temperatures, it is recommended that the interval between temperature checks is established to ensure that hazards are being controlled and time is allowed for an appropriate corrective action. For example, if you are holding potentially hazardous ready-to-eat foods under refrigeration, such as potato salad at a salad bar, you may decide to set a critical limit at 41 ºF or below.  You may also want to set a target, or operating limit, less than 41 ºF in order to provide a safety cushion that allows you the opportunity to see a trend toward exceeding 41 ºF and to intervene with appropriate corrective actions.  To control biological hazards, it is recommended that hot or cold holding or use of time alone as a public health control be managed either as a CCP in your HACCP plans or as a prerequisite program and be based upon the same level of safety established by the critical limits in the Food Code.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>SET UP, ASSEMBLY, AND PACKING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      Set up, assembly, and packing are operational steps used by some retail food establishments, including caterers [e.g., restaurant-caterers, interstate  conveyance caterers, commissaries, grocery stores (for display cases), schools, nursing homes, hospitals, or food delivery services].  Set up, assembly, and packing may involve wrapping food items, assembling these items onto trays, and packing them into a transportation carrier or display case. An example would be an airline flight kitchen where food entrees are wrapped, assembled, and placed into portable food carts that are taken to a final holding cooler.  Hospital kitchens would be another example where patient trays are assembled and placed into carriers for transportation to nursing stations.  Food may be placed in bulk containers for transportation to another site where it is served.  Your food safety management system should address the potential for bacterial contamination and growth, bare hand contact with ready-to-eat foods, and proper handwashing.
</td>
		</tr>
		<tr>
		    <td>
		     <h4>SERVING/SELLING</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      This is the final operational step before the food reaches the customer. When employees work with food and food-contact surfaces, they can easily spread bacteria parasites, and viruses. Managing personal hygiene is important to controlling these hazards.  It is recommended that a management program for employee personal hygiene be implemented that addresses the following:

<li>Procedures for proper handwashing</li>
<li>The appropriate use of gloves and dispensing utensils</li>
<li>Control of bare hand contact with ready-to-eat foods</li>
<li>Exclusion and restriction of ill employees</li>

Specific procedures are recommended for customer self-service displays such as salad bars and buffet lines to protect food from contamination.  Special consideration should be given to preventing cross-contamination from soiled utensils and equipment and minimizing contamination from the customer.<br />

</td>
		</tr>		
		</table>
		</td>
		</tr>
		<%-- Step Five --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Five-Establish Monitoring Procedures</h3>
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
		<%-- Step Six --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Six-Develop Corrective Actions</h3>
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
		<%-- Step Seven --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Seven-Conduct Ongoing Verification</h3>
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
		     <h4>Verification - Examples</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        Listed below are four examples of verification procedures:<br />
-	Receiving logs: The manager reviews temperature logs of refrigerated products at various intervals, such as on a weekly basis, or even daily if:
<li>Receiving a high volume</li>
<li>Products received include scombroid toxin-forming fish such as fresh tuna</li>
<br />
-	Cooling logs: The location manager checks that the "cooling log'' is maintained for leftover foods on a weekly basis. The location manager checks to see that the time the food is placed in the cooler, its initial temperature, and  measurements of the time and temperature as the food is cooled are recorded and initialed on the log sheet.
<li>Handwashing and no bare hand contact logs: Nightly, the closing manager checks to see if the logs maintained at the handwashing sinks and preparation areas are complete.</li>
<li>Cooking: The manager checks the time/temperature monitoring records for cooking nightly to see that the required number of temperature measurements were taken during each shift.</li>

		    </td>
		</tr>
		</table></td>
		</tr>
		<%-- Step Eight --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Eight-Keep Records</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Keep Records</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       As the manager of your operation, you may have several duties to perform in addition to making sure that the activities in your food safety management system are being performed at the proper frequency and with the proper method. Documenting these activities provides one mechanism for verifying that the activities were properly completed.  While record keeping is voluntary in most retail and food service operations, maintaining documentation of the activities in your food safety management system may be vital to its success.  Remember that by keeping records you are going above and beyond what your regulations normally require. Records provide documentation that appropriate corrective actions were taken when critical limits were not met. In the event your establishment is implicated in a foodborne illness, documentation of activities related to monitoring and corrective actions can provide proof that reasonable care was exercised in the operation of your establishment. Records may also show that on-going verification was conducted on the food safety management system. In many cases, your records can serve a dual purpose of ensuring quality and food safety. In order to develop the most effective record keeping system for your operation, you should determine what documented information will assist you in managing the control of food safety hazards. A record keeping system can be simple and needs to be designed to meet the needs of your individual establishment. You do not necessarily need to develop new records to document the actions in the system.  Some recorded information like shellfish tags should already be part of your food safety management system, and an additional record may not be needed. Your record keeping system may use existing paperwork such as delivery invoices for documenting product temperature. Many retail and food service establishments have implemented comprehensive record keeping systems without having to generate a mountain of paperwork.<br />
Employees are an important source for developing simple and effective record keeping procedures. You should ask employees how they are currently monitoring CCPs or prerequisite programs and discuss with them the types of corrective actions they are currently taking when a critical limit is not met. Managers are responsible for designing the system, but effective day-to-day implementation involves every employee.  The simplest record keeping system that lends itself to integration into existing operations is always best.  A simple, yet effective, system is easier to use and communicate to your employees.<br />
Record keeping systems designed to document process rather than product information may be more useful in a retail and food service establishment, especially if you frequently change product/menu items or products. Accurately documenting processes like cooking, cooling, and reheating provides a mechanism for ensuring that you have active managerial control of risk factors. There are at least 5 types of records that may be maintained to support your food safety management system:
<li>Records documenting the activities related to the prerequisite programs</li>
<li>Monitoring records</li>
<li>Corrective action records</li>
<li>Verification and validation records</li>
<li>Calibration records</li><br />
Once a specific process has been shown to work for you, such as an ice bath method for cooling certain foods, the frequency of record keeping may be modified.  This approach is extremely effective for labor-intensive processes related to:
<li>Cooking large volumes of food where a temperature check of each individual item is impractical</li>
<li>Implementing a verified process that will allow employees to complete the procedure in a scheduled workday</li>
<li>Cooling foods or leftovers at the end of the business day</li>
<li>Maintaining cold holding temperatures of ready-to-eat, potentially hazardous foods in walk-in refrigeration units</li>

		    </td>
		</tr>
	<tr>
		    <td>
		     <h4>Special Considerations Regarding Records</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       You are encouraged to periodically obtain feedback from your regulatory authority regarding how well your system is working.  You can invite your regulatory authority to review or verify your voluntarily-implemented food safety management system.  This allows them the opportunity to offer suggestions for problems that they find in the operation of your system, including discrepancies with the monitoring and record keeping procedures.  Remember that the maintenance of records is required in the Food Code only in a limited number of cases. When your food safety management system is voluntary, their review of your system is by invitation only and they can only document violations that they observe as they would during routine inspections.  Records generated in support of a voluntary food safety management systems may not to be used to verify compliance with your regulations unless the records are specifically required by your regulations.  An example of when records may be used to verify compliance with your regulations would be the maintenance of shellstock tags. If there is a requirement in your regulations that shellstock tags be maintained in chronological order for at least 90 days, a health inspector may verify this requirement using your records.  In contrast, if your health inspector finds documented cases of inadequately cooked or hot held foods being sold to consumers, he or she cannot take regulatory action against you based on the documentation. Documentation of hot holding and cooking, like most processes in your regulations, is probably not required. The fact that you are keeping records of these processes means that you are probably going above and beyond what is required by your regulations. Of course, your health inspector may point out discrepancies and offer recommendations to you in hopes of preventing the problems from happening again.  Of course, if during the review of your system evidence is found that a product still in circulation poses a serious health threat to the public, the health inspector may initiate an appropriate regulatory investigation as dictated by your regulatory agency.  If it is known by your health inspector or you that a product still on the market poses a health threat to consumers, both of you should play your respective roles to remove the product immediately.  This may involve voluntary recall of the suspected products.<br />

		    </td>
		</tr>
		</table></td>
		</tr>
		<%-- Step Nine --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Nine-Conduct Periodic Validation</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Conduct Periodic Validation</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		       Once your food safety management system is established, you should periodically review it to determine whether the food safety hazards are controlled when the system is implemented properly. In this program, this review is known as validation.  Changes in suppliers, products, or preparation procedures may prompt a revalidation of your food safety management system.  A small change could result in a drastically different outcome from what you expect.  You may benefit from both internal (quality assurance) and external validations that may involve assistance from the regulatory authority or other consultants.  Validation is conducted less frequently (e.g., yearly) than on-going verification. It is a review or audit of the plan to determine if:<br />
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
<br />horse-eye jack
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
		    <td>Puffer Fish or Fugu, usually from Indo-Pacific ocean, however some noted from Atlantic Ocean, Gulf of Mexico and Gulf of California</td>
		    <td>Illegal to import or receive (exemption:
an agreement with one N.Y. importer)</td>		    
		    </tr>
		    </table>
		    </td>
		</tr>		
		</table></td>
		</tr>
		<%-- Glossory --%>
		<tr>
		<td><table>
		<tr>
		    <td class="BackGround2">
		       <h3> Glossory</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>Glossory</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		      The definitions cited in Chapter 1 of the latest edition of the FDA Food Code should be used to supplement this Glossary. In some cases, this Glossary condenses those definitions for the purposes of this particular document.<br />
<b>ACCEPTABLE LEVEL</b> means the presence of a food safety hazard at levels low enough not to cause an illness or injury.<br />
<b>APPROVED SOURCE</b> means an acceptable supplier to the regulatory authority based on a determination of conformity with principles, practices, and generally recognized standards that protect public health.<br />
<b>ACTIVE MANAGERIAL CONTROL </b>means the purposeful incorporation of specific actions or procedures by industry management into the operation of their business to attain control over foodborne illness risk factors.<br />
<b>BACTERIA </b>means single-cell microorganisms without distinct nuclei or organized cell structures.<br />
<b>CCP </b>means Critical Control Point.<br /> 
<b>CONTAMINATION </b>means the unintended presence in food of potentially harmful substances, including microorganisms, chemicals, and physical objects.<br />
<b>CONTROL MEASURE</b> means any action or activity that can be used to prevent,eliminate or reduce an identified hazard. Control measures determined to be essential for food safety are applied at critical control points in the flow of food.<br />
<b>CORRECTIVE ACTION</b> means an activity that is taken by a person whenever a critical limit is not met.<br />
<b>CRITICAL CONTROL POINT (CCP)</b> means an operational step in a food preparation process at which control can be applied and is essential to prevent or eliminate a hazard or reduce it to an acceptable level.<br />
<b>CRITICAL LIMIT</b> means one or more prescribed parameters that must be met to ensure that a CCP effectively controls a hazard.<br />
<b>CROSS-CONTAMINATION</b> means the transfer of harmful substances or disease causing microorganisms to food by hands, food-contact surfaces, sponges, cloth towels and utensils that touch raw food, are not cleaned, and then touch ready-to-eat foods.  Cross-contamination can also occur when raw food touches or drips onto cooked or ready-to-eat foods.<br />
<b>DEVIATION</b> means the failure to meet a required critical limit for a critical control point.<br />
<b>DANGER ZONE</b> means the temperature range between 5 ºC (41 ºF) and 57 ºC (135 ºF) that favors the growth of pathogenic microorganisms.<br />
<b>EXCLUDE</b> means to prevent a person from working as a food employee or entering a food establishment except for those areas open to the general public.<br />
<b>FISH</b> means fresh or saltwater finfish, crustaceans and other forms of aquatic life
(including alligator, frog, aquatic turtle, jellyfish, sea cucumber, sea urchin and
the roe of such animals) other than birds or mammals, and all mollusks, if such
life is intended for human consumption; and includes an edible human food product derived in whole or in part from fish, including fish that have been processed in any manner.<br />
<b>FOOD </b>means raw, cooked, or processed edible substance, ice, beverage, chewing gum, or ingredient used or intended for use or for sale in whole or in part for human consumption.<br />
<b>FOOD ESTABLISHMENT</b>means an operation at the retail or food service level, i.e., that serves or offers food directly to the consumer and that, in some cases, includes a production, storage, or distributing operation that supplies the direct-to-consumer operation. Refer to Chapter 1, Defining Retail Food and Food Service Industries, for examples.<br />
<b>FOOD PREPARATION</b> PROCESS means a series of operational steps conducted to produce a food ready to be consumed.<br />
<b>FOODBORNE ILLNESS </b>means sickness resulting from the consumption of foods or beverages contaminated with disease-causing microorganisms, chemicals, or other harmful substances.<br />
<b>FOODBORNE OUTBREAK</b> means the occurrence of two or more cases of a similar illness resulting from the ingestion of a common food.<br />
<b>HACCP</b> means Hazard Analysis and Critical Control Point.<br />
<b>HACCP PLAN </b>means, for the purposes of this document, a written document that is based on the principles of HACCP and describes the procedures to be followed to ensure the control of a specific process or procedure.<br />
<b>HACCP SYSTEM </b>means the result of implementing the HACCP principles in an operation that has foundational comprehensive, prerequisite programs in place. A HACCP system includes the HACCP plan and all prerequisite programs.<br />
<b>HAZARD </b>means a biological, physical, or chemical property that may cause a food to be unsafe for human consumption.<br />
<b>HAZARD ANALYSIS AND CRITICAL CONTROL POINT (HACCP) </b>means a prevention-based food safety system that identifies and monitors specific food safety hazards that can adversely affect the safety of food products.<br />
<b>INTERNAL TEMPERATURE</b> means the temperature of the internal portion of a food product.<br />
<b>MEAT</b> means the flesh of animals used as food including the dressed flesh of cattle, swine, sheep, or goats and other edible animals, except fish, poultry, and wild game animals.<br />
<b>MICROORGANISM</b>means a form of life that can be seen only with a microscope; including bacteria, viruses, yeast, and single-celled animals.<br />
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
<li>in raw shell eggs, the growth of Salmonella Enteritidis; and includes foods of animal origin that are raw or heat-treated; foods of plant origin that are heat-treated or consists of raw seed sprouts, cut melons, and garlic in oil mixtures that are not acidified or otherwise modified at a processing plant in a way that results in mixtures that do not support growth of pathogenic microorganisms as described above.</li><br />
<b>PREREQUISITE PROGRAMS</b> means procedures, including Standard Operating Procedures (SOPs), that address basic operational and sanitation conditions in an establishment.<br />
<b>PROCEDURAL STEP </b>means an individual activity in applying this Manual to a food establishment’s operations.<br />
<b>PROCESS APPROACH </b>means a method of categorizing food operations into one of three categories:<br />

<li>Process O: No food preparation with no cook step wherein ready-to-eat food is received, stored, held and served.</li>
<li>Process 1: Food preparation with no cook step wherein ready-to-eat food is received, stored, prepared, held and served;</li>
<li>Process 2: Food preparation for same day service wherein food is received, stored, prepared, cooked, held and served; or</li>
<li>Process 3: Complex food preparation wherein food is received, stored, prepared, cooked, cooled, reheated, hot held, and served.</li><br />
<b>READY-TO-EAT (RTE) FOOD </b>means:<br />
<li>raw animal foods that have been properly cooked;</li>
<li>fish intended for raw consumption that has been frozen to destroy parasites;</li>
<li>raw fruits and vegetables that are washed;</li>
<li>fruits and vegetables that are cooked for hot holding;</li>
<li>plant food for which further washing, cooking, or other processing is not required for food safety, and from which rinds, peels, husks, or shells, if naturally present, are removed;</li>
<li>substances derived from plants such as spices, seasonings, and sugar; a bakery item such as bread, cakes, pies, fillings, or icing for which further cooking is not required for food safety;</li>
<li>dry, fermented sausages, such as dry salami or pepperoni;</li>
<li>salt-cured meat and poultry products, such as prosciutto ham, country-cured ham, and Parma ham; and</li>
<li>dried meat and poultry products, such as jerky or beef sticks; and low acid foods that have been thermally processed and packaged in hermetically sealed containers.</li><br />

<b>RECORD </b>means a documentation of monitoring observations and verification activities.<br />
<b>REGULATORY AUTHORITY </b>means a federal, state, local, or tribal enforcement body or authorized representative having jurisdiction over the food establishment.<br />
<b>RESTRICT</b> means to limit the activities of a food employee so that there is no risk of transmitting a disease that is transmissible through food and the food employee does not work with exposed food, clean equipment, utensils, linens, and unwrapped single service or single-use articles.<br />
<b>RISK FACTOR</b> means one of the broad categories of contributing factors to foodborne illness outbreaks, as identified in the Centers for Disease Control and Prevention (CDC) Surveillance Report for 1993-1997, that directly relates to foodborne safety concerns within retail and food service establishments. The factors are Food from Unsafe Sources, Inadequate Cooking Temperatures, Improper Holding Temperatures, Contaminated Equipment, and Poor Personal Hygiene.<br />
<b>SEVERITY </b>means the seriousness of the effect(s) of a hazard.<br />
<b>SOP</b> means Standard Operating Procedure.<br />
<b>SHELLFISH </b>means bivalve molluscan shellfish.<br />
<b>SPORE</b> means a very tough, dormant form of certain bacterial cells that is very resistant to desiccation, heat, and a variety of chemical and radiation treatments that are otherwise lethal to vegetative cells.<br />
<b>SPORE-FORMER</b> means a bacterium capable of producing spores under adverse conditions.<br />
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
        <%-- Procedural Question --%>
        <tr>
			<td>						
				<h2 class="BackGround1">HACCP PROCEDURAL QUESTIONS AND ANSWERS</h2>									
			</td>		
		</tr>
		<%-- Buyes Specs --%>
		<tr>
		    <td class="BackGround2">
		       <h3> HACCP Procedural Questions:  Buyer Specifications</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		     <h4>   Describe Establishment Requirements for Vendor Selection</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion1" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<%-- Allergen Management --%>
		<tr>
		    <td class="BackGround2">
		       <h3> HACCP Procedural Questions:  Allergen Management</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		       <p><h4> Do any product/menu items contain potential allergen ingredients</h4></p>
		       <p><asp:RadioButton ID="rdlAllergenYes" Enabled="false" runat="server" Text="Yes" />
		       <asp:RadioButton ID="rdlAllergenNo" Enabled="false" runat="server" Text="No" /></p>
		    </td>		   
		</tr>
		<tr>
		    <td>
		       <h4> If yes, describe allergen ingredients</h4>
		    </td>
		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion2" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<tr>
		    <td>
		       <h4> Please describe procedures for allergen control:</h4>
		    </td>		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion2b" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<%-- Safety Hazard --%>
		<tr>
		    <td class="BackGround2">
		       <h3> HACCP Procedural Questions:  Safety Hazard Procedures</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		      <h4> Describe basic procedures to eliminate product/menu items from contamination  by biological, chemical and physical food safety hazards</h4>
		    </td>
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion3" Text="" runat="server"></asp:Label>
		    </td>
		</tr>
		<%-- Soiled And Unsanitized --%>
		<tr>
		    <td class="BackGround2">
		       <h3> HACCP Procedural Questions:  Soiled and Unsanitized Surfaces</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		       <h4> Do soiled and unsanitized surfaces of equipment and utensils contact raw or cooked food</h4>
		        <asp:RadioButton ID="rdbSoilYes" Enabled="false" TextAlign="Right" runat="server" Text="Yes" />
		        <asp:RadioButton ID="rdbSoilNo" Enabled="false" TextAlign="Right"  runat="server" Text="No" />
		    </td>		    
		</tr>
		<tr>
		    <td>
		       <h4>If yes, describe how the raw or cooked food comes into contact with unclean or unsanitized surfaces</h4>
		    </td>		    
		</tr>
		<tr>
		    <td>
		        <asp:Label ID="lblQuestion4" Text="" runat="server"></asp:Label>
		    </td>
		</tr>		
		<tr>
		    <td class="BackGround2">
		       <h3> HACCP Procedural Questions:  Daily Requirements (HACCP Builder will fulfill requirements daily)</h3>
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
		<%-- Vendors --%>
		
		<tr>
		    <td>
		        <hr />
		    </td>
		</tr>
		<tr>
		    <td style="background-color:#99ccff; color: #000;">
		        <div class="PageBreak"></div>
		       <b> VENDORS DETAIL REVIEW </b>
		    </td>
		</tr>
		<tr>
		    <td style="background-color:#c0c0c0">
		       <h3> HACCP Procedural Questions: All Vendors</h3>
		    </td>
		</tr>
		<tr>
		    <td>
		         <asp:GridView ID="grdHotHolding" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource4">                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Vendor Name">
	                        <ItemTemplate>
	                        <asp:Label ID="lblName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "VendorName")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="Training and Certifications">
	                        <ItemTemplate>
	                            <asp:Label ID="lblTraining" runat="server" Text='<%# Eval("Training").ToString() == "1"? "Yes":"No" %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Corrective Actions">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCorrective" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CorrectiveAction") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Training and/or Certifications Details">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCertification" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "TrainingDetail") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified By">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifyBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VerifiedBy") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifiedDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VarifiedDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <%--<asp:TemplateField HeaderText="Entry Date" ItemStyle-HorizontalAlign="Center">
	                        <ItemTemplate>
	                             <asp:Label ID="lblEntrydate" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="120px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>                    
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
		    </td>
		</tr>
        <%-- Inventory Items Repeater --%>
        <tr>
			<td>
			    <div class="PageBreak"></div>						
				<h2 style="color: #000; background-color:#99ccff">Inventory Items Review</h2>
				<asp:Repeater ID="rptInventory" runat="server" DataSourceID="ObjectDataSource2">
 <HeaderTemplate>
    <table> 
        <tr >  
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
        <td ><%#Eval("Quantity")%></td>
        <td ><%#Eval("Name")%></td>        
    </tr>     
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>					
			</td>
		</tr>		
		<%-- Categorizing Item Description --%>
        <tr>
			<td>
			    <div class="PageBreak"></div>
						<h2 style="color: #000; padding-top: 30px; background-color:#99ccff;">Categorizing Product/Menu Items and Identification of 
						Control Measures and CCP's</h2>

						<p> The product/menu cycle is posted in the location. Each product/menu item available for service 
						is listed in this food safety program in the table:  Selected  Product/Menu Items - Categorized 
						by Process with associated CCPs - Detailed Index.</p>

						<p> When new product/menu items are added, the list is updated. Each item is evaluated 
						to determine which of the four processes is applicable and to identify the appropriate 
						control measures and critical control points (CCPs) using the Process Approach 
						(Food Processes - Detailed Index).</p>

						<p> Once the determination is made for each product/menu item, the food service manager 
						will make the rest of the food service staff aware of the product/menu items and applicable 
						process and control measures by posting the Process Charts (Food Processes 
						- Detailed Index) in the location. In addition, the product/menu cycle, product/menu, recipes, 
						product directions, and charts are kept in a digital record online and are accessible 
						via the World Wide Web.</p>

						<p> 
						<div class="PageBreak"></div>
						<b>STAFF</b></p>

						<p> * All food service personnel will be given an overview of the Process Approach 
						(Food Processes - Detailed Index) to HACCP after being hired and before 
						handling food.</p>

						<p> * Any substitute food service staff will be given instructions on the Process 
						Approach (Food Processes - Detailed Index) and a list of necessary procedures 
						relevant to the tasks they will be performing and the corresponding records 
						to be kept.</p>

						<p> * Periodic refresher training for employees will be provided on a quarterly 
						basis.</p>

						<p> * An easily accessible copy of an explanation of the Process Approach (Food Processes - Detailed Index) taken from the USDA HACCP guidance document 
						will be available online via the World Wide Web.</p>

						<p>
							&nbsp;</p>&nbsp;</td>
	    </tr>
	    <%-- product/menu Items Repeater --%>
	    <tr>
	    <td >
	    <div class="PageBreak"></div>
	    <h2 style=" background-color:#c0c0c0;">Product/Menu Detail All Recipes </h2>            
                <%--<asp:Repeater ID="rptMealCalendar" runat="server" DataSourceID="ObjectDataSource1">
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;">             
            <td width="100px" align="center" ><b>Item ID</b></td>
            <td width = "150px" align="center" ><b>Item Name</b></td>
            <td width="100px" align="center" ><b>Preparation</b></td>
            <td width="150px" align="center"  ><b>Food Group</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >
        
        <td ><%#Eval("ItemId")%></td>
        <td ><%#Eval("MenuItem")%></td>
        <td ><%#Eval("PreparationType")%></td>
        <td ><%#Eval("FoodGroup")%></td>
    </tr> 
    <tr>
    <td colspan="4"><hr /></td>
    </tr>
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>--%>
                 <asp:GridView ID="grdMenuAll" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource5" onrowdatabound="grdMenuAll_RowDataBound" >                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>	                    
	                    <asp:TemplateField HeaderText="Item Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Process Type">
	                        <ItemTemplate>
	                            <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Ingredient">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <%--<asp:TemplateField HeaderText="CCP Requirement">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCP" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	--%>
	                     <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                                       
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemNewByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
            </td>
        </tr>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItems">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <%-- Process --%>
        
		<tr>
		<td>
		<asp:Repeater ID="rptProcess" runat="server" 
                DataSourceID="SqlDataSource2" onitemdatabound="rptProcess_ItemDataBound">
                <HeaderTemplate>
            <table> 
                <tr style="background-color:Silver;"> 
                    <td>                    
                    </td>            
                    <td></td>             
                </tr> 
         </HeaderTemplate>
                <ItemTemplate>
             <tr>        
                <td >
                    <div class="PageBreak"></div>
                    <asp:DetailsView ID="dtvProcess" runat="server" AutoGenerateRows="False" Height="50px" Width="100%">    
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
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Field1") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ffcc" height="18"  align="center">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Field2") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Field3") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Field4") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Field5") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Field6") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22" valign="top" align="center">
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Field7") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                  <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Field8") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ccff" height="22"  valign="top" align="center">
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Field9") %>'></asp:Label>
                   </td>
                   </tr>
                   <tr>
                   		<td colspan="3" height="20" valign="top">
							<hr>
						</td>
				    </tr>
                   <tr>
                   <td bgcolor="#99ffcc" height="18"  valign="top" align="center">
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Field10") %>'></asp:Label>
                   </td>
                   </tr>
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
                </td>
                <td><asp:HiddenField ID="hfProcessId" Value='<%# Eval("ProcessId") %>' runat="server" />
                                </td>
            </tr>
            <tr>
			<td>						
				<div class="PageBreak"></div>
				
				<h2 style="color: #000;"><asp:Label ID="lblProcess" runat="server" Text='<%# "Selected Recipes for " + Eval("ProcessName") %>'></asp:Label></h2>
				<asp:GridView ID="grdMenuProcess1" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    onrowdatabound="grdMenuProcess1_RowDataBound" >                
                <Columns> 
                    <%--<asp:BoundField DataField="Id" HeaderText="Entry ID" ItemStyle-Width="50px" HeaderStyle-CssClass="gridheaderline" />--%>
                          
                    <%--<asp:TemplateField HeaderText="Entry ID">                        
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlTableName" runat="server"  NavigateUrl="~/ControlPanel/Default2.aspx" Text='<%# DataBinder.Eval(Container.DataItem, "TableName")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>	                    
	                    <asp:TemplateField HeaderText="Item Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Process Type">
	                        <ItemTemplate>
	                            <asp:Label ID="lblProcess" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Process") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Ingredient">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ingredient") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                             <asp:Label ID="lblHazard" runat="server"  Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <%-- <asp:TemplateField HeaderText="CCP Requirement">
	                        <ItemTemplate>
	                             <asp:Label ID="lblCCP" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >--%>	
	                     <asp:TemplateField HeaderText="Vendor">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVendor" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VendorName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="100px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >		
	                                       
                </Columns>
            </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetMenuItemsNewByProcess" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetMenuItemNew">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="nProcessId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
            <strong> <asp:Label ID="lblProcessMenu" runat="server"></asp:Label>	</strong>								
			</td>
		</tr>
        </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </td>
		</tr>
		
		<%-- HAZARDS --%>
		<tr>
		<td style="background-color:#99ccff; color: #000;">
		   <div class="PageBreak"></div>
		   <h2> INGREDIENTS BY FOOD CATEGORY, HAZARDS (BIOLOGICAL, CHEMICAL, PHYSICAL), CCP's AND CP's </h2>
		</td>
		</tr>
		<tr>
		<td>
		     <asp:GridView ID="grdHazards" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource10" >                
                <Columns> 
                        <asp:TemplateField HeaderText="Ingredient">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                                      
	                    <asp:TemplateField HeaderText="Food Category">
	                        <ItemTemplate>
	                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("FoodCategory").ToString()== ""? "<span class=\"Error\">Requires Update</span>": Eval("FoodCategory")%>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="150px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Biological Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "BiologicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Chemical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ChemicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Physical Hazards">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "PhysicalHazard") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Associated CCP">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CCP") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Associated CP">
	                        <ItemTemplate>
	                            <asp:Label ID="lblIngredient" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CP") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetIngredientByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetIngredient"> 
            <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>                 
              </asp:ObjectDataSource>
		</td>
		</tr>
		<%-- CCP's --%>
		<%--<tr>
		<td style="background-color:#99ccff; color: #000;">
		   <div class="PageBreak"></div>
		   <h1> Critical Control Points (CCP's) and Time and Temperature Requirements</h1>
		</td>
		</tr>
		<tr>
		<td>
		     <asp:GridView ID="GridView1" runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource11" >                
                <Columns>                                       
	                    <asp:TemplateField HeaderText="Food/Process Item (CP and CCP Relationship)">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCCP" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CCP")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="250px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Control Point (CP) Requirement">
	                        <ItemTemplate>
	                            <asp:Label ID="lblRequirement" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CPRequirement") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                        
	                    <asp:TemplateField HeaderText="Critical Control Point Requirement">
	                        <ItemTemplate>
	                            <asp:Label ID="lblRequirement" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Requirement") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle Width="450px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >                
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPsByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP"> 
            <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
             </SelectParameters>                 
            </asp:ObjectDataSource>
		</td>
		</tr>--%>
		<%-- SOP's --%>
        <tr>
		    <td style="background-color:#99ccff;">
			    <div class="PageBreak"></div>
				    <b >MONITORING</b>
		    </td>
		</tr>
		<tr>
		<td style=" background-color:#c0c0c0;">

				   <%-- <br />
				    <br />--%>
				    <b >Manager Responsibilities:</b>
        </td>
        </tr>
        <tr>
		<td>
				    <p>
					    &raquo; The foodservice manager at each site will be responsible for ensuring assigned
					    foodservice staff are properly monitoring control measures and CCPs at the required
					    frequency and are documenting required records.
				    </p>
				    <p>
					    &raquo; The manager will also be responsible for monitoring the overall performance
					    of standard operating procedures. (Specific details regarding monitoring are addressed
					    in each SOP.)
				    </p>

				    <p>
					    &raquo; Monitoring will be a constant consideration. However, the manager will use
					    the Food Safety Checklist to formally monitor foodservice staff at least once per
					    week. This list MUST be submitted via the www.haccpbuilder.com website and is recorded
					    in a digital database for later review. Corrective Actions as well as review consistency
					    will be tracked and trended electronically and emails will alert the Foodservice
					    Director and Site Managers to any problems or issues that must be addressed.</p>
		</td>
		</tr>
		<tr>
		<td>			    
				    <p style=" background-color:#c0c0c0;">
					    <b >Foodservice Staff Responsibilities: </b>
				    </p>
	    </td>
	    </tr>
	    <tr>
	    <td>
				    <p>
					    &raquo; Foodservice staff is responsible for monitoring individual critical control
					    points (CCPs) in the handling and preparation of food.
				    </p>

				    <p>
					    &raquo; Foodservice staff is responsible for monitoring control points as defined
					    in the standard operating procedures (SOPs).</p>
				    <p class="breakhere">
					    &nbsp;</p>
				    <p style="background-color:#99ccff;">
					   <div class="PageBreak"></div>
					    <b >CORRECTIVE ACTIONS </b>
				    </p>

				    <p style=" background-color:#c0c0c0;">
					    <b>Documenting Corrective Actions: </b>
				    </p>
				    <p>
					    &raquo; The foodservice director or manager* will be responsible for developing
					    predetermined corrective actions for the most common deviations from control measures
					    including critical control points (CCPs) and standard operating procedures (SOPs).
				    </p>
				    <p>
					    &raquo; The foodservice director or manager will review and update corrective actions
					    at least annually. Corrective actions for all SOPs are outlined in the written SOPs.
				    </p>

				    <p>
					    &raquo; Foodservice staff will be responsible for documenting any corrective actions
					    taken while handling and preparing food as well as any actions taken while performing
					    SOPs.</p>
				    <p>
					    &raquo; The Foodservice Manager or Site Manager, or a responsible person
					    appointed by such a manager, will digitally submit a Weekly Food Safety Checklist
					    via www.haccpbuilder.com which will log any Corrective Actions taken during the reporting
					    week and as within the scope of such the Checklist.</p>
				    <p style=" background-color:#c0c0c0;">
					    <b>Training: </b>

				    </p>
				    <p>
					    &raquo; In addition to the corrective actions outlined in the SOPs, foodservice
					    staff will be trained on a continuous basis to take corrective actions when necessary.
				    </p>
				    <p>
					    &raquo; Guidance on most common specific corrective actions will be listed in this
					    food safety program and will be posted in an accessible location in the location.
				    </p>
				    <p>
					    Corrective actions for common problems are included with this Plan.</p>

				    <p>
					    * Person responsible for foodservice management and operations in the location/site.
				    </p>
				    <p class="breakhere">
					    &nbsp;</p>
				    <p style=" background-color:#99ccff;">
					    <div class="PageBreak"></div>
					    <b>REVIEW OF THE FOOD SAFETY PROGRAM<br />
					</p>
					<p>
					    </b>The food service manager will review the food safety program at
					    the beginning of each year and when any significant changes occur in the
					    operation. Additionally, the online HACCP record for each location will be updated
					    as soon as any such changes occur (e.g., a new product/menu item is added or the HACCP process
					    for a product/menu item changes due to the source of such an item or means of preparation).</p>

				    <p>
					    The checklist below will be used for the review and will be submitted electronically
					    via the www.haccpbuilder.com website.
				    </p>
				    <p style=" background-color:#c0c0c0;">
					    <b>Food Safety Program Review Checklist
					</p>
					<p><br />
					    </b>1. Documents to review<br />
					    ___ Standard Operating Procedures
					    <br />
					    ___ Food Preparation Process Charts
					    <br />

					    ___ Control Measures in the Process Approach (CCPs and SOPs)
					    <br />
					    ___ Corrective Actions
				    </p>
				    <p>
					    2. Monitoring recordkeeping.
					    <br />
					    Choose at random one week from the previous four.</p>
				    <ul>
					    <li>Type of Record (SOP, CCP, Corrective Action, etc.) </li>

					    <li>Monitoring Frequency and Procedure (How often? Initiated and dated? Etc.) </li>
					    <li>Record Location (Where is record kept?) </li>
				    </ul>
				    <p>
					    3. Describe the strengths or weaknesses with the current monitoring or recordkeeping
					    methods.
				    </p>
				    <p>
					    4. Who is responsible for verifying that the required records are being completed
					    and properly maintained?
				    </p>

				    <p>
					    5. Describe the training that has been provided to support the food safety program.
				    </p>
				    <p>
					    6. Do the managers and staff demonstrate knowledge of the plan?
				    </p>
				    <p>
					    7. Have there been any changes to the product/menu or operation (new equipment, etc.)?
				    </p>
				    <p>

					    8. Was the plan modified because of these changes?</p>
			    </td>
	    </tr>
		<tr>
			<td>
		        &nbsp;</td>
		</tr>
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
                
                <HeaderTemplate>
            <table> 
                <tr style="background-color:Silver;"> 
                    <td>                    
                    </td>            
                    <td></td>             
                </tr> 
         </HeaderTemplate>
                <ItemTemplate>
             <tr >        
                <td>
                    <div class="PageBreak"></div>
                    <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%">    
                            <Fields>
                                 <asp:TemplateField >
                                        <ItemTemplate>
                                            <%--<table >
                                            <tr>
                                                <td class="SOPHeading" >--%>
                                                <div class="SOPHeading2">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                                 </div>
                                                 <div class="SOPHeading1">PURPOSE:</div>
                                                   <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Purpose")%>
                                                  </div>
                                                  <div class="SOPHeading1">SCOPE:</div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "Scope")%>
                                                  </div>
                                                  <div class="SOPHeading1">KEYWORDS:</div>
                                                    <div class="SOPList"><%#  DataBinder.Eval(Container.DataItem, "KeyWords")%>
                                                  </div>
                                                  <div class="SOPHeading1">
                                                    INSTRUCTIONS: </div>
                                                    <div class="SOPList"><%# (Eval("Instructions1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions1")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions2")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions3")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions4")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions5")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions6")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions7")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions8").ToString() != "" ? "8. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions8")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions9").ToString() != "" ? "9. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions9")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions10").ToString() != "" ? "10. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions10")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions11").ToString() != "" ? "11. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions11")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions12").ToString() != "" ? "12. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions12")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions13").ToString() != "" ? "13. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions13")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions14").ToString() != "" ? "14. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions14")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions15").ToString() != "" ? "15. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions15")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions16").ToString() != "" ? "16. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions16")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions17").ToString() != "" ? "17. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions17")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions18").ToString() != "" ? "18. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions18")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions19").ToString() != "" ? "19. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions19")%></div>
                                                    <div class="SOPList"><%# (Eval("Instructions20").ToString() != "" ? "20. " : " ") + DataBinder.Eval(Container.DataItem, "Instructions20")%></div>
                                                  
                                                  <div class="SOPHeading1">
                                                    MONITORING: </div>
                                                    <div class="SOPList"><%# (Eval("Monitoring1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring1")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring2")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring3")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring4")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring5")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring6").ToString() != "" ? "6. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring6")%></div>
                                                    <div class="SOPList"><%# (Eval("Monitoring7").ToString() != "" ? "7. " : " ") + DataBinder.Eval(Container.DataItem, "Monitoring7")%></div>                                            
                                                  
                                                  <div class="SOPHeading1">
                                                    CORRECTIVE ACTIONS: </div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction1").ToString() != "" ? "1. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction1")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction2").ToString() != "" ? "2. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction2")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction3").ToString() != "" ? "3. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction3")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction4").ToString() != "" ? "4. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction4")%></div>
                                                    <div class="SOPList"><%# (Eval("CorrectiveAction5").ToString() != "" ? "5. " : " ") + DataBinder.Eval(Container.DataItem, "CorrectiveAction5")%></div>                                            
                                                  
                                                  <div class="SOPHeading1">VERIFICATION AND RECORD KEEPING:</div>
                                                    <div class="SOPList"><%# "" + DataBinder.Eval(Container.DataItem, "Verification")%>
                                                  </div>
                                                  <div class="SOPHeading1"></div>
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
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
             </td>
		</tr>
            <%--<td>
        	
            <div align="center">
	        <h1><font face="Arial">** Elementary ** PPP Cleaning and Sanitizing Food Contact Surfaces</font></h1>
            </div>
            <p>&nbsp;</p>


            <p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all food contact surfaces are properly cleaned and sanitized.</p>


            <p><strong>SCOPE:</strong> This procedure applies to foodservice employees involved in cleaning and sanitizing food contact surfaces.</p>


            <p><strong>KEY WORDS:</strong> Food Contact Surface, Cleaning, Sanitizing</p>

            <p><strong>INSTRUCTIONS:</strong> </p>
            1. Train foodservice employees on using the procedures in this SOP.<br />
            <br />

            2. Follow State or local health department requirements.<br />
            <br />

            3. Follow manufacturer’s instructions regarding the use and maintenance of equipment and use of chemicals for cleaning and sanitizing food contact surfaces.  Refer to Storing and Using Poisonous or Toxic Chemicals SOP.<br />
            <br />

            4. If State or local requirements are based on the 2001 FDA Food Code, wash, rinse, and sanitize food contact surfaces of sinks, tables, equipment, utensils, thermometers, carts, and equipment:

            <br />•	Before each use 
            <br />•	Between uses when preparing different types of raw animal foods, such as eggs, fish, meat, and poultry 
            <br />•	Between uses when preparing ready-to-eat foods and raw animal foods, such as eggs, fish, meat, and poultry 
            <br />•	Any time contamination occurs or is suspected
            <br /><br />
            <br />

            5. Wash, rinse, and sanitize food contact surfaces of sinks, tables, equipment, utensils, thermometers, carts, and equipment using the following procedure:
            <br />•	Wash surface with detergent solution.
            <br />•	Rinse surface with clean water.
            <br />•	Sanitize surface using a sanitizing solution mixed at a concentration specified on the manufacturer’s label.  
            <br />•	Place wet items in a manner to allow air drying.
            <br /><br />
            <br />

            6. If a 3-compartment sink is used, setup and use the sink in the following manner:  
            <br />•	In the first compartment, wash with a clean detergent solution at or above 110  oF or at the temperature specified by the detergent manufacturer.

            <br />•	In the second compartment, rinse with clean water.
            <br />•	In the third compartment, sanitize with a sanitizing solution mixed at a concentration specified on the manufacturer’s label or by immersing in hot water at or above 171 oF for 30 seconds.  Test the chemical sanitizer concentration by using an appropriate test kit.<br />
            <br />

            7. If a dishmachine is used:
            <br />•	Check with the dishmachine manufacturer to verify that the information on the data plate is correct. 
            <br />•	Refer to the information on the data plate for determining wash, rinse, and sanitization (final) rinse temperatures; sanitizing solution concentrations; and water pressures, if applicable.
            <br />•	Follow manufacturer’s instructions for use.
            <br />•	Ensure that food contact surfaces reach a surface temperature of 160 oF or above if using hot water to sanitize.  <br />
            <br />














            <p><strong>MONITORING:</strong></p>
            1. Foodservice employees will:
            <br />During all hours of operation, visually and physically inspect food contact surfaces of equipment and utensils to ensure that the surfaces are clean. 
            <br /><br />
            <br />

            2. In a 3-compartment sink, on a daily basis:
            <br />•	Visually monitor that the water in each compartment is clean.
            <br />•	Take the water temperature in the first compartment of the sink by using a calibrated thermometer.  
            <br />•	If using chemicals to sanitize, test the sanitizer concentration by using the appropriate test kit for the chemical.
            <br />•	If using hot water to sanitize, use a calibrated thermometer to measure the water temperature.  Refer to Using and Calibrating Thermometers SOPs.
            <br /><br />
            <br />

            3. In a dishmachine, on a daily basis:
            <br />•	Visually monitor that the water and the interior parts of the machine are clean and free of debris. 
            <br />•	Continually monitor the temperature and pressure gauges, if applicable, to ensure that the machine is operating according to the data plate. 
            <br />•	For hot water sanitizing dishmachine, ensure that food contact surfaces are reaching the appropriate temperature by placing a piece of heat sensitive tape on a smallware item or a maximum registering thermometer on a rack and running the item or rack through the dishmachine. 
            <br />•	For chemical sanitizing dishmachine, check the sanitizer concentration on a recently washed food-contact surface using an appropriate test kit. <br />
            <br />





            <p><strong>CORRECTIVE ACTIONS:</strong></p>
            1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
            <br />

            2. Wash, rinse, and sanitize dirty food contact surfaces.  Sanitize food contact surfaces if it is discovered that the surfaces were not properly sanitized.  Discard food that comes in contact with food contact surfaces that have not been sanitized properly.<br />
            <br />

            3. In a 3-compartment sink:   
            <br />•	Drain and refill compartments periodically and as needed to keep the water clean.
            <br />•	Adjust the water temperature by adding hot water until the desired temperature is reached.

            <br />•	Add more sanitizer or water, as appropriate, until the proper concentration is achieved.  <br />
            <br />

            4. In a dishmachine:
            <br />•	Drain and refill the machine periodically and as needed to keep the water clean.  
            <br />•	Contact the appropriate individual(s) to have the machine repaired if the machine is not reaching the proper wash temperature indicated on the data plate.
            <br />•	For a hot water sanitizing dishmachine, retest by running the machine again.  If the appropriate surface temperature is still not achieved on the second run, contact the appropriate individual(s) to have the machine repaired.  Wash, rinse, and sanitize in the 3-compartment sink until the machine is repaired or use disposable single service/single-use items if a 3-compartment sink is not available.
            <br />•	For a chemical sanitizing dishmachine, check the level of sanitizer remaining in bulk container.  Fill, if needed.  “Prime” the machine according to the manufacturer’s instructions to ensure that the sanitizer is being pumped through the machine.  Retest.  If the proper sanitizer concentration level is not achieved, stop using the machine and contact the appropriate individual(s) to have it repaired.  Use a 3-compartment sink to wash, rinse, and sanitize until the machine is repaired.
            <br /><br />
            <br />



            <p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
            Foodservice employees will record monitoring activities and any corrective action taken on the Food Contact Surfaces Cleaning and Sanitizing Log.  The foodservice manager will verify that foodservice employees have taken the required temperatures and tested the sanitizer concentration by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Food Contact Surfaces Cleaning and Sanitizing Log.  The log will be kept on file for at least 1 year.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.  

            <p>&nbsp;</p>
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
            &nbsp;

<div align="center">
	<h2><font face="Arial">Controlling Time and Temperature During Preparation</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by limiting the amount of time that potentially hazardous foods are held in the temperature danger zone during preparation.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Time and Temperature Control, Food Preparation, Temperature Danger Zone</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP. <br />
<br />

2. Follow State or local health department requirements. <br />
<br />

3. Wash hands prior to preparing foods.  Refer to the Washing Hands SOP.<br />
<br />

4. Use clean and sanitized equipment and utensils while preparing food.<br />
<br />

5. Separate raw foods from ready-to-eat foods by keeping them in separate containers until ready to use and by using separate dispensing utensils.  Refer to the Preventing Cross-Contamination During Storage and Preparation SOP.<br />
<br />

6. Pre-chill ingredients for cold foods, such as sandwiches, salads, and cut melons, to 41 ºF or below before combining with other ingredients.
<br /><br />
<br />

7. Prepare foods as close to serving times as the menu will allow.<br />
<br />

8. Prepare food in small batches.<br />

<br />

9. Limit the time for preparation of any batches of food so that ingredients are not at room temperature for more than 30 minutes before cooking, serving, or being returned to the refrigerator. <br />
<br />

10. If potentially hazardous foods are not cooked or served immediately after preparation, quickly chill.  Refer to the Cooling Potentially Hazardous Foods SOP.<br />
<br />











<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer, preferably a thermocouple.<br />
<br />

2. Take at least two internal temperatures from each pan of food at various stages of preparation.<br />
<br />

3. Monitor the amount of time that food is in the temperature danger zone.  It should not exceed 4 hours.<br />
<br />






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Begin the cooking process immediately after preparation is complete for any foods that will be served hot.<br />
<br />

3. Rapidly cool ready-to-eat foods or foods that will be cooked at a later time.<br />

<br />

4. Immediately return ingredients to the refrigerator if the anticipated preparation completion time is expected to exceed 30 minutes.<br />
<br />

5. Discard food held in the temperature danger zone for more than 4 hours.<br />
<br />


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the date, product name, start and end times of production, the two temperature measurements taken, any corrective actions taken, and the amount of food prepared on the Production Log.  The foodservice manager will verify that foodservice employees are taking the required temperatures and following the proper preparation procedure by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Production Log daily.  Maintain the Production Log as directed by your State agency.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Cooking Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are cooked to the appropriate internal temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Cooking</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

2. Follow State or local health department requirements. <br />
<br />

3. If a recipe contains a combination of meat products, cook the product to the highest required temperature.<br />
<br />

4. If State or local health department requirements are based on the 2001 FDA Food Code, cook products to the following temperatures:
<br />a.	145 ºF for 15 seconds 
<br />•	Seafood, beef, and pork
<br />•	Eggs cooked to order that are placed onto a plate and immediately served  
<br />b.	155 ºF for 15 seconds
<br />•	Ground products containing beef, pork, or fish 
<br />•	Fish nuggets or sticks
<br />•	Eggs held on a steam table
<br />•	Cubed or Salisbury steaks
<br />c. 165 ºF for 15 seconds
<br />•	Poultry 
<br />•	Stuffed fish, pork, or beef  
<br />•	Pasta stuffed with eggs, fish, pork, or beef (such as lasagna or manicotti)
<br />d. 135 ºF for 15 seconds
<br />•	Fresh, frozen, or canned fruits and vegetables that are going to be held on a steam table or in a hot box
<br /><br />
<br />

















<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer, preferably a thermocouple.<br />
<br />

2. Avoid inserting the thermometer into pockets of fat or near bones when taking internal cooking temperatures.<br />
<br />

3. Take at least two internal temperatures from each batch of food by inserting the thermometer into the thickest part of the product which usually is in the center. <br />
<br />

4. Take at least two internal temperatures of each large food item, such as a turkey, to ensure that all parts of the product reach the required cooking temperature.<br />

<br />





<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Continue cooking food until the internal temperature reaches the required temperature.<br />
<br />




<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record product name, time, the two temperatures/times, and any corrective action taken on the Cooking and Reheating Temperature Log. 
<br />Foodservice manager will verify that foodservice employees has taken the required cooking temperatures by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating the temperature log at the close of each day.  The Cooking and Reheating Temperature Log is to be kept on file for a minimum of 1 year.
<br />
<p>&nbsp;</p>
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
<div align="center">
	<h2><font face="Arial">Date Marking Ready-to-Eat, Potentially Hazardous Food</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To ensure appropriate rotation of ready-to-eat food to prevent or reduce foodborne illness from Listeria monocytogenes.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, store, or serve food.</p>


<p><strong>KEY WORDS:</strong> Ready-to-Eat Food, Potentially Hazardous Food, Date Marking, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.  The best practice for a date marking system would be to include a label with the product name, the day or date, and time it is prepared or opened.  Examples of how to indicate when the food is prepared or opened include:  
<br />•	Labeling food with a calendar date, such as “cut cantaloupe, 5/26/05, 8:00 a.m.,”
<br />•	Identifying the day of the week, such as “cut cantaloupe, Monday, 8:00 a.m.,” or 
<br />•	Using color-coded marks or tags, such as cut cantaloupe, blue dot, 8:00 a.m. means “cut on Monday at 8:00 a.m.” 
<br /><br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Label ready-to-eat, potentially hazardous foods that are prepared on-site and held for more than 24 hours.<br />
<br />

4. Label any processed, ready-to-eat, potentially hazardous foods when opened, if they are to be held for more than 24 hours.<br />

<br />

5. Refrigerate all ready-to-eat, potentially hazardous foods at 41 �F or below.<br />
<br />

6. Serve or discard refrigerated, ready-to-eat, potentially hazardous foods within 7 days.<br />
<br />

7. Indicate with a separate label the date prepared, the date frozen, and the date thawed of any refrigerated, ready-to-eat, potentially hazardous foods.<br />
<br />

8. Calculate the 7-day time period by counting only the days that the food is under refrigeration. For example:
<br />� On Monday, 8/1/05, lasagna is cooked, properly cooled, and refrigerated with a label that reads, �Lasagna, Cooked, 8/1/05.�
<br />� On Tuesday, 8/2/05, the lasagna is frozen with a second label that reads, �Frozen, 8/2/05.� Two labels now appear on the lasagna. Since the lasagna was held under refrigeration from Monday, 8/1/05 � Tuesday, 8/2/05, only 1 day is counted towards the 7-day time period.

<br />� On Tuesday 8/16/05 the lasagna is pulled out of the freezer. A third label is placed on the lasagna that reads, �Thawed, 8/16/05.� All three labels now appear on the lasagna. The lasagna must be served or discarded within 6 days.<br />
<br />














<p><strong>MONITORING:</strong></p>
1. A designated employee will check refrigerators daily to verify that foods are date marked and that foods exceeding the 7-day time period are not being used or stored.<br />
<br />








<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />

<br />

2. Foods that are not date marked or that exceed the 7-day time period will be discarded.<br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily. The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Handling A Food Recall</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness in the event of a product recall.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Food Recalls</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Review the food recall notice and specific instructions that have been identified in the notice.<br />
<br />

4. Communicate the food recall notice to feeding sites.<br />
<br />

5. Hold the recalled product using the following steps:
<br />•	Physically segregate the product, including any open containers, leftover product, and food items in current production that items contain the recalled product.
<br />•	If an item is suspected to contain the recalled product, but label information is not available, follow the district’s procedure for disposal.
<br /><br />
<br />

6. Mark recalled product “Do Not Use” and “Do Not Discard.” Inform the entire staff not to use the product.<br />
<br />

7. Do not destroy any USDA commodity food without official written notification from the State Distributing Agency, USDA Food Safety Inspection Services (FSIS), or State or local health department.<br />
<br />

8. Inform the school district’s public relations coordinator of the recalled product.<br />
<br />

9. Identify and record whether any of the product was received in the district, locate the food recall product by feeding site, and verify that the food items bear the product identification code(s) and production date(s) listed in the recall notice.<br />
<br />

10. Obtain accurate inventory counts of the recalled products from every feeding site, including the amount in inventory and amount used.<br />
<br />

11. Account for all recalled product by verifying inventory counts against records of food received at the feeding site.<br />
<br />










<p><strong>MONITORING:</strong></p>
1. Foodservice employees and foodservice manager will visually observe that school sites have segregated and secured all recalled products.<br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Determine if the recalled product is to be returned and to whom, or destroyed and by whom.<br />
<br />

3. Notify feeding site staff of procedures, dates, and other specific directions to be followed for the collection or destruction of the recalled product.<br />

<br />

4. Consolidate the recall product as quickly as possible, but no later than 30 days after the recall notification.<br />
<br />

5. Conform to the recall notice using the following steps:
<br />•	Report quantity and site where product is located to manufacturer, distributor, or State agency for collection.  The quantity and location of the affected USDA commodity food must be submitted to the State Distributing Agency within 10 calendars days of the recall.
<br />•	Obtain the necessary documents from the State Distributing Agency for USDA commodity foods.  Submit necessary documentation for reimbursement of food costs.
<br />•	Complete and maintain all required documentation related to the recall including:
<br />•	Recall notice
<br />•	Records of how food product was returned or destroyed
<br />•	Reimbursable costs
<br />•	Public notice and media communications
<br />•	Correspondence to and from the public health department and State agency
<br /><br />
<br />


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the name of the contaminated food, date, time, and the reason why the food was discarded on the Damaged or Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged or Discarded Product Log each day.  Maintain the Damaged or Discarded Product Logs for a minimum of 1 year.
<p>&nbsp;</p>
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

&nbsp;

<div align="center">
	<h2><font face="Arial">Holding Hot and Cold Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all potentially hazardous foods are held under the proper temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food. </p>


<p><strong>KEY WORDS:</strong> CCross-Contamination, Temperatures, Holding, Hot Holding, Cold Holding, Storage</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

2. Follow State or local health department requirements.<br />

<br />

3. If State or local health department requirements are based on the 2001 FDA Food Code:
<br />•	Hold hot foods at 135 ºF or above 
<br />•	Hold cold foods at 41 ºF or below
<br /><br />
<br />


















<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer to measure the temperature of the food.<br />
<br />

2. Take temperatures of foods by inserting the thermometer near the surface of the product, at the thickest part, and at other various locations.<br />

<br />

3. Take temperatures of holding units by placing a calibrated thermometer in the coolest part of a hot holding unit or warmest part of a cold holding unit.<br />
<br />

4. For hot foods held for service:  
<br />•	Verify that the air/water temperature of any unit is at 135 ºF or above before use.
<br />•	Reheat foods in accordance with the Reheating for Hot Holding SOP.
<br />•	All hot potentially hazardous foods should be 135 ºF or above before placing the food out for display or service.  
<br />•	Take the internal temperature of food before placing it on a steam table or in a hot holding unit and at least every 2 hours thereafter.<br />
<br />

5. For cold foods held for service:
<br />•	Verify that the air/water temperature of any unit is at 41 ºF or below before use.
<br />•	Chill foods, if applicable, in accordance with the Cooling Potentially Hazardous Foods SOP.

<br />•	All cold potentially hazardous foods should be 41 ºF or below before placing the food out for display or service.  
<br />•	Take the internal temperature of the food before placing it onto any salad bar, display cooler, or cold serving line and at least every 2 hours thereafter.
<br /><br />
<br />

6. For cold foods in storage:  
<br />•	Take the internal temperature of the food before placing it into any walk-in cooler or reach-in cold holding unit. 
<br />•	Chill food in accordance with the Cooling Potentially Hazardous Foods SOP if the food is not 41 ºF or below.
<br />•	Verify that the air temperature of any cold holding unit is at 41 ºF or below before use and at least every 4 hours thereafter during all hours of operation.   
<br /><br />
<br />



<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />

<br />

2. For hot foods: 
<br />•	Reheat the food to 165 ºF for 15 seconds if the temperature is found to be below 135 ºF and the last temperature measurement was 135 ºF or higher and taken within the last 2 hours.  Repair or reset holding equipment before returning the food to the unit, if applicable.
<br />•	Discard the food if it cannot be determined how long the food temperature was below 135 ºF.<br />
<br />

3. For cold foods: 
<br />•	Rapidly chill the food using an appropriate cooling method if the temperature is found to be above 41 ºF and the last temperature measurement was 41 ºF or below and taken within the last 2 hours:  
<br />•	Place food in shallow containers (no more than 4 inches deep) and  uncovered on the top shelf in the back of the walk-in or reach-in cooler. 
<br />•	Use a quick-chill unit like a blast chiller. 
<br />•	Stir the food in a container placed in an ice water bath.
<br />•	Add ice as an ingredient.
<br />•	Separate food into smaller or thinner portions.<br />
<br />

4. Repair or reset holding equipment before returning the food to the unit, if applicable.<br />
<br />

5. Discard the food if it cannot be determined how long the food temperature was above 41 ºF. <br />
<br />


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record temperatures of food items and document corrective actions taken on the Hot and Cold Holding Temperature Log.  A designated foodservice employee will record air temperatures of coolers and cold holding units on the Refrigeration Logs.  The foodservice manager will verify that foodservice employees have taken the required holding temperatures by visually monitoring foodservice employees during the shift and reviewing the temperature logs at the close of each day.  The temperature logs are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Personal Hygiene</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent contamination of food by foodservice employees.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who handle, prepare, or serve food.</p>


<p><strong>KEY WORDS:</strong> Personal Hygiene, Cross-Contamination, Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Follow the Employee Health Policy.  (Employee health policy is not included in this resource.) <br />
<br />

4. Report to work in good health, clean, and dressed in clean attire.<br />
<br />

5. Change apron when it becomes soiled.  <br />
<br />

6. Wash hands properly, frequently, and at the appropriate times.<br />
<br />

7. Keep fingernails trimmed, filed, and maintained so that the edges are cleanable and not rough.<br />
<br />

8. Avoid wearing artificial fingernails and fingernail polish.<br />

<br />

9. Wear single-use gloves if artificial fingernails or fingernail polish are worn.<br />
<br />

10. Do not wear any jewelry except for a plain ring such as a wedding band.<br />
<br />

11. Treat and bandage wounds and sores immediately.  When hands are bandaged, single-use gloves must be worn.<br />
<br />

12. Cover a lesion containing pus with a bandage.  If the lesion is on a hand or wrist, cover with an impermeable cover such as a finger cot or stall and a single-use glove.<br />
<br />

13. Eat, drink, use tobacco, or chew gum only in designated break areas where food or food contact surfaces may not become contaminated.<br />
<br />

14. Taste food the correct way:
<br />•	Place a small amount of food into a separate container. 
<br />•	Step away from exposed food and food contact surfaces. 
<br />•	Use a teaspoon to taste the food.  Remove the used teaspoon and container to the dish room.  Never reuse a spoon that has already been used for tasting. 
<br />•	Wash hands immediately.
<br /><br />
<br />

15. Wear suitable and effective hair restraints while in the kitchen. <br />
<br />






<p><strong>MONITORING:</strong></p>
1. •	A designated foodservice employee will inspect employees when they report to work to be sure that each employee is following this SOP.  
<br />•	The designated foodservice employee will monitor that all foodservice employees are adhering to the personal hygiene policy during all hours of operation.
<br /><br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Discard affected food.<br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will verify that foodservice employees are following this SOP by visually observing the employees during all hours of operation.  The foodservice manager will complete the Food Safety Checklist daily.  Foodservice employees will record any discarded food on the Damaged or Discarded Product Log.  The Food Safety Checklist and Damaged or Discarded Product Logs are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Preventing Contamination at Food Bars</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all items held on food bars are protected from contamination.</p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who is responsible for maintaining and monitoring the self-service food bars. </p>


<p><strong>KEY WORDS:</strong> Contamination, Self-Service, Salad Bars, Food Bars</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements. <br />
<br />

3. Follow Employee Health Policy, Personal Hygiene, and Washing Hands SOPs. (Employee health policy is not included in this resource.)  <br />
<br />

4. Follow manufacturer’s instructions for pre-heating and pre-chilling food bar equipment before use.<br />
<br />

5. Place all exposed food under sneeze guards.<br />
<br />

6. Provide an appropriate clean and sanitized utensil for each container on the food bar.<br />
<br />

7. Replace existing containers of food with new containers when replenishing the food bar. <br />
<br />

8. Assist customers who are unable to properly use utensils.<br />

<br />

9. Ensure that customers use a clean dish when returning to the food bar.<br />
<br />

10. Store eating utensils with the handles up or in a manner to prevent customers from touching the food contact surfaces.<br />
<br />

11. Avoid using spray chemicals to clean food bars when in use.<br />
<br />










<p><strong>MONITORING:</strong></p>
1. Monitor and record temperatures of food in accordance with the Holding Hot and Cold Potentially Hazardous Foods SOP<br />
<br />

2. Continually monitor food containers to ensure that utensils are stored on a clean and sanitized surface or in the containers with the handles out of the food.<br />
<br />

3. 3.	Continually monitor customers’ use of the food bar to ensure that customers are not:
<br />•	Touching food with their bare hands
<br />•	Coughing, spitting, or sneezing on the food
<br />•	Placing foreign objects in the food
<br />•	Using the same plate for subsequent trips<br />
<br />






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />

<br />

2. Remove and discard contaminated food.<br />
<br />

3. Demonstrate to customers how to properly use utensils.<br />
<br />

4. Discard the food if it cannot be determined how long the food temperature was above 41 ºF or below 135 ºF.<br />
<br />



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

The foodservice manager will verify that foodservice employees are assigned to maintain food bars during all hours of operation.  Foodservice employees will record temperatures of food items and document corrective actions taken on the Hot and Cold Holding Temperature Log.  The foodservice manager will complete the Food Safety Checklist daily.  This form is to be kept on file for a minimum of 1 year.  Foodservice employees will document any discarded food on the Damaged or Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged or Discarded Product Log each day.  The Hot and Cold Holding Temperature Log and the Damaged or Discarded Product Log are to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Preventing Cross-Contamination During Storage and Preparation</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To reduce foodborne illness by preventing unintentional contamination of food. </p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who is responsible for receiving, storing, preparing, and serving food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Preparation, Contamination, Storage, Receiving</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements. <br />
<br />

3. Wash hands properly.  Refer to the Washing Hands SOP.<br />
<br />

4. Avoid touching ready-to-eat food with bare hands.  Refer to Using Suitable Utensils When Handling Ready-To-Eat Foods SOP.<br />
<br />

5. Separate raw animal foods, such as eggs, fish, meat, and poultry, from ready-to-eat foods, such as lettuce, cut melons, and lunch meats during receiving, storage, and preparation.<br />
<br />

6. Separate different types of raw animal foods, such as eggs, fish, meat, and poultry, from each other, except when combined in recipes.<br />
<br />

7. Store raw animal foods in refrigerators or walk-in coolers by placing the raw animal foods on shelves in order of cooking temperatures with the raw animal food requiring the highest cooking temperature, such as chicken, on the lowest shelf.<br />
<br />

8. Separate unwashed fruits and vegetables from washed fruits and vegetables and other ready-to-eat foods.<br />

<br />

9. Use only dry, cleaned, and sanitized equipment and utensils.  Refer to Cleaning and Sanitizing Food Contact Surfaces SOP for proper cleaning and sanitizing procedure.<br />
<br />

10. Touch only those surfaces of equipment and utensils that will not come in direct contact with food.<br />
<br />

11. Place food in covered containers or packages, except during cooling, and store in the walk-in refrigerator or cooler.<br />
<br />

12. Designate an upper shelf of a refrigerator or walk-in cooler as the “cooling” shelf.  Uncover containers of food during the initial quick cool-down phase to facilitate cooling.<br />
<br />

13. Clean the exterior surfaces of food containers, such as cans and jars, of visible soil before opening. <br />
<br />

14. Store damaged goods in a separate location.  Refer to Segregating Damaged Goods SOP.<br />
<br />








<p><strong>MONITORING:</strong></p>

1. A designated foodservice employee will continually monitor food storage and preparation to ensure that food is not cross-contaminated.<br />
<br />








<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Separate foods found improperly stored.<br />
<br />

3. Discard ready-to-eat foods that are contaminated by raw eggs, raw fish, raw meat, or raw poultry.<br />
<br />




<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will visually observe that employees are following these procedures and taking all necessary corrective actions during all hours of operation.  The foodservice manager will periodically check the storage of foods during hours of operation and complete the Food Safety Checklist daily.  The Food Safety Checklist will be kept on file for a minimum of 1 year.  Foodservice employees will document any discarded food on the Damaged and Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged and Discarded Product Log each day.  The Damaged and Discarded Product Log is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Receiving Deliveries</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To ensure that all food is received fresh and safe when it enters the foodservice operation and to transfer food to proper storage as quickly as possible.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who handle, prepare, or serve food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Receiving, Holding, Frozen Goods, Delivery</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Schedule deliveries to arrive at designated times during operational hours.<br />
<br />

4. Post the delivery schedule, including the names of vendors, days and times of deliveries, and drivers’ names.<br />
<br />

5. Establish a rejection policy to ensure accurate, timely, consistent, and effective refusal and return of rejected goods.<br />
<br />

6. Organize freezer and refrigeration space, loading docks, and store rooms before deliveries.<br />
<br />

7. Gather product specification lists and purchase orders, temperature logs, calibrated thermometers, pens, flashlights, and clean loading carts before deliveries.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

8. Keep receiving area clean and well lighted.<br />

<br />

9. Do not touch ready-to-eat foods with bare hands.<br />
<br />

10. Determine whether foods will be marked with the date arrival or the “use by” date  and mark accordingly upon receipt.<br />
<br />

11. Compare delivery invoice against products ordered and products delivered.<br />
<br />

12. Transfer foods to their appropriate locations as quickly as possible.<br />
<br />










<p><strong>MONITORING:</strong></p>
1. Inspect the delivery truck when it arrives to ensure that it is clean, free of putrid odors, and organized to prevent cross-contamination.  Be sure refrigerated foods are delivered on a refrigerated truck.<br />
<br />

2. Check the interior temperature of refrigerated trucks.<br />

<br />

3. Confirm vendor name, day and time of delivery, as well as driver’s identification before accepting delivery.  If driver’s name is different from what is indicated on the delivery schedule, contact the vendor immediately. <br />
<br />

4. Check frozen foods to ensure that they are all frozen solid and show no signs of thawing and refreezing, such as the presence of large ice crystals or liquids on the bottom of cartons.<br />
<br />

5. Check the temperature of refrigerated foods.
<br />a.	For fresh meat, fish, and poultry products, insert a clean and sanitized thermometer into the center of the product to ensure a temperature of 41 ºF or below.  The temperature of milk should be 45 ºF or below. 
<br />b.	For packaged products, insert a food thermometer between two packages being careful not to puncture the wrapper.  If the temperature exceeds 41 ºF, it may be necessary to take the internal temperature before accepting the product.
<br />c.	For eggs, the interior temperature of the truck should be 45 ºF or below.  
<br /><br />
<br />

6. Check dates of milk, eggs, and other perishable goods to ensure safety and quality.<br />
<br />

7. Check the integrity of food packaging.<br />
<br />


<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Reject the following:
<br />•	Frozen foods with signs of previous thawing

<br />•	Cans that have signs of deterioration, such as swollen sides or ends, flawed seals or seams, dents, or rust
<br />•	Punctured packages  
<br />•	Foods with out-dated expiration dates
<br />•	Foods that are out of safe temperature zone or deemed unacceptable by the established rejection policy
<br /><br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Record the temperature and the corrective action on the delivery invoice or on the Receiving Log.  The foodservice manager will verify that foodservice employees are receiving products using the proper procedure by visually monitoring receiving practices during the shift and reviewing the Receiving Log at the close of each day.  Receiving Logs are kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Reheating Potentially Hazardous Foods</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are reheated to the appropriate internal temperature.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food. </p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Temperatures, Reheating, Holding, Hot Holding</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

2. Follow State or local health department requirements. <br />
<br />

3. If State or local requirements are based on the 2001 FDA Food Code, heat processed, ready-to-eat foods from a package or can, such as canned green beans or prepackaged breakfast burritos, to an internal temperature of at least 135 ºF for 15 seconds for hot holding.  <br />
<br />

4. Reheat the following products to 165 ºF for 15 seconds:
<br />•	Any food that is cooked, cooled, and reheated for hot holding 
<br />•	Leftovers reheated for hot holding
<br />•	Products made from leftovers, such as soup
<br />•	Precooked, processed foods that have been previously cooled
<br /><br />
<br />

5. Reheat food for hot holding in the following manner if using a microwave oven: 
<br />•	Heat processed, ready-to-eat foods from a package or can to at least 135 ºF for 15 seconds
<br />•	Heat leftovers to 165 ºF for 15 seconds
<br />•	Rotate (or stir) and cover foods while heating 
<br />•	Allow to sit for 2 minutes after heating 
<br /><br />
<br />

6. Reheat all foods rapidly.  The total time the temperature of the food is between 41 ºF and 165 ºF may not exceed 2 hours. <br />

<br />

7. Serve reheated food immediately or transfer to an appropriate hot holding unit.<br />
<br />














<p><strong>MONITORING:</strong></p>
1. Use a clean, sanitized, and calibrated probe thermometer.<br />
<br />

2. Take at least two internal temperatures from each pan of food.  <br />
<br />






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Continue reheating and heating food if the internal temperature does not reach the required temperature.<br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

Foodservice employees will record product name, time, the two temperatures/times, and any corrective action taken on the Cooking and Reheating Temperature Log.  Foodservice manager will verify that foodservice employees have taken the required reheating temperatures by visually monitoring foodservice employees during the shift and reviewing, initialing, and dating the Cooking and Reheating Temperature Log at the close of each day.  The temperature logs are kept on file for a minimum of 1 year.  
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Serving Food</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that all foods are served in a sanitary manner.
<br />
<br /></p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who serve food.</p>


<p><strong>KEY WORDS:</strong> Cross-Contamination, Service</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Follow the employee health policy.  (Employee health policy is not included in this resource.)  <br />
<br />

4. Wash hands before putting on gloves, each time the gloves are changed, when changing tasks, and before serving food with utensils.  Refer to the Washing Hands SOP.<br />
<br />

5. Avoid touching ready-to-eat foods with bare hands.  Refer to the Using Suitable Utensils when Handling Ready-To-Eat Foods SOP.<br />
<br />

6. Handle plates by the edge or bottom; cups by the handle or bottom; and utensils by the handles.<br />
<br />

7. Store utensils with the handles up or by other means to prevent contamination.<br />

<br />

8. Hold potentially hazardous food at the proper temperature.  Refer to the Holding Hot and Cold Potentially Hazardous Foods SOP.<br />
<br />

9. Serve food with clean and sanitized utensils.<br />
<br />

10. Store in-use utensils properly.  Refer to the Storing In-Use Utensils SOP.<br />
<br />

11. Date mark and cool potentially hazardous foods or discard leftovers.  Refer to the Date Marking Ready-to-Eat, Potentially Hazardous Foods, and Cooling Potentially Hazardous Foods SOPs. <br />
<br />











<p><strong>MONITORING:</strong></p>
1. A designated foodservice employee will visually observe that food is being served in a manner that prevents contamination during all hours of service.<br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Replace improperly handled plates, cups, or utensils.<br />
<br />

3. Discard ready-to-eat food that has been touched with bare hands.<br />
<br />

4. Follow the corrective actions identified in the Washing Hands; Using Suitable Utensils When Handling Ready-To-Eat Foods; Date Marking Ready-to-Eat, Potentially Hazardous Foods; Cooling Potentially Hazardous Foods; and Holding Hot and Cold Potentially Hazardous Foods SOPs.<br />
<br />



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will periodically check the storage and use of utensils during service.  In addition, the foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Storing and Using Poisonous or Toxic Chemicals</font></h2>
</div>
<p>&nbsp;</p>

<p><strong>PURPOSE:</strong> To prevent foodborne illness by chemical contamination.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who use chemicals in the kitchen.</p>


<p><strong>KEY WORDS:</strong> Chemicals, Cross-Contamination, Contamination, Material Safety Data Sheet</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Designate a location for storing the Material Safety Data Sheets (MSDS).<br />
<br />

4. Follow manufacturer’s directions for specific mixing, storing, and first aid instructions on the chemical containers in the MSDS. <br />
<br />

5. Label and date all poisonous or toxic chemicals with the common name of the substance. <br />
<br />

6. Store all chemicals in a designated secured area away from food and food contact surfaces using spacing or partitioning. <br />
<br />

7. Limit access to chemicals by use of locks, seals, or key cards.<br />
<br />

8. Maintain an inventory of chemicals.<br />

<br />

9. Store only chemicals that are necessary to the operation and maintenance of the kitchen.<br />
<br />

10. Mix, test, and use sanitizing solutions as recommended by the manufacturer and the  State or local health department.<br />
<br />

11. Use the appropriate chemical test kit to measure the concentration of sanitizer each time a new batch of sanitizer is mixed. <br />
<br />

12. Do not use chemical containers for storing food or water.<br />
<br />

13. Use only hand sanitizers that comply with the 2001 FDA Food Code.  Confirm with the manufacturer that the hand sanitizers used meet the requirements of the 2001 FDA Food Code.<br />
<br />

14. Label and store first aid supplies in a container that is located away from food or food contact surfaces. <br />
<br />

15. Label and store medicines for employee use in a designated area and away from food contact surfaces.  Do not store medicines in food storage areas.<br />
<br />

16. Store refrigerated medicines in a covered, leak proof container where they are not accessible to children and cannot contaminate food. <br />
<br />





<p><strong>MONITORING:</strong></p>
1. Foodservice employees and foodservice manager will visually observe that chemicals are being stored, labeled, and used properly during all hours of operation. <br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Discard any food contaminated by chemicals.<br />
<br />

3. Label and properly store any unlabeled or misplaced chemicals. <br />
<br />



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is completed.  Foodservice employees will record the name of the contaminated food, date, time, and the reason why the food was discarded on the Damaged and Discarded Product Log.  The foodservice manager will verify that appropriate corrective actions are being taken by reviewing, initialing, and dating the Damaged and Discarded Product Log each day.  The Food Safety Checklist and Damaged and Discarded Product Logs are kept on file for a minimum of 1 year. 
<p>&nbsp;</p>
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

&nbsp;

<div align="center">
	<h2><font face="Arial">Transporting Food to Remote Sites (Satellite Kitchens)</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that food temperatures are maintained during transportation and contamination is prevented.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who transport food from a central kitchen to remote sites (satellite kitchens).</p>


<p><strong>KEY WORDS:</strong> Hot Holding, Cold Holding, Reheating, Cooling, Transporting Food</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  <br />
<br />

2. Follow State or local health department requirements. <br />

<br />

3. If State or local health department requirements are based on the 2001 FDA Food Code:
<br />•	Keep frozen foods frozen during transportation.
<br />•	Maintain the temperature of refrigerated, potentially hazardous foods at 41 ºF or below and cooked foods that are transported hot at 135 ºF or above.
<br /><br />
<br />

4. Use only food carriers for transporting food approved by the National Sanitation Foundation International or that have otherwise been approved by the state or local health department.<br />
<br />

5. Prepare the food carrier before use:
<br />•	Ensure that all surfaces of the food carrier are clean.
<br />•	Wash, rinse, and sanitize the interior surfaces.
<br />•	Ensure that the food carrier is designed to maintain cold food temperatures at 
<br />41 ºF and hot food temperatures at 135 ºF or above.

<br />•	Place a calibrated stem thermometer in the warmest part of the carrier if used for transporting cold food, or the coolest part of the carrier if used for transporting hot food.  Refer to the Using and Calibrating Thermometers SOP.
<br />•	Pre-heat or pre-chill the food carrier according to the manufacturer’s recommendations.
<br /><br />
<br />

6. Store food in containers suitable for transportation.  Containers should be:
<br />•	Rigid and sectioned so that foods do not mix
<br />•	Tightly closed to retain the proper food temperature
<br />•	Nonporous to avoid leakage
<br />•	Easy-to-clean or disposable
<br />•	Approved to hold food
<br /><br />
<br />

7. Place food containers in food carriers and transport the food in clean trucks, if applicable, to remote sites as quickly as possible.<br />
<br />

8. Follow Receiving Deliveries SOP when food arrives at remote site.<br />
<br />













<p><strong>MONITORING:</strong></p>
1. Check the air temperature of the food carrier to ensure that the temperature suggested by the manufacturer is reached prior to placing food into it.<br />
<br />

2. Check the internal temperatures of food using a calibrated thermometer before placing it into the food carrier.  Refer to the Holding Hot and Cold Potentially Hazardous Foods SOP for the proper procedures to follow when taking holding temperatures.<br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP. <br />
<br />

2. Continue heating or chilling food carrier if the proper air temperature is not reached.<br />
<br />

3. Reheat food to 165 ºF for 15 seconds if the internal temperature of hot food is less than 135 ºF.  Refer to the Reheating Potentially Hazardous Foods SOP.<br />
<br />

4. Cool food to 41 ºF or below using a proper cooling procedure if the internal temperature of cold food is greater than 41 ºF.  Refer to the Cooling Potentially Hazardous Foods SOP for the proper procedures to follow when cooling food.<br />
<br />

5. Discard foods held in the danger zone for greater than 4 hours.<br />
<br />


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Before transporting food to remote sites, foodservice employees will record food carrier temperature, food product name, time, internal temperatures, and any corrective action taken on the Hot and Cold Holding Temperature Log.  Upon receipt of food at remote sites, foodservice employees will record receiving temperatures and corrective action taken on the Receiving Log.  The foodservice manager at central kitchens will verify that foodservice employees are following this SOP by visually observing employees and reviewing and initialing the Hot and Cold Holding Temperature Log daily.  The foodservice manager at the remote site(s) will verify that foodservice employees are receiving foods at the proper temperature and following the proper receiving procedures by visually observing receiving practices during the shift and reviewing and initialing the Receiving Log daily.  All logs are kept on file for a minimum of 1 year.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Using and Calibrating Thermometers</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that the appropriate type of thermometer is used to measure internal product temperatures and that thermometers used are correctly calibrated for accuracy.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, cook, and cool food.</p>


<p><strong>KEY WORDS:</strong> Thermometers, Calibration</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Follow the food thermometer manufacturer’s instructions for use.  Use a food thermometer that measures temperatures from 0 ºF (-18 ºC) to 220 ºF (104 ºC) and is appropriate for the temperature being taken.  For example:
<br />•	Temperatures of thin products, such as hamburgers, chicken breasts, pizza, filets, nuggets, hot dogs, and sausage patties, must be taken using a thermistor or thermocouple with a thin probe.
<br />•	Bimetallic, dial-faced stem thermometers are accurate only when measuring temperatures of thick foods.  They may not be used to measure temperatures of thin foods.  A dimple mark located on the stem of the thermometer indicates the maximum food thickness that can be accurately measured.
<br />•	Use only oven-safe, bimetallic thermometers when measuring temperatures of food while cooking in an oven.
<br /><br />
<br />

4. Have food thermometers easily-accessible to foodservice employees during all hours of operation.<br />

<br />

5. Clean and sanitize food thermometers before each use.  Refer to the Cleaning and Sanitizing Food Contact Surfaces SOP for the proper procedure to follow. <br />
<br />

6. Store food thermometers in an area that is clean and where they are not subject to contamination.<br />
<br />















<p><strong>MONITORING:</strong></p>
1. Foodservice employees will use either the ice-point method or boiling-point method to verify the accuracy of food thermometers.  This is known as calibration of the thermometer.<br />
<br />

2. To use ice-point method:
<br />•	Insert the thermometer probe into a cup of crushed ice.
<br />•	Add enough cold water to remove any air pockets that might remain.

<br />•	Allow the temperature reading to stabilize before reading temperature.  
<br />•	Temperature measurement should be 32 ºF (+ 2 ºF) [or 0 ºC (+ 1 ºC)].  If not, adjust according to manufacturer’s instructions.
<br /><br />
<br />

3. To use boiling-point method:
<br />•	Immerse at least the first two inches of the probe into boiling water.
<br />•	Allow the temperature reading to stabilize before reading temperature.
<br />•	Reading should be 212 ºF (+ 2 ºF) [or 100 ºC (+ 1 ºC)].  This reading may vary at higher altitudes.  If adjustment is required, follow manufacturer’s instructions.
<br /><br />
<br />

4. Foodservice employees will check the accuracy of the food thermometers:
<br />•	At regular intervals (at least once per week)
<br />•	If dropped
<br />•	If used to measure extreme temperatures, such as in an oven
<br />•	Whenever accuracy is in question

<br /><br />
<br />





<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. For an inaccurate, bimetallic, dial-faced thermometer, adjust the temperature by turning the dial while securing the calibration nut (located just under or below the dial) with pliers or a wrench.<br />
<br />

3. For an inaccurate, digital thermometer with a reset button, adjust the thermometer according to manufacturer’s instructions.<br />
<br />

4. If an inaccurate thermometer cannot be adjusted on-site, discontinue using it, and follow manufacturer’s instructions for having the thermometer calibrated.<br />
<br />

5. Retrain employees who are using or calibrating food thermometers improperly.<br />
<br />


<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will record the calibration temperature and any corrective action taken, if applicable, on the Thermometer Calibration Log each time a thermometer is calibrated.  The foodservice manager will verify that foodservice employees are using and calibrating thermometers properly by making visual observations of the employees during the calibration process and all operating hours.  The foodservice manager will review and initial the Calibration Log daily.  The Calibration Log will be kept on file a minimum of 1 year. The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>

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
&nbsp;

<div align="center">
	<h2><font face="Arial">Using Suitable Utensils When Handling Ready-to-Eat Foods</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness due to hand-to-food cross-contamination.   </p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare, handle, or serve food.</p>


<p><strong>KEY WORDS:</strong> Ready-to-Eat Food, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Use proper handwashing procedures to wash hands and exposed arms prior to preparing or handling food or at anytime when the hands may have become contaminated.<br />
<br />

4. Do not use bare hands to handle ready-to-eat foods at any time unless washing fruits and vegetables. <br />
<br />

5. Use suitable utensils when working with ready-to-eat food.  Suitable utensils may include:
<br />•	Single-use gloves
<br />•	Deli tissue
<br />•	Foil wrap
<br />•	Tongs, spoodles, spoons, and spatulas 
<br /><br />
<br />

6. Wash hands and change gloves: 
<br />•	Before beginning food preparation
<br />•	Before beginning a new task
<br />•	After touching equipment such as refrigerator doors or utensils that have not been cleaned and sanitized
<br />•	After contacting chemicals

<br />•	When interruptions in food preparation occur, such as when answering the telephone or checking in a delivery
<br />•	When handling money
<br />•	Anytime a glove is torn, damaged, or soiled
<br />•	Anytime contamination of a glove might have occurred
<br /><br />
<br />















<p><strong>MONITORING:</strong></p>
1. A designated foodservice employee will visually observe that gloves or suitable utensils are used and changed at the appropriate times during all hours of operation.<br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Discard ready-to-eat food touched with bare hands. <br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>

The foodservice manager will verify that foodservice workers are using suitable utensils by visually monitoring foodservice employees during all hours of operation.  The foodservice manager will complete the Food Safety Checklist daily.  The designated foodservice employee responsible for monitoring will record any discarded food on the Damaged and Discarded Product Log.  The Food Safety Checklist and Damaged and Discarded Food Log are kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Using Time Alone as a Public Health Control to Limit Bacteria Growth in Potentially Hazardous Foods</font></h2>

</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by ensuring that potentially hazardous foods are not held in the temperature danger zone for more than 4 hours before being cooked or served.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees that handle, prepare, cook, and serve food.</p>


<p><strong>KEY WORDS:</strong> Temperatures, Holding, Time As a Public Health Control</p>


<p><strong>INSTRUCTIONS:</strong> </p>
1. Train foodservice employees on using the procedures in this SOP.  Refer to the Using and Calibrating Thermometers SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. If State or local health department requirements are based on the 2001 FDA Food Code, establish written procedures that clearly identify the:
<br />•	Specific foods for which time rather than temperature will be used to limit bacteria growth.
<br />•	Corrective procedures that are followed to ensure that foods are cooled properly.  Refer to the Cooling Potentially Hazardous Foods SOP.
<br />•	Marking procedures used to indicate the time that is 4 hours past the point when the food is removed from temperature control, such as an oven or refrigerator.

<br />•	Procedures that are followed when food is in the danger zone for greater than 4 hours.
<br /><br />
<br />

4. Cook raw potentially hazardous food within 4 hours past the point when the food is removed from temperature control.<br />
<br />

5. Serve or discard cooked or ready-to-eat food within 4 hours past the time when the food is removed from temperature control.<br />
<br />

6. Avoid mixing different batches of food together in the same container.  If different batches of food are mixed together in the same container, use the time associated with the first batch of food as the time by which to cook, serve, or discard all the food in the container.<br />
<br />















<p><strong>MONITORING:</strong></p>
1. Foodservice employees will continually monitor that foods are properly marked or identified with the time that is 4 hours past the point when the food is removed from temperature control. <br />

<br />

2. Foodservice employees will continually monitor that foods are cooked, served, or discarded by the indicated time.<br />
<br />







<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Discard unmarked or unidentified food or food that is noted to exceed the 4-hour limit.<br />
<br />





<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
Foodservice employees will mark or otherwise identify food as specified in the Instructions Section of this SOP.  The foodservice manager will verify that foodservice employees are following this procedure by visually monitoring foodservice employees and food handling during the shift.  The foodservice manager will complete the Food Safety Checklist daily.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Washing Fruits and Vegetables</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent or reduce risk of foodborne illness or injury by contaminated fruits and vegetables.</p>


<p><strong>SCOPE:</strong> This procedure applies to foodservice employees who prepare or serve food.</p>


<p><strong>KEY WORDS:</strong> Fruits, Vegetables, Cross-Contamination, Washing</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Wash hands using the proper procedure.<br />
<br />

4. Wash, rinse, sanitize, and air-dry all food-contact surfaces, equipment, and utensils that will be in contact with produce, such as cutting boards, knives, and sinks.<br />
<br />

5. Follow manufacturer’s instructions for proper use of chemicals.<br />

<br />

6. Wash all raw fruits and vegetables thoroughly before combining with other ingredients, including:
<br />•	Unpeeled fresh fruit and vegetables that are served whole or cut into pieces.
<br />•	Fruits and vegetables that are peeled and cut to use in cooking or served ready-to-eat.  
<br /><br />
<br />

7. Wash fresh produce vigorously under cold running water or by using chemicals that comply with the 2001 FDA Food Code.  Packaged fruits and vegetables labeled as being previously washed and ready-to-eat are not required to be washed.  <br />
<br />

8. Scrub the surface of firm fruits or vegetables such as apples or potatoes using a clean and sanitized brush designated for this purpose. <br />
<br />

9. Remove any damaged or bruised areas.<br />

<br />

10. Label, date, and refrigerate fresh-cut items.<br />
<br />

11. Serve cut melons within 7 days if held at 41 ºF or below.  Refer to the Date Marking Ready-to-Eat, Potentially Hazardous Food SOP.  <br />
<br />

12. Do not serve raw seed sprouts to highly susceptible populations such as preschool-age children.<br />
<br />









<p><strong>MONITORING:</strong></p>
1. The foodservice manager will visually monitor that fruits and vegetables are being properly washed, labeled, and dated during all hours of operation.  <br />
<br />

2. Foodservice employees will check daily the quality of fruits and vegetables in cold storage.<br />
<br />






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Remove unwashed fruits and vegetables service and washed immediately before being served.<br />
<br />

3. Label and date fresh cut fruits and vegetables.<br />

<br />

4. Discard cut melons held after 7 days.<br />
<br />



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is being conducted as specified in this SOP.  The Food Safety Checklist is to be kept on file for a minimum of 1 year.
<p>&nbsp;</p>
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
&nbsp;

<div align="center">
	<h2><font face="Arial">Washing Hands</font></h2>
</div>
<p>&nbsp;</p>


<p><strong>PURPOSE:</strong> To prevent foodborne illness by contaminated hands.</p>


<p><strong>SCOPE:</strong> This procedure applies to anyone who handle, prepare, and serve food.</p>


<p><strong>KEY WORDS:</strong> Handwashing, Cross-Contamination</p>


<p><strong>INSTRUCTIONS:</strong> </p>

1. Train foodservice employees on using the procedures in this SOP.<br />
<br />

2. Follow State or local health department requirements.<br />
<br />

3. Post handwashing signs or posters in a language understood by all foodservice staff near all handwashing sinks, in food preparation areas, and restrooms.<br />
<br />

4. Use designated handwashing sinks for handwashing only.  Do not use food preparation, utility, and dishwashing sinks for handwashing.<br />
<br />

5. Provide warm running water, soap, and a means to dry hands.  Provide a waste container at each handwashing sink or near the door in restrooms.<br />

<br />

6. Keep handwashing sinks accessible anytime employees are present.<br />
<br />

7. Wash hands:
<br />•	Before starting work
<br />•	During food preparation
<br />•	When moving from one food preparation area to another
<br />•	Before putting on or changing gloves
<br />•	After using the toilet
<br />•	After sneezing, coughing, or using a handkerchief or tissue
<br />•	After touching hair, face, or body
<br />•	After smoking, eating, drinking, or chewing gum or tobacco
<br />•	After handling raw meats, poultry, or fish
<br />•	After any clean up activity such as sweeping, mopping, or wiping counters

<br />•	After touching dirty dishes, equipment, or utensils
<br />•	After handling trash
<br />•	After handling money
<br />•	After any time the hands may become contaminated
<br /><br />
<br />

8. Follow proper handwashing procedures as indicated below:
<br />•	Wet hands and forearms with warm, running water at least 100 ºF and apply soap.
<br />•	Scrub lathered hands and forearms, under fingernails, and between fingers for at least 10-15 seconds.  Rinse thoroughly under warm running water for 5-10 seconds.
<br />•	Dry hands and forearms thoroughly with single-use paper towels.
<br />•	Dry hands for at least 30 seconds if using a warm air hand dryer.
<br />•	Turn off water using paper towels.
<br />•	Use paper towel to open door when exiting the restroom.
<br /><br />
<br />

9. Follow FDA recommendations when using hand sanitizers.  These recommendations are as follows:
<br />•	Use hand sanitizers only after hands have been properly washed and dried. 
<br />•	Use only hand sanitizers that comply with the 2001 FDA Food Code.  Confirm with the manufacturers that the hand sanitizers used meet these requirements. 
<br />•	Use hand sanitizers in the manner specified by the manufacturer.
<br /><br />
<br />












<p><strong>MONITORING:</strong></p>
1. A designated employee will visually observe the handwashing practices of the foodservice staff during all hours of operation. <br />
<br />

2. The designated employee will visually observe that handwashing sinks are properly supplied during all hours of operation.<br />
<br />






<p><strong>CORRECTIVE ACTIONS:</strong></p>
1. Retrain any foodservice employee found not following the procedures in this SOP.<br />
<br />

2. Ask employees that are observed not washing their hands at the appropriate times or using the proper procedure to wash their hands immediately. <br />
<br />

3. Retrain employee to ensure proper handwashing procedure.<br />
<br />



<p><strong>VERIFICATION AND RECORD KEEPING:</strong></p>
The foodservice manager will complete the Food Safety Checklist daily to indicate that monitoring is being conducted as specified.  The Food Safety Checklist is to be kept on file for a minimum of 1 year. 
<p>&nbsp;</p>
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

&nbsp;
<br/>
&nbsp;</td>--%>
		   
		
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetSOPsBykitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource>  
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
                        SelectCommand="uspAdm_GetProcessesByKitchenId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
                    </asp:SqlDataSource>  
        <tr>
            <td style="background-color:#99ccff;">
                
            </td>
        </tr>
        <tr>
            <td align="center">
                <h2> HACCP Plan Built by HACCP BUILDER</h2>
            </td>
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
    </div>
    </form>
</body>
</html>
