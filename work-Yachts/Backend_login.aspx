<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="backend_login.aspx.cs" Inherits="work_Yachts.backend_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

   

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="login/css/style.css">

</head>
<body>
    <form id="form1" runat="server">
       

<div class="img js-fullheight" style="background-image: url(images/bg00.jpg);"/div>
	<div class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Yachts Login </h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
						<asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
		      		<div class="form-group">
				<asp:TextBox ID="Account" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>

		      		</div>
	            <div class="form-group">
			
					<asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
					<asp:Button ID="Btn_login" runat="server" Text="Login" CssClass="form-control btn btn-primary submit px-3" OnClick="Btn_login_Click" />
	           
	            </div>
						<br />
						<br />
						<br />
						<asp:Button ID="Button2" runat="server" Text="回首頁" OnClick="Button2_Click1" CssClass="form-control btn btn-primary submit px-3" />
	            </form>
		      </div>
				</div>
			</div>
		</div>
	</div>

	<script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>


        </div>
    </form>

</body>
</html>
