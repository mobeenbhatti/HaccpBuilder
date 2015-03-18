<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCtpat.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.ViewCtpat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
     <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <div class="ph-top"></div>
         <div class="form3">
        <div class="left"> 
       <h2> HACCP-Based Ctpats    </h2>
        </div>    
        <div class="clear"></div>
        </div>
        <asp:Repeater ID="rptCtpat" runat="server" DataSourceID="sqlDSCtpat">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
                                    <%--<table >
                                    <tr>
                                        <td class="SOPHeading" >--%>
                                        <%--<div class="SOPHeading">
                                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                         </div>--%>
                                          <div class="form3">
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