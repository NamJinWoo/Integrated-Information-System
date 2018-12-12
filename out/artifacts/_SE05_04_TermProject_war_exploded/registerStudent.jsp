<%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p> 학번 : <input type="text" id="studentId"></p>
    <p> 이름 : <input type="text" id="studentName"></p>
    <p> 학과명 : <input type="text" id="studentDepartment"></p>
    <p> 이메일 : <input type="text" id="studentEmail"></p>
    <button onclick="javascript:register();">등록</button>
    <button onclick="self.close();">취소</button>

<script>
    function register(){
        var studentId = document.getElementById("studentId").value;
        var studentName = document.getElementById("studentName").value;
        var studentDepartment = document.getElementById("studentDepartment").value;
        var studentEmail = document.getElementById("studentEmail").value;

        var url = "registerStudents.jsp?" +
            "studentId="+studentId +
            "&studentName="+studentName +
            "&studentDepartment="+studentDepartment +
            "&studentEmail="+studentEmail;

        opener.window.location=url;
        close();
    }
</script>
</body>
</html>
