<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<%
	String message = (String) request.getAttribute("message");
	if(message == null) {
		message = "";
	}
%>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="form-structor">
		<div class="signup" id="s">
			<h2 class="form-title" id="signup"><span>or</span>Sign up</h2>
			<div class="form-holder">
				<input type="text" class="input" placeholder="Name" /> 
				<input type="email" class="input" placeholder="Email" /> 
				<input type="password" class="input" placeholder="Password" />
			</div>
			<button class="submit-btn">Sign up</button>
		</div>
		<form action="LoginController">
			<div class="login slide-up" id="l">
				<div class="center">
					<h2 class="form-title" id="login"><span>or</span>Log in</h2>
					<div class="form-holder">
						<input type="email" name="userid" class="input" placeholder="Email" /> 
						<input type="password" name="password" class="input" placeholder="Password" />
					</div>
					<button class="submit-btn">Log in</button>
					<div>			
						<h5><%= message %></h5>
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
</script>
</html>