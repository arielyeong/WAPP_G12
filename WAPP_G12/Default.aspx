<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WAPP_G12._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="sciverseTitle">
            <h1 id="sciverseTitle">Welcome to SciVerse</h1>
            <p class="lead">
                SciVerse is your all-in-one platform for exploring science, learning with interactive materials, and testing your knowledge through engaging quizzes and simulations.
            </p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="materialsTitle">
                <h2 id="materialsTitle">Learning Materials</h2>
                <p>
                    Access a repository of science videos, documents, and interactive resources designed to enhance your learning.
                </p>
                <p>
                    <a class="btn btn-default" href="~/Pages/Materials.aspx">Explore Materials &raquo;</a>
                </p>
            </section>

            <section class="col-md-4" aria-labelledby="quizTitle">
                <h2 id="quizTitle">Quizzes & Performance</h2>
                <p>
                    Test yourself with quizzes of multiple types. Automatic grading and performance tracking help you learn from your mistakes.
                </p>
                <p>
                    <a class="btn btn-default" href="~/Pages/Quizzes.aspx">Start Quiz &raquo;</a>
                </p>
            </section>

            <section class="col-md-4" aria-labelledby="accountTitle">
                <h2 id="accountTitle">Account Management</h2>
                <p>
                    Register as a student, manage your profile, and enjoy role-based access control. Guests can browse but must sign up to access full features.
                </p>
                <p>
                    <a class="btn btn-default" href="~/Account/Register.aspx">Register Now &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
