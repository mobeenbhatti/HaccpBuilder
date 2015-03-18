<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.master" AutoEventWireup="true" CodeBehind="ChecklistQuestionReview.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistQuestionReview" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" runat="server">

<div class="row">
	<table  class="table table-striped table-hover"> 
                         
                <tr>
                  <td colspan="3"><h3><b>Section Name: <asp:Label ID="lblSection" runat="server"></asp:Label></h3></td>                  
                </tr>
                 <tr>
                   <td colspan="3">&nbsp;</td>                  
                </tr>  
                <tr>
                  <td>Observer:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:Label ID="lblObserverValue" Text="" runat="server"></asp:Label></td>
                </tr> 
                <tr>
                  <td>Entry Date:</td>
                  <td><img src="../../images/District Images/spacer.gif" width="10" height="25" /></td>
                  <td><asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label></td>
                </tr>                
   </table>
   </div>
   <div class="clear tenpx"></div> 
   <div class="row">
            <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-hover">
                <Columns>                  
                    <asp:BoundField DataField="Checklist" ItemStyle-Width="250px" HeaderText="Question" >
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="250px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:Label ID="lblAnswer" Text='<%# Eval("BoolResponse") != null ? Eval("BoolResponse").ToString() == "1"? "Yes":Eval("BoolResponse").ToString() == "2"?"NA":"No" : "" %>'  runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="80px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OFResponse" ItemStyle-Width="200px" HeaderText="Remarks">
                    <HeaderStyle CssClass="gridheaderline"></HeaderStyle>
                    <ItemStyle Width="200px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Label ID="lblCorrectiveAction" Text='<%# Eval("CorrectiveAction").ToString() %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="200px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="cmdContinue" Text="Confirm" CssClass="btn btn-primary"
                runat="server" onclick="cmdContinue_Click"  />
   </div>         

</asp:Content>
