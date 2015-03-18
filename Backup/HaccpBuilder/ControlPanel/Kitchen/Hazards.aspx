<%@ Page Language="C#" MasterPageFile="~/ControlPanel/Kitchen/MasterPage2.master"  AutoEventWireup="true" Inherits="ControlPanel_Kitchen_Hazards" Title="HACCP Builder | Hazards" Codebehind="Hazards.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolder" Runat="Server">
<div class="MainHeading">
    <div class="ContentLeftTest">
    <div class="ChecklistLabel"></div>
    </div>
</div>
<div class="ContentLeftTest">
        <div class="ValidationDiv1">
            <b>FOOD CATEGORY: </b> <asp:Label ID="lblFoodCategory" Text="" runat="server"></asp:Label>
       </div>
</div>
<div class="ContentLeftTest">
        <div class="ValidationDiv1">
             <b>HAZARD: </b><asp:Label ID="lblHazard" Text="" runat="server"></asp:Label></div>
       </div>
</div>
</asp:Content>

