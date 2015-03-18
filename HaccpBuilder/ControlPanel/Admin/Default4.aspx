<%@ Page Language="C#" MasterPageFile="~/ControlPanel/AdminMaster.master" Theme="Default" AutoEventWireup="true" Inherits="ControlPanel_Admin_Default" Title="Admin Panel" Codebehind="Default4.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
     <div >
         <div class="MainHeading">
              ADMIN CONTROL PANEL               
         </div>            
    </div>        
    <div>
        <div class="ContentLeft" >                            
                <div class="Buttons">
                   <div class="FloatLeft">
                       <asp:ImageButton ID="cmdCreateDistrict" runat="server" 
                           ImageUrl="~/images/District Images/buttonCreateDistrict.jpg" 
                           onclick="cmdCreateDistrict_Click"/> 
                   </div>
                   <div class="Clearer"></div>
                   <div class="ViewPlanClearer"></div>
                   <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search for A District:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtDistrict" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByDistrict" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByDistrict_Click"  />
                    </div>
                    </div>
                   <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By  District User:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtDistrictUser" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByDistrictUser" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByDistrictUser_Click"  />
                    </div>
                    </div>
                    <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By District Type:</div>
                    <div class="DistrictSearchCol2">
                        <asp:DropDownList ID="ddlDistrictType" runat="server" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="0" />
			                <asp:ListItem Value="1">Paid</asp:ListItem>
                            <asp:ListItem Value="2">Free Trial</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
			            </asp:DropDownList>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByDistrictType" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByDistrictType_Click"  />
                    </div>
                    </div>
                    <div class="DistrictSearchDiv">
                    <div class="DistrictSearchCol1">Search By District Id:</div>
                    <div class="DistrictSearchCol2">
                        <asp:TextBox ID="txtDistrictId" runat="server" Width="200px" CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="DistrictSearchCol3">
                        <asp:Button ID="cmdSearchByDistrictId" runat="server" Text="GO" Width="87px" 
                            CssClass="ButtonSearch" onclick="cmdSearchByDistrictId_Click"  />
                    </div>
                    </div>                                     
                   <div class="Clearer" style="margin-top:15px"></div>
                </div>
                <div class="Clearer"></div>                
          </div>
        <div class="ContentRight" >              
        </div>             
        <div class="Clearer"></div>
        <div class="ViewPlanClearer"></div>            
    </div> 
     <div style="margin-left:10px; margin-right:10px; margin-top:10px; font-family:Verdana; font-size:14px; font-weight:bold; color:Red;">
        <asp:Label ID="lblInfo" Text="" Visible="false" runat="server"></asp:Label>
    </div> 
    <div class="GirdDiv">
            <asp:ScriptManager ID="scpAjax" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="udpDistrict" runat="server">
            <ContentTemplate>
            <asp:GridView ID="grdDistrict" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource1"  SkinID="gridviewSkin" AllowPaging="True" 
                AllowSorting="True" onrowcommand="grdDistrict_RowCommand" 
                onrowdatabound="grdDistrict_RowDataBound" >                
                <Columns>                                   
                    <asp:BoundField DataField="Name" HeaderText="District Name" SortExpression="Name" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
	                <asp:TemplateField ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" SortExpression="DistrictType"  ItemStyle-HorizontalAlign="Center" HeaderText="District Type" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblDistrictType" Text='<%# Eval("DistrictType") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField> 
                    <asp:TemplateField ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="District Printing" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblDistrictPrinting" Text='<%# Eval("DistrictPrinting").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                      
                   <asp:BoundField DataField="DistrictId" HeaderText="District ID" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="UserId" HeaderText="User Name" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline" HorizontalAlign="Center"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="District Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblActive"  Text='<%# Eval("Active").ToString() == "1"? "Active":"InActive" %>' runat="server"></asp:Label> 
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Kitchens" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlViewKitchen" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Admin/ViewKitchen.aspx?DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <%--<asp:TemplateField ItemStyle-Width="50px" HeaderText="District On/Off" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditSOp" runat="server" Text="ON" NavigateUrl= "~/ControlPanel/District/SOPReview.aspx"></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>--%>
                    <%--<asp:TemplateField ItemStyle-Width="50px" HeaderText="Create Account" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlDistrictType" runat="server" AppendDataBoundItems="true" Width="200px" 
				            CssClass="DropDown" >
				            <asp:ListItem Text=" -- SELECT VALUE -- " Value="0" />
			                <asp:ListItem Value="1">Paid</asp:ListItem>
                            <asp:ListItem Value="2">Free Trial</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
			            </asp:DropDownList>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>--%>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="District Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditDistrict" runat="server"  Text="Edit" NavigateUrl='<%# "~/ControlPanel/Admin/CreateDistrict.aspx?DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Select" HeaderStyle-CssClass="gridheaderline">
                     <ItemTemplate>
                       <asp:LinkButton ID="lkbDelete" 
                         CommandArgument='<%# Eval("DistrictID") %>' 
                         CommandName="Delete" runat="server">
                         Delete</asp:LinkButton>
                     </ItemTemplate>
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                   </asp:TemplateField>--%>
                   <%--<asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="gridheaderline">
                   <ItemTemplate>
                        <asp:LinkButton ID="lkbChecks" runat="server" Text="Delete" CommandArgument='<%# Eval("DistrictID") %>' CommandName="Delete"></asp:LinkButton>
                       <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="lkbChecks"  ConfirmText="Are you sure about deleting this record" runat="server">
                       </cc1:ConfirmButtonExtender>
                   </ItemTemplate>
                   </asp:TemplateField>--%>
                   <%--<asp:TemplateField HeaderText=”Delete” >
                    <ItemStyle CssClass=”grid-column-buttons” />
                    <ItemTemplate>
                        <asp:ImageButton ID="ibDelete" runat="server"
                            CausesValidation="False" CommandName="Delete"
                            ImageUrl="~/Images/icon-delete.gif" />                            
                        <ajaxToolkit:ConfirmButtonExtender ID="ConfirmBtExt1″
                            runat="server" TargetControlID="ibDelete"
                            ConfirmText='Are you sure about deleting this record?' />                            
                    </ItemTemplate>
                </asp:TemplateField>--%>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>           
            <!-- Search Grid -->
            <asp:GridView ID="grdDistrictSearch" runat="server" AutoGenerateColumns="False" 
                 SkinID="gridviewSkin" AllowPaging="True" Visible="false"
                AllowSorting="True" onrowcommand="grdDistrictSearch_RowCommand">                
                <Columns>                                   
                    <asp:BoundField DataField="Name" HeaderText="District Name" SortExpression="Name" ItemStyle-Width="150px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
	                <asp:TemplateField ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" SortExpression="DistrictType" ItemStyle-HorizontalAlign="Center" HeaderText="District Type" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblDistrictType" Text='<%# Eval("DistrictType") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                    
                    
                    <asp:TemplateField ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="District Printing" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblDistrictType" Text='<%# Eval("DistrictPrinting").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                      
                   <asp:BoundField DataField="DistrictId" HeaderText="District ID" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="UserId" HeaderText="User Name" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Kitchens" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlViewKitchen" runat="server" Text="View" NavigateUrl='<%# "~/ControlPanel/Admin/ViewKitchen.aspx?DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                   
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="District Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditDistrict" runat="server"  Text="Edit" NavigateUrl='<%# "~/ControlPanel/Admin/CreateDistrict.aspx?DistrictId=" + DataBinder.Eval(Container.DataItem, "DistrictId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <%--<asp:TemplateField ItemStyle-Width="50px" HeaderText="District Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlDeleteDistrict" runat="server" Text="Delete" NavigateUrl="~/ControlPanel/District/SOPReview.aspx"></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>--%>
                </Columns>
                <PagerSettings Mode="Numeric" />
                <PagerStyle CssClass="gridPager" HorizontalAlign="Center" />
            </asp:GridView>
            <div class="Clearer"></div>            
            <div class="ViewPlanClearer"></div>            
            <asp:GridView ID="grdFreeTrail" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource2"  SkinID="gridviewSkin" AllowPaging="True" 
                onrowcommand="grdFreeTrail_RowCommand">                
                <Columns>    
                    <asp:BoundField DataField="DistrictName" HeaderText="Free Trial District Name" ItemStyle-Width="50px" 
                        HeaderStyle-CssClass="gridheaderline" >
                        <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>  
                    <asp:BoundField DataField="EmailAddress" HeaderText="Email" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="100px"></ItemStyle>
                    </asp:BoundField>         
                    <asp:BoundField DataField="NumberOfKitchens" HeaderText="Number Of Kitchens" 
                        HeaderStyle-CssClass="gridheaderline" ItemStyle-Width="50px" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>  
	                <%--<asp:TemplateField ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="District Type" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlDistrictType" runat="server" Text="Add/Edit" NavigateUrl="~/ControlPanel/District/CustomSOP.aspx"></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>--%>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Create District" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditDistrict" runat="server"  Text="Create" NavigateUrl='<%# "~/ControlPanel/Admin/CreateDistrict.aspx?RequestId=" + DataBinder.Eval(Container.DataItem, "FreeTrialRequestId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>                  
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Delete Request" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkbDelete" runat="server" Text="Delete" CommandName="Remove" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FreeTrialRequestId") %>' ></asp:LinkButton>
                           <cc1:ConfirmButtonExtender ID="cbeDelete" ConfirmText="Are you sure about deleting this record" TargetControlID="lkbDelete" runat="server"></cc1:ConfirmButtonExtender>
                           
                            <%--<asp:HyperLink ID="hlDeleteDistrict" runat="server" Text="Delete" NavigateUrl="~/ControlPanel/District/SOPReview.aspx"></asp:HyperLink>--%>
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDistrictDetail" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDistrict">
        </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetFreeTrialRequestDetail" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetFreeTrialRequest">
            </asp:ObjectDataSource>
    </div>
    <div class="Clearer"></div>
    <div class="ViewPlanClearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>    
    
</asp:Content>

