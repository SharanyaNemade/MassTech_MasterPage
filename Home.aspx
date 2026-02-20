 <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MasterPageProject.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Home Title
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
<div class="container vh-100 d-flex justify-content-center align-items-center">
    <div class="text-center p-5 shadow rounded bg-light">

        <h2 class="mb-3">This is my Home Page</h2>

        <p class="text-muted">
            Welcome to the dashboard. Manage your departments and records easily.
        </p>

    </div>
</div>
</asp:Content>
