<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_CCPGroup" Title="HACCP Builder | Create CCP Group" Codebehind="CCPGroup.aspx.cs" %>

<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div >
      <div class="MainHeading">
               CREATE CUSTOM CCP AND CP REQUIREMENTS GROUP NAME
               <span style="font-size:10px; margin-left:140px;">
               <a href="DistrictControl.aspx"><img src="../../images/buttons/ButtonBackToMain.jpg" alt="" /></a>            
               </span>
     </div>               
    </div>        
    <div>
        <div class="ContentLeft" >
                <div class="ContactDetail">
                    <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>
                <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Add/Create New CCP/CP Group:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtCCPGroup" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearch" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearch_Click" />
                    </div>
                </div>
                <div style="margin-left:10px; margin-right:10px; margin-top:10px; font-family:Verdana; font-size:14px; font-weight:bold; color:Red;">
                    <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
                </div>                 
                <div class="Buttons">
                   <div class="FloatLeft">
                   <asp:ImageButton ID="btnCreateCustomCCP"  runat="server"  
                           ImageUrl="~/images/District Images/ButtonGoToAssignKitchen.jpg" 
                           onclick="btnCreateCustomCCP_Click"/>
                   </div>                   
                   <div class="Clearer" style="margin-top:15px"></div>                   
                   <%--<div class="FloatLeft">
                   </div> 
                   <div class="Clearer" style="margin-top:15px"></div>--%>
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
                  <div style="margin-top:55px; clear:both;"></div> 
                
        </div>             
        <div class="Clearer"></div>
        <%--<div class="ViewPlanClearer"></div>  --%>          
    </div>
    <div style="margin-left:10px; margin-right:10px; font-family:Arial;">
        <b> 1.  CREATING A CUSTOM CCP GROUP: </b> Type in the name you want to call the Custom CCP Group you wish to create and then click GO<br />
        <b> 2.  TO EDIT AND CUSTOMIZE CCP's IN GROUP:</b>  Now to change the CCP's in the group, simply click on the Add/Edit hotlink to the right of the GROUP name you created below to customize your individual CCPs<br />
    </div>
    <div class="Clearer"></div>  
    <div class="GirdDiv">
            <asp:GridView ID="grdCCPGroup" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin" AllowPaging="True" 
                PageSize="20">                
                <Columns>                 
                    <asp:BoundField DataField="GroupName" HeaderText="CCP/CP Group Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
	                <asp:TemplateField ItemStyle-Width="50px"  HeaderText="Add/Edit CCP/CP" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditCCP" runat="server" Text="Add/Edit" NavigateUrl='<%# "~/ControlPanel/District/CustomCCP.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "CCPGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Locations in Group"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditCCP" runat="server"  Text="View" NavigateUrl='<%# "~/ControlPanel/District/ViewCCPKitchen.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "CCPGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="View CCP/CP"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditCCP" runat="server" Text="View CCP's" NavigateUrl='<%# "~/ControlPanel/District/CCPReview.aspx?GroupId=" + DataBinder.Eval(Container.DataItem, "CCPGroupId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>          
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetCCPGroup">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nDistrictId" 
                SessionField="DistrictId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <div class="Clearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>               
</asp:Content>

