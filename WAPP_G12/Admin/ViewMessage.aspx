<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMessage.aspx.cs" Inherits="WAPP_G12.ViewMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Menu Toggle Button -->
    <button class="menu-toggle" type="button" onclick="toggleSidebar()">☰ Menu</button>

    <!-- Sidebar -->
    <aside class="admin-sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">SCIVERSE<br>General Science Learning</div>
        </div>
        <nav class="sidebar-nav">
            <a href="~/Account/Profile.aspx" runat="server" class="sidebar-item"><i class="fa fa-user"></i> Profile</a>
            <a href="~/Admin/ViewUserList.aspx" runat="server" class="sidebar-item active"><i class="fa fa-users"></i> User List</a>
            <a href="~/Account/QuizList.aspx" runat="server" class="sidebar-item"><i class="fa fa-question-circle"></i> Quiz List</a>
            <a href="~/Account/LearningMaterial.aspx" runat="server" class="sidebar-item"><i class="fa fa-book"></i> Learning Material</a>
            <a href="~/Admin/ViewMessage.aspx" runat="server" class="sidebar-item"><i class="fa fa-envelope"></i> View Messages</a>
        </nav>
    </aside>

    <!-- Main Content -->
        <div class="admin-content" id="contentArea">
            <h1>Messages by User</h1>

            <asp:Repeater ID="rptMessages" runat="server" OnItemDataBound="rptMessages_ItemDataBound">
                <ItemTemplate>
                    <div class="message-card">
                        <div class="message-content">
                            <p><strong>Name:</strong> <%# Eval("ContactName") %></p>
                            <p><strong>Email:</strong> <%# Eval("ContactEmail") %></p>
                            <p><strong>Message:</strong> <%# Eval("ContactMessage") %></p>
                        </div>
                        <div class="message-actions">
                            <asp:CheckBox ID="chkReviewed" runat="server" AutoPostBack="true" OnCheckedChanged="chkReviewed_CheckedChanged" />
                            <asp:HiddenField ID="hdnCheckedState" runat="server" Value='<%# Eval("CID") + "|" + (IsChecked(Eval("CID").ToString()) ? "1" : "0") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                               SelectCommand="SELECT * FROM [tblContactUs]"></asp:SqlDataSource>
        </div>



</asp:Content>
