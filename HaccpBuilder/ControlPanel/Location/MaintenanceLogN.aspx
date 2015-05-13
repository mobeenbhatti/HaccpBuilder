<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="MaintenanceLogN.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.MaintenanceLogN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Maintenance Log</h1>
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
            var hfTemMaintenanceigh = document.getElementById('PlaceHolder_hfTemMaintenanceigh');
            var txtCorrectiveAction = document.getElementById('PlaceHolder_txtCorrectiveAction');

            if (hfTemMaintenanceigh.value != 'NA') {
                if (txtTemp1.value != '') {

                    if ((txtTemp1.value < hfTempLow.value || txtTemp1.value > hfTemMaintenanceigh.value) && txtCorrectiveAction.value == '') {
                        args.IsValid = false;

                    }
                }
            }
        }

        function CheckCorrectItem(sender, args) {
            alert('hello');
            var rdbCorrectNo = document.getElementById('PlaceHolder_rdbCorrectNo');
            var rdlCorrectiveAction1 = document.getElementById('PlaceHolder_rdlCorrectiveAction1');
            alert(rdlCorrectiveAction1);
            args.IsValid = false;
            if (rdbCorrectNo.checked == true) {
                var radioButtonlist = document.getElementsByName("<%=rdlCorrectiveAction1.ClientID%>");
                alert(radioButtonlist);
                for (var x = 0; x < radioButtonlist.length; x++) {
                    if (radioButtonlist[x].checked) {
                        alert("Selected item Value " + radioButtonlist[x].value);
                    }
                }

                ///////////////////////////////////////////
                alert(rdlCorrectiveAction1.length);
                //var collection = document.getElementById(rdlCorrectiveAction1).getElementsByTagName('INPUT');
                for (var x = 0; x < rdlCorrectiveAction1.length; x++) {
                    alert(rdlCorrectiveAction1[x].checked);
                    if (rdlCorrectiveAction1[x].checked == true) { // if a button in group is checked,

                        args.IsValid = true;  // uncheck it
                    }
                }

            }
        }
    </script>

    <asp:HiddenField ID="hfTempLow" runat="server" />
    <asp:HiddenField ID="hfTemMaintenanceigh" runat="server" />
    <asp:Label ID="LogError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <asp:ValidationSummary ID="vldSummary" DisplayMode="List" runat="server" CssClass="alert alert-danger mt30 row" ShowSummary="true"
        Enabled="true" />

   <%-- <p class="mt30 mb30">
        <strong>Drirections: </strong>
        Record item name, time, the Maintenance levels, and any corrective action taken on this form. If no items are testing any working day, indicate 'No Ingredient/No Menu Item' in the form.The foodservice manager will verify that foodservice employees have taken the required Maintenance level by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.
    </p>--%>


    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
              
                 <a href="#" data-toggle="tooltip" title="Drirections: Record item name, time, the Maintenance levels, and any corrective action taken on this form. If no items are testing any working day, indicate 'No Ingredient/No Menu Item' in the form.The foodservice manager will verify that foodservice employees have taken the required Maintenance level by visually monitoring foodservice employees and preparation procedures during the shift and reviewing, initialing, and dating this log daily. Maintain this log for a minimum of 1 year.">
                    <i class="fa fa-dashboard cw"></i></a>
               Maintenance Log
            </div>
            <div class="panel-body tasks">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="temp-max">QCL Maximum Temp:</label>
                                <asp:TextBox ReadOnly="true" runat="server" CssClass="form-control" ID="Lbl_QCLMaxtempValue"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="temp-min">QCL Minimum Temp:</label>
                                <asp:TextBox ReadOnly="true" runat="server" CssClass="form-control" ID="Lbl_QCLMintempValue"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="cldMealDate">Service Date:</label>

                                <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-group">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="cldEntryDate"></asp:TextBox>

                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                                <asp:CompareValidator ID="CV_cldEntryDate" runat="server" ControlToValidate="cldEntryDate"
                                    Display="None" ErrorMessage="Service date should not be future date" Operator="LessThanEqual"
                                    Type="Date"></asp:CompareValidator>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <label for="freezer-device">Equipment or Facility Area Item:</label>
                            <asp:DropDownList ID="ddlInventory" DataSourceID="ObjectDataSource2" Enabled="true" CssClass="form-control"
                                DataTextField="Name" DataValueField="Id" runat="server" data-editableCombobox="true"
                                AppendDataBoundItems="false">
                                <asp:ListItem>Select Equipment/Inventory</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvInventory" Enabled="true" runat="server" Display="None"
                                ErrorMessage="Please Select Equipment / Inventory Item" ControlToValidate="ddlInventory" CssClass="form-control"
                                Font-Names="Verdana" Font-Size="10px" InitialValue="Select Equipment/Inventory"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="inputEmail">Equipment Item or Area is Working Properly:</label>

                                <asp:RadioButton ID="rdbCorrectYes" Text="Yes"
                                    GroupName="CorrectItem" runat="server" />
                                <asp:RadioButton ID="rdbCorrectNo" Text="No"
                                    CssClass="LogText" GroupName="CorrectItem" runat="server" />
                                <asp:CustomValidator ID="custCorrectiveAction" runat="server" OnServerValidate="ValidateCorrect"
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
                                        <%--  <input type="radio" name="dispose-item" id="dispose" />
                                        <span class="lbl padding-8">Disposed of product/item</span>--%>


                                        <asp:Label ID="Lbl_CorrectiveAction1" runat="server" Visible="false" CssClass="form-control"></asp:Label>

                                        <asp:RadioButtonList ID="rdlCorrectiveAction1" Width="200px" DataValueField="CorrectiveActionID"
                                            DataSourceID="odsCorrectiveAction" DataTextField="Name" runat="server">
                                        </asp:RadioButtonList>
                                        <asp:ObjectDataSource ID="odsCorrectiveAction" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetKitchenCorrectiveActionByStatusId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetKitchenCorrectiveAction">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="nKitchenId" SessionField="KitchenId" Type="Int32" />
                                                <asp:Parameter DefaultValue="11" Name="nLogTypeId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputEmail">Describe what was done?:</label>

                                        <asp:TextBox ID="txtComments" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                        <label for="entry-date">Entry Date:</label>

                                        <asp:TextBox ID="txtEntryDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
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


                    <div class="col-sm-12">
                        <asp:GridView ID="grdMaintenance" HeaderStyle-CssClass="col" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-responsive table-bordered"
                            DataSourceID="ObjectDataSource1" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Entry ID" />
                                <asp:TemplateField HeaderText="Service Date">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlEntryDate" runat="server" NavigateUrl='<%#"~/ControlPanel/Location/MaintenanceLogN.aspx?Id=" + DataBinder.Eval(Container.DataItem, "Id") %>'
                                            Text='<%# DataBinder.Eval(Container.DataItem, "ServiceDate","{0:d}")  %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Item Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuITem" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Is Correct">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMenuITem" runat="server" Text='<%# Eval("IsCorrect").ToString() == "True"? "Yes" : "No" %>'></asp:Label>
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

            </div>
        </div>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetMaintenanceLogDataSetByMobileId" TypeName="SchoolHaccp.BusinessLogic.ProcessGetMaintenanceLog">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId" SessionField="KitchenId"
                        Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="nMobileId" SessionField="MobileId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetHaccpInventory"
                TypeName="SchoolHaccp.BusinessLogic.ProcessGetInventoryItemsByKitchenId">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="nKitchenId"
                        SessionField="KitchenId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>

            <script type="text/javascript">
                $(document).ready(function () {
                    $('#<%= cldEntryDate.ClientID %>').datepicker({
                          format: "dd/mm/yyyy"
                      });

                      $('#<%= cldVerifiedDate.ClientID %>').datepicker({
                          format: "dd/mm/yyyy"
                      });

                    $('[data-toggle="tooltip"]').tooltip();

                  });
            </script>
</asp:Content>
