<%@ page import="example.SelSubject" %>
<%@ page import="example.SelSubjectDAO" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 07/12/2018
  Time: 9:35 PM
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
</head>
<body>
    <%
        int lectureId = Integer.parseInt(request.getParameter("lectureId"));
        SelSubjectDAO selSubjectDAO = new SelSubjectDAO();
        String result = selSubjectDAO.registerSelSubjects(lectureId,studentId);
    %>
    <script>
        alert("<%=result%>");
        location.href = "subject.jsp";
    </script>

</body>
</html>
