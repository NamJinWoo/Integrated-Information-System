<%@ page import="example.StudentDAO" %>
<%@ page import="example.StateDAO" %>
<%@ page import="example.Student" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 06/12/2018
  Time: 12:22 AM
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
<%
    StudentDAO StuDAO = new StudentDAO();
    Student student = StuDAO.lookupStudentInfo(studentId);

    if(student != null) {
        StuDAO.updateState(studentId, !(student.isState()));
        StateDAO StaDAO = new StateDAO();
        StaDAO.updateState(studentId, !(student.isState()));
    }

%>
<script>
    alert("변경되었습니다.");
    location.href="state.jsp";
</script>