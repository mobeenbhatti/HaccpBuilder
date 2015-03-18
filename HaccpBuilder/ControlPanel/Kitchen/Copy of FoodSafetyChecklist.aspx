<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage2.master" Theme="Default" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_FoodSafetyChecklist" Title="SchoolHaccp | Food Safety Checklist" Codebehind="Copy of FoodSafetyChecklist.aspx.cs" %>



<%@ Register Src="~/Controls/ContactDetail.ascx" TagPrefix="Contact" TagName="Detail" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

<asp:Content ID="content" ContentPlaceHolderID="PlaceHolder" runat="server">
<script language="javascript" type="text/javascript">
  function check(txtobj,vldObj, enable)
  {
    if(enable == false)
    {
   
     ValidatorEnable(vldObj, false); 
     txtobj.disabled=true;
     txtobj.value = "";
    }
    else
    { 
   
     ValidatorEnable(vldObj, true);  
     txtobj.disabled=false;
    }
   
  }
</script>
        <div>
        <div class="MainHeading"></div>
        <div class="SmallClearer"></div> 
            <div class="ContentLeft" >
                <div class="ContactDetail">
                    <Contact:Detail ID="cd" runat="server" />
                </div>       
            </div>
            <div class="ContentRight" >                     
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>            
            <div class="Clearer"></div>
            <div class="ViewPlanClearer"></div>            
        </div>
        <div class="Heading">
            Food Safety Checklist
        </div>
        <div class="GirdDiv">
            <b>Directions:</b> Use this checklist weekly to 
            determine areas in your operations requiring corrective action.
	        Record corrective action taken and keep completed records in a notebook for future reference.
        </div>
        <div style="margin-left:15px;">
        <asp:Panel ID="pnlObserver" runat="server">	
	        <asp:Label ID="lblObserver" Text="Observer" runat="server"></asp:Label>
	        <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox></td>
	    </asp:Panel>	
        </div>
        <div class="Heading">
            <asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
        </div>
            
        <div class="GirdDiv">
        <asp:GridView ID="grdSafetyChecklist" runat="server" AutoGenerateColumns="false" 
                SkinID="gridviewSkin" onrowdatabound="grdSafetyChecklist_RowDataBound">
            <Columns>
                <asp:TemplateField  ItemStyle-Width="10px">
                    <ItemTemplate>
                    <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "QuestionId") %>' runat="server" />                    
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField  ItemStyle-Width="10px">
                    <ItemTemplate>
                    <asp:Label ID="lblQuestionId" Text = '<%# DataBinder.Eval(Container.DataItem, "SortOrder") %>' runat="server"></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="Question" ItemStyle-Width="350px" HeaderText="Question" />                
                <asp:TemplateField HeaderText="Answer" ItemStyle-Width="80px">
                    <ItemTemplate >
                        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
                        <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Corrective Action" ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false" Width="200px" Height="30px"   runat="server" ></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Static" Enabled="true" 
                         ErrorMessage="You must supply a corrective action or select Yes." ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--<asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal" onitemdatabound="DataList1_ItemDataBound" >
        <    
        <ItemTemplate >        
       <asp:Label ID="lblQuestionId" Text = '<%#  DataBinder.Eval(Container.DataItem, "QuestionId")%>' runat="server"></asp:Label> 
        <%# DataBinder.Eval(Container.DataItem,"Question") %></td> 
        <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
       <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
      
        <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false"   runat="server" ></asp:TextBox> </td>
   <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" 

Display="Static"  Enabled="true" 
        ErrorMessage="You must supply a corrective action or select Yes." 

ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
        
 
    </ItemTemplate>   
    
    </asp:DataList>--%>            
           
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetQuestionsDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessFoodSafetyQuestions">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="0" 
                Name="tnPageIndex" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetResponsesDataSet" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetFoodSafetyReponse">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" 
                SessionField="KitchenId" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nHistoryId" 
                SessionField="HistoryId" Type="Int32" />
            <asp:ControlParameter ControlID="lblIteration" DefaultValue="1" 
                Name="nPageIndex" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
        </div>
        <div style="clear:both; margin-top:10px;"></div>                      
            <div class="ContentLeft">
            </div>
            <div class="ContentRight">
                <div style="float:left; margin-left:250px;">
                 <asp:ImageButton ID="btnBack" runat="server"  onclick="btnBack_Click" ImageUrl="~/images/buttons/ButtonBack.gif" />
                 </div>
                <div style="float:left; margin-left:5px;">
                <asp:ImageButton ID="btnContinue" runat="server" onclick="Button1_Click" ImageUrl="~/images/buttons/ButtonContinue.gif" />
                </div>   
            </div>    
            <div class="Clearer"></div>
        <div class="PageFooter">
            <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
        </div>       
        <asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label>
    <%--</center>--%>
</asp:Content>


