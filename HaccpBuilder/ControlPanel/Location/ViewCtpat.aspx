<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCtpat.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ViewCtpat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>HACCP-Based Ctpats </title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="haccpInner">
        <div  class="BackGround1">
        HACCP-Based Ctpats        
        </div>
        <asp:Repeater ID="rptCtpat" runat="server" DataSourceID="sqlDSCtpat">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
                                    <%--<table >
                                    <tr>
                                        <td class="CtpatHeading" >--%>
                                        <%--<div class="CtpatHeading">
                                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                         </div>--%>
                                          <div>
                                            <%# DataBinder.Eval(Container.DataItem, "CtpatText")%>
                                         </div>
                                         
                               </ItemTemplate>
        <FooterTemplate></FooterTemplate>
        </asp:Repeater>  
            
	</div>
	<asp:SqlDataSource ID="sqlDSCtpat" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
        SelectCommand="uspAdm_GetCtpatById" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>       
            <asp:QueryStringParameter DefaultValue="1" Name="nCtpatId" 
                QueryStringField="CtpatId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>