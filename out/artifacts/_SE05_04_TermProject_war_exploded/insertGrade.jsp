<%@ page import="example.SelSubjectDAO" %>
<%@ page import="example.SelSubject" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 10/12/2018
  Time: 1:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = request.getParameter("studentId");
    int semester = Integer.parseInt(request.getParameter("semester"));

    SelSubjectDAO SelSubDAO = new SelSubjectDAO();
    String sellectureIds = "";
    List<SelSubject> selSubjectList = SelSubDAO.lookupSelSubjects(studentId,semester);
    for(int i = 0; i< selSubjectList.size(); i++){
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <p> 강의명 : <%=selSubjectList.get(i).getLectureName()%></p>
    <p> 성적 : <input type="number" class="gradePoint" value="<%=selSubjectList.get(i).getGradePoint()%>"></p>
<%
        sellectureIds += selSubjectList.get(i).getLectureId()+",";

    }
%>
    <button onclick="javascript:insert();">성적 입력</button>
    <button onclick="self.close();">취소</button>
<script>
    function insert(){
        var sellectureIds = "<%=sellectureIds%>";
        var sellectureGradePoints = "";

        var y = document.getElementsByClassName("gradePoint");
        var i;
        for (i = 0; i < y.length; i++) {
            sellectureGradePoints += y[i].value+",";
        }

        var studentId = "<%=studentId%>";
        var semester = "<%=semester%>";

        var url = "insertGrades.jsp?"+
                "studentId="+studentId+
                "&semester="+semester+
                "&sellectureIds="+sellectureIds+
                "&sellectureGradePoints="+sellectureGradePoints;
        console.log(url);
        console.log(document.getElementsByClassName("gradePoint"));
        opener.window.location=url;
        close();
    }
</script>
</body>
</html>
