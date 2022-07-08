<%@page import="dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
display: flex;
flex-direction: column;
}
span {
	margin-left : 15px;
}
</style>
</head>
<body>
<header>
		<h3>쇼핑몰 회원관리 ver 1.0</h3>
	</header>
	<nav>
		
	<span><a href="/test_07_08/write.jsp">회원등록</a></span> 
		<span><a href="/test_07_08/list.jsp">회원목록조회/수정</a></span> 
		<span><a href="/test_07_08/sales.jsp">회원매출조회</a></span> 
		<span><a href="/test_07_08/index.jsp">홈으로</a></span>
		
	</nav>
	
	<%
		Dao dao = new Dao();
		ArrayList<MemberDto> list = dao.매출조회(); 
	%>
	
	<table>
		<tr>
			<th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th>
			
		</tr>
		<%for (MemberDto temp :list) { %>
			<tr>
				<td> <%=temp.getCustno() %></td>
				<td><%=temp.getCustname()%></td>
				<td><%=temp.getGrade() %></td>
				<td><%=temp.getSumprice() %></td>
			</tr>
		<%} %>
	</table>
	

</body>
</html>