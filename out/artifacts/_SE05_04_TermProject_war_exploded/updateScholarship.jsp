<%@ page import="java.util.List" %>
<%@ page import="example.*" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 10/12/2018
  Time: 3:20 AM
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
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        StudentDAO studentDAO = new StudentDAO();
        List<Student> studentList = studentDAO.lookupStudents();
        SelSubjectDAO selSubjectDAO = new SelSubjectDAO();
        TuitionDAO tuitionDAO = new TuitionDAO();

        for(int i = 0; i< studentList.size(); i++){
            System.out.println(studentList.size());
            System.out.println(selSubjectDAO.getAvgGrade(studentList.get(i).getStudentId(),studentList.get(i).getSemester()-1));
            if(selSubjectDAO.getAvgGrade(studentList.get(i).getStudentId(),studentList.get(i).getSemester()-1) >= 4.0){
                tuitionDAO.updateScholarship(studentList.get(i).getStudentId(),studentList.get(i).getSemester());
    %>
        <p>학번 : <%=studentList.get(i).getStudentId()%>
        이름 : <%=studentList.get(i).getStudentName()%>
        학과명 : <%=studentList.get(i).getMajor()%>
        현재학기 : <%=studentList.get(i).getSemester()%>
        장학금 : 1000000 원
        장학분류 : 성적우수장학금</p>
    <%
            }
        }

    %>

    <a href="AdminMain.jsp">메인으로</a>
</body>
</html>
