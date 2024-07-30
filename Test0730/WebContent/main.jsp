<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO mDao = new MemberDAO();
	String id = request.getParameter("id").toString();
	MemberDTO mInfo = mDao.getMemberById(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main</title>
	<link rel="stylesheet" href="css/reset.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$("#logout").on("click", function(){
				alert("로그아웃되었습니다.");
				location.href="login.jsp";
			})
			
			
			$(".ad").on("click", function(){
				alert("점이 적립되었습니다.")
			});
		})
	</script>
	<style>
		.header { 
			display:flex;
			justify-content: space-between; 
			padding : 1rem;
		}
		.right_header{
			display:flex;
		}
		.user_infor {
			font-weight: 700;
		}
		#logout { 
	    	height: 1.625rem;
		    padding: 0 0.5rem;
		}
		.center {
			padding: 0 1rem 1rem 1rem;
		}
		.item_container {
			display:flex;
			justify-content: space-between;
			margin:auto 0;
		}
		.img_container {
			display:flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.footer{
			display:flex;
			justify-content: flex-end;
		}
		.ad_container {
			border: 1px solid #a1a1a1;
		}
	</style>
</head>
<body>
	<div class="main">
		<div class="header border">
			<div class="left_header">
				<h1>메인페이지</h1>
			</div>
			<div class="right_header">
				<div class="user_infor">
					<span class="user_name"><%=mInfo.getName()%></span><span class="user_id">(<%=mInfo.getId()%>)</span>님 안녕하세요.<br/>
					포인트 : <span><%=mInfo.getPoint()%></span>점
				</div>
				<button id="logout">로그아웃</button>
			</div>
		</div>
		<div class="center border">
			<h3 style="margin: 1rem 0;">구입할 컨텐츠를 선택하세요.</h3>
			<div class="item_container">
				<div class="img_container">
					<img src="img/Intro_350_408.png"/>
					<span>100,000 포인트</span>
				</div>
				<div class="img_container">
					<img src="img/Java_350_408.png"/>
					<span>500,000 포인트</spanp>
				</div>
				<div class="img_container">
					<img src="img/Cpp_350_408.png"/>
					<span>300,000 포인트</span>
				</div>
			</div>
		</div>
		<div class="footer border">
			<div class="ad_container">
				<p style="margin: 0;">&lt;광고&gt;</p>
				<img class="ad" src="img/korea_it.png">
			</div>
		</div>	
	</div>
</body>
</html>