<%@ Page Title="" Language="C#" MasterPageFile="~/Back_User.Master" AutoEventWireup="true" CodeBehind="Back_Company.aspx.cs" Inherits="work_Yachts.WebForm3" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%-----------------------Abouus-----------------------------%>
   <h5 class="text-white mb-0">Company - About US <span class="float-right"></i></span></h5>

   <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400px">
</CKEditor:CKEditorControl>
<asp:Label ID="UploadAboutUsLab" runat="server" Visible="False" ForeColor="#009933" class="d-flex justify-content-center"></asp:Label>
<asp:Button ID="UploadAboutUsBtn" runat="server" Text="Upload About Us Content" class="btn btn-outline-primary btn-block mt-3" OnClick="UploadAboutUsBtn_Click"/>

<%-----------------------AbouusEnd-----------------------------%>
    
<%-----------------------Certificat 頁面 - 文字區-----------------------------%>

   <h5 class="text-white mb-0">Company - Certificate(Content) <span class="float-right"></i></span></h5>

   <CKEditor:CKEditorControl ID="certificatTbox" runat="server" BasePath="/Scripts/ckeditor/"
    Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image"
    Height="400px">
</CKEditor:CKEditorControl>

<asp:Label ID="uploadCertificatLab" runat="server" Visible="False" ForeColor="#009933" class="d-flex justify-content-center"></asp:Label>
<asp:Button ID="uploadCertificatBtn" runat="server" Text="Upload Certificat Text" class="btn btn-outline-primary btn-block mt-3" OnClick="uploadCertificatBtn_Click"/>

<%-----------------------Certificat 頁面 - 文字區END-----------------------------%>


<%-----------------------Certificat 頁面 - Certificat 頁面 - 直式並排圖片區-----------------------------%>

   <h5 class="text-white mb-0">Company - Certificate(PictureV) <span class="float-right"></i></span></h5>

    <asp:FileUpload ID="FUPicV1" runat="server" />
    <asp:FileUpload ID="FUPicV2" runat="server" />
    <asp:FileUpload ID="FUPicV3" runat="server" />
    <asp:FileUpload ID="FUPicV4" runat="server" />
    <asp:FileUpload ID="FUPicV5" runat="server" />
    <asp:FileUpload ID="FUPicV6" runat="server" />
    <asp:FileUpload ID="FUPicV7" runat="server" />



    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT [CertificateVertcalImgJSON] FROM [Company]"></asp:SqlDataSource>



<asp:Label ID="uploadCertificatLab1" runat="server" Visible="False" ForeColor="#009933" class="d-flex justify-content-center"></asp:Label>
<asp:Button ID="Btn_uploadCertiPicV" runat="server" Text="Upload Certificat Text" class="btn btn-outline-primary btn-block mt-3" OnClick="Btn_uploadCertiPicV_Click"/>
<asp:Button ID="Btn_clearall" runat="server" Text="Clear All Certificate Picture" class="btn btn-outline-primary btn-block mt-3" OnClick="Btn_clearall_Click"/>

<%-----------------------Certificat 頁面 - Certificat 頁面 - 直式並排圖片區-----------------------------%>

<%-----------------------Certificat 頁面 - Certificat 頁面 - 橫式並排圖片區-----------------------------%>


<%-----------------------Certificat 頁面 - Certificat 頁面 - 直式並排圖片區-----------------------------%>


</asp:Content>
