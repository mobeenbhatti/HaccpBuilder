<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIndexPrintSop.aspx.cs" Inherits="HaccpBuilder.ControlPanel.District.PlanIndexPrintSop" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div class="haccpInner">  
         <div width="100%">
    <div class="BackGround1"> 
      <b>HACCP-Based SOPs</b>       
    </div>                                         
            <asp:Repeater ID="rptSopMain" runat="server" 
             onitemdatabound="Repeater2_ItemDataBound">  
                <ItemTemplate>               
             <div>   
                <asp:Repeater ID="rptSOP" runat="server">
                <ItemTemplate>
                    <div style="font-family:Verdana; font-size:large; text-align:center;" >
                       <strong><%# DataBinder.Eval(Container.DataItem, "Title")%></strong>
                    </div>
                    <div>
                        <%# DataBinder.Eval(Container.DataItem, "SOPText")%>
                    
                     <div>			
                        <hr />		
                    </div>  
                    </div>                  
                    <div style="page-break-after:always"></div>
                </ItemTemplate>
                </asp:Repeater>              
                <asp:HiddenField ID="hfSOPId" Value='<%# Eval("KitchenSOPId") %>' runat="server" />
             </div>
        </ItemTemplate>           
        </asp:Repeater>
        <!---------- C-TPAT --------------->
        <asp:Repeater ID="rptCtpatMain" runat="server" 
               onitemdatabound="rptCtpatMain_ItemDataBound">  
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
          <asp:SqlDataSource ID="sqlDSSOP" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
            SelectCommand="uspAdm_GetSOPsBykitchenId" SelectCommandType="StoredProcedure">
            <SelectParameters>
            <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDsCtpat" runat="server" ConnectionString="<%$ ConnectionStrings:HaccpConnectionString %>" 
            SelectCommand="uspAdm_GetCtpatsBykitchenId" SelectCommandType="StoredProcedure">
            <SelectParameters>
            <asp:SessionParameter DefaultValue="&quot;&quot;" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>   
		
		</div>
     </div>
    </form>
</body>
</html>
