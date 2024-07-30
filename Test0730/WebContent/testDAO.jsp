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
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
	</script>
</head>
<body>
		<%
			boolean login = mDao.loginCheck("1", "22");
			if(login){ %>
			<div>로그인됨</div>
			<% } else { %>
			<div>안됨</div>
			<%}
		%>
		<table>
		<%
			ArrayList<MemberDTO> mDto =  mDao.getMemberInfoAll();
			for(MemberDTO aa : mDto) { 
		%>
			<tr>
				<th><%=aa.getId()%></th>
				<th><%=aa.getPw()%></th>
				<th><%=aa.getName()%></th>
				<th><%=aa.getPoint()%></th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		<% } %>
		</table>
		
		<button>삭제테스트</button>
</body>
</html>