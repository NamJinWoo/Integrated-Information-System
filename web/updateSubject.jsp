<%@ page import="example.Student" %>
<%@ page import="example.StudentDAO" %>
<%@ page import="example.SubjectDAO" %>
<%@ page import="example.Subject" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 09/12/2018
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String lectureId = request.getParameter("lectureId");

    SubjectDAO SubDAO = new SubjectDAO();

    Subject subject = SubDAO.lookupSubjectInfo(lectureId);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <p> 강의명 : <%=subject.getLectureName()%></p>
    <p> 교수명 : <%=subject.getProfName()%></p>
    <p> 강의실 : <input type="text" id="classroomNum" value="<%=subject.getClassroomNum()%>"></p>
    <p> 강의시간 : <input type="text" id="classTime" value="<%=subject.getClassTime()%>"></p>
    <p> 이수학점 : <%=subject.getGradeValue()%></p>
    <p> 교육과정년도 : <%=subject.getEduYear()%></p>
    <p> 정원 : <input type="number" id="maxStudents" value="<%=subject.getMaxStudents()%>"></p>
    <p> 이수구분(0:교양, 1:전공) : <%=subject.getLectureKind()%></p>
    <p> 전공학과 : <%=subject.getLectureMajor()%></p>
    <p> 강의계획 : <input type="text" id="lecturePlan" value="<%=subject.getLecturePlan()%>"></p>
    <button onclick="javascript:update();">수정</button>
    <button onclick="self.close();">취소</button>

<script>
    function update(){
        var lectureId = "<%=subject.getLectureId()%>";
        var lectureName = "<%=subject.getLectureName()%>";
        var profName = "<%=subject.getProfName()%>";
        var classroomNum = document.getElementById("classroomNum").value;
        var classTime = document.getElementById("classTime").value;
        var gradeValue = "<%=subject.getGradeValue()%>";
        var eduYear = "<%=subject.getEduYear()%>";
        var maxStudents = document.getElementById("maxStudents").value;
        var lectureKind = "<%=subject.getLectureKind()%>";
        var lectureMajor = "<%=subject.getLectureMajor()%>";
        var lecturePlan = document.getElementById("lecturePlan").value;

        var url = "updateSubjects.jsp?" +
            "lectureId="+lectureId +
            "&lectureName="+lectureName +
            "&profName="+profName +
            "&classroomNum="+classroomNum +
            "&classTime="+classTime +
            "&gradeValue="+gradeValue +
            "&eduYear="+eduYear +
            "&maxStudents="+maxStudents +
            "&lectureKind="+lectureKind +
            "&lectureMajor="+lectureMajor +
            "&lecturePlan="+lecturePlan;

        opener.window.location=url;
        close();
    }
</script>
</body>
</html>
