<%@ Page Title="" Language="C#" MasterPageFile="~/Back_User.Master" AutoEventWireup="true" CodeBehind="Back_Register.aspx.cs" Inherits="work_Yachts.Back.Back_Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-------------輸入帳號密碼------------------%>
    <div class="card mt-3">
        <div class="card-content">
            <div class="row row-group m-0">
                <div class="col-12 col-lg-6 col-xl-3 border-light">
                    <div class="card-body">
                        <h5 class="text-white mb-0">Add User <span class="float-right"></i></span></h5>
                        <br />
                        <h5 class="text-white mb-0">Account <span class="float-right"></i></span></h5>
                        <asp:TextBox runat="server" ID="txtAccount" placehold="請輸入帳號"></asp:TextBox>
                        <asp:Label ID="LabelAdd" runat="server" Text="Label" Visible="False"></asp:Label>
                        <h5 class="text-white mb-0">Password <span class="float-right"></i></span></h5>
                       <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placehold="請輸入密碼"></asp:TextBox>
                        <asp:Button runat="server" Text="送出" ID="BtnAddAccount" OnClick="BtnAddAccount_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-------------輸入帳號密碼end------------------%>

    <div class="card mt-3">
    <div class="card-content">
        <div class="row row-group m-0">
            <div class="col-12 col-lg-6 col-xl-3 border-light">
                <div class="card-body">
                    <h5 class="text-white mb-0">User List <span class="float-right"></i></span></h5>
                    <br />
                    <%-- 直接在pageload綁資料庫的
                    <asp:GridView ID="GV_Member" runat="server">
                        <Columns>
                             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
 <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                             <asp:TemplateField HeaderText="Username" SortExpression="Username">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
 <asp:BoundField DataField="Salt" HeaderText="Salt" SortExpression="Salt" />
 <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
 <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
 <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
 <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
 <asp:CheckBoxField DataField="MaxPower" HeaderText="MaxPower" SortExpression="MaxPower" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>


                    資料來源抓DataSource的--%>
                    <asp:GridView ID="GV_Member" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                        <Columns>
                             <asp:CommandField  ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Salt" HeaderText="Salt" SortExpression="Salt" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:CheckBoxField DataField="MaxPower" HeaderText="MaxPower" SortExpression="MaxPower" />
                        </Columns>
                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" DeleteCommand="DELETE FROM [Member] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Member] ([Username], [Salt], [Password], [CreateDate], [Email], [Name], [MaxPower]) VALUES (@Username, @Salt, @Password, @CreateDate, @Email, @Name, @MaxPower)" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [Username] = @Username, [Salt] = @Salt, [Password] = @Password, [CreateDate] = @CreateDate, [Email] = @Email, [Name] = @Name, [MaxPower] = @MaxPower WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Salt" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="MaxPower" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Username" Type="String" />
                            <asp:Parameter Name="Salt" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="MaxPower" Type="Boolean" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>


                </div>
            </div>
        </div>
    </div>
</div>



</asp:Content>
