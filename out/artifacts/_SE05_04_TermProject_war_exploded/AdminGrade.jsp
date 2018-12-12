<%@ page import="example.StudentDAO" %>
<%@ page import="example.Student" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 9:37 PM
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
    <script>
        function popupOpen(studentId, semester){

            var popUrl = "insertGrade.jsp?studentId="+studentId+"&semester="+semester;	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }
    </script>
</head>
<body>
    <%
        StudentDAO studentDAO = new StudentDAO();
        List<Student> studentList = studentDAO.lookupStudents();
        for (int i = 0; i < studentList.size(); i++) {
    %>
    <p>
        학번 : <%=studentList.get(i).getStudentId()%>
        이름 : <%=studentList.get(i).getStudentName()%>
        학과명 : <%=studentList.get(i).getMajor()%>
    </p>
    <button onclick="popupOpen(<%=studentList.get(i).getStudentId()%>,<%=studentList.get(i).getSemester()%>)"> 성적 입력
    </button>
    <%
        }
    %>

    <hr/>
    <br/>
    <a href="AdminMain.jsp">메인으로</a>
</body>
</html>
