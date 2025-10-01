<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewFlashcard.aspx.cs" Inherits="WAPP_G12.Flashcard.viewFlashcard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p style="text-align: center">
    Flashcard for 
    <asp:Label ID="lblQuizName" runat="server"></asp:Label>
    </p>
 <div class="container-fluid my-4" style="height:30vh;">
     <asp:Panel ID="Panel1" runat="server" 
         CssClass="mx-auto p-3 rounded d-flex flex-column justify-content-center align-items-center text-center" 
         Width="100%" Height="100%" Style="background-color:#298fba;">
         <asp:Label ID="lblIndex" runat="server" CssClass="h5 d-block mb-2 text-wrap"></asp:Label>
         <asp:Label ID="lblQuestion" runat="server" CssClass="h3 d-block text-wrap text-center"></asp:Label>
         
     </asp:Panel>
 </div>
 <div class="d-flex justify-content-evenly gap-4 my-3">
     <asp:Button ID="btnFirst" runat="server" CssClass="btn btn-outline-primary flex-fill" OnClick="btnFirst_Click" Text="First" />
     <asp:Button ID="btnPrevious" runat="server" CssClass="btn btn-outline-primary flex-fill" OnClick="btnPrevious_Click" Text="Previous" />
     <asp:Button ID="btnShowAns" runat="server" CssClass="btn btn-success flex-fill" OnClick="btnShowAns_Click" Text="Show Answer" />
     <asp:Button ID="btnNext" runat="server" CssClass="btn btn-outline-primary flex-fill" OnClick="btnNext_Click" Text="Next" />
     <asp:Button ID="btnLast" runat="server" CssClass="btn btn-outline-primary flex-fill" OnClick="btnLast_Click" Text="Last" />
 </div>
</asp:Content>
