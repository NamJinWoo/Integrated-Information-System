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

<p> 강의명 : <input type="text" id="lectureName"></p>
<p> 교수명 : <input type="text" id="profName"></p>
<p> 강의실 : <input type="text" id="classroomNum"></p>
<p> 강의시간 : <input type="text" id="classTime"></p>
<p> 이수학점 : <input type="number" id="gradeValue"></p>
<p> 교육과정년도 : <input type="number" id="eduYear"></p>
<p> 정원 : <input type="number" id="maxStudents"></p>
<p> 이수구분(0:교, 1:전공) : <input type="number" id="lectureKind"></p>
<p> 전공학과 : <input type="text" id="lectureMajor"></p>
<p> 강의계획 : <input type="text" id="lecturePlan"></p>


<button onclick="javascript:register();">등록</button>
<button onclick="self.close();">취소</button>

<script>
    function register() {
        var lectureName = document.getElementById("lectureName").value;
        var profName = document.getElementById("profName").value;
        var classroomNum = document.getElementById("classroomNum").value;
        var classTime = document.getElementById("classTime").value;
        var gradeValue = document.getElementById("gradeValue").value;
        var eduYear = document.getElementById("eduYear").value;
        var maxStudents = document.getElementById("maxStudents").value;
        var lectureKind = document.getElementById("lectureKind").value;
        var lectureMajor = document.getElementById("lectureMajor").value;
        var lecturePlan = document.getElementById("lecturePlan").value;

        var url = "registerSubjects.jsp?" +
            "lectureName=" + lectureName +
            "&profName=" + profName +
            "&classroomNum=" + classroomNum +
            "&classTime=" + classTime +
            "&gradeValue=" + gradeValue +
            "&eduYear=" + eduYear +
            "&maxStudents=" + maxStudents +
            "&lectureKind=" + lectureKind +
            "&lectureMajor=" + lectureMajor +
            "&lecturePlan=" + lecturePlan;

        opener.window.location = url;
        close();
    }
</script>
</body>
</html>
