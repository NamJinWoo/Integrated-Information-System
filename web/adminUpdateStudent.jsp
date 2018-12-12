<%@ page import="example.Student" %>
<%@ page import="example.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = request.getParameter("studentId");

    StudentDAO StuDAO = new StudentDAO();

    Student student = StuDAO.lookupStudentInfo(studentId);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p> 학번 : <%=student.getStudentId()%></p>
    <p> 이름 : <%=student.getStudentName()%></p>
    <p> 비밀번호 : <input type="text" id="studentPassword" value="<%=student.getPassword()%>"></p>
    <p> 학과명 : <input type="text" id="studentDepartment" value="<%=student.getMajor()%>"></p>
    <p> 조직구분 : <input type="text" id="studentAttr" value="<%=student.getStudentAttr()%>"></p>
    <p> 현재학기 : <%=student.getSemester()%></p>
    <p> E-Mail : <%=student.getEmail()%></p>
    <p> 학적상태 : <%=student.isState() ? "재학" : "휴학"%></p>
    <button onclick="javascript:update();">수정</button>
    <button onclick="self.close();">취소</button>

<script>
    function update(){
        var studentId = "<%=student.getStudentId()%>";
        var studentName = "<%=student.getStudentName()%>";
        var studentPassword = document.getElementById("studentPassword").value;
        var studentDepartment = document.getElementById("studentDepartment").value;
        var studentAttr = document.getElementById("studentAttr").value;
        var studentSemester = "<%=student.getSemester()%>";
        var studentEmail = "<%=student.getEmail()%>";
        var studentState = "<%=student.isState()%>";

        var url = "updateStudents.jsp?" +
            "studentId="+studentId +
            "&studentName="+studentName +
            "&studentPassword="+studentPassword +
            "&studentDepartment="+studentDepartment +
            "&studentAttr="+studentAttr +
            "&studentSemester="+studentSemester +
            "&studentEmail="+studentEmail +
            "&studentState="+studentState;

        opener.window.location=url;
        close();
    }
</script>
</body>
</html>
