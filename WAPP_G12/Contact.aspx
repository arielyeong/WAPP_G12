﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WAPP_G12.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<main aria-labelledby="title">
    <h2 id="title"><%: Title %>.</h2>
    <section id="course-main">
        <h1 class="heading">Contact Us</h1>
    </section>
    <p>&nbsp;</p>

    <section id="contact">
            <div class="contact-form-container">
                <div class="form-fields-wrapper">
                    <asp:Panel ID="pnlContactForm" runat="server" DefaultButton="btnSubmit">
                        <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" Text="Your Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                                    ErrorMessage="Please enter your full name." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Your Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                                    ErrorMessage="Please enter your email address." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                                       ErrorMessage="Please enter a valid email address." CssClass="text-danger" Display="Dynamic" 
                                                       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        <asp:Label ID="lblMessage" runat="server" AssociatedControlID="txtMessage" Text="Message Us"></asp:Label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write something.."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                                                    ErrorMessage="Please enter a message." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Label ID="lblMessageStatus" runat="server" CssClass="text-danger" EnableViewState="false"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </section>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                       InsertCommand="INSERT INTO [tblContactUs] ([ContactName], [ContactEmail], [ContactMessage]) VALUES (@ContactName, @ContactEmail, @ContactMessage)">
        <InsertParameters>
            <asp:ControlParameter Name="ContactName" ControlID="txtName" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="ContactEmail" ControlID="txtEmail" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="ContactMessage" ControlID="txtMessage" PropertyName="Text" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</main>
</asp:Content>
