<%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<body>
    <b>관리자</b>님이 로그인하셨습니다.
    <form method="post" action = "cookieLogout.jsp">
        <input type="submit" value = "logout">
    </form>
    <ul>
        <li><a href="AdminState.jsp">학적정보관리</a></li>
        <li><a href="AdminSubject.jsp">과목정보관리</a></li>
        <li><a href="AdminGrade.jsp">성적정보관리</a></li>
        <li><a href="AdminTuition.jsp">등록정보관리</a></li>
        <li><a href="updateScholarship.jsp">장학정보관리</a></li>
    </ul>
</body>
</body>
</html>
