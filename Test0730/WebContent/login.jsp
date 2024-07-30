<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link href="css/reset.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<style>
		.main_border{
			display: inline-block;
			border: 1px solid black;
			padding: 1rem 2rem 2rem 2rem;
		}
		.input_container, .input_outer {
			display:flex;
  			flex-direction: column;
			gap:0.2rem;
		}
		.input_inner {
			display:flex;
			justify-content: flex-start;
		}
		.input_inner > input {
			margin-left: auto;
		}
		.btn {
			width:100%;
		}
	</style>
</head>
<body>
	<div class="main_border">
		<div class="h1_container">
			<h1 style="font-size: 36px;">로그인</h1>
		</div>
		
		<div class="input_container">
			<form action="LoginServlet" method="post">
			<div class="input_outer">
					<div class="input_inner">
						ID : <input type="text" name="id" id="input_id" required/><br/>
					</div>
					<div class="input_inner">
						PW : <input type="password" name="pw" id="input_id" required/><br/>
					</div>
			</div>
			<button type="submit" id="login" class="btn">로그인</button>
			</form>
			<button id="signUp" class="btn" onclick="location.href='userSignUp.jsp'">회원가입</button>			
		</div>
	</div>
</body>
</html>
