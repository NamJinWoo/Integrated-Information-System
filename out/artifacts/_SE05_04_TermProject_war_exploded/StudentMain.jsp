<%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = "";
    try{
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(int i =0; i<cookies.length;i++){
                if(cookies[i].getName().equals("studentId")){
                    studentId = cookies[i].getValue();
                }
            }
            if(studentId.equals("")){
                response.sendRedirect("loginForm.jsp");
            }
        }else{
            response.sendRedirect("loginForm.jsp");
        }
    }catch(Exception e){

    }
%>
<html>
<head>
    <title>Title</title>

    <script>
        function inputSemester() {
            var semester = parseInt(window.prompt("성적조회를 원하는 학기를 입력하세요, 0은 전체 성적 조회입니다.","숫자만"));
            if( semester < 0 || isNaN(semester)){
                alert("정상적인 학기만 입력하세요.");
                return;
            }
            location.href ="gpa.jsp?semester="+semester;

        }
    </script>
</head>
<body>
    <b><%=studentId %></b>님이 로그인하셨습니다.
    <form method="post" action = "cookieLogout.jsp">
        <input type="submit" value = "logout">
    </form>
    <ul>
        <li><a href="state.jsp">학적정보</a></li>
        <li><a href="subject.jsp">과목정보</a></li>
        <li><a href="javascript:inputSemester();">성적조회</a></li>
        <li><a href="tuition.jsp">등록정보</a></li>
        <li><a href="scholarship.jsp">장학정보</a></li>
    </ul>
</body>
</html>
