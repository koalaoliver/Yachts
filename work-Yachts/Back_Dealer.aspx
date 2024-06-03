<%@ Page Title="" Language="C#" MasterPageFile="~/Back_User.Master" AutoEventWireup="true" CodeBehind="Back_Dealer.aspx.cs" Inherits="work_Yachts.Back_Dealer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- ------上方新增國家End----------%>
    <div class="card mt-3">
        <div class="card-content">
            <div class="row row-group m-0">
                <div class="col-12 col-lg-6 col-xl-3 border-light">
                    <div class="card-body">
                        <h5 class="text-white mb-0">請輸入國家 Add Country <span class="float-right"></i></span></h5>
                        <br />

                        <asp:TextBox runat="server" ID="txtCountry" placehold="請輸入國家"></asp:TextBox>
                        <asp:Button runat="server" Text="ADD" ID="BtnAddCountry" OnClick="BtnAddCountry_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--------上方新增國家End----------%>

    <%------------國家顯示GridView-----------%>
    <div class="card mt-3">
        <div class="card-content">
            <div class="row row-group m-0">
                <div class="col-12 col-lg-6 col-xl-3 border-light">
                    <div class="card-body">
                        <h5 class="text-white mb-0">User List <span class="float-right"></i></span></h5>
                        <br />

                        <asp:GridView ID="GV_Country" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource5" OnRowDeleted="GV_Country_RowDeleted">
                            <Columns>
                                <asp:CommandField  ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="frk_DealersID" HeaderText="frk_DealersID" SortExpression="frk_DealersID" />
                                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                <asp:BoundField DataField="Createdate" HeaderText="Createdate" SortExpression="Createdate" />
                                    <asp:CommandField ShowDeleteButton="True"  />
                            </Columns>
                        </asp:GridView>



                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" DeleteCommand="DELETE FROM [Country] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Country] ([frk_DealersID], [Country], [Createdate]) VALUES (@frk_DealersID, @Country, @Createdate)" SelectCommand="SELECT * FROM [Country]" UpdateCommand="UPDATE [Country] SET [frk_DealersID] = @frk_DealersID, [Country] = @Country, [Createdate] = @Createdate WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="frk_DealersID" Type="Int32" />
                                <asp:Parameter Name="Country" Type="String" />
                                <asp:Parameter Name="Createdate" Type="DateTime" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="frk_DealersID" Type="Int32" />
                                <asp:Parameter Name="Country" Type="String" />
                                <asp:Parameter Name="Createdate" Type="DateTime" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>



                    </div>
                </div>
            </div>
        </div>
    </div>
    <%------------國家顯示GridViewEnd-----------%>




    <%--  ------------新增區域代理商-----------------%><%--    <div class="card mt-3">
        <div class="card-content">
            <div class="row row-group m-0">
                <div class="col-12 col-lg-6 col-xl-3 border-light">
                    <div class="card-body">

                        <h5 class="text-white mb-0">請輸入代理商 Country Dealers <span class="float-right"></i></span></h5>
                        <br />
                        <asp:DropDownList ID="DropDownDealer" runat="server" CssClass="dropdown-item"></asp:DropDownList>

                        <asp:TextBox runat="server" ID="TxtArea" placehold="請輸入國家"></asp:TextBox>
                        <asp:Button ID="Btn_addarea" runat="server" OnClick="Btn_addarea_Click" Style="height: 25px" Text="ADD" />
                    </div>
                </div>
            </div>
        </div>
    </div>--%>    <%--  ------------新增區域代理商End-----------------%>
    <%-- -----------輸入代理商 Add Dealers-----------------%>
    <div class="row mt-3">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">輸入代理商 Add Dealers</div>
                    <hr>

                    <asp:DropDownList ID="DropDownDealer" runat="server" DataSourceID="SqlDataSource2" DataTextField="Country" DataValueField="ID" CssClass="dropdown-item" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT * FROM [Country]"></asp:SqlDataSource>
                    <div>
                        <h4>上傳照片</h4>
                        <asp:FileUpload ID="FileUploadpic" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="input-1">Area</label>
                        <asp:TextBox ID="Textarea" runat="server" class="form-control" placeholder="Enter Company"></asp:TextBox>
                    </div>
                    <%--    <div class="form-group">
                        <label for="input-2">Company</label>
                        <asp:TextBox ID="Txtcompany" runat="server" class="form-control" placeholder="Enter Company"></asp:TextBox>
                    </div>--%>
                    <div class="form-group">
                        <label for="input-3">Name</label>
                        <asp:TextBox ID="Txtname" runat="server" class="form-control" placeholder="Enter Your Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="input-4">Contact</label>
                        <asp:TextBox ID="Txtcontact" runat="server" class="form-control" placeholder="Enter Contact"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="input-5">Address</label>
                        <asp:TextBox ID="Txtaddress" runat="server" class="form-control" placeholder="Enter Address"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="input-6">TEL</label>
                        <asp:TextBox ID="Txttel" runat="server" class="form-control" placeholder="Enter TEL"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="input-7">Fax</label>
                        <asp:TextBox ID="Txtfax" runat="server" class="form-control" placeholder="Enter FAX"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="input-8">Email</label>
                        <asp:TextBox ID="Txtmail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="input-9">Link</label>
                        <asp:TextBox ID="Txtlink" runat="server" class="form-control" placeholder="Enter Link"></asp:TextBox>
                    </div>

                    <asp:Button ID="Btn_updealer" runat="server" Text="Submit" OnClick="Btn_updealer_Click" CssClass="btn btn-light px-5" />
                    <asp:Label ID="UpdateDealerListLab" runat="server" Text="Label"></asp:Label>
                </div>

            </div>
        </div>
    </div>
    <%-----------------輸入代理商 Add Dealers-----------%>



    <%---------------------編輯代理商-------------------------%>
    <div class="row mt-3">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">編輯代理商 Edit Dealers</div>
                    <asp:DropDownList ID="DDSelCountry" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Country" DataValueField="ID" OnSelectedIndexChanged="DDSelCountry_SelectedIndexChanged1">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT * FROM [Country]"></asp:SqlDataSource>
                    <hr>
                    <asp:GridView ID="GVSelContry" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource4" CssClass="custom-grid">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />

                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                         <asp:BoundField DataField="frk_countryID" HeaderText="frk_countryID" SortExpression="frk_countryID" />
                            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                            <asp:TemplateField HeaderText="DealerImgPath" SortExpression="DealerImgPath">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="FileUpload1" runat="server"  />
                                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DealerImgPath") %>'></asp:TextBox>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DealerImgPath") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
                            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                        </Columns>
                    </asp:GridView>



                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" DeleteCommand="DELETE FROM [Dealers] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Dealers] ([frk_countryID], [Area], [DealerImgPath], [Name], [Contact], [Address], [Tel], [Fax], [Email], [Link], [CreateDate]) VALUES (@frk_countryID, @Area, @DealerImgPath, @Name, @Contact, @Address, @Tel, @Fax, @Email, @Link, @CreateDate)" SelectCommand="SELECT * FROM [Dealers] WHERE ([frk_countryID] = @frk_countryID)" UpdateCommand="UPDATE [Dealers] SET [frk_countryID] = @frk_countryID, [Area] = @Area, [DealerImgPath] = @DealerImgPath, [Name] = @Name, [Contact] = @Contact, [Address] = @Address, [Tel] = @Tel, [Fax] = @Fax, [Email] = @Email, [Link] = @Link, [CreateDate] = @CreateDate WHERE [ID] = @ID" OnUpdating="SqlDataSource4_Updating">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="frk_countryID" Type="Int32" />
                            <asp:Parameter Name="Area" Type="String" />
                            <asp:Parameter Name="DealerImgPath" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Contact" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Tel" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Link" Type="String" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDSelCountry" Name="frk_countryID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="frk_countryID" Type="Int32" />
                            <asp:Parameter Name="Area" Type="String" />
                            <asp:Parameter Name="DealerImgPath" Type="String" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Contact" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="Tel" Type="String" />
                            <asp:Parameter Name="Fax" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Link" Type="String" />
                            <asp:Parameter Name="CreateDate" Type="DateTime" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>



                </div>

            </div>
        </div>
    </div>


    <%---------------------編輯代理商End----------------------%>
</asp:Content>
