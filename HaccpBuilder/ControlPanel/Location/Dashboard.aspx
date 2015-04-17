﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/Location/LocationMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HaccpBuilder.ControlPanel.Location.Dashboard" %>

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
                        <div class="col-xs-2 task-due-time">
                            <i class="fa fa-clock-o"></i>
                            <strong>Due Time</strong>
                        </div>

                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-check-square-o"></i></span>
                            <a href="#">Checklist One</a>
                        </div>
                        <div class="col-xs-2 task-due-time">
                            <span><i class="fa fa-clock-o"></i></span>
                            04:35 PM
                        </div>
                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-file-text-o"></i></span>
                            <a href="#">Refrigerator log.</a>
                        </div>
                        <div class="col-xs-2 task-due-time">
                            <span><i class="fa fa-clock-o"></i></span>
                            04:35 PM
                        </div>
                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-file-text-o"></i></span>
                            <a href="#">Freezer Log.M</a>
                        </div>
                        <div class="col-xs-2 task-due-time">
                            <span><i class="fa fa-file-text-o"></i></span>
                            04:35 PM
                        </div>
                    </li>
                    <li>
                        <div class="col-xs-10">
                            <span><i class="fa fa-check-square-o"></i></span>
                            <a href="#">Checklist Two.M</a>
                        </div>
                        <div class="col-xs-2 task-due-time">
                            <span><i class="fa fa-clock-o"></i></span>
                            04:35 PM
                        </div>
                    </li>



                </ul>
            </div>
        </div>
    </div>
    <div class="mt10 mb30" role="group" aria-label="...">
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <button class="btn btn-block btn-orange btn-lh-40 btn3d" aria-hidden="true">
                <span class="fa fa-list-ul" aria-hidden="true"></span>
                LOGS & CHECKLIST
            </button>
        </div>
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <button class="btn btn-block btn-green btn-lh-40 btn3d" aria-hidden="true">
               
               		<span class="fa fa-file-text-o"></span>
                SUPPORT DOCUMENTATION
            </button>
        </div>
        <div class="col-xs-12 col-sm-4 mt10" role="group">
            <button class="btn btn-block btn-skyblue btn-lh-40 btn3d" aria-hidden="true">
                <span class="fa fa-pagelines"></span>
                Mixes & Recipies
            </button>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>