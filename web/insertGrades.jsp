<%@ page import="example.SelSubjectDAO" %>
<%@ page import="example.SelSubject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
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
    String[] sellectureIds = request.getParameter("sellectureIds").split(",");
    String[] sellectureGradePoints = request.getParameter("sellectureGradePoints").split(",");

    List<SelSubject> selSubjectList = new ArrayList<>();
    int size = sellectureIds.length;
    for(int i=0; i<size; i++){
        SelSubject selSubject = new SelSubject(Integer.parseInt(sellectureIds[i]),null,null,null,null,
                0,0,null,null, Double.parseDouble(sellectureGradePoints[i]),0);
        selSubjectList.add(selSubject);
        System.out.println(sellectureIds[i]+","+sellectureGradePoints[i]);
    }

    SelSubjectDAO SelSubDAO = new SelSubjectDAO();
    SelSubDAO.updateGradePoints(studentId, semester, selSubjectList);
%>

<script>
    alert("입력되었습니다.");
    location.href="AdminGrade.jsp";
</script>