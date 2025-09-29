<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewUserList.aspx.cs" Inherits="WAPP_G12.ViewUserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                <a href="~/Account/LearningMaterial.aspx" runat="server" class="sidebar-item"><i class="fa fa-chart-bar"></i> User Performance</a>
                <a href="~/Admin/ViewMessage.aspx" runat="server" class="sidebar-item"><i class="fa fa-envelope"></i> View Messages</a>
            </nav>
        </aside>

    <!-- Main Content -->
    <div class="admin-content" id="contentArea">
        <!-- Header with Title and Toggle Button -->
        <div class="content-header">
            <button class="menu-toggle" type="button" onclick="toggleSidebar()">☰ Menu</button>
            <h1>View User List</h1>
        </div>

        <!-- Search Box -->
        <div class="mb-3">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search by Username or Email"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-2" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary mt-2" OnClick="btnClear_Click" />
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [tblRegisteredUsers]">
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="RID" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
            OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="RID" HeaderText="RID" ReadOnly="True" />
                <asp:BoundField DataField="fullName" HeaderText="Full Name" />
                <asp:BoundField DataField="emailAddress" HeaderText="Email Address" />
                <asp:BoundField DataField="username" HeaderText="Username" />
                <asp:BoundField DataField="age" HeaderText="Age" />
                <asp:BoundField DataField="gender" HeaderText="Gender" />
                <asp:BoundField DataField="country" HeaderText="Country" />
                <asp:BoundField DataField="picture" HeaderText="Picture File Path" />
                <asp:BoundField DataField="dateRegister" HeaderText="Date Register" />
                <asp:ImageField DataImageUrlField="picture" HeaderText="Picture"></asp:ImageField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditUser" 
                            CommandArgument='<%# Eval("username") %>' CssClass="btn btn-warning"/>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteUser" 
                            CommandArgument='<%# Eval("username") %>' CssClass="btn btn-danger"
                            OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
    </div>

    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("active");
            document.getElementById("contentArea").classList.toggle("shifted");
        }
    </script>

</asp:Content>
