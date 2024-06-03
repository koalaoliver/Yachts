﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="work_Yachts.company" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    Tayana | Tayana Yachts Official Website
  </title>
  <script type="text/javascript" src="Scripts/jquery.min.js"></script>
  <!--[if lt IE 7]>
  <script type="text/javascript" src="javascript/iepngfix_tilebg.js"></script>
  <![endif]-->
  <link rel="shortcut icon" href="favicon.ico" />
  <link href="css/homestyle.css" rel="stylesheet" type="text/css" />
  <link href="css/reset.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript">
    $(function () {
      $('.topbuttom').click(function () {
        $('html, body').scrollTop(0);
      });
    });
  </script>
</head>
<body>
    <form id="form1" runat="server" method="post">
      <div class="contain">
        <div class="sub">
          <p>
            <a href="index.aspx">Home</a>
          </p>
        </div>
        <!--------------------------------選單開始---------------------------------------------------->
                         <div id="logol"><a href="index.aspx"><img src="images/logo001.gif" alt="Tayana"  /></a></div>
           <div class="menu">
<ul>
<li class="menuli01"><a href="Yachts_OverView.aspx"><img src="images/mmmmeeeee.gif" alt="&quot;&quot;" />Yachts</a></li>
<li class="menuli02"><a href="news01.aspx"><img src="images/mmmmeeeee.gif" alt="&quot;&quot;" />NEWS</a></li>
<li class="menuli03"><a href="Company.aspx"><img src="images/mmmmeeeee.gif" alt="&quot;&quot;" />COMPANY</a></li>
<li class="menuli04"><a href="Dealers.aspx"><img src="images/mmmmeeeee.gif" alt="&quot;&quot;" />DEALERS</a></li>
<li class="menuli05"><a href="Contact.aspx"><img src="images/mmmmeeeee.gif" alt="&quot;&quot;" />CONTACT</a></li>
</ul>  
</div>
        <!--------------------------------選單開始結束---------------------------------------------------->
        <!--遮罩-->
        <div class="bannermasks"><img src="images/company.jpg" alt="&quot;&quot;" width="967" height="371" /></div>
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
            <p><span>COMPANY</span></p>
            <ul>
                <li><a href='Company.aspx' target='_self'>About Us</a></li>
                <li><a href='Certificate.aspx' target='_self'>Certificat</a></li>
            </ul>
            </div>
        </div>
        <!--------------------------------左邊選單結束---------------------------------------------------->
        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb"><a href="index.aspx">Home</a> >> <a href="#">Company </a> >> <a href="#"><span class="on1">About Us</span></a></div>
        <div class="right">
            <div class="right1">
            <div class="title"> <span>About Us</span></div>
            <!--------------------------------內容開始---------------------------------------------------->
            <div class="box3">
                <asp:Literal ID="Li_AbouUS" runat="server"></asp:Literal>
            </div>
            <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>
        <!--------------------------------右邊選單結束---------------------------------------------------->
        </div>
        <!--------------------------------落款開始---------------------------------------------------->
        <div class="footer">
          <div class="footerp00">
            <a href="http://www.tognews.com/" target="_blank">
              <p><img src="images/tog.jpg" alt="TOG" /></p>
            </a>
            <p class="footerp001">© 1973-2012 Tayana Yachts, Inc. All Rights Reserved</p>
          </div>
          <div class="footer01">
            <span>No. 60, Hai Chien Road, Chung Men Li, Lin Yuan District, Kaohsiung City, Taiwan, R.O.C.</span><br />
            <span>TEL：+886(7)641-2721</span> <span>FAX：+886(7)642-3193</span>
          </div>
        </div>
        <!--------------------------------落款結束---------------------------------------------------->
      </div>
    </form>
</body>
</html>
