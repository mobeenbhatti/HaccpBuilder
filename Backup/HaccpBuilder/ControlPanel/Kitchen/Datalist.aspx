<%@ Page Language="C#" MasterPageFile="~/ControlPanel/MasterPage.master" AutoEventWireup="true" Inherits="ControlPanel_Kitchen_Datalist" Title="Untitled Page" Codebehind="Datalist.aspx.cs" %>

<%@ Register src="../../Controls/ContactDetail.ascx" tagname="ContactDetail" tagprefix="uc2" %>


<%@ Register src="../../Controls/Advertisement.ascx" tagname="Advertisement" tagprefix="uc1" %>





<asp:Content ID="Content2" ContentPlaceHolderID="cphTopLeft" Runat="Server">
    <table width="100%">
    <tr>
    <td>
        <uc2:ContactDetail ID="ContactDetail1" runat="server" />
     </td>
    </tr>
    </table>
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphTopRight" Runat="Server">    
    <table width="100%"  >
    <tr>
        <td>        
            <uc1:Advertisement ID="Advertisement1" runat="server" />        
        </td>
    </tr>   
    </table>      
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphMainContent" Runat="Server">


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
	
	<table width="100%">
	<tr>
	  
	    <td width="90%"></td>
	</tr>
	<tr>
	  
	    <td width="90%" align="left"><h1>Food Safety Checklist</h1></td>
	</tr>
	<tr>
	  
	    <td width="90%" align="left"><b>Directions:</b> Use this checklist weekly to 

determine areas in your operations requiring corrective action.
	      Record corrective action taken and keep completed records in a notebook for 

future reference.</td>
	</tr>
	<tr>
	
	</tr>
	<tr>
	 
	    <asp:Panel ID="pnlObserver" runat="server">	
	    <td width="90%" align="left"><asp:Label ID="lblObserver" Text="Observer" 

runat="server"></asp:Label>
	    <asp:TextBox ID="txtObserver" runat="server" ></asp:TextBox></td>
	    </asp:Panel>	
	</tr>
	</table>
	<table width="100%" cellspacing="2" >
	<tr>
	    <td colspan="4" ></td>
	</tr>
	<tr>
	    <td width="5%"></td>
       <td  width="50%" align="left" ><asp:Label ID="lblSection" runat="server" 
               Font-Bold="True" Font-Size="Larger"></asp:Label> </td>
       <td  width="15%" align="left"> </td>
       <td   width="20%" align="left"></td>
	</tr>
	<tr>
	    <td colspan="4" ></td>
	</tr>
	<tr>
   <th width="5%"></th>
       <th   width="50%" align="left" > Question</th>
       <th  width="15%" align="left">Answer </th>
       <th   width="20%" align="left">Corrective Action</th>
    </tr>
    <tr>
        <td colspan="5">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
        RepeatDirection="Horizontal" CellSpacing="13" 
       onitemdatabound="DataList1_ItemDataBound" >
    
        <ItemTemplate>
    <tr>      
       <td width="5%"><asp:Label ID="lblQuestionId" Text = '<%#  DataBinder.Eval(Container.DataItem, "QuestionId")%>' runat="server"></asp:Label></td> 
       <td align="left" width="50%"> <%# DataBinder.Eval(Container.DataItem,"Question") %></td> 
       <td width="15%"> <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" /> 
       <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer"  runat="server" /> 
       </td> 
        <td width="20%"> <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Enabled="false"   runat="server" ></asp:TextBox> </td>
   </tr>
   <tr>
      
       <th width="5%">  </th>
       <th   width="50%" align="left" > </th>
       <th  width="15%" align="left">  </th>
       <td   width="20%"><asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" 

Display="Static"  Enabled="true" 
        ErrorMessage="You must supply a corrective action or select Yes." 

ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>
        </td>
   </tr>
 
    </ItemTemplate>   
    
    </asp:DataList>
    </td>
</tr>
<tr>
    
       <th width="5%">  </th>
       <th   width="50%" align="left" > </th>
       <th  width="15%" align="left"> </th>
    <td width="20%">
    <asp:ImageButton ID="btnBack" runat="server"  onclick="btnBack_Click" ImageUrl="~/images/buttons/ButtonBack.gif" />
    <asp:ImageButton ID="btnContinue" runat="server" onclick="Button1_Click" ImageUrl="~/images/buttons/ButtonContinue.gif" />
    <%--<asp:Button ID="btnContinue" runat="server" onclick="Button1_Click" Text="Continue  >>" />--%>
    </td>
</tr>
<tr>
 
       <th width="5%">  </th>
       <th   width="50%" align="left" > </th>
       <th  width="15%" align="left"> </th>
    <td width="20%">
<%--    <asp:ImageButton ID="btnBack" runat="server"  onclick="btnBack_Click" ImageUrl="~/images/buttons/ButtonBack.gif" />
--%>    <%--<asp:Button ID="btnBack" runat="server"  Text="Back" onclick="btnBack_Click" />--%>
    </td>
</tr>
<tr><asp:Label ID="lblIteration" runat="server" Text="1" Visible="False"></asp:Label> </tr>
   

</table>
       
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
    


    
</asp:Content>