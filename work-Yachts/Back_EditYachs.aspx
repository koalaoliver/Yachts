<%@ Page Title="" Language="C#" MasterPageFile="~/Back_User.Master" AutoEventWireup="true" CodeBehind="Back_EditYachs.aspx.cs" Inherits="work_Yachts.Back.Back_EditYachs" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function confirmDelete() {
            var result = confirm("是否確定要刪除？");

            if (result) {
                // 用户点击了确认按钮，继续执行后台删除操作
                return true;
            } else {
                // 用户点击了取消按钮，阻止后台删除操作
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




   <%-- ----------編輯遊艇Edit Yachts--------------%>
           <div class="card">
           <div class="card-body">
            
           <div class="card-title">編輯 Edit Yachts</div>
           <hr>
               <asp:DropDownList ID="DDYachtmodel" runat="server" OnSelectedIndexChanged="DDYachtmodel_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="yachtModel" DataValueField="id" CssClass="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT * FROM [Yachts]"></asp:SqlDataSource>
           <div class="form-group">
            <label for="input-1">New Design/Building </label><br />
            <asp:CheckBox ID="CBoxNewDesign" runat="server" Text="NewDesign" Width="50%" />
            <asp:CheckBox ID="CBoxNewBuilding" runat="server" Text="NewBuilding" Width="50%" />
           </div>
           <div class="form-group">
            <label for="input-2">編輯型號 Edit Model</label>
            <asp:TextBox ID="TxtedYachtModel" runat="server" type="text" class="form-control" placeholder="Model" Width="30%" ></asp:TextBox>
           </div>


             <div class="form-group">
            <label for="input-2.5">*必填 上傳圖片 Upload Banner pic</label><br />
            <asp:FileUpload ID="upbannerpic" runat="server" />
            </div>

           <div class="form-group">
            <label for="input-3">上傳內容文章 Edit Content</label>

               <CKEditor:CKEditorControl ID="CKEdOcHtml" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400px">

               </CKEditor:CKEditorControl>

               <div class="form-group">
                  <label for="input-4">overview DIMENSIONS Img</label><br />
                   <asp:Label ID="odImgPathImgpath" runat="server" Text="Label"></asp:Label>
                   <asp:TextBox ID="odImgPathImg" runat="server"></asp:TextBox>
                   <asp:FileUpload ID="odImgPathImgpath1" runat="server" />
               </div>

               <div class="form-group">
                  <label for="input-5">Downloadfile Title</label>
                   <asp:TextBox ID="downloadtitle" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                  <label for="input-6">更換檔案 Downloadfile</label>
                   <asp:TextBox ID="DownloadsFilespath" runat="server"></asp:TextBox>
                   <asp:FileUpload ID="Editfile" runat="server" />
               </div>

               <div class="card-title">Layout & deck plan</div>
                  <div class="form-group">
                  <label for="input-7">Layout Img</label>
                  <asp:TextBox ID="LDPath" runat="server"></asp:TextBox>
                      <asp:FileUpload ID="uplayout" runat="server" AllowMultiple="True" />
               </div>

               <div class="card-title">DETAIL SPECIFICATION</div>
                 <div class="form-group">
                  <label for="input-8">DETAIL SPECIFICATION</label>
                   
                   <CKEditor:CKEditorControl ID="CKEoverviewDimensionsJSON" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400">

                   </CKEditor:CKEditorControl>

                      <div class="form-group">
                  <label for="input-9">VideoLink</label>
                   <asp:TextBox ID="Txtvideo" runat="server"></asp:TextBox>
               </div>

               </div>

               <asp:Button ID="BtnEditYacht" runat="server" Text="Edit Yachts" class="btn btn-light px-5" OnClick="BtnEditYacht_Click" /> 
               <br /><br />
               <asp:Button ID="deleteYacht" runat="server" Text="Delete 刪除" OnClientClick="return confirmDelete();" OnClick="deleteYacht_Click" CssClass="btn btn-danger" />
           </div>
               </div>
         
            <%--  </div>--%>          <%-- </div>--%>
              <!-- Add New Model end -->    
       <!-- Yachts Banner Start -->
               <%--<div class="page-body">
    <div class="row">
        <div class="col-md-12 col-xl-12">
            <div class="card project-task">
                <div class="card-header">
                    <div class="card-header-left ">
                        <h5>Yacht Model Banner Image</h5>
                        <h6><span class="badge badge-pill badge-warning text-dark">* The maximum upload size at once is 10MB !</span></h6>
                    </div>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="icofont icofont-simple-left "></i></li>
                            <li><i class="icofont icofont-maximize full-card"></i></li>
                            <li><i class="icofont icofont-minus minimize-card"></i></li>
                            <li><i class="icofont icofont-refresh reload-card"></i></li>
                            <li><i class="icofont icofont-error close-card"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="card-block p-b-10">
                    <div class="table-responsive">
                        <div class="input-group my-3">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="yachtModel" DataValueField="id" Width="50%" Font-Bold="True" class="btn btn-outline-primary dropdown-toggle" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT * FROM [Yachts]"></asp:SqlDataSource>

                            <asp:FileUpload ID="imageUpload" runat="server" class="btn btn-outline-primary btn-block" AllowMultiple="True" />
                            <asp:Button ID="UploadBtn" runat="server" Text="Upload" class="btn btn-primary" OnClick="UploadBtn_Click" />
                        </div>
                        <hr />
                        <h6>Banner Image List :</h6>
                        <h6><span class="badge badge-pill badge-success text-dark">* The first image will be the home page banner !</span></h6>
                        <h6>Step1. To upload one image to be the home page banner.</h6>
                        <h6>Step2. Then upload other images.</h6>
                        <asp:RadioButtonList ID="RadioButtonList" runat="server" class="my-3 mx-auto" AutoPostBack="True" CellPadding="10" RepeatColumns="5" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonListH_SelectedIndexChanged" ></asp:RadioButtonList>
                        <asp:Button ID="DelImageBtn" runat="server" Text="Delete Image" type="button" class="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete？')" Visible="False" OnClick="DelHImageBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<!-- Yachts Banner End -->

        <!-- Model List Start -->
        <div class="col-md-12 col-xl-8">
            <div class="card project-task">
                <div class="card-header">
                    <div class="card-header-left ">
                        <h5>Yacht Model List</h5>
                    </div>
               
                </div>
                <div class="card-block p-b-10">
                    <div class="table-responsive text-center">
      

                           
                   
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Model List End -->
<!-- Yachts Type End -->
</asp:Content>
