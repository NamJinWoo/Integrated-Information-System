<%@ page import="example.StudentDAO" %>
<%@ page import="example.StateDAO" %>
<%@ page import="example.Student" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 10:21 PM
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

    String studentId = request.getParameter("studentId");
    String studentName = request.getParameter("studentName");
    String studentDepartment = request.getParameter("studentDepartment");
    String studentEmail = request.getParameter("studentEmail");
    String studentPassword = request.getParameter("studentPassword");
    boolean studentState = Boolean.parseBoolean(request.getParameter("studentState"));
    String studentAttr = request.getParameter("studentAttr");
    int studentSemester = Integer.parseInt(request.getParameter("studentSemester"));

    Student student = new Student(studentId, studentName, studentPassword, studentDepartment, studentAttr, studentState, studentEmail, studentSemester);

    StuDAO.updateStudentInfo(student);
%>
<script>
    alert("수정되었습니다.");
    location.href="AdminState.jsp";
</script>