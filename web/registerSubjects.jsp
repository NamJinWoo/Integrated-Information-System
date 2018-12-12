<%@ page import="example.StudentDAO" %>
<%@ page import="example.StateDAO" %>
<%@ page import="example.SubjectDAO" %><%--
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
    SubjectDAO SubDAO = new SubjectDAO();

    String lectureName = request.getParameter("lectureName");
    String profName =request.getParameter("profName");
    String classroomNum = request.getParameter("classroomNum");
    String classTime = request.getParameter("classTime");
    int gradeValue = Integer.parseInt(request.getParameter("gradeValue"));
    int eduYear = Integer.parseInt(request.getParameter("eduYear"));
    int maxStudents = Integer.parseInt(request.getParameter("maxStudents"));
    int lectureKind = Integer.parseInt(request.getParameter("lectureKind"));
    String lectureMajor = request.getParameter("lectureMajor");
    String lecturePlan = request.getParameter("lecturePlan");

    SubDAO.insertSubject(lectureName, profName, classroomNum, classTime, gradeValue, eduYear, maxStudents, lectureKind, lectureMajor, lecturePlan);
%>
<script>
    alert("등록되었습니다.");
    location.href="AdminSubject.jsp";
</script>