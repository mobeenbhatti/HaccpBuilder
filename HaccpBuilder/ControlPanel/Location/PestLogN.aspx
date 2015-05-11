<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="PestLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.PestLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Pest Log</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolder" runat="server">

    <script lang="javascript" type="text/javascript">
        function MoveBack() {
            window.location = "Default.aspx";
        }
        function ClearCorrectiveActions(rdlCorrectiveActions) {
            var collection = document.getElementById(rdlCorrectiveActions).getElementsByTagName('INPUT');
            for (var x = 0; x < collection.length; x++) {

                if (collection[x].checked == true) { // if a button in group is checked,

                    collection[x].checked = false;  // uncheck it
                }
            }
        }

        function CheckTemperature1(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');
            var txtTemp1 = document.getElementById('PlaceHolder_txtTemp1');

            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTemPestigh = document.getElementById('PlaceHolder_hfTemPestigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTemPestigh.value != 'NA') {
                if (txtTemp1.value != '') {

                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTemPestigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;

                    }
                }
            }
        }

        function CheckTemperature2(sender, args) {
            // var vldCorrectiveAction = document.getElementById('PlaceHolder_rfvCorrectiveAction');
            // var vldIngrdient= document.getElementById('PlaceHolder_rfvIngredient');

            var txtTemp2 = document.getElementById('PlaceHolder_txtTemp2');
            var hfTempLow = document.getElementById('PlaceHolder_hfTempLow');
            var hfTemPestigh = document.getElementById('PlaceHolder_hfTemPestigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTemPestigh.value != 'NA') {
                if (txtTemp2.value != '') {
                    if ((txtTemp2.value < hfTempLow.value || txtTemp2.value > hfTemPestigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;
                    }
                }
            }
        }
    </script>

    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTempHigh" runat="server" />
    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />
    <%--<p class="mt30 mb30">
        <strong>Directions: </strong>
        Record item name, time, the Pest levels, and any corrective action taken on this form. 
                <b>If no items are testing any working day, indicate "No Ingredient/No Menu Item" in the form. </b>
        The foodservice manager will verify that foodservice employees have taken the required Pest level by visually monitoring foodservice employees
                 and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>--%>

    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-dashboard"></i>Pest Log
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="Lbl_QCLMaxtempValue">QCL Maximum Temp:</label>
                                    <asp:TextBox ReadOnly="true" ID="Lbl_QCLMaxtempValue" CssClass="form-control" Text="NA" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <label for="freezer-device">QCL Minimum Temp:</label>
                                <asp:TextBox ReadOnly="true" ID="Lbl_QCLMintempValue" CssClass="form-control" Text="NA" runat="server"></asp:TextBox>



                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="cldMealDate">Today's Date:</label>

                                    <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                        <asp:TextBox CssClass="form-control" runat="server" ID="cldEntryDate"></asp:TextBox>

                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    </div>
                                    <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                                        Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                        Type="Date"></asp:CompareValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">

                                <label for="inputEmail">Pest Control Station/Item:</label>

                                <asp:DropDownList ID="ddlInventory" DataSourceID="odsPestLogKitchenInvetory" Enabled="true" CssClass="form-control"
                                    DataTextField="Name" DataValueField="Id" runat="server" data-editableCombobox="true"
                                    AppendDataBoundItems="false">
                                    <asp:ListItem>Select Equipment/Inventory</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInventory" Enabled="true" runat="server" Display="None"
                                    ErrorMessage="Please Select Equipment / Inventory Item" ControlToValidate="ddlInventory" CssClass="form-control"
                                    Font-Names="Verdana" Font-Size="10px" InitialValue="Select Equipment/Inventory"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <label class="control-label" for="inputEmail">Pest Control Station/Item Is Clean:</label>
                                <asp:RadioButton ID="rdbCleanYes" Checked="true" Text="Yes"
                                    GroupName="CleanItem" runat="server" />
                                <asp:RadioButton ID="rdbCleanNo" Text="No"
                                    GroupName="CleanItem" runat="server" />
                                <asp:CustomValidator ID="custCorrectiveAction" runat="server" OnServerValidate="ValidateClean"
                                    ErrorMessage=" Please select Corrective Action field" Display="None"></asp:CustomValidator>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-tasks"></i>Corrective Action
                            </div>
                            <div class="panel-body tasks">
                                <div class="col-sm-12">
                                    <label>
                                        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false"></asp:Label>
                                        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="10" Name="nLogTypeId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        <asp:RadioButtonList ID="rdlCorrectiveAction1" DataValueField="CorrectiveActionID"
                                            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                        </asp:RadioButtonList>
                                    </label>

                                </div>
                                <div class="col-sm-12" id="trClearCorrectiveActions" runat="server">
                                    <label>
                                        <asp:CheckBox ID="chkClear" runat="server" />
                                        <span class="lbl padding-8">Clear Corrective Action</span>

                                    </label>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="verified-by">Verified By:</label>

                                        <asp:TextBox ID="txtVerifiedBy" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>

                                        <asp:RegularExpressionValidator ID="REV_txtVerifiedBy" runat="server" ControlToValidate="txtVerifiedBy"
                                            Display="None" ErrorMessage="The value in field 'Verified By' is not valid."
                                            Font-Names="Verdana" Font-Size="10px" ValidationExpression="^[A-Za-z0-9.\-_ ]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">

                                    <div class="form-group">
                                        <label for="cldVerifiedDate">Verified Date:</label>

                                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                            <asp:TextBox CssClass="form-control" runat="server" ID="cldVerifiedDate"></asp:TextBox>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>

                                        </div>
                                        <asp:CompareValidator ID="CV_cldVerifiedDate" runat="server" ControlToValidate="cldVerifiedDate"
                                            Display="None" ErrorMessage="Verified date should not be future date" Operator="LessThanEqual"
                                            Type="Date"></asp:CompareValidator>
                                        <asp:CompareValidator ID="CV2_cldVerifiedDate" runat="server" ControlToValidate="cldEntryDate"
                                            Display="None" ControlToCompare="cldVerifiedDate" ErrorMessage="Verified date should be greater than or equal to service date."
                                            Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="serviceDate">Entry Date </label>
                                        <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                            <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <asp:Button ID="cmdSubmit" runat="server" OnClick="cmdSubmit_Click" Text="Submit" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdDelete" Visible="false" CausesValidation="false" Text="Delete" CssClass="btn btn-danger" OnClick="cmdDelete_Click" runat="server" />
                                    <asp:Button ID="cmdAdd" runat="server" OnClick="cmdAdd_Click" Text="Add" CssClass="btn btn-primary" />
                                    <asp:Button ID="cmdCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-warning" OnClick="cmdCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="col-sm-12">

                    <asp:GridView ID="grdPest" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-responsive table-bordered"
                        DataSourceID="ObjectDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                            <asp:TemplateField HeaderText="Service Date">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/PestLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                        Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Item Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is Clean">
                                <ItemTemplate>
                                    <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsClean").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entry Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblEntrydate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EntryDate","{0:d}")  %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
        <
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetPestLogDataSetByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPestLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPestLogKitchenInvetory" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetPestLogInventory" TypeName="SchoolHaccp.BusinessLogic.ProcessGetPestLog">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
</asp:Content>
