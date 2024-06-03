<%@ Page Title="" Language="C#" MasterPageFile="~/view.master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="work_Yachts.Certificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="css/homestyle.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<!--------------------------------換圖開始----------------------------------------------------> 

<div class="banner">
<ul>
<li><img src="images/newbanner.jpg" alt="Tayana Yachts" /></li>
</ul>

</div> 
<!--------------------------------換圖結束----------------------------------------------------> 


<div class="conbg"> 
<!--------------------------------左邊選單開始----------------------------------------------------> 
<div class="left"> 

<div class="left1">
<p><span>COMPANY </span></p>
<ul>
<li><a href="Company.aspx">About Us</a></li>
<li><a href="Certificate.aspx">Certificat</a></li>
</ul>
</div>
</div>

<!--------------------------------左邊選單結束----------------------------------------------------> 

<!--------------------------------右邊選單開始----------------------------------------------------> 
<div id="crumb"><a href="#">Home</a> >> <a href="#">Company  </a> >> <a href="#"><span class="on1">About Us</span></a></div>
<div class="right"> 
<div class="right1">
  <div class="title"> <span>Certificat</span></div>
  
<!--------------------------------內容開始----------------------------------------------------> 
<div class="box3">
    <asp:Literal ID="ContentText" runat="server"></asp:Literal>
    <br />
    <br />
    <div class="pit">
        <ul>
            <asp:Literal ID="ContentImgV" runat="server"></asp:Literal>
            <asp:Literal ID="ContentImgH" runat="server"></asp:Literal>
        </ul>
    </div>
</div>




<!--------------------------------內容結束------------------------------------------------------> 
</div>
</div>

<!--------------------------------右邊選單結束----------------------------------------------------> 
</div>



</asp:Content>
