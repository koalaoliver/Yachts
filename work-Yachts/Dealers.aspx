﻿<%@ Page Title="" Language="C#" MasterPageFile="~/view.master" AutoEventWireup="true" CodeBehind="Dealers.aspx.cs" Inherits="work_Yachts.dealers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="css/homestyle.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contain"> 
  
  
 

<!--遮罩-->
<div class="bannermasks"><img src="images/DEALERS.jpg" alt="&quot;&quot;" width="967" height="371" /></div>
<!--遮罩結束-->

<!--<div id="buttom01"><a href="#"><img src="images/buttom01.gif" alt="next" /></a></div>-->

<!--小圖開始-->
<!--<div class="bannerimg">
<ul>
<li> <a href="#"><div class="on"><p class="bannerimg_p"><img  src="images/pit003.jpg" alt="&quot;&quot;" /></p></div></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" width="300" /></p>
</a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
</ul>

<ul>
<li> <a class="on" href="#"><p class="bannerimg_p"><img  src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <p class="bannerimg_p"><a href="#"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
<li> <a href="#"><p class="bannerimg_p"><img src="images/pit003.jpg" alt="&quot;&quot;" /></p></a></li>
</ul>


</div>-->
<!--小圖結束-->


<!--<div id="buttom02"> <a href="#"><img src="images/buttom02.gif" alt="next" /></a></div>-->

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
<p><span>DEALERS</span></p>
<ul>

    <asp:Literal ID="LeftMenu" runat="server"></asp:Literal>

</ul>
</div>
</div>


<!--------------------------------左邊選單結束----------------------------------------------------> 

<!--------------------------------右邊選單開始----------------------------------------------------> 
<div id="crumb"><a href="#">Home</a> >> <a href="#">Dealers </a> >> <a href="#">
    <span class="on1" id="labLink" runat="server"> USA</span></a></div>
    
<div class="right"> 
<div class="right1">
 <div class="title"> 
 <span id="LitTitle" runat="server"> USA</span></div>
  
<!--------------------------------內容開始----------------------------------------------------> 
<div class="box2_list"> 
<ul>
    <asp:Literal ID="DealerList" runat="server"></asp:Literal>
</ul>
  <div class="pagenumber">
 
</div>
 
<!--------------------------------內容結束------------------------------------------------------> 
</div>
</div>

<!--------------------------------右邊選單結束----------------------------------------------------> 
</div>

 

    </div>
    </div>
</asp:Content>
