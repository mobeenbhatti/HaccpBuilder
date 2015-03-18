<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_CCPReview" Title="HACCP Builder | CCP Review" Codebehind="CCPReview.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               CCP/CP REVIEW
               <span style="font-size:10px; margin-left:150px;">
               <%--<asp:ImageButton ID="btnBack" runat="server"   
                   ImageUrl="~/images/buttons/ButtonBackToMain.jpg" onclick="btnBack_Click" />            
               </span>--%>
     </div>               
    </div> 
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
                <div class="Clearer"></div>                
   </div>
    <div class="ContentRight" >                     
            <ucl:Advs id="adv1" runat="server"></ucl:Advs>
    </div>
    <div class="Clearer"></div>
    <div class="ViewPlanClearer">      
    </div>
    <div class="MainHeading">
        <asp:Label ID="lblGroupName" runat="server" Text=""></asp:Label>
    </div>
    <div class="GirdDiv">
           <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>--%>
<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:GridView ID="grdCCP" runat="server" AutoGenerateColumns="False" 
                    SkinID="gridviewSkin" DataSourceID="ObjectDataSource1" 
                    onrowcommand="grdCCP_RowCommand">
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
                        <asp:LinkButton ID="lkbTitle" Text='<%# Eval("CCP") %>' CommandName="CCP" CommandArgument='<%# Eval("CCPId") %>'  runat="server" 
                               ></asp:LinkButton>
                        <%--<asp:HyperLink ID="hlTitle" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("CCP").ToString():Eval("CCP").ToString() %>'
                         NavigateUrl='<%# "~/ControlPanel/District/ViewCCP.aspx?CCPId=" + Eval("CCPId") %>' Target="_blank" runat="server"></asp:HyperLink>--%>
                        <%--<asp:Label ID="lblTitle" Text='<%# Eval("IsAdditional").ToString() == "1"? "Custom Add - " + Eval("Title").ToString():Eval("Title").ToString() %>' runat="server"></asp:Label>--%>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="350px"></ItemStyle>
                    </asp:TemplateField>                    
                    <asp:TemplateField ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="Additional Custom CCP/CP" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="TYPE" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Custom").ToString() == "0"? "USDA Default":"Custom" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>                       
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Add/Edit CCP/CP" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEdit" Text="Edit"  NavigateUrl='<%# Eval("Custom").ToString() == "1"? "~/ControlPanel/District/EditCCP.aspx?CCPId=" + Eval("CCPId") + "&GroupId=" + Eval("CCPGroupId") + "&Review=1&Mode=3":"" %>' runat="server"></asp:HyperLink>
                           <%--<asp:LinkButton ID="lkbEditCCP" CommandName='<%# Eval("CCPId")%>' runat="server" Text="Add/Edit"></asp:LinkButton>--%>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp"
                BackgroundCssClass="overlay"
                PopupDragHandleControlID="panelDragHandle" />
            <br />
             
            <div class="popUpStyle" id="divPopUp" style="display:none;">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" 
                  Height="50px" Width="100%">
                <Fields>
                <asp:TemplateField>
                <ItemTemplate>
                <div class="LogHeading">Food/Process Item (CP and CCP Relationship)</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CCP")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Critical Control Point Requirement</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Requirement")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading">Control Point (CP) Requirement</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "CPRequirement")%>
                </div>
                </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                </asp:DetailsView> 
                <br />                       
                <asp:Button ID="btnClose" runat="server" Text="Close" />
               <br />
            </div> 
            </ContentTemplate>            
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedCCPByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCP">
        <SelectParameters>               
               <asp:ControlParameter ControlID="ddlKitchen" Name="nCCPGroupId" 
                PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        </asp:ObjectDataSource>
        
    </div>
     <div style="clear:both; margin-top:10px;"></div>
            <div style="margin-left:750px;">              
                <div class="ButtonsCols"  >
                <%--<asp:ImageButton ID="cmdContinue" ImageUrl="~/images/buttons/ButtonContinue.gif" 
                        OnClick="cmdContinue_Click" runat="server" />--%>
                <asp:ImageButton ID="btnBack" runat="server"   
                   ImageUrl="~/images/buttons/ButtonBackToMain.jpg" onclick="btnBack_Click" /> 
                </div>                
                <div class="Clearer"></div>
            </div>
   <div class="Clearer"></div>
    <div class="ViewPlanClearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>   
</asp:Content>

