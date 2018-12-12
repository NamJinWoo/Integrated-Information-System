<%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="example.DBBean"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<%
    final String adminId = "ADMIN";
    final String adminPasswd = "ADMIN";

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    if(id.equals(adminId) &&passwd.equals(adminPasswd)){

        Cookie cookie = new Cookie("studentId", id);
        cookie.setMaxAge(20 * 60);
        response.addCookie(cookie);

        response.sendRedirect("AdminMain.jsp");
    }

    DBBean logon = new DBBean();
    int check = logon.userCheck(id, passwd);

    if (check == 1) {
        Cookie cookie = new Cookie("studentId", id);
        cookie.setMaxAge(20 * 60);
        response.addCookie(cookie);

        response.sendRedirect("StudentMain.jsp");
    } else if (check == 0) {
%>
<script>
    alert("비밀번호가 맞지 않습니다.");
    history.go(-1);
</script>
<%
} else {
%>
<script>
    alert("아이디가 맞지않습니다.");
    history.go(-1);
</script>
<%
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
