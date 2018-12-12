<%@ page import="example.TuitionDAO" %>
<%@ page import="example.Tuition" %>
<%@ page import="java.util.List" %><%--
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
</head>
<body>
<h2>등록금 정보</h2>
<%
    TuitionDAO tuitionDAO = new TuitionDAO();
    List<Tuition> tuitionList = tuitionDAO.lookupBills(studentId);

    for (int i = 0; i < tuitionList.size(); i++) {
%>
    <p>
        [학기] : <%=tuitionList.get(i).getSemester()%>
        [등록금 산정 금액] : <%=tuitionList.get(i).getCalcul_Fee()%> 원
        [수혜 장학금 금액] : <%=tuitionList.get(i).getScholarship()%> 원
        [실 납부액] : <%=tuitionList.get(i).getCalcul_Fee() - tuitionList.get(i).getScholarship()%> 원
    </p>
<%
    }
%>
    <hr/>
    <br/>
    <a href="StudentMain.jsp">메인으로</a>
</body>
</html>
