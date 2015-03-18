<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIndexPrintVendor.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.PlanIndexPrintVendor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Vendors Print"</title>
    <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <%-- Vendors --%>
		<div class="form3 ph-top">
		       <h2> VENDORS DETAIL REVIEW </h2>
		</div>
        <div class="table">
		<div class="box-header">
             HACCP Procedural Questions: All Vendors
        </div>
        <asp:GridView ID="grdHotHolding" runat="server" CssClass="zebra" AutoGenerateColumns="False"  DataSourceID="ObjectDataSource4">                
            <Columns>
	                <asp:TemplateField HeaderText="Entry Date">
	                    <ItemTemplate>
	                        <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >	                    
	                <asp:TemplateField HeaderText="Vendor Name">
	                    <ItemTemplate>
	                    <asp:Label ID="lblName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "VendorName")  %>'></asp:Label>	                            	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Contact Name">
	                    <ItemTemplate>
	                        <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Phone">
	                    <ItemTemplate>
	                        <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >	
	                    <asp:TemplateField HeaderText="Training and Certifications">
	                    <ItemTemplate>
	                        <asp:Label ID="lblTraining" runat="server" Text='<%# Eval("Training").ToString() == "1"? "Yes":"No" %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >	                    
	                <asp:TemplateField HeaderText="Corrective Actions">
	                    <ItemTemplate>
	                        <asp:Label ID="lblCorrective" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CorrectiveAction") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Training and/or Certifications Details">
	                    <ItemTemplate>
	                        <asp:Label ID="lblCertification" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "TrainingDetail") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Verified By">
	                    <ItemTemplate>
	                        <asp:Label ID="lblVerifyBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VerifiedBy") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >
	                <asp:TemplateField HeaderText="Verified Date">
	                    <ItemTemplate>
	                        <asp:Label ID="lblVerifiedDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VarifiedDate","{0:d}") %>'></asp:Label>	                           
	                    </ItemTemplate>
	                    <ItemStyle  />
	                    <HeaderStyle CssClass="gridheaderline" />
	                </asp:TemplateField >	                               
            </Columns>
        </asp:GridView>
        <div class="box-bottom"> </div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetVendorByKitchenId" 
            TypeName="SchoolHaccp.BusinessLogic.ProcessGetVendor">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                    SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>		   
        <div style="page-break-after:always"></div>
        <%-- Customers --%>		
		<div class="form3 ph-top">
		       <h2> CUSTOMERS DETAIL REVIEW</h2>
		</div> 
        <div class="table">
		<div class="box-header">
              HACCP Procedural Questions: All Customers
        </div>
		     <asp:GridView ID="grdCustomers"    runat="server" CssClass="zebra" AutoGenerateColumns="False"   DataSourceID="ObjectDataSource7">                
                <Columns> 
	                    <asp:TemplateField HeaderText="Entry Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Entrydate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Customer Name">
	                        <ItemTemplate>
	                        <asp:Label ID="lblName" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "CompanyName")  %>'></asp:Label>	                            	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                     <asp:TemplateField HeaderText="Contact Name">
	                        <ItemTemplate>
	                            <asp:Label ID="lblDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ContactName") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Phone">
	                        <ItemTemplate>
	                            <asp:Label ID="lblPhone" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Phone") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	
	                     <asp:TemplateField HeaderText="Training and Certifications">
	                        <ItemTemplate>
	                            <asp:Label ID="lblTraining" runat="server" Text='<%# Eval("Training").ToString() == "1"? "Yes":"No" %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >	                    
	                    <asp:TemplateField HeaderText="Corrective Actions">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCorrective" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CorrectiveAction") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Training and/or Certifications Details">
	                        <ItemTemplate>
	                            <asp:Label ID="lblCertification" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "TrainingDetail") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified By">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifyBy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VerifiedBy") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
	                        <HeaderStyle CssClass="gridheaderline" />
	                    </asp:TemplateField >
	                    <asp:TemplateField HeaderText="Verified Date">
	                        <ItemTemplate>
	                            <asp:Label ID="lblVerifiedDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "VarifiedDate","{0:d}") %>'></asp:Label>	                           
	                        </ItemTemplate>
	                        <ItemStyle  />
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
        <div class="box-bottom"> </div>
            <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
		 </div>        
		<div style="page-break-after:always"></div>
		
        <%-- Inventory Items Repeater --%>
       <div class="form3 ph-top">
		       <h2>INVENTORY ITEMS REVIEW</h2>
		</div>
        <div class="table">
		<div class="box-header">
              HACCP Procedural Questions: Inventory Items
        </div>
				<b class="BackGround1"></b>
				<asp:Repeater ID="rptInventory" runat="server" DataSourceID="ObjectDataSource2">
                 <HeaderTemplate>
                    <table class="zebra"> 
                        <tr > 
                        <th class="haccpHeading">Quantity</td> 
                        <th class="haccpHeading" align="left">Item Description</td>
                        </tr> 
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr >        
                        <td class="haccpText"><%#Eval("Quantity")%></td>
                        <td class="haccpText"><%#Eval("Name")%></td>        
                    </tr>     
                 </ItemTemplate>
                 <FooterTemplate>
                 </table>
                 </FooterTemplate>
                 </asp:Repeater>
        <div class="box-bottom"> </div>
        </div>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>		
    </div>
    </form>
</body>
</html>
