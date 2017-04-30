<%@ page contentType="text/html;charset=GB2312"%>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link href="css/signin.css" rel="stylesheet">

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
	$('#login-button').click(function(event) {
		event.preventDefault();
		$('form').fadeOut(500);
		$('.signin').addClass('form-success');
	});
</script>
<script type="text/javascript">
	function login() {
		var htmlobj = $.ajax({
			url : "UserAction!login.action",
			type : "POST",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
			},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "Chewei.jsp";

		} else {
			/* $.MsgBox.Alert("��ܰ��ʾ��", error);  */
			alert("��ܰ��ʾ���û������������");
			swal({
				title : error,
				showCancelButton : true,
				showConfirmButton : false,
				cancelButtonText : "ȷ��",

			});
		}
	}
	function keydown(e) {
		if ((e.keyCode || e.which) == 13) {
			login();
		}
	};
</script>
</head>
<html>
<body>
	<div id="container">
		<div align="center">
			<span class="STYLE20"><span class="STYLE19">
					<h1 style="color:black">԰��ͣ��������ϵͳ</h1>
			</span>
		</div>
		<div class="signin">
			<div class="signin-head">
				<img src="images/test/head_120.png" alt="" class="img-circle">
			</div>
			<form class="form-signin">
				<input name="username" type="text" class="form-control"
					id="username" placeholder="�û���"> <input name="password"
					type="password" class="form-control" id="password"
					placeholder="Password">
				<button name="" type="button"
					class="btn btn-lg btn-warning btn-block" value="��¼"
					onclick="login()" id="login-button">��¼</button>
			</form>
		</div>
	</div>
</body>
</html>