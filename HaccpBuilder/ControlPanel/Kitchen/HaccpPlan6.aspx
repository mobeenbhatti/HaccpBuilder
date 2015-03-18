<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HaccpPlan6.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.HaccpPlan6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="haccpInner">      
    <!-- PLACE Ctpat DETAILVIEW HERE -->        
	<div width="100%">
    <div class="BackGround1"> 
      <b>C-TPAT</b>       
    </div>                                         
            <asp:Repeater ID="Repeater2" runat="server" 
                DataSourceID="sqlDSCtpat" onitemdatabound="Repeater2_ItemDataBound">  
                <ItemTemplate>               
             <div>   
                <asp:Repeater ID="rptCtpat" runat="server">
                <ItemTemplate>
                    <div style="font-family:Verdana; font-size:large; text-align:center;" >
                       <strong><%# DataBinder.Eval(Container.DataItem, "Title")%></strong>
                    </div>
                    <div>
                        <%# DataBinder.Eval(Container.DataItem, "CtpatText")%>
                    
                     <div>			
                        <hr />		
                    </div>  
                    </div>                  
                    <div style="page-break-after:always"></div>
                </ItemTemplate>
                </asp:Repeater>              
                <asp:HiddenField ID="hfCtpatId" Value='<%# Eval("KitchenCtpatId") %>' runat="server" />
             </div>
        </ItemTemplate>           
        </asp:Repeater>
          <asp:SqlDataSource ID="sqlDSCtpat" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
            SelectCommand="uspAdm_GetCtpatsBykitchenId" SelectCommandType="StoredProcedure">
            <SelectParameters>
            <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>  
		
		</div>
        <div style="page-break-after:always"></div>
    </div>
    </form>
</body>
</html>
