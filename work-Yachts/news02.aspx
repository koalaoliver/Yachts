<%@ Page Title="" Language="C#" MasterPageFile="~/view.master" AutoEventWireup="true" CodeBehind="news02.aspx.cs" Inherits="work_Yachts.news02" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/homestyle.css" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--------------------------------選單開始結束---------------------------------------------------->  

<!--遮罩-->
<div class="bannermasks"><img src="images/banner02_masks.png" alt="&quot;&quot;" /></div>


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
<p><span>NEWS</span></p>
<ul>
<li><a href="#">News & Events</a></li>

</ul>



</div>




</div>







<!--------------------------------左邊選單結束----------------------------------------------------> 

<!--------------------------------右邊選單開始----------------------------------------------------> 
<div id="crumb"><a href="#">Home</a> >> <a href="#">News </a> >> <a href="#"><span class="on1">News & Events</span></a></div>
<div class="right"> 
<div class="right1">
  <div class="title"> <span>News & Events</span></div>
  
<!--------------------------------內容開始----------------------------------------------------> 
  <div class="box3">
      <h4><span id="newsTitle" runat="server"></span></h4>
      <p>
          <asp:Literal ID="newsContent" runat="server"></asp:Literal>
      </p>
      <br>
      <asp:Literal ID="groupImg" runat="server"></asp:Literal>
  </div>
  <!--下載開始-->
  <!--下載結束-->
  <div class="buttom001"><a href="javascript:window.history.back();"><img src="images/back.gif"alt="&quot;&quot;" width="55" height="28" /></a></div>

<!--------------------------------內容結束------------------------------------------------------> 
</div>
</div>

<!--------------------------------右邊選單結束----------------------------------------------------> 
</div>
</asp:Content>
