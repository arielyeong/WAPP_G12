<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="WAPP_G12.Flashcard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblQuizTitle" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="btnGenerateFlashcard" runat="server" CssClass="btn btn-primary&quot;" Text="Generate Flashcard" OnClick="btnGenerateFlashcard_Click" />
    </asp:Panel>
</asp:Content>
