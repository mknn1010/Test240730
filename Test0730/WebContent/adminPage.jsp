<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO mDao = new MemberDAO();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>admin</title>
	<link href="/css/reset.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$(document).on("click","#update_btn", function(){
				alert("클릭");
			})
			$(document).on("click","#delete_btn", function(){
				alert("삭제되었습니다.");
			})
		})
	</script>
	<style>
		table { 
			border-collapse: collapse;
			text-align: center; 
		}	
		td, th { 
			border: 1px solid grey; 
			padding: 0.2rem 1rem;
			width: 4rem;	
			font-size: 1.2rem
		}
		.user_tr > td > button {
			width:90%;
		}
	</style>
</head>
<body>
	<div class="main_container">
		<div class="user_container">
			<div class="header">
				<h1>회원관리</h1>
				<button id="login">로그인</button>
			</div>
			<div class="table_section">
				<table>
					<tr>
						<th>ID</th>
						<th>PW</th>
						<th>Name</th>
						<th>Point</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					<%
						ArrayList<MemberDTO> listMember =  mDao.getMemberInfoAll();
						for(MemberDTO mDto : listMember) { 
					%>
						<tr class="user_tr">
							<td><%=mDto.getId()%></td>
							<td><%=mDto.getPw()%></td>
							<td><%=mDto.getName()%></td>
							<td><%=mDto.getPoint()%></td>
							<td><button id="update_btn" onclick="location.href='AdminServlet?id=<%=mDto.getId()%>&type=update'">수정</button></td>
							<td><button id="delete_btn" onclick="location.href='AdminServlet?id=<%=mDto.getId()%>&type=delete'">삭제</button></td>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
		<div class="schedule_container">
			<h1>스케줄러관리</h1>
			<div class="btn_container">
				<button class="start_scheduler" style="font-size: 1.2rem;">스케줄러(20초마다 포인트 1 증가) 실행 시작</button>
				<button class="stop_scheduler" style="font-size: 1.2rem;">스케줄러 실행 종료</button>
			</div>
		</div>
	</div>
</body>
</html>