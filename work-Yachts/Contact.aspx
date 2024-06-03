<%@ Page Title="" Language="C#" MasterPageFile="~/view.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="work_Yachts.Contact" %>

<%@ Register Assembly="Recaptcha.Web" Namespace="Recaptcha.Web.UI.Controls" TagPrefix="cc1" %>


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
<p><span>CONTACT</span></p>
<ul>
<li><a href="#">contacts</a></li>
</ul>


</div>

</div>



<!--------------------------------左邊選單結束----------------------------------------------------> 

<!--------------------------------右邊選單開始----------------------------------------------------> 
<div id="crumb"><a href="#">Home</a> >> <a href="#"><span class="on1">Contact</span></a></div>
<div class="right"> 
<div class="right1">
  <div class="title"> <span>Contact</span></div>
  
<!--------------------------------內容開始----------------------------------------------------> 
<div class="from01">
    <p>
        Please Enter your contact information<span class="span01">*Required</span>
    </p>
    <br />
    <table>
        <tr>
            <td class="from01td01">Name :</td>
            <td><span>*</span><asp:TextBox runat="server" name="Name" type="text" ID="Name" class="{validate:{required:true, messages:{required:'Required'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="from01td01">Email :</td>
            <td><span>*</span><asp:TextBox runat="server" name="Email" type="text" ID="Email" class="{validate:{required:true, email:true, messages:{required:'Required', email:'Please check the E-mail format is correct'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="from01td01">Phone :</td>
            <td><span>*</span><asp:TextBox runat="server" name="Phone" type="text" ID="Phone" class="{validate:{required:true, messages:{required:'Required'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="from01td01">Country :</td>
            <td><span>*</span>
                <asp:DropDownList name="Country" id="Country" runat="server" DataTextField="Country" DataValueField="Country" DataSourceID="OliverDB" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="OliverDB" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT [Country] FROM [Country]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2"><span>*</span>Brochure of interest *Which Brochure would you like to view?</td>
        </tr>
        <tr>
            <td class="from01td01"> </td>
            <td>
                <asp:DropDownList name="Yachts" id="Yachts" runat="server" DataTextField="YachtModel" DataValueField="YachtModel" DataSourceID="OliverDB1"></asp:DropDownList>
                <asp:SqlDataSource ID="OliverDB1" runat="server" ConnectionString="<%$ ConnectionStrings:OliverDB %>" SelectCommand="SELECT [YachtModel] FROM [Yachts]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="from01td01">Comments:</td>
            <td>
                <asp:TextBox runat="server" TextMode="MultiLine" name="Comments" Rows="2" cols="20" ID="Comments" Style="height: 150px; width: 330px;" MaxLength="500"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="from01td01"> </td>
            <td class="f_right">
                <!-- Render recaptcha API script -->
                <cc1:RecaptchaApiScript ID="RecaptchaApiScript1" runat="server" />
                <!-- Render recaptcha widget -->
                <cc1:RecaptchaWidget ID="Recaptcha1" runat="server" />
                <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="from01td01"> </td>
            <td class="f_right">
                <asp:ImageButton runat="server" type="image" name="ImageButton1" id="ImageButton1" src="images/buttom03.gif" style="border-width: 0px;" Height="25px" OnClick="ImageButton1_Click"/>
            </td>
        </tr>
    </table>
</div>
<!--表單-->

<div class="box1">
<span class="span02">Contact with us</span><br />
Thanks for your enjoying our web site as an introduction to the Tayana world and our range of yachts.
As all the designs in our range are semi-custom built, we are glad to offer a personal service to all our potential customers. 
If you have any questions about our yachts or would like to take your interest a stage further, please feel free to contact us.
</div>

<div class="list03">
<p><span>TAYANA HEAD OFFICE</span><br />
NO.60 Haichien Rd. Chungmen Village Linyuan Kaohsiung Hsien 832 Taiwan R.O.C<br />
  tel. +886(7)641 2422<br />
  fax. +886(7)642 3193<br />
  info@tayanaworld.com<br /></p>
</div>


<div class="list03">
<p><span>SALES DEPT.</span><br />
+886(7)641 2422  ATTEN. Mr.Basil Lin<br /><br /></p>
</div>

<div class="box4">
<h4>Location</h4>
<p>
  <iframe width="695" height="518" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8095.545979985496!2d120.30367973524821!3d22.627588715312964!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e048fcb1db9a3%3A0x6e6aee6edfe5dd47!2zODAw6auY6ZuE5biC5paw6IiI5Y2A5rCR55Sf5LiA6Lev!5e0!3m2!1szh-TW!2stw!4v1703582011554!5m2!1szh-TW!2stw"></iframe>
<%--    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8095.545979985496!2d120.30367973524821!3d22.627588715312964!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e048fcb1db9a3%3A0x6e6aee6edfe5dd47!2zODAw6auY6ZuE5biC5paw6IiI5Y2A5rCR55Sf5LiA6Lev!5e0!3m2!1szh-TW!2stw!4v1703582011554!5m2!1szh-TW!2stw" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>--%>
</p>

  </div>




<!--------------------------------內容結束------------------------------------------------------> 
</div>
</div>

<!--------------------------------右邊選單結束----------------------------------------------------> 
</div>


</asp:Content>
