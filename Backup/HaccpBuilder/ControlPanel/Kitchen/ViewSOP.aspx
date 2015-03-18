<%@ Page Language="C#" AutoEventWireup="true" Theme="Facility" Inherits="ControlPanel_Kitchen_ViewSop" Title="HACCP Builder | SOP" Codebehind="ViewSOP.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>   
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <div class="ph-top"></div>
        <h2> HACCP-Based SOP, SSOP & GMPs</h2>
        <asp:Repeater ID="rptSOP" runat="server" DataSourceID="sqlDSSOP">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
                <div class="form3">
                <label><%# DataBinder.Eval(Container.DataItem, "SOPText")%></label>
                </div>                  
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
      </asp:Repeater>  
            
	</div>
	<asp:SqlDataSource ID="sqlDSSOP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetSOPById" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:QueryStringParameter DefaultValue="1" Name="nSOPId" 
                QueryStringField="SOPId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
