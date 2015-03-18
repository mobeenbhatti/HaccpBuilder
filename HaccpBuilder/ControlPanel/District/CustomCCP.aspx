<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CustomCCP" Title="HACCP Builder | Custom CCP" Codebehind="CustomCCP.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
    function checkDefault(chkDefault, chkCustom, chkRemove) {

        if (chkDefault.checked == true) {
            // chkCustom.checked = false;
            chkRemove.checked = false;
            // lkbEdit.disabled = true;
        }
        else {
            if (chkRemove.checked == false && chkCustom.checked == false) {
                chkDefault.checked = true;
            }
        }

    }
    function checkRemove(chkDefault, chkCustom, chkRemove) {
        if (chkRemove.checked == true) {
            chkCustom.checked = false;
            chkDefault.checked = false;

        }
        else {

            if (chkCustom.checked == false && chkDefault.checked == false) {
                chkRemove.checked = true;
            }
        }

    }
    function checkCustom(chkDefault, chkCustom, chkRemove) {

        if (chkCustom.checked == true) {
            chkRemove.checked = false;
            chkDefault.checked = false;

        }
        else {
            if (chkRemove.checked == false && chkDefault.checked == false) {
                chkCustom.checked = true;
            }
        }

    }
  
</script>
    <div >
      <div class="MainHeading">
               CREATE CUSTOM CCP AND CP REQUIREMENTS FOR A FOOD CATEGORY
               <span style="font-size:10px; margin-left:150px;">
               <a href="DistrictControl.aspx"><img src="../../images/buttons/ButtonBackToMain.jpg" alt="" /></a>            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
                <div class="SearchDiv1">
                    <div class="DistrictSearchCol1">Select Location Group</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlKitchen" Width="200px" runat="server" DataSourceID="ObjectDataSource2"
	                             DataTextField="GroupName" DataValueField="CCPGroupId" AppendDataBoundItems="true"
                            CssClass="DropDown" 
                            onselectedindexchanged="ddlKitchen_SelectedIndexChanged" 
                            AutoPostBack="True">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>
                            
                    </div>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCPGroup">
            <SelectParameters>
                <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>                    
                </div>                
                                
                <div class="Buttons">      
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnAddKitchens"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonGotToAssignKitchens copy.jpg" 
                           onclick="btnAddKitchens_Click"/>
                   </div>                   
                   <%--<div class="Clearer" style="margin-top:15px"></div>--%>                   
                   <%--<div class="FloatLeft">
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>--%>
                </div>
                <%--<div class="Clearer"></div> --%>               
        </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
        </div>             
        <div class="Clearer"></div>
       <%-- <div class="ViewPlanClearer"></div> --%>           
    </div>
   <div style="margin-left:10px; margin-right:10px; font-family:Arial;">
       <span style="color:Red;">
       Managing, adjusting and creating CCP's Questions with the CCP manager is a simple task.  If you would like to adjust an existing CCP Question or create a new CCP Question you have three options:<br />
       </span>  
       <b>1.  REMOVE AN EXISTING CCP:</b>  Click on the box next to the CCP you want to remove in the REMOVE CCP column and the system will remove that CCP<br />
       <b>2.  ADJUST/CHANGE AN EXISTING CCP:</b>  Click on the box next to the CCP you want to adjust in the CREATE CUSTOM CCP column and the system will enable you to adjust that CCP<br />
       <b> 3.  CREATE A COMPLETE CUSTOM CCP:</b>Click on ADD CUSTOM CCP AND REQUIREMENT button and the system will enable you to create a completely customized CCP<br />  
                           
    </div>
    <div class="Clearer"></div>
    <%--<div class="ViewPlanClearer">--%>    
    <div class="Buttons">
        <asp:ImageButton ID="cmdAdditionalCCP" runat="server" 
            ImageUrl="~/images/District Images/ButtonAdditionalCCP.jpg"
            onclick="cmdAdditionalCCP_Click" />
    </div>        
    
    <div class="GirdDiv">
           <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:GridView ID="grdCCP" runat="server" AutoGenerateColumns="False" 
                    SkinID="gridviewSkin" DataSourceID="ObjectDataSource1" 
                    onrowdatabound="grdCCP_RowDataBound" onrowcommand="grdCCP_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="2px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfCCPId" runat="server" Value='<%# Eval("CCPId") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Standard CCP/CP" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lblTitle" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("CCP").ToString():Eval("CCP").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="350px"></ItemStyle>
                    </asp:TemplateField>                 
                    <%--<asp:BoundField DataField="Title" HeaderText="Standard USDA CCPs" ItemStyle-Width="350px" 
                        HeaderStyle-CssClass="gridheaderline" >
<HeaderStyle CssClass="gridheaderline"></HeaderStyle>
<ItemStyle Width="350px"></ItemStyle>
                    </asp:BoundField>--%>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Additional Custom CCP/CP" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="USDA Default CCP/CP" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDefault" runat="server" Checked='<%# Eval("Custom").ToString() == "0"? true:false %>'
                            Text= '<%# Eval("CCPId") %>' CssClass="HiddenCheckBoxText" AutoPostBack="True" 
                                oncheckedchanged="chkDefault_CheckedChanged" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Remove CCP/CP" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRemove" runat="server" Checked='<%# Eval("Active").ToString() == "1"? false:true %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Create Custom CCP/CP" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkCustom" runat="server" 
                                Checked='<%# Eval("Custom").ToString() == "1"? true:false %>'
                                 Text= '<%# Eval("CCPId") %>' CssClass="HiddenCheckBoxText"
                                AutoPostBack="True" oncheckedchanged="chkCustom_CheckedChanged" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                    
                    <asp:TemplateField ItemStyle-Width="50px"  HeaderText="Add/Edit Custom CCP/CP" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                           <asp:LinkButton ID="lkbEditCCP" CommandName='<%# Eval("CCPId")%>' Enabled='<%# Eval("Custom").ToString() == "1"? true:false%>' runat="server" Text="Add/Edit"></asp:LinkButton>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
            </ContentTemplate>            
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCCPByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKitchen" Name="nCCPGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        
    </div>
    <div style="clear:both; margin-top:10px;"></div>
            <div style="margin-left:750px;">              
                <div class="ButtonsCols"  >
                <asp:ImageButton ID="cmdContinue" 
                        ImageUrl="~/images/District Images/ButtonSubmitCCP.jpg" 
                        OnClick="cmdContinue_Click" runat="server" />
                </div>                
                <div class="Clearer"></div>
            </div> 
    <div class="Clearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>  
</asp:Content>

