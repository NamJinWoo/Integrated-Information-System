<%@ page import="example.SelSubject" %>
<%@ page import="example.SelSubjectDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jinwoo
  Date: 08/12/2018
  Time: 12:38 AM
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

<%
    int semester = Integer.parseInt(request.getParameter("semester"));

    SelSubjectDAO selSubjectDAO = new SelSubjectDAO();
    List<SelSubject> selSubjectList = null;

    System.out.println(semester);
    %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
    if( semester == 0){
        // 전체학점
        selSubjectList = selSubjectDAO.lookupSelSubjects(studentId, -1);
    }else{
        selSubjectList = selSubjectDAO.lookupSelSubjects(studentId, semester);
    }
    double GPA = 0.0;
    int prev = -1, current=0;
    if( selSubjectList.size() == 0 ){%>
        <script>
            alert("산정할 성적이 없습니다.");
            history.go(-1);
        </script>
  <%  }
    for (int i = 0; i < selSubjectList.size(); i++) {
        current = selSubjectList.get(i).getEduSemester();
        if( current != prev){
  %>
<h2> <%=selSubjectList.get(i).getEduSemester()%>학기</h2>
<%}%>
<p>
    [과목명] : <%=selSubjectList.get(i).getLectureName()%>
    [학점] : <%=selSubjectList.get(i).getGradePoint()%>
</p>
<%
    GPA += selSubjectList.get(i).getGradePoint()/selSubjectList.size();
    prev = current;
    }
%>
<hr>
<h2>총 점 : <%=GPA%></h2>
<hr>
<a href="StudentMain.jsp">메인으로</a>
</body>
</html>
