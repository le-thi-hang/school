<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<%
	String username =(String)request.getAttribute("username");
	String userid =(String)request.getAttribute("userid");	
	if (userid == null) {
		userid = "";
	}
	if (username == null) {
		username = "";
	}
	String message = (String) request.getAttribute("message");
	String mess = (String) request.getAttribute("mess");
	if(message == null) {
		message = "";
	}
	if(mess == null){
		mess="";
	}
%>
<meta charset="UTF-8">
<title>ログイン</title>

</head>
<body>
	<div class="form-structor">
		<form action="SignUpController" method="post">	
			<div class="signup slide-up" id="s">
				<h2 class="form-title" id="signup" >
					<span>or</span>Sign up
				</h2>
				<div class="form-holder">
					<input type="text" name="username" class="input" placeholder="Name"  value="<%= username%>"/> 
					<input type="email" name="userid" class="input" placeholder="Email"  value="<%= userid%>"/> 
					<input type="password" name="password" class="input" placeholder="Password" />
				</div>
				<button class="submit-btn">Sign up</button>
				<div>		
					<h5 style="text-align:center;"><%= mess%></h5>
				</div>
			</div>
		</form>
		<form action="LoginController" method="post">
			<div class="login" id="l">
				<div class="center">
					<h2 class="form-title" id="login"><span>or</span>Log in</h2>
					<div class="form-holder">
						<input type="email" name="userid" class="input" placeholder="Email" /> 
						<input type="password" name="password" class="input" placeholder="Password" />
					</div>
					<button class="submit-btn">Log in</button>	
					<input type="button" class="submit-btn" onclick="location.href='ItemListController'" value="HOME">	
					<div>
						<h5><%= message%></h5>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script src="js/login.js"></script>
<script>
	if(<%= !message.equals("") ? "true" : "false" %>) {
		$("#s").addClass("slide-up");
		$("#l").removeClass("slide-up");
	}

	if(<%= !mess.equals("") ? "true" : "false" %>) {
		$("#l").addClass("slide-up");
		$("#s").removeClass("slide-up");
	}
</script>
</html>