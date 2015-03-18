<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_District_ViewSop" Title="HACCP Builder | SOP" Codebehind="ViewSOP.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
       <h2> HACCP-Based SOPs    </h2>
        </div>    
        <div class="clear"></div>
        </div>
        <asp:Repeater ID="rptSOP" runat="server" DataSourceID="sqlDSSOP">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
                                    <%--<table >
                                    <tr>
                                        <td class="SOPHeading" >--%>
                                        <%--<div class="SOPHeading">
                                            <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                         </div>--%>
                                          <div class="form3">
                                            <%# DataBinder.Eval(Container.DataItem, "SOPText")%>
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
