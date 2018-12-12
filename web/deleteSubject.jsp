<%@ page import="example.StudentDAO" %>
<%@ page import="example.SubjectDAO" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String admin = "";
    try{
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(int i =0; i<cookies.length;i++){
                if(cookies[i].getName().equals("studentId")){
                    admin = cookies[i].getValue();
                }
            }
            if(!admin.equals("ADMIN")){
                response.sendRedirect("loginForm.jsp");
            }
        }else{
            response.sendRedirect("loginForm.jsp");
        }
    }catch(Exception e){

    }
%>
<%
    SubjectDAO SubDAO = new SubjectDAO();

    String lectureId = request.getParameter("lectureId");

    SubDAO.deleteSubjectIndo(lectureId);
%>
<script>
    alert("삭제되었습니다.");
    location.href="AdminSubject.jsp";
</script>