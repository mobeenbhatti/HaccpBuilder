<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChecklistPrint.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Kitchen.ChecklistPrintNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HACCP Builder | Checklist Print"</title>
    <link href="../../App_Themes/Facility/style.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/reset.css" rel="stylesheet" type="text/css" />
    <link href="../../App_Themes/Facility/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
<div class="ph-top">  
  
</div>
<div class="form3">
    <div class="left">        
        <div class="input">
            <b>Directions:</b> Use this checklist weekly to determine areas in your operations requiring corrective action. Record corrective action taken and keep completed records
                        in a notebook for future reference.
        </div> 
    </div>
    <div class="clear"></div>
</div>
<div class="form3">
    <div class="left">
        <label>Report Date:</label>
        <div class="input">
             <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>        
        </div> 
    </div>
    <div class="left margin-lr">
        <label>Observer:</label>
        <div class="input">           
           <asp:TextBox ID="txtObserver" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the Observer field" ForeColor="Red" ControlToValidate="txtObserver"></asp:RequiredFieldValidator>
        </div>        
    </div>
       
    <div class="clear"></div>
</div>
<div class="table">
    <div class="box-header">
      <h2 class="left"><asp:Label ID="lblSection" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>    </h2>
    </div>
    <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="false" CssClass="zebra" OnRowDataBound="grdChecklist_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Checklist"  HeaderText="Question" />
                    <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <asp:RadioButton ID="rdbAnswerYes" Text="Yes" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNo" Text="No" GroupName="Answer" runat="server" />
                            <asp:RadioButton ID="rdbAnswerNA" Text="NA" GroupName="Answer"  runat="server" /> 
                             <asp:HiddenField ID="hfQuestionId" Value='<%# DataBinder.Eval(Container.DataItem, "ChecklistQuestionId") %>' runat="server" />
                            <asp:HiddenField ID="hfIsBoolActive" Value='<%# DataBinder.Eval(Container.DataItem, "BoolActive") %>' runat="server" />
                            <asp:HiddenField ID="hfIsOpenActive" Value='<%# DataBinder.Eval(Container.DataItem, "OFActive") %>' runat="server" />
                            <asp:HiddenField ID="hfOfRequired" Value='<%# DataBinder.Eval(Container.DataItem, "OFRequired") %>' runat="server" />
                            <asp:HiddenField ID="hfIsCorrectiveAction" Value='<%# DataBinder.Eval(Container.DataItem, "CAActive") %>' runat="server" />
                            <asp:HiddenField ID="hfChecklisthistory" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCorrectiveAction" TextMode="MultiLine" Width="220px"
                                Height="60px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vldAnswerValidate" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must supply remarkss."
                                ControlToValidate="txtCorrectiveAction"></asp:RequiredFieldValidator>                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Corrective Action">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="rdlCorrectiveActions" runat="server"></asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="vldCorrectiveAction" runat="server" Display="Dynamic" ForeColor="Red"
                                Enabled="true" ErrorMessage="You must select a corrective action"
                                ControlToValidate="rdlCorrectiveActions"></asp:RequiredFieldValidator>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    <div class="box-bottom"> </div>
  </div>
  <div class="clear tenpx"></div>
 
</div>
    </form>
</body>
</html>
