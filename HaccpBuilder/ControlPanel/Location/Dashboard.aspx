<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationLayout.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageTitle" runat="server">
    <h1>Dashboard</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolder" runat="server">
    <div class="row mt30">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-tasks"></i>Today's Tasks
            </div>
            <div class="panel-body tasks">
                <ul class="tasksTime">
                    <li>

                        <div class="col-xs-10">
                            <i class="fa fa-tasks"></i>
                            <strong>Tasks</strong>
                        </div>

                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-check-square-o"></i></span>
                            <a href="#">Checklist One</a>
                        </div>

                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-file-text-o"></i></span>
                            <a href="#">Refrigerator log.</a>
                        </div>

                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-file-text-o"></i></span>
                            <a href="#">Freezer Log.M</a>
                        </div>

                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-check-square-o"></i></span>
                            <a href="#">Checklist Two.M</a>
                        </div>

                    </li>



                </ul>
            </div>
        </div>
    </div>
    <div class="mt10 mb30" role="group" aria-label="...">
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <a class="btn btn-block btn-orange btn-lh-40 btn3d" href="LogsAndChecklist.aspx" aria-hidden="true">
                <span class="fa fa-list-ul" aria-hidden="true"></span>
                LOGS & CHECKLIST
            </a>
        </div>
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <a class="btn btn-block btn-green btn-lh-40 btn3d"  href="SOPs.aspx" aria-hidden="true">

                <span class="fa fa-file-text-o"></span>
                SUPPORT DOCUMENTATION
            </a>
        </div>
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <a class="btn btn-block btn-skyblue btn-lh-40 btn3d" href="MenuItems.aspx" aria-hidden="true">
                <span class="fa fa-pagelines"></span>
                Mixes & Recipies
            </a>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
