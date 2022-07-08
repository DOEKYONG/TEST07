<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.BoardDao"%>
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
<% Dao dao = new Dao();
	int maxcustno =dao.get마지막번호()+1;
	 SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");             
	 Date now = new Date();    
	 String date = sdf1.format(now);      
	 

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
<form id ="join" action="joincontroller.jsp">
		<table>
		<tr>
			<td>회원번호(자동발생)</td>
			<td><input type="text" value="<%=maxcustno%>" name="custno" id = "custno"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" id ="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" id ="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address" id ="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate" value="<%=date%>" id ="joindate" ></td>
		</tr>
		<tr>
			<td>고객등급(A:VIP,B:일반,C:직원)</td>
			<td><input type="text" name="grade" id ="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
		<td><input type="text" name="city" id ="city"></td>
		</tr>
		<tr>
			<td></td>
			<td><button type="button" onclick="joinchk()">등록</button><button type="button" onclick="location.href='list.jsp'">조회</button></td>
		</tr>
		</table>
	</form>	
	</main>
<script type="text/javascript" src = "write.js"></script>
</body>
</html>