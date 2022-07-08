<%@page import="dto.MemberDto"%>
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
<%
	int custno = Integer.parseInt( request.getParameter("custno"));
	Dao dao = new Dao();
	MemberDto dto = dao.개별호출(custno);
	
%>
<header>
		<h3>쇼핑몰 회원관리 ver 1.0</h3>
	</header>
	<nav>
		
		<span><a href="/test_07_08/write.jsp">회원등록</a></span> 
		<span><a href="/test_07_08/list.jsp">회원목록조회/수정</a></span> 
		<span><a href="/test_07_08/sales.jsp">회원매출조회</a></span> 
		<span><a href="/test_07_08/index.jsp">홈으로</a></span>
		
	</nav>
<main>

<form id ="update" action="updatecontroller.jsp">
<table>
		<tr>
			<td>회원번호</td>
			<td><input type="text" value="<%=dto.getCustno()%>" name="custno" id = "custno"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" id ="custname" value="<%=dto.getCustname()%>"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" id ="phone" value="<%=dto.getPhone()%>"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" id ="address" value="<%=dto.getAddress()%>" ></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" value="<%=dto.getJoindate()%>" id ="joindate" ></td>
		</tr>
		<tr>
			<td>고객등급(A:VIP,B:일반,C:직원)</td>
			<td><input type="text" name="grade" id ="grade" value="<%=dto.getGrade()%>" ></td>
		</tr>
		<tr>
			<td>도시코드</td>
		<td><input type="text" name="city" id ="city" value="<%=dto.getCity()%>"></td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" onclick="mupdate()">등록</button><button type="button" onclick="location.href='list.jsp'">조회</button></td>
		</tr>
		
</table>
</form>

</main>

<script type="text/javascript" src ="update.js"></script>
</body>
</html>