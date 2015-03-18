<%@ Page Language="C#" AutoEventWireup="true"  Inherits="ControlPanel_Location_ViewSop" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" Title="HACCP Builder | SOP" Codebehind="ViewSOP.aspx.cs" %>


<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1>HACCP-Based SOPs</h1> 
            </div>       
        </div>        
         <div class="row">
        <asp:Repeater ID="rptSOP" runat="server" DataSourceID="sqlDSSOP">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
                                    <%--<table >
                                    <tr>
                                        <td class="SOPHeading" >--%>
                                       
                                        <div class="col-lg-12">                                            
                                            <h3><%# DataBinder.Eval(Container.DataItem, "Title")%></h3>
                                         
                                         
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
</asp:Content>  
