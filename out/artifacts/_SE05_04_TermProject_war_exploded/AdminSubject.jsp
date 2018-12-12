<%@ page import="example.SubjectDAO" %>
<%@ page import="example.Subject" %>
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
    <style>
        div.subjectPlan {
            display: none;
        }
    </style>
    <script>
        function showLecturePlan(divId) {
            document.getElementById(divId).style.display = "block";
        }

        function closeLecturePlan(divId) {
            document.getElementById(divId).style.display = "none";
        }


        function popupOpen(){

            var popUrl = "registerSubject.jsp";	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }
        function updateSubject(lectureId){

            var popUrl = "updateSubject.jsp?lectureId="+lectureId;	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=450, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }
        function deleteSubject(lectureId){
            location.href="deleteSubject.jsp?lectureId="+lectureId;
        }

    </script>
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


<button onclick="updateSubject(<%=subjectList.get(i).getLectureId()%>)"> 수정
</button>
<button onclick="deleteSubject(<%=subjectList.get(i).getLectureId()%>)"> 삭제
</button>
<%
    }
%>
<hr/>

<button onclick="javascript:popupOpen();"> 등록
</button>
<hr/>
<br/>
<a href="AdminMain.jsp">메인으로</a>
</body>
</html>
