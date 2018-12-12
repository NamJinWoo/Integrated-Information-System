<%@ page import="example.StudentDAO" %>
<%@ page import="example.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 10/12/2018
  Time: 4:01 AM
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
    StudentDAO StuDAO = new StudentDAO();
    List<Student> studentList = StuDAO.lookupStudents();

    StuDAO.toNextSemester(studentList);
%>
<script>
    alert("종강했습니다.");
    location.href="AdminState.jsp";
</script>