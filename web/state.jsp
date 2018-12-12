<%@ page import="example.*" %>
 <%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 05/12/2018
  Time: 10:12 PM
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
<html>
<head>
    <title>Title</title>
    <script>
        function updateStudent(studentId){

            var popUrl = "studentUpdateStudent.jsp?studentId="+studentId;	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }
    </script>
</head>
<body>
    <%
        StudentDAO StuDAO = new StudentDAO();
        Student student = StuDAO.lookupStudentInfo(studentId);
        if(student != null){
    %>
        <p>학번 : <%=student.getStudentId()%></p>
        <p>이름 : <%=student.getStudentName()%></p>
        <p>학과명 : <%=student.getMajor()%></p>
        <p>조직구분 : <%=student.getStudentAttr()%></p>
        <p>현재학기 : <%=student.getSemester()%></p>
        <p>E-Mail : <%=student.getEmail()%></p>
        <p>학적상태 : <%=student.isState() ? "재학" : "휴학"%></p>
    <%
        }else{
    %>
    <script>
        alert("아이디가 맞지않습니다.");
        history.go(-1);
    </script>
    <%
        }
    %>
    <button onclick="updateStudent(<%=student.getStudentId()%>)"> 수정
    </button>
    <a href="stateList.jsp">학적 변동 내역</a>
    <br/>
    <a href="changeState.jsp">휴복학신청</a>

    <br/><a href="StudentMain.jsp">메인으로</a>
</body>
</html>
