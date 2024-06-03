<%@ Page Title="" Language="C#" ValidateRequest="false"  MasterPageFile="~/Back_User.Master" AutoEventWireup="true" CodeBehind="Back_News.aspx.cs" Inherits="work_Yachts.Back_News" %>


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
 </script>>
    <title>News Manager</title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 1rem;
            height: 61px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- News Cover Start -->
    <!-- Add News Start -->
    <div class="page-body">
        <div class="row">
            <div class="col-md-12 col-xl-8">
                <div class="card project-task">
                    <div class="card-header">
                        <div class="card-header-left ">
                            <h5>Add News</h5>
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
                            <h6>Date :</h6>
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="100%" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#3399FF" ForeColor="White" Font-Bold="True" />
                                <TitleStyle BackColor="White" BorderColor="#3399FF" BorderWidth="3px" Font-Bold="True" Font-Size="12pt" ForeColor="#3399FF" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                            <hr />
                           
                            <hr />
                           
                   </div>
                </div>
            </div>
                        </div>
                    </div>
                </div>

     <!-- Add News End -->
  <div class="container-fluid">

    <%--<div class="row mt-3">
      <div class="col-lg-6">--%>
         <div class="card">
           <div class="card-body">
              <%-- 第一個表格新增新聞add news--%>
           <div class="card-title">新增新聞 ADD News</div>
           <hr>
            
           <div class="form-group">
            <label for="input-1">是否置頂</label>
             <asp:CheckBox ID="CBoxIsTop" runat="server" Text=" Top Tag " Width="100%" />
           </div>
           <div class="form-group">
            <label for="input-2">請輸入標題</label>
            <asp:TextBox ID="headlineTbox" runat="server" type="text" class="form-control" placeholder="Enter Headline 請輸入標題" MaxLength="75"></asp:TextBox>
           </div>
           <div class="form-group">
               
            <label for="input-3">上傳縮圖</label>
            <asp:FileUpload ID="thumbnailUpload" runat="server" class="btn btn-outline-primary btn-block" />
               <asp:Image ID="thumbnailUpload01" runat="server" />
           </div>
           <div class="form-group">
            <label for="input-4">上傳小標文</label>
             <asp:TextBox ID="summaryTbox" runat="server" type="text" class="form-control" placeholder="Enter summary text" TextMode="MultiLine" Height="170px" ></asp:TextBox>
           </div>
           <div class="form-group">
            <label for="input-5">上傳內容文章</label>
                  <CKEditor:CKEditorControl ID="CKTxNews" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400px"></CKEditor:CKEditorControl>
<%--<asp:TextBox ID="TxNews" runat="server" type="text" class="form-control" placeholder="Enter summary text" TextMode="MultiLine" Height="170px" ></asp:TextBox>--%>
           </div>

          <div class="form-group">
          <label for="input-5">上傳圖片</label><br />
          <asp:FileUpload ID="FUPic1" runat="server" AllowMultiple="True" />
           </div>


               <asp:Button ID="AddHeadlineBtn" runat="server" Text="Add News" class="btn btn-light px-5" OnClick="AddHeadlineBtn_Click" />  
          </div>
             </div>
               <%-- 第一個表格新增新聞add news end--%>       
       <%--  
         </div>
      </div>--%>

      <%--<div class="col-lg-6">--%>
        <div class="card">
           <div class="card-body">
           <div class="card-title">編輯新聞 Edit News</div>
           <hr>
            <div class="form-group">
            <asp:DropDownList ID="DDnews" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Headline" DataValueField="Headline" OnSelectedIndexChanged="DDnews_SelectedIndexChanged" CssClass="btn btn-secondary dropdown-toggle"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT [Headline] FROM [News]"></asp:SqlDataSource>
            </div>
           <div class="form-group">
            <label for="input-6">DateTitle</label>
             <asp:TextBox ID="TxtDateTitle" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>
           </div>

           <div class="form-group">
            <label for="input-7">Headline</label>
             <asp:TextBox ID="TxtHeadline" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>
           </div>
           <div class="form-group">
            <label for="input-8">isTop</label>
              <asp:CheckBox ID="EDisTOP" runat="server" Text=" YES " Width="100%" />
           <%--<asp:TextBox ID="TxtisTop" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>--%>
           </div>
           <div class="form-group">
            <label for="input-9">Summary</label>
           <asp:TextBox ID="TxtSummary" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>
           </div>
           <div class="form-group">
            <label for="input-10">ThumbnailPath</label>
             <asp:TextBox ID="ThumbnailPath" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>
              <asp:FileUpload ID="EDThpic" runat="server" />
           </div>

               <div class="form-group">
            <label for="input-11">NewsContentHtml</label>
                   <CKEditor:CKEditorControl ID="CKEditorNewCon" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400px"></CKEditor:CKEditorControl>
             <%--<asp:TextBox ID="TxtNewCon" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>--%>
           </div>

                <div class="auto-style1">
            <label for="input-12">NewsImageJson</label>
             <asp:TextBox ID="TxtNImg" runat="server" CssClass="form-control form-control-rounded"></asp:TextBox>
                    <asp:FileUpload ID="Ed_NewsPic01" runat="server" AllowMultiple="True" />
           </div>
               <br />
                 <br />
            <asp:Button ID="EDnewsubmit" runat="server" Text="Edit" CssClass="btn btn-light btn-round px-5" OnClick="EDnewsubmit_Click" />
             <asp:Button ID="DeleteNewsBtn" runat="server" Text="Delete" CssClass="btn btn-light btn-round px-5" OnClientClick="return confirmDelete();" OnClick="DeleteNewsBtn_Click" />

         </div>
         </div>
      </div>
    <%--</div>--%><!--End Row-->

	<!--start overlay-->
		  <div class="overlay toggle-menu"></div>
		<!--end overlay-->

  
                           
                         
</asp:Content>
