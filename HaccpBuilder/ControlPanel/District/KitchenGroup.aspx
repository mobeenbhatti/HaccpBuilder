<%@ Page Language="C#" MasterPageFile="CorporateMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_KitchenGroup" Title="HACCP Builder | Kitchen Groups" Codebehind="KitchenGroup.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<style>
td {line-height: 2.0em;}
</style>
<div id="titlediv"><!----HEADER-TITLE-START----->
      <div class="container">
        <div class="page-title">
          <h1>ADD/EDIT VIEW LOCATIONS IN GROUP</h1>
        </div>
      </div>
    </div>
<div class="container">
    <div class="ph-top"></div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="form3">
        <asp:Button ID="cmdContinue" Text="Continue" OnClick="cmdContinue_Click" runat="server" />
    </div>
     <div class="table">
    <div class="box-header">
      <h4 class="left">SITES/LOCATIONS IN THE CORPORATION</h4>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="SqlDataSource1" 
            onrowdatabound="GridView1_RowDataBound" AllowPaging="True" 
            onrowcommand="GridView1_RowCommand">                
                <Columns>
                    <asp:TemplateField ItemStyle-Width="3px" >
	                        <ItemTemplate>
	                            <asp:HiddenField ID="hfKitchenId" Value='<%# DataBinder.Eval(Container.DataItem, "KitchenId")  %>' runat="server" />
	                        </ItemTemplate>
	                        <ItemStyle Width="3px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >                    
                    <asp:TemplateField HeaderText="Location Name" ItemStyle-Width="150px">
	                        <ItemTemplate>
	                            <asp:HyperLink ID="hlKitchen" runat="server" CssClass="link_color" NavigateUrl='<%#"~/ControlPanel/District/CreateKitchen.aspx?KitchenName=" + DataBinder.Eval(Container.DataItem, "Kitchen")%>' Text='<%# DataBinder.Eval(Container.DataItem, "Kitchen")  %>'>
	                            </asp:HyperLink>
	                        </ItemTemplate>
	                        <ItemStyle Width="200px" />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >               
	                    <asp:TemplateField HeaderText="Groups">
	                        <ItemTemplate>
                                <table>
                                <tr>
                                    <td> <asp:Label ID="lblSOP" Text="SOP, SSOP & GMP's" runat="server" CssClass="GridLabel"></asp:Label><br />  <asp:DropDownList ID="ddlSOPGroup" runat="server" DataSourceID="ObjectDataSource1"
	                             DataTextField="GroupName" DataValueField="KitchenGroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                    <td><asp:Label ID="lblChecklist" Text="Checklist" runat="server" CssClass="GridLabel"></asp:Label><br />  <asp:DropDownList ID="ddlFSCL" runat="server" DataSourceID="ObjectDataSource2"
	                             DataTextField="GroupName" DataValueField="CheckListGroupId" CssClass="GridDropDown"></asp:DropDownList> </td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="lblValidation" Text="Validation" runat="server" CssClass="GridLabel"></asp:Label><br />  <asp:DropDownList ID="ddlValidation" runat="server" DataSourceID="ObjectDataSource3"
	                             DataTextField="GroupName" DataValueField="ValidationGroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                    <td><asp:Label ID="lblFoodCategory" Text="Food Category" runat="server" CssClass="GridLabel"></asp:Label><br />  <asp:DropDownList ID="ddlFoodCategory" runat="server" DataSourceID="ObjectDataSource5"
	                             DataTextField="GroupName" DataValueField="FoodCategoryGroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="lblcheckListAddOn" Text="Checklist Add-On" runat="server" CssClass="GridLabel"></asp:Label><br /> <asp:DropDownList ID="ddlChecklist" runat="server" DataSourceID="EntityDataSource1"
	                             DataTextField="GroupName" DataValueField="ChecklistAddOnGroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                    <td><asp:Label ID="lblProcess" Text="Process" runat="server" CssClass="GridLabel"></asp:Label><br /> <asp:DropDownList ID="ddlProcess" runat="server" DataSourceID="ObjectDataSource4"
	                             DataTextField="GroupName" DataValueField="ProcessGroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                </tr>
                                <tr>                                   
                                    <td><asp:Label ID="lblCtpat" Text="C-TPAT" runat="server" CssClass="GridLabel"></asp:Label><br /> <asp:DropDownList ID="ddlCtpat" runat="server" DataSourceID="ObjectDataSource6"
	                             DataTextField="GroupName" DataValueField="GroupId" CssClass="GridDropDown"></asp:DropDownList></td>
                                </tr>
                                </table>
	                            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetProcessGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetSOPGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>  
                                <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodCategoryGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetValidationGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetCheckListGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource> 
                                <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                                ConnectionString="name=Entities" ContextTypeName="DataModel.Entities"
                                DefaultContainerName="Entities" EnableFlattening="False" 
                                EntitySetName="CheckListAddonGroups"
                                Select="it.[CheckListAddonGroupId], it.[GroupName], it.[DistrictId]" OrderBy="it.[CheckListAddonGroupId]" Where="it.[DistrictId] = @DistrictId">
                                <WhereParameters>
                                <asp:SessionParameter DbType="Int32" Name="DistrictId" SessionField="DistrictId" />
                                </WhereParameters>
                                </asp:EntityDataSource> 
                                <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                                    TypeName="SchoolHaccp.BusinessLogic.ProcessGetCtpatGroup">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource> 
	                        </ItemTemplate>
	                        <ItemStyle Width="350px"/>
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField>
	                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Submit" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Button ID="cmdSubmit" CommandName="Submit" runat="server" Text="Submit" />                        
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="50px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetKitchenDetailsByDistrictId" 
        SelectCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                 Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>
    <asp:UpdateProgress ID="updProgress" runat="server"  Visible="true">
     <ProgressTemplate>                     
     <div id="progress">
         <img src="../../images/buttons/ajax-loader1.gif" alt="" />
     </div>                    
     </ProgressTemplate>
     </asp:UpdateProgress>
</div>

             
</asp:Content>

