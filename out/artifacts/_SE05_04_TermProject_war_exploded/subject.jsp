<%@ page import="example.SubjectDAO" %>
<%@ page import="example.Subject" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="example.SelSubject" %>
<%@ page import="example.SelSubjectDAO" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = "";
    try {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("studentId")) {
                    studentId = cookies[i].getValue();
                }
            }
            if (studentId.equals("")) {
                response.sendRedirect("loginForm.jsp");
            }
        } else {
            response.sendRedirect("loginForm.jsp");
        }
    } catch (Exception e) {

    }
%>
<html>
<head>
    <title>Title</title>
    <style>
        div.subjectPlan, div.selsubjectPlan, div#timetable {
            display: none;
        }
    </style>
</head>
<body>
    <h2>교과목 목록</h2>
    <%
        SubjectDAO SubDAO = new SubjectDAO();
        List<Subject> subjectList = SubDAO.lookupSubject();
        for (int i = 0; i < subjectList.size(); i++) {
    %>
    <div id="subject_<%=i%>">
        <p>[학수번호] : <%=subjectList.get(i).getLectureId()%>
            [과목명] : <%=subjectList.get(i).getLectureName()%>
            [교수명] : <%=subjectList.get(i).getProfName()%>
            [강의실] : <%=subjectList.get(i).getClassroomNum()%>
            [강의시간] : <%=subjectList.get(i).getClassTime()%>
            [이수학점] : <%=subjectList.get(i).getGradeValue()%>
            [교육과정년도] : <%=subjectList.get(i).getEduYear()%>
            [정원] : <%=subjectList.get(i).getMaxStudents()%>
            [현재 인원] : <%=subjectList.get(i).getPresentStudent()%>
            [이수구분] : <%=subjectList.get(i).getLectureKind()%>
            [전공학과] : <%=subjectList.get(i).getLectureMajor()%>
        </p>
        <button id="selsubjectPlan_<%=subjectList.get(i).getLectureId()%>bnt"
                onclick="showLecturePlan('subjectPlan_<%=subjectList.get(i).getLectureId()%>')">강의계획서 조회
        </button>

        <div id="subjectPlan_<%=subjectList.get(i).getLectureId()%>" class="subjectPlan">
            <hr/>

            <h3>강의 계획서</h3>
            <div>
                <%=subjectList.get(i).getLecturePlan()%>
            </div>
            <button onclick="closeLecturePlan('subjectPlan_<%=subjectList.get(i).getLectureId()%>')">닫기</button>
        </div>
    </div>

    <hr/>
    <%
        if(subjectList.get(i).getPresentStudent() != subjectList.get(i).getMaxStudents()){
    %>
    <a href="selSubjects.jsp?lectureId=<%=subjectList.get(i).getLectureId()%>">수강신청</a>
    <hr/>
    <%
        }
        }
    %>
    <h2>수강 신청 과목</h2>
    <%
        SelSubjectDAO selSubjectDAO = new SelSubjectDAO();
        List<SelSubject> selSubjectList = selSubjectDAO.lookupSelSubjects(studentId, 0);
        for (int i = 0; i < selSubjectList.size(); i++) {
    %>
    <div id="selsubject_<%=i%>">
        <p>[학수번호] : <%=selSubjectList.get(i).getLectureId()%>
            [과목명] : <%=selSubjectList.get(i).getLectureName()%>
            [교수명] : <%=selSubjectList.get(i).getProfName()%>
            [이수학점] : <%=selSubjectList.get(i).getGradeValue()%>
            [이수구분] : <%=subjectList.get(i).getLectureKind()%>
            [전공학과] : <%=subjectList.get(i).getLectureMajor()%>
        </p>
        <button id="selsubjectPlan_<%=selSubjectList.get(i).getLectureId()%>bnt"
                onclick="showLecturePlan('selsubjectPlan_<%=selSubjectList.get(i).getLectureId()%>')">강의계획서 조회
        </button>

        <div id="selsubjectPlan_<%=selSubjectList.get(i).getLectureId()%>" class="selsubjectPlan">
            <hr/>
            <h3>강의 계획서</h3>
            <div>
                <%=selSubjectList.get(i).getLecturePlan()%>
            </div>
            <button onclick="closeLecturePlan('selsubjectPlan_<%=selSubjectList.get(i).getLectureId()%>')">닫기</button>
        </div>
    </div>
    <hr/>
    <%
        }
        if (selSubjectList.size() != 0) {
    %>
    <h2>수업 시간표</h2>
    <button onclick="showTimeTable()">수업 시간표 조회</button>
    <div id="timetable">
        <hr/>
        <h3>수업 시간표</h3>
        <div>
            <% for (int i = 0; i < selSubjectList.size(); i++) { %>
            <p>
                [과목명] : <%=selSubjectList.get(i).getLectureName()%>
                [강의실] : <%=selSubjectList.get(i).getClassroomNum()%>
                [강의시간] : <%=selSubjectList.get(i).getClassTime()%>
            </p>
            <%}%>
        </div>
        <button onclick="closeTimeTable()">닫기</button>
    </div>
    <%
        }
    %>
    <br/>
    <hr/>
    <a href="StudentMain.jsp">메인으로</a>

    <script>
        function showLecturePlan(divId) {
            document.getElementById(divId).style.display = "block";
        }

        function closeLecturePlan(divId) {
            document.getElementById(divId).style.display = "none";
        }

        function showTimeTable() {
            document.getElementById("timetable").style.display = "block";
        }

        function closeTimeTable() {
            document.getElementById("timetable").style.display = "none";
        }
    </script>
</body>
</html>
