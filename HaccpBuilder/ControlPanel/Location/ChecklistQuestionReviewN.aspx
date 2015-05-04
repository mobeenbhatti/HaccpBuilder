<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="ChecklistQuestionReviewN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.ChecklistQuestionReviewN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row faculity mt30">
        <div class="col-sm-4">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Section Name
                    </li>
                    <li>
                        <asp:Label ID="lblSection" Text="" runat="server"></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="users">
                <ul>
                    <li>
                        <i class="fa fa-calendar"></i>
                        Entry Date
                    </li>
                    <li>
                        <asp:Label ID="lblEntryDate" Text="" runat="server"></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="users">
                <ul>
                    <li class="col-xs-12">
                        <div class="input-group" id="pnlObserver" runat="server">
                            <span class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </span>
                            <asp:TextBox ID="lblObserverValue" ReadOnly="true" CssClass="form-control" placeholder="Observer" runat="server"></asp:TextBox>

                        </div>
                        <span class="help-block"></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="panel panel-primary mt10">
        <div class="panel-heading">
            <h4 class="left">Checklist Entries</h4>
        </div>
        <div class="panel-body">
            <div class="table">

                <div>
                    <asp:GridView ID="grdChecklist" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-bordered">
                        <Columns>
                            <asp:BoundField DataField="Checklist" HeaderText="Question"></asp:BoundField>
                            <asp:TemplateField HeaderText="Answer">
                                <ItemTemplate>
                                    <asp:Label ID="lblAnswer" Text='<%# Eval("BoolResponse") != null ? Eval("BoolResponse").ToString() == "1"? "Yes":Eval("BoolResponse").ToString() == "2"?"NA":"No" : "" %>' runat="server"></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:BoundField DataField="OFResponse" HeaderText="Remarks"></asp:BoundField>
                            <asp:TemplateField HeaderText="Corrective Action">
                                <ItemTemplate>
                                    <asp:Label ID="lblCorrectiveAction" Text='<%# Eval("CorrectiveAction").ToString() %>' runat="server"></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
                <div class="box-bottom"></div>
            </div>
        </div>
    </div>

    <div class="mt30 mb30">
        <div class="btn-group">

            <asp:Button ID="btnContinue" runat="server" OnClick="cmdContinue_Click" Text="Confirm" CssClass="btn btn-primary btn-square" />
        </div>

    </div>
</asp:Content>
