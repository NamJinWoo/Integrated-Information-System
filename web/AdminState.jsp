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

        function popupOpen(){

            var popUrl = "registerStudent.jsp";	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }
        function updateStudent(studentId){

            var popUrl = "adminUpdateStudent.jsp?studentId="+studentId;	//팝업창에 출력될 페이지 URL

            var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

            window.open(popUrl,"",popOption);

        }

        function deleteStudent(studentId){
            location.href="deleteStudent.jsp?studentId="+studentId;
        }

        function toNextSemester(){
            location.href="toNextSemester.jsp";
        }

    </script>
</head>
<body>
    <h2>학적 정보 관리</h2>
    <%
        StudentDAO studentDAO = new StudentDAO();
        List<Student> studentList = studentDAO.lookupStudents();
        for (int i = 0; i < studentList.size(); i++) {
    %>
    <p>
        학번 : <%=studentList.get(i).getStudentId()%>
        이름 : <%=studentList.get(i).getStudentName()%>
        학과명 : <%=studentList.get(i).getMajor()%>
        조직구분 : <%=studentList.get(i).getStudentAttr()%>
        현재학기 : <%=studentList.get(i).getSemester()%>
        E-Mail : <%=studentList.get(i).getEmail()%>
        학적상태 : <%=studentList.get(i).isState() ? "재학" : "휴학"%>
    </p>
    <button onclick="updateStudent(<%=studentList.get(i).getStudentId()%>)"> 수정
    </button>
    <button onclick="deleteStudent(<%=studentList.get(i).getStudentId()%>)"> 삭제
    </button>
    <%
        }
    %>
    <hr/>

    <button onclick="javascript:popupOpen();"> 등록
    </button>

    <hr/>
    <br/>

    <button onclick="javascript:toNextSemester();"> 다음 학기로</button>
        <br/>
    <a href="AdminMain.jsp">메인으로</a>
</body>
</html>
