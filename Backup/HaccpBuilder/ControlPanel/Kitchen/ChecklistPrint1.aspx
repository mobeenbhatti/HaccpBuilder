<%@ Page Language="C#"   AutoEventWireup="true" Inherits="ControlPanel_Kitchen_ChecklistPrint" Title="HACCP Builder | Food Safety Checklist " Codebehind="ChecklistPrint1.aspx.cs" %>
<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
    <div>
        <div class="MainHeading">
        <asp:Label ID="lblInfo" runat="server" Text="FOOD SAFETY CHECK LIST"></asp:Label>
        </div>
        <div class="SmallClearer"></div> 
            <div class="ContentLeft" >
                <div class="ContactDetail">
                </div>       
            </div>
            <div class="ContentRight" >                     
            </div>            
            <div class="Clearer"></div>
            <div class="ViewPlanClearer"></div>            
     </div>
     <div class="GirdDiv"> 
              
            <asp:GridView ID="grdQuestion" runat="server" AutoGenerateColumns="False" 
            SkinID="gridviewSkin" DataSourceID="ObjectDataSource1"
               onrowdatabound="grdQuestion_RowDataBound" >
                <Columns>
                    <asp:TemplateField ItemStyle-Width="2px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfSection" runat="server" Value='<%# Eval("Section") %>' />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="5px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Category" ItemStyle-Font-Bold="true" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lkbCategory" Text='<%# Eval("Section") %>'  runat="server"></asp:Label>
                       </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="100px"></ItemStyle>
                    </asp:TemplateField>                      
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Question" HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>                                               
                        <asp:Label ID="lblQuestion" Text='<%#  Eval("Question") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle  CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle  Width="350px"></ItemStyle>
                    </asp:TemplateField>                     
                    <asp:TemplateField ItemStyle-Width="50px" HeaderText="Answers" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                        <asp:Label ID="lblIsAdditional" Text='<%# Eval("Answer").ToString() == "1"? "Yes":"No" %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                    </asp:TemplateField>
	                <asp:TemplateField ItemStyle-Width="50px" HeaderText="Corrective Action" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-CssClass="gridheaderline">
                        <ItemTemplate>
                            <asp:Label ID="lblType" Text='<%# Eval("CorrectiveAction") %>' runat="server"></asp:Label>                            
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" CssClass="gridheaderline"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                    </asp:TemplateField>
                </Columns>                
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetResponsesByHistoryId" 
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="nHistoryId" 
                        SessionField="HistoryId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
           
    </div>
</asp:Content>

