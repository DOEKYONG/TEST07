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
<% // 리스트호출 
	Dao dao = new Dao();
	ArrayList<MemberDto> list = dao.모든호출();
%>
<header>
		쇼핑몰 회원관리 ver 1.0
	</header>
	
	<nav>
		<span><a href="/test_07_08/write.jsp">회원등록</a></span> 
		<span><a href="/test_07_08/list.jsp">회원목록조회/수정</a></span> 
		<span><a href="/test_07_08/sales.jsp">회원매출조회</a></span> 
		<span><a href="/test_07_08/index.jsp">홈으로</a></span>

	</nav>

<table>
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>회원전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	<% for(MemberDto dto :  list) { 
		String grade = null;
		if(dto.getGrade().equals("A")) {
			grade = "VIP"; 
		}else if(dto.getGrade().equals("B")) {
			grade = "일반";
		} else {
			grade = "직원";
		}
	%>
		<tr>
			<td><a href="update.jsp?custno=<%=dto.getCustno()%>"><%=dto.getCustno() %></a></td>
			<td><%=dto.getCustname() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getAddress() %></td>
			<td><%=dto.getJoindate() %></td>
			<td><%=grade %></td>
			<td><%=dto.getCity() %></td>
		</tr>
	
	
	<%} %>
	
</table>

</body>
</html>