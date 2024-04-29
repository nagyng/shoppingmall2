<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>/sample/admin page</h1>

<!-- principal		: 사용자의 모든 정보를 가진다. -->
<p>principal		: <sec:authentication property="principal"/></p>
<!-- CustomUser.java 에 있는 member 의 필드 값을 모두 가져온다. -->
<p>MemberVO			: <sec:authentication property="principal.member"/></p>
<p>사용자이름			: <sec:authentication property="principal.member.userName"/></p>
<!-- username 		: 스프링에서 제공하는 아이디 -->
<p>사용자아이디		: <sec:authentication property="principal.username"/></p>
<p>사용자 권한 리스트	: <sec:authentication property="principal.member.authList"/></p> 
 
<a href="/customLogout">로그아웃</a>


</body>
</html>