<%@ Page Language="C#" MasterPageFile="~/ControlPanel/DistrictMaster.master"  AutoEventWireup="true" Inherits="ControlPanel_District_AlertsDates" Title="HACCP Builder | Alert Dates" Codebehind="AlertsDates.aspx.cs" %>
<%@ Register Src="~/Controls/Advertisement.ascx" TagPrefix="ucl" TagName="Advs" %>
<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>
<%@ Register src="../../Controls/DistrictAddress.ascx" tagname="DistrictAddress" tagprefix="uc1" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
  function GetData(divId)
  {
    //alert(divId.toString());  
    //divId.contentDocument.designMode="on"; 
    document.getElementById("divTest").contentDocument.designMode="on";
    frmTest.document.designMode = 'on' ;
    
  } 
</script>
    <div>
        <div class="MainHeading">
              <asp:Label ID="lblMain" Text="ALERT DATES" runat="server"></asp:Label>
        </div>
        <div class="ContentLeft">
                <div class="ContactDetail">
                     <uc1:DistrictAddress ID="DistrictAddress1" runat="server" />
                </div>                
            </div>
        <div class="ContentRight">                
                <ucl:Advs id="adv1" runat="server"></ucl:Advs>
            </div>
       <div class="Clearer"></div>
    </div>
        <div class="MainHeading">
              <asp:Label ID="lblLog" runat="server" Visible ="false"></asp:Label>
              <asp:Label ID="lblKitchen" runat="server" ></asp:Label>
        </div>
        <div class="GirdDiv">        
            <asp:Repeater ID="rptAlertDates" runat="server" 
                DataSourceID="ObjectDataSource1"  
                OnItemCommand="rptAlertDates_OnItemCommand" onitemdatabound="rptAlertDates_ItemDataBound" 
                >
 <HeaderTemplate>
    <table> 
        <tr style="background-color:Silver;">
            <td width="920px" align="center" ><b>ALERT DATE</b></td>
        </tr> 
 </HeaderTemplate>
 <ItemTemplate>
     <tr >        
        <td align="center">
        <%--<asp:LinkButton ID="lkbBreakFast" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")%>' CommandName="BreakFast" />--%>
        <asp:Label ID="lblDates" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")%>'></asp:Label>
        </td>
     
     </tr> 
 </ItemTemplate>
 <FooterTemplate>
 </table>
 </FooterTemplate>
 </asp:Repeater>   
 <%--<div runat="server" id="divTest" onclick="javascript:GetData(this.id);"  contenteditable="true" indicateeditable="true" style="height:100px; border:solid 1px red;overflow:auto;">
</div>--%> 
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAlertDates" 
        TypeName="SchoolHaccp.BusinessLogic.ProcessGetDailyReports">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblLog" DefaultValue="''" 
                Name="strTableName" PropertyName="Text" Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="nKitchenId" 
                QueryStringField="KitchenId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
            
 </div>
   <div class="Clearer"></div>
    <div class="PageFooter">
        <asp:Label ID="lblFooter" Text=" © HACCP Builder 2009" ForeColor="White" runat="server"></asp:Label>
    </div>               
</asp:Content>

