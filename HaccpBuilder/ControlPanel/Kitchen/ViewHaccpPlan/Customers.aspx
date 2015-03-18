<%@ Page Language="C#" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ViewHaccpPlan_Customers" Codebehind="Customers.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div id="container">
    <div style="overflow:visible; height:50%;">
    <table >
		
			<%-- Customers --%>
	 
	
		<tr>
		    <td style="background-color:#99ccff; color: #000;">
		       
		       <h2> CUSTOMERS DETAIL REVIEW <h2>
		    </td>
		</tr>
		<tr>
		    <td style="background-color:#c0c0c0">
		        HACCP Procedural Questions: All Customers
		    </td>
		</tr>
		<tr>
		</tr>
		<tr>
		    <td>
		         <asp:GridView ID="grdCustomers"    runat="server" SkinID="gridviewHeadSkin" AutoGenerateColumns="False" 
                    DataSourceID="ObjectDataSource7">                
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
            <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerByKitchenId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetCustomer">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
              </asp:ObjectDataSource>
		    </td>
		</tr>
		
		</table>
    </div>
    </div>
    </form>
</body>
</html>
