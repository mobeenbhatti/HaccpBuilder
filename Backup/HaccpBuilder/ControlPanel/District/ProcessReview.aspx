<%@ Page Title="" Language="C#" MasterPageFile="CorporateMaster.master" AutoEventWireup="true"  Inherits="ControlPanel_District_ProcessReview" Codebehind="ProcessReview.aspx.cs" %>
<%@ Register src="../../Controls/DistrictAddrssNew.ascx" tagname="DistrictAddrssNew" tagprefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div id="titlediv">
     <div class="container">
        <div class="page-title">
          <h1> Process Review  </h1>
        </div>
      </div>
</div>
<div class="container">
    <div class="ph-top">
        <asp:Label ID="lblMeassage" Text="" Visible="false" runat="server" CssClass="msg-error"></asp:Label>
    </div>
    <div class="form3">
        <div class="left">
             Select Process Group : <asp:DropDownList ID="ddlKitchen" runat="server" DataSourceID="ObjectDataSource2"
	                             DataTextField="GroupName" DataValueField="ProcessGroupId" AppendDataBoundItems="true"
                            Height="30px" Width="250px" Font-Names="Verdana"                            
                            AutoPostBack="True">
                            <asp:ListItem Text=" -- SELECT VALUE -- " Value="" />
                            </asp:DropDownList>                       
           
        </div>
         <div class="clear"></div>
    </div>
    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="table">
    <div class="box-header">
      <h4 class="left">List of Groups</h4>
    </div>
     <asp:GridView ID="grdProcess" runat="server" AutoGenerateColumns="False" CssClass="zebra" DataSourceID="ObjectDataSource1" 
                    onrowcommand="grdProcess_RowCommand">
                <Columns>
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:HiddenField ID="hfProcessId" runat="server" Value='<%# Eval("ProcessId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField  HeaderText="Standard USDA Processes" >
                        <ItemTemplate>
                       <asp:LinkButton ID="lkbTitle" Text='<%# Eval("ProcessShortName") %>' CommandName="Process" CommandArgument='<%# Eval("ProcessId") %>'  runat="server" 
                        ></asp:LinkButton>
                       <%-- <asp:Label ID="lblTitle" Text='<%# Eval("Additional").ToString() == "1"? "Custom Add - " + Eval("ProcessShortName").ToString():Eval("ProcessShortName").ToString() %>' runat="server"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField  HeaderText="Additional Custom Processes" >
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Additional").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
	                <asp:TemplateField HeaderText="TYPE" >
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("Custom").ToString() == "0"? "USDA Default":"Custom" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    </asp:TemplateField>  
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
    </div>
    <asp:Button runat="server" ID="btnShowModalPopup" style="display:none"/>
             <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                TargetControlID="btnShowModalPopup"
                PopupControlID="divPopUp"
                BackgroundCssClass="overlay"
                PopupDragHandleControlID="panelDragHandle"                
                />
            <br />
             
            <div class="popUpStyle" id="divPopUp" style="display:none;">
                <asp:Panel runat="Server" ID="panelDragHandle" CssClass="drag">
                    Hold here to Drag this Box</asp:Panel>                
               <asp:DetailsView ID="dtvSOPOld" runat="server" AutoGenerateRows="False" 
                  Height="50px" Width="100%">
                <Fields>
                <asp:TemplateField>
                <ItemTemplate>
                <div class="LogHeading">Process Name</div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "ProcessName")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "ProcessShortName")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field1")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field2")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field3")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field4")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field5")%>
                </div>
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field6")%>
                </div>          
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field7")%>
                </div>          
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field8")%>
                </div>          
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field9")%>
                </div>          
                <div class="Clearer"></div>
                <div class="LogHeading"></div>
                <div class="FloatLeft">
                <%# DataBinder.Eval(Container.DataItem, "Field10")%>
                </div>               
                </ItemTemplate>
                </asp:TemplateField>
                </Fields>
                </asp:DetailsView> 
                <asp:DetailsView ID="dtvSOP" runat="server" AutoGenerateRows="False" Height="50px" Width="100%" >    
                       <HeaderTemplate>
                        <table cellpadding="10"> 
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
                   <td>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProcessText") %>' ></asp:Label>
                   </td>
                   </tr>                  
                   </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterTemplate>
                            </table>
                            </FooterTemplate>
                        </asp:DetailsView>
                <br />                       
                <asp:Button ID="btnClose" runat="server" Text="Close" />
               <br />
            </div> 
            </ContentTemplate>            
            </asp:UpdatePanel>
</div>   
 <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSelectedProcessByGroupId" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetProcess">
        <SelectParameters>               
               <asp:ControlParameter ControlID="ddlKitchen" Name="nProcessGroupId" 
                PropertyName="SelectedValue" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        </asp:ObjectDataSource>
  <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
                        TypeName="SchoolHaccp.BusinessLogic.ProcessGetProcessGroup">
                        <SelectParameters>
                            <asp:SessionParameter Name="nDistrictId" SessionField="DistrictId" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>  
</asp:Content>
